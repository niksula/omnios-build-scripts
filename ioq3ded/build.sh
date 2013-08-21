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

PROG=ioq3ded
VER=1.36
VERHUMAN=1.36
# ioq3 team doesn't seem to make releases, so let's just decide to build some
# known good version
commit=6a763f0
PKG=games/ioquake3/server
SUMMARY="Standalone server for ioQuake3 based games"
DESC="$SUMMARY"

RUN_DEPENDS_IPS='games/quake3/data'

download_source() {
    TARGETDIR=$TMPDIR
    pushd $TARGETDIR >/dev/null
    logcmd git clone git://github.com/ioquake/ioq3.git $BUILDDIR
    pushd $BUILDDIR >/dev/null
    logcmd git checkout $commit
    logcmd git reset --hard
    logcmd git clean -fd
    VER=${VER}.$(git log -1 --format=%at)
    popd >/dev/null
    popd >/dev/null
}

MAKE_ARGS_BASE="BUILD_CLIENT=0 DEFAULT_BASEDIR=/${PREFIX}/share/games/quake3"

configure32() {
    MAKE_ARGS="$MAKE_ARGS_BASE"
}
configure64() {
    MAKE_ARGS="$MAKE_ARGS_BASE COMPILE_ARCH=x86_64"
}

make_prog() {
    logcmd $MAKE $MAKE_JOBS $MAKE_ARGS || logerr "build failed"
}

make_install32() {
    make_install $ISAPART
}

make_install64() {
    make_install $ISAPART64
}

make_install() {
    isapart=$1
    if [ "$isapart" = "amd64" ]; then
        binary_suffix=x86_64
        libdir_suffix=/$isapart
    else
        binary_suffix=x86
        libdir_suffix=
    fi
    libdir=${DESTDIR}/${PREFIX}/lib$libdir_suffix
    logcmd $MAKE $MAKE_ARGS COPYDIR=${libdir}/ioquake3 copyfiles
    executable=${libdir}/ioquake3/ioq3ded.$binary_suffix
    isadir="${DESTDIR}/${PREFIX}/sbin/$isapart"
    mkdir -p "${isadir}"
    mv "$executable" "${isadir}"/ioq3ded
    svcdir=${DESTDIR}/lib/svc/manifest/network
    mkdir -p $svcdir
    install -m 0444 $SRCDIR/*.xml ${svcdir}/
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
