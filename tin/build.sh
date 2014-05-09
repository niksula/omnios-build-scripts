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

PROG=tin
VER=2.2.1
VERHUMAN=$VER
PKG=news/tin
SUMMARY="a threaded NNTP and spool based UseNet newsreader"
DESC="$SUMMARY"

NOSCRIPTSTUB=1

make_prog() {
    pushd src >/dev/null
    logcmd $MAKE $MAKE_JOBS || logerr 'make failed'
    popd >/dev/null
}

make_install() {
    pushd src >/dev/null
    logcmd $MAKE DESTDIR=${DESTDIR} install || logerr 'install failed'
    popd >/dev/null
}

CONFIGURE_OPTS="$CONFIGURE_OPTS --mandir=${PREFIX}/share/man --with-domain-name=/etc/defaultdomain --with-mime-default-charset=UTF-8 --enable-cancel-locks"

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
