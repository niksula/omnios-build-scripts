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

PROG=slrn
VER=1.0.1
VERHUMAN=$VER
PKG=news/slrn
SUMMARY="slrn news reader"
DESC="$SUMMARY"

# slrn source archive is from git, which makes it have pax_global_header with
# typeflag g, which confuses tar, so just use gtar
BUILD_DEPENDS_IPS='archiver/gnu-tar library/slang'
TAR=gtar

# slrn configure script doesn't seem to pick up that socket stuff is in
# -lsocket, so just add them here; slrn only builds one binary anyway
LDFLAGS="$LDFLAGS -lsocket -lnsl"

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
