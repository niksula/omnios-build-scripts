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
# Copyright 2016 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=OpenBLAS
VER=0.2.15
VERHUMAN=$VER
PKG=library/openblas
SUMMARY="an optimized BLAS library based on GotoBLAS2 1.13 BSD version"
DESC="$SUMMARY"

CONFIGURE_CMD=:
BUILDARCH=64
TAR=gtar

make_prog64() {
    logmsg '--- make'
    logcmd $MAKE $MAKE_JOBS NO_STATIC=1 BINARY=64 \
        || logerr '--- make failed'
}

make_install64() {
    logmsg '--- make install'
    logcmd $MAKE install DESTDIR=$DESTDIR PREFIX=$PREFIX \
        NO_STATIC=1 \
        OPENBLAS_INCLUDE_DIR=$PREFIX/include/$ISAPART64 \
        OPENBLAS_LIBRARY_DIR=$PREFIX/lib/$ISAPART64 \
        OPENBLAS_BINARY_DIR=$PREFIX/bin/$ISAPART64 \
        || logerr '--- make install failed'
    # XXX: OmniOS r151014 note: libgfortran runtime is not delivered to /usr by
    # any package. Getting rpath options to the openblas build system seems
    # more trouble than it's worth, so just copy the library to our $PREFIX in
    # this package and elfedit the .so to add the rpath. yes, it's a hack, and
    # we will depend on the gcc package at runtime, but it's hopefully
    # temporary until such time that upstream ships a runtime package to /usr.
    logmsg '--- hacking rpath'
    cp -a ${GCCPATH}/../lib/amd64/libgfortran.so{,.3,.3.0.0} $DESTDIR$PREFIX/lib/$ISAPART64/ || logerr 'copying libgfortran failed'
    elfedit -e "dyn:runpath $(readlink -f $GCCPATH/../lib/$ISAPART64)" $DESTDIR$PREFIX/lib/$ISAPART64/libopenblas_sandybridgep-r${VER}.so || logerr 'elfedit dyn:runpath failed'
}

init
download_source $PROG v$VER ''
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
