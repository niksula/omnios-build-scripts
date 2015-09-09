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
# Copyright 2015 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=cmake
VER=3.3.1
VERHUMAN=$VER
PKG=developer/build/cmake
SUMMARY="portable build system"
DESC="$SUMMARY"

BUILDARCH=32
REMOVE_PREVIOUS=1

CONFIGURE_CMD=./bootstrap
# OmniOS shipped liblzma.5.0.5 doesn't work with cmake, and we don't have some
# libs. additionally, --no-system-liblzma is not implemented.
# Also, the curses interface code does invalid conversions from const char* to
# char* on illumos, so just don't build ccmake(1).
CONFIGURE_OPTS="--prefix=${PREFIX} --mandir=share/man --system-libs --no-system-jsoncpp --no-system-libarchive -- -DCMAKE_USE_SYSTEM_LIBRARY_LIBLZMA=0 -DBUILD_CursesDialog=0"
CONFIGURE_OPTS_32=
export DESTDIR

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
