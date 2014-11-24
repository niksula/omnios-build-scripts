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

PROG=unbound
VER=1.5.0
VERHUMAN=$VER
PKG=network/dns/unbound
SUMMARY="Validating, recursive, and caching DNS resolver"
DESC="$SUMMARY"

PREFIX=/opt/unbound
reset_configure_opts

CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-static --with-gnu-ld --with-conf-file=/opt/unbound/etc/unbound.conf --with-pidfile="
NO_PARALLEL_MAKE=1

BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=

install_manifest() {
    tgtdir=${DESTDIR}/lib/svc/manifest/network/dns
    mkdir -p "$tgtdir"
    install -m 0444 ${SRCDIR}/unbound.xml ${tgtdir}/ || logerr 'manifest install failed'
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
install_manifest
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
