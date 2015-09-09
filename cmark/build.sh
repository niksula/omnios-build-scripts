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

PROG=cmark
VER=0.22.0
VERHUMAN=$VER
PKG=text/cmark
SUMMARY="CommonMark parsing and rendering library and program in C"
DESC="$SUMMARY"

# tests require python 3, *and* since our python is 64-bit only, we need to
# build the cmark lib 64-bit too
BUILD_DEPENDS_IPS='developer/build/cmake niksula/runtime/python@3'
BUILDARCH=64
TAR=gtar
REMOVE_PREVIOUS=1

build64() {
    mkdir ${TMPDIR}/${BUILDDIR}/build
    pushd ${TMPDIR}/${BUILDDIR}/build >/dev/null
    CFLAGS="$CFLAGS $CFLAGS64" \
        LDFLAGS="$LDFLAGS $LDFLAGS64" \
        CXXFLAGS="$CFLAGS $CFLAGS64" \
        logcmd ${PREFIX}/bin/cmake -DCMAKE_INSTALL_PREFIX=$PREFIX .. || logerr 'cmake failed'
    make_prog64
    logcmd $MAKE test || logerr 'make test failed'
    make_install64
    popd >/dev/null
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
