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

PROG=boost
VER=1.59.0
VERHUMAN=$VER
PKG=library/c++/boost
SUMMARY="free peer-reviewed portable C++ source libraries"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS=
RUN_DEPENDS_IPS=

PREFIX=/opt/boost
CONFIGURE_CMD=./bootstrap.sh
CONFIGURE_OPTS="--prefix=$PREFIX --without-libraries=python"
CONFIGURE_OPTS_32="--libdir=$PREFIX/lib --includedir=$PREFIX/include/$ISAPART"
CONFIGURE_OPTS_64="--libdir=$PREFIX/lib/$ISAPART64 --includedir=$PREFIX/include/$ISAPART64"
# we change PREFIX, so redefine these too
LDFLAGS32="-L${PREFIX}/lib -R${PREFIX}/lib"
LDFLAGS64="-m64 -L${PREFIX}/lib/${ISAPART64} -R${PREFIX}/lib/${ISAPART64}"

make_prog32() {
    logmsg '--- ./b2'
    logcmd ./b2 --build-dir=$TMPDIR/$BUILDDIR/build.32 $MAKE_JOBS -q cxxflags="$CXXFLAGS $CXXFLAGS32" linkflags="$LDFLAGS $LDFLAGS32" link=shared || logerr 'build failed'
}
make_prog64() {
    logmsg '--- ./b2'
    logcmd ./b2 --build-dir=$TMPDIR/$BUILDDIR/build.64 $MAKE_JOBS -q cxxflags="$CXXFLAGS $CXXFLAGS64" linkflags="$LDFLAGS $LDFLAGS64" link=shared || logerr 'build failed'
    logcmd ./b2 --build-dir=$TMPDIR/$BUILDDIR/build.64 $MAKE_JOBS -q link=shared || logerr 'build failed'
}
make_install32() {
    logmsg '--- ./b2 install'
    logcmd ./b2 --build-dir=$TMPDIR/$BUILDDIR/build.32 $MAKE_JOBS -q --prefix=$DESTDIR$PREFIX --libdir=$DESTDIR$PREFIX/lib install || logerr '--- b2 install failed'
}
make_install64() {
    logmsg '--- ./b2 install'
    logcmd ./b2 --build-dir=$TMPDIR/$BUILDDIR/build.64 $MAKE_JOBS -q --prefix=$DESTDIR$PREFIX --libdir=$DESTDIR$PREFIX/lib/$ISAPART64 install || logerr '--- b2 install failed'
}

init
BUILDDIR=${PROG}_${VER//./_}
download_source $PROG $BUILDDIR ""
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
