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

# XXX build fails on gcc > 4.6:
# Text relocation remains                         referenced
#     against symbol                  offset      in file
# std::tr1::function<void (torrent::PeerInfo*)>::~function() 0x55         download/.libs/libsub_download.a(download_main.o)
# std::tr1::function<void (torrent::PeerInfo*)>::~function() 0x6a         download/.libs/libsub_download.a(download_main.o)
# std::tr1::_Maybe_unary_or_binary_function<void, torrent::PeerInfo*>::_Maybe_unary_or_binary_function() 0x19             download/.libs/libsub_download.a(download_main.o)
# std::vector<torrent::BlockList*, std::allocator<torrent::BlockList*> >::size() const 0x1c1e     download/.libs/libsub_download.a(download_main.o)
# ld: fatal: relocations remain against allocatable but non-writable sections
# -- however, download_main.o *is* built with -fPIC. no idea what's up, so just compile with 4.4

CC=/opt/gcc-4.4.4/bin/gcc
CXX=/opt/gcc-4.4.4/bin/g++
BUILD_DEPENDS_IPS='developer/gcc44'

PROG=libtorrent
VER=0.13.6
VERHUMAN=$VER
PKG=library/libtorrent
SUMMARY="a BitTorrent library"
DESC="LibTorrent is a BitTorrent library written in C++ for *nix, with a focus on high performance and good code. The library differentiates itself from other implementations by transfering directly from file pages to the network stack."

BUILDARCH=64

export PKG_CONFIG=${PREFIX}/bin/pkg-config

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
