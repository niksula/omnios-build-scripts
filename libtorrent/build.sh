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

# build fails on gcc 4.7.2 so use 4.6
CC=/opt/gcc-4.6.3/bin/gcc
CXX=/opt/gcc-4.6.3/bin/g++
BUILD_DEPENDS_IPS='developer/gcc46'

PROG=libtorrent
VER=0.13.4
VERHUMAN=$VER
PKG=library/libtorrent
SUMMARY="a BitTorrent library"
DESC="LibTorrent is a BitTorrent library written in C++ for *nix, with a focus on high performance and good code. The library differentiates itself from other implementations by transfering directly from file pages to the network stack."

# we need pkg-config in PATH
PATH=$PATH:$PREFIX/bin

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
