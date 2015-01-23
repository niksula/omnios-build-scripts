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
# Copyright 2011-2013 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=collectd
VER=5.4.1
VERHUMAN=$VER
PKG=application/collectd
SUMMARY="system statistics collection daemon"
DESC="$SUMMARY"

BUILDARCH=64

# need autoconf to apply some patches to configure.ac
BUILD_DEPENDS_IPS='application/rrdtool developer/build/pkg-config developer/build/autoconf system/management/snmp/net-snmp niksula/runtime/perl@5.20'
RUN_DEPENDS_IPS='=niksula/runtime/perl@5.20 niksula/runtime/perl@5.20'

CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-static --with-libperl=/opt/niksula/perl5/bin/perl --with-perl-bindings=INSTALLDIRS=vendor"

PKG_CONFIG=${PREFIX}/bin/pkg-config
export PKG_CONFIG

TAR=gtar

install_manifest() {
    smfdir=${DESTDIR}/lib/svc/manifest/application
    mkdir -p $smfdir
    install -m 0444 ${SRCDIR}/collectd.xml ${smfdir}/
}

install_contrib() {
    pushd ${TMPDIR}/${BUILDDIR}/contrib >/dev/null
    spamassassin_plugindir=${DESTDIR}/opt/niksula/perl5/lib/vendor_perl/5.20.1/Mail/SpamAssassin/Plugin
    mkdir -p "${spamassassin_plugindir}"
    # remove hashbang - this isn't an executable
    sed 1d SpamAssassin/Collectd.pm > "${spamassassin_plugindir}/Collectd.pm" || logerr 'failed to install spamassassin plugin'
    popd >/dev/null
}

run_autoconf() {
    pushd $TMPDIR/$BUILDDIR >/dev/null
    logcmd autoconf || logerr 'autoconf failed'
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
run_autoconf
build
make_isa_stub
install_contrib
install_manifest
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
