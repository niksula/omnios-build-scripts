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

PROG=yaml-cpp
VER=0.5.2
VERHUMAN=$VER
PKG=library/c++/yaml-cpp
SUMMARY="A YAML parser and emitter in C++"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/build/cmake library/c++/boost'
BUILDARCH=32

TAR=gtar

build() {
    pushd $TMPDIR/$BUILDDIR >/dev/null
    rm -rf build
    mkdir build
    cd build
    logcmd $PREFIX/bin/cmake -DBUILD_SHARED_LIBS=ON -DBOOST_INCLUDEDIR=/opt/boost/include -DCMAKE_INSTALL_PREFIX=$PREFIX .. || logerr 'cmake failed'
    make_prog32
    # 'make test' fails with "other error", presumably because we don't have
    # gtest?
    make_install32
    popd >/dev/null
}

init
BUILDDIR=${PROG}-release-${VER}
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
