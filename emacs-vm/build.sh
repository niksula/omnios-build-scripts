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

PROG=vm
VER=8.1.2
VERHUMAN=$VER
PKG=editor/gnu-emacs/vm
SUMMARY="VM is a mail reader that runs inside GNU Emacs and XEmacs."
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='editor/gnu-emacs'
RUN_DEPENDS_IPS='editor/gnu-emacs'
# need to put emacs in PATH for build
PATH=${PATH}:${PREFIX}/bin

# the only arch-dependent things this package ships are two helper binaries, no
# need to build twice just for those
BUILDARCH=32

make_prog() {
    # parallel make breaks the build, and apparently giving the build envvars
    # to configure is not enough
    logmsg '--- make'
    CFLAGS="$CFLAGS $CFLAGS64" \
    CXXFLAGS="$CXXFLAGS $CXXFLAGS64" \
    CPPFLAGS="$CPPFLAGS $CPPFLAGS64" \
    LDFLAGS="$LDFLAGS $LDFLAGS64" \
    CC=$CC CXX=$CXX \
    logcmd $MAKE || logerr 'make failed'
}

init
download_source emacs-${PROG} $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
