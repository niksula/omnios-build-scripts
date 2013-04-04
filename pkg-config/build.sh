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

PROG=pkg-config      # App name
VER=0.26            # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=developer/build/pkg-config            # Package name (e.g. library/foo)
SUMMARY="manage compile and link flags for libraries"      # One-liner, must be filled in
DESC="pkg-config is a system for managing library compile and link flags that works with automake and autoconf."         # Longer description, must be filled in

BUILD_DEPENDS_IPS='library/glib2'

CFLAGS32="$CFLAGS32 -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include"
CFLAGS64="$CFLAGS64 -I/usr/include/amd64/glib-2.0 -I/usr/lib/amd64/glib-2.0/include"
CONFIGURE_OPTS_32="$CONFIGURE_OPTS_32 GLIB_LIBS=/usr/lib/libglib-2.0.so"
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64 GLIB_LIBS=/usr/lib/amd64/libglib-2.0.so"

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
