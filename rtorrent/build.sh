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

PROG=rtorrent
VER=0.9.6
VERHUMAN=$VER
PKG=application/rtorrent
SUMMARY="BitTorrent client on top of libtorrent with ncurses interface"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='library/libtorrent developer/build/pkgconf'
BUILDARCH=64

# we need pkg-config
export PKG_CONFIG=${PREFIX}/bin/pkg-config
CPPFLAGS64="$CPPFLAGS64 -I/usr/include/amd64 -I/usr/include/ncurses"
LDFLAGS="$LDFLAGS -lnsl -lsocket"

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
