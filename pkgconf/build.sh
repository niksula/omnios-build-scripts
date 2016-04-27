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

PROG=pkgconf
VER=0.9.12
VERHUMAN=$VER
PKG=developer/build/pkgconf
SUMMARY="pkgconf provides compiler and linker configuration for development frameworks"
DESC="$SUMMARY"

# add /usr to the default pc paths
CONFIGURE_OPTS_32="$CONFIGURE_OPTS_32 --with-system-libdir=/usr/lib --with-system-includedir=/usr/include --with-pkg-config-dir=${PREFIX}/lib/pkgconfig:/usr/lib/pkgconfig"
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64 --with-system-libdir=/usr/lib/amd64 --with-system-includedir=/usr/include/amd64 --with-pkg-config-dir=${PREFIX}/lib/amd64/pkgconfig:/usr/lib/amd64/pkgconfig"

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
