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

PROG=poppler
VER=0.24.5
VERHUMAN=$VER
PKG=library/libpoppler
SUMMARY="Poppler PDF rendering library"
DESC="$SUMMARY"

CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-static --enable-xpdf-headers"

# iconv signature check in configure is broken (probably due to restrict
# pointers), but we can work around it by using POSIX-1.2001
CPPFLAGS="$CPPFLAGS -std=c99 -D_XOPEN_SOURCE=600"

PKG_CONFIG=${PREFIX}/bin/pkg-config
export PKG_CONFIG

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
