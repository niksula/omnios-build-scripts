#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=postfix
VER=3.0.3
VERHUMAN=$VER
PKG=service/network/smtp/postfix
SUMMARY="Postfix MTA"
DESC="Wietse Venema's mail server that started life at IBM research as an alternative to the widely-used Sendmail program. "

BUILD_DEPENDS_IPS='pkg://niksula.hut.fi/database/bdb'

CCARGS='-DUSE_TLS -DHAS_LDAP -DHAS_DB -DUSE_SASL_AUTH -DDEF_SERVER_SASL_TYPE=\"dovecot\" -DNO_NIS -DDEF_MANPAGE_DIR=\"'$PREFIX/share/man'\" -DDEF_COMMAND_DIR=\"'${PREFIX}/sbin'\" -DDEF_MAILQ_PATH=\"'${PREFIX}/bin/mailq'\" -DDEF_NEWALIAS_PATH=\"'${PREFIX}/bin/newaliases'\" -DDEF_CONFIG_DIR=\"'${PREFIX}/etc/postfix'\" '"$CFLAGS"
CCARGS32='-DDEF_DAEMON_DIR=\"'${PREFIX}/libexec/postfix'\" -I'${PREFIX}/include
CCARGS64='-DDEF_DAEMON_DIR=\"'${PREFIX}/libexec/$ISAPART64/postfix'\" -I'${PREFIX}/include/$ISAPART64
AUXLIBS='-lssl -lcrypto -ldb'
LIBDIR32="-L${PREFIX}/lib -R${PREFIX}/lib"
LIBDIR64="-L${PREFIX}/lib/$ISAPART64 -R${PREFIX}/lib/$ISAPART64"
AUXLIBS_LDAP='-lldap'

NOSCRIPTSTUB=1

configure32() {
    logmsg '--- make makefiles'
    logcmd $MAKE makefiles CCARGS="$CCARGS $CCARGS32 $CFLAGS32" AUXLIBS="$AUXLIBS $LIBDIR32" AUXLIBS_LDAP="$AUXLIBS_LDAP"
    cur_isa=${ISAPART}
}

configure64() {
    logmsg '--- make makefiles'
    logcmd $MAKE makefiles CCARGS="$CCARGS $CCARGS64 $CFLAGS64" AUXLIBS="$AUXLIBS $LIBDIR64" AUXLIBS_LDAP="$AUXLIBS_LDAP"
    cur_isa=${ISAPART64}
}

make_clean() {
    logcmd $MAKE tidy
    logcmd $MAKE -f Makefile.init makefiles
}

make_install() {
    logmsg '--- make install'
    [ -n "$cur_isa" ] || logerr "don't know which arch we're installing"

    # If postfix finds a configuration file in the destination it will use
    # paths defined there in the install script, so let's install to different
    # DESTDIRs for different ISAs and merge afterwards

    # sendmail will go to /usr/lib if not set here, but system sendmail is
    # already there. put it in PREFIX/sbin to get correct isaexec stubs.
    install_args="install_root=${DESTDIR}/$cur_isa sendmail_path=${PREFIX}/sbin/sendmail"
    logcmd $MAKE non-interactive-package $install_args || \
        logerr '--- make install failed'
    cp -fRP ${DESTDIR}/$cur_isa/* ${DESTDIR}
    rm -fr ${DESTDIR}/$cur_isa
    # postfix will generate its config file and the symlinks it installs with
    # paths pointing to the configured directories, so let's just tell it we're
    # installing into default directories and move binaries in the correct
    # place after install -- this way we get a sensible default conf file
    for dir in ${ISAEXEC_DIRS-bin sbin}; do
        pushd ${DESTDIR}/${PREFIX}/${dir} >/dev/null
        mkdir -p $cur_isa
        find . -maxdepth 1 -type f -exec mv {} ${cur_isa}/ ';'
        popd >/dev/null
    done
    unset cur_isa
    manifest_path=${DESTDIR}/lib/svc/manifest/network/smtp
    mkdir -p $manifest_path
    install -m 0444 ${SRCDIR}/postfix.xml ${manifest_path}/
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
