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
# Copyright 2014 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=bind
VER=9.9.8
VERHUMAN=$VER
PKG=service/network/dns/bind
SUMMARY="ISC BIND DNS server"
DESC="$SUMMARY"

PREFIX=/opt/bind
reset_configure_opts
BUILDARCH=64
NOSCRIPTSTUB=1

install_manifest() {
    target=${DESTDIR}/lib/svc/manifest/network/dns
    logcmd mkdir -p ${target}
    logcmd install -m 0444 ${SRCDIR}/bind.xml ${target}/ || logerr 'manifest install failed'
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_manifest
make_isa_stub
VER=${VER//-[PW]/.}
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
