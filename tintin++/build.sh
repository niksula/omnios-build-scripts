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

PROG=tintin++
VER=2.01.0
VERHUMAN=$VER
PKG=games/mud/tintin++
SUMMARY="TinTin++ MUD client"
DESC="$SUMMARY"

CPPFLAGS="$CPPFLAGS -I/usr/include/pcre"
# tintin++ build doesn't use CPPFLAGS apparently
CFLAGS="$CFLAGS $CPPFLAGS"
# getaddrinfo check doesn't link correct libraries, just brute force and link
# them to everything
LDFLAGS="$LDFLAGS -lsocket -lnsl"

init
BUILDDIR="tt/src"
download_source $PROG tintin $VER
# drop license into BUILDDIR
ln -s ../COPYING ${TMPDIR}/${BUILDDIR}/
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
