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

PROG=texlive
VER=20140525
VERHUMAN=$VER
PKG=application/texlive
SUMMARY="TeX Live - LaTeX distribution"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/build/pkg-config'

BUILDARCH=32

# texlive doesn't check for gmake
export MAKE

export PKG_CONFIG=/opt/niksula/bin/pkg-config
PREFIX=/opt/texlive
reset_configure_opts

CONFIGURE_OPTS="$CONFIGURE_OPTS
--bindir=${PREFIX}/bin
--disable-native-texlive-build
--disable-static
--disable-luajittex
--without-x"

dl_texmf() {
    pushd ${TMPDIR} >/dev/null
    if ! [ -f ${PROG}-${VER}-texmf.tar.xz ]; then
        logmsg '--- Downloading texmf archive'
        get_resource ${PROG}/${PROG}-${VER}-texmf.tar.xz
    fi
    if ! [ -d ${PROG}-${VER}-texmf ]; then
        logmsg '--- Extracting texmf archive'
        logcmd extract_archive ${PROG}-${VER}-texmf.tar.xz || logerr 'failed to extract texmf'
    fi
}

install_texmf() {
    mkdir -p ${DESTDIR}${PREFIX}/share
    # manpages get installed from the source package into $PREFIX/share/man
    # already
    rm -rf ${TMPDIR}/${PROG}-${VER}-texmf/texmf-dist/doc/man
    # we don't want the python/ruby stuff
    logcmd cp -RP ${TMPDIR}/${PROG}-${VER}-texmf/texmf-dist ${DESTDIR}${PREFIX}/share/
}

config_tex() {
    dir=${DESTDIR}${PREFIX}
    PATH=${dir}/bin:$PATH logcmd texlinks -f ${dir}/share/texmf-dist/web2c/fmtutil.cnf ${dir}/bin || logerr 'texlinks failed'
    PATH=${dir}/bin:$PATH logcmd fmtutil-sys --cnffile ${dir}/share/texmf-dist/web2c/fmtutil.cnf --missing || logerr 'fmtutil-sys failed'
}

init
BUILDDIR=${PROG}-${VER}-source
download_source $PROG $PROG ${VER}-source
patch_source
dl_texmf
BUILDDIR=${BUILDDIR}/build
logcmd mkdir ${TMPDIR}/$BUILDDIR
logcmd wget -O ${TMPDIR}/${BUILDDIR}/LICENSE.TL https://www.tug.org/texlive/LICENSE.TL
CONFIGURE_CMD=../configure
prep_build
install_texmf
build
config_tex
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
