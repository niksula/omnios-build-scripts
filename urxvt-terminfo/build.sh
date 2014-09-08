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

# rxvt-unicode terminfo definition is not shipped by ncurses, apparently due to
# https://lists.gnu.org/archive/html/bug-ncurses/2009-10/msg00031.html

PROG=rxvt-unicode
VER=9.20
VERHUMAN=$VER
PKG=data/urxvt-terminfo
SUMMARY="terminfo definition for rxvt-unicode $VER"
DESC="$SUMMARY"

build() {
    pushd ${TMPDIR}/$BUILDDIR >/dev/null
    TERMINFO=${DESTDIR}/usr/share/lib/terminfo
    mkdir -p $TERMINFO
    TERMINFO=$TERMINFO tic doc/etc/${PROG}.terminfo || logerr 'failed to install terminfo file'
}

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
