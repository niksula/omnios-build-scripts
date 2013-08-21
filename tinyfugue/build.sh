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

PROG=tf
VER=5.0.8
VERHUMAN=5.0b8
PKG=games/mud/tinyfugue
SUMMARY="flexible, screen-oriented MUD client"
DESC="$SUMMARY"

CFLAGS="$CFLAGS -I/usr/include/pcre"

BUILDDIR=${PROG}-${VERHUMAN//./}

mkinstalldirs() {
    for d in bin/$ISAPART bin/$ISAPART64 share; do
        mkdir -p ${DESTDIR}/${PREFIX}/$d
    done
}

init
download_source $PROG $BUILDDIR
patch_source
prep_build
mkinstalldirs
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
