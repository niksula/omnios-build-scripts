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
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#

# Load support functions
. ../../lib/functions.sh

PROG=perl
VER=5.18.1
VERHUMAN=$VER
MAJOR_MINOR=${VER:0:4}
PKG=niksula/runtime/perl
SUMMARY="$PROG - Perl $VER Programming Language"
DESC="$SUMMARY"

SHELL=/usr/bin/bash

BUILD_DEPENDS_IPS="text/gnu-sed"

build32() {
    pushd $TMPDIR/$BUILDDIR > /dev/null
    logmsg "Building 32-bit"
    logmsg "--- make (dist)clean"
    logcmd make distclean || \
        logmsg "--- *** WARNING *** make (dist)clean Failed"
    logmsg "--- configure (32-bit)"
    logcmd $SHELL Configure -Dusethreads -Duseshrplib -Dusemultiplicity -Duselargefiles \
        -Dusedtrace -Duse64bitint -Dmyhostname="localhost" \
        -Dcc=gcc -Dld=/usr/ccs/bin/ld -Dccflags="-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_TS_ERRNO" \
        -Doptimize="-O3" \
        -Dvendorprefix=${PREFIX} -Dprefix=${PREFIX} \
        -Dbin=${PREFIX}/bin/$ISAPART \
        -Dsitebin=${PREFIX}/bin/$ISAPART \
        -Dvendorbin=${PREFIX}/bin/$ISAPART \
        -Dscriptdir=${PREFIX}/bin \
        -Dsitescript=${PREFIX}/bin \
        -Dvendorscript=${PREFIX}/bin \
        -des || \
    logerr "--- Configure failed"
    gsed -i 's/-fstack-protector//g;' config.sh
    logmsg "--- make"
    logcmd gmake $MAKE_JOBS || \
    logcmd gmake || \
        logerr "--- Make failed"
    logmsg "--- make install"
    logcmd gmake install DESTDIR=${DESTDIR} || \
        logerr "--- Make install failed"
    popd > /dev/null
}

build64() {
    pushd $TMPDIR/$BUILDDIR > /dev/null
    logmsg "Building 64-bit"
    logmsg "--- make (dist)clean"
    logcmd make distclean || \
        logmsg "--- *** WARNING *** make (dist)clean Failed"
    logmsg "--- configure (64-bit)"
    logcmd $SHELL Configure -Dusethreads -Duseshrplib -Dusemultiplicity -Duselargefiles \
        -Dusedtrace -Duse64bitint -Dmyhostname="localhost" \
        -Dcc=gcc -Dld=/usr/ccs/bin/ld -Dccflags="-D_LARGEFILE64_SOURCE -m64 -D_TS_ERRNO" \
        -Dlddlflags="-G -64" \
        -Dldflags="" \
        -Doptimize="-O3" \
        -Dvendorprefix=${PREFIX} -Dprefix=${PREFIX} \
        -Dbin=${PREFIX}/bin/$ISAPART64 \
        -Dsitebin=${PREFIX}/bin/$ISAPART64 \
        -Dvendorbin=${PREFIX}/bin/$ISAPART64 \
        -Dscriptdir=${PREFIX}/bin \
        -Dsitescript=${PREFIX}/bin \
        -Dvendorscript=${PREFIX}/bin \
        -des || \
    logerr "--- Configure failed"
    gsed -i 's/-fstack-protector//g;' config.sh
    gsed -i -e '/^lddlflags/{s/-G -m64//;}' config.sh
    logmsg "--- make"
    logcmd gmake $MAKE_JOBS || \
    logcmd gmake || \
        logerr "--- Make failed"
    logmsg "--- make install"
    logcmd gmake install DESTDIR=${DESTDIR} || \
        logerr "--- Make install failed"
    pushd $DESTDIR/$PREFIX/bin > /dev/null
    gsed -i 's:'$PREFIX'/bin/amd64:'$PREFIX'/bin:g' \
        `find . -type f | xargs file | grep script | cut -f1 -d:`
    popd > /dev/null
    popd > /dev/null
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
