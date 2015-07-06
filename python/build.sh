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

PROG=Python
VER=3.3.6
VERHUMAN=$VER
PKG=niksula/runtime/python
SUMMARY="Python programming language"
DESC="$SUMMARY"
VERMAJOR=${VER%.*}

# system ffi is required for 64bit ctypes module
BUILD_DEPENDS_IPS='library/libffi'

CONFIGURE_OPTS="$CONFIGURE_OPTS --enable-shared --disable-static --with-system-ffi"

# ncurses
LDFLAGS64="$LDFLAGS64 -L/usr/gnu/lib/$ISAPART64 -R/usr/gnu/lib/$ISAPART64"
CPPFLAGS="$CPPFLAGS -I/usr/include/ncurses"

# multiarch python is a pain: there seems to be a builtin assumption in
# Modules/getpath.c about extension modules having a 'lib/python$VERSION' path
# component, but with the 64 bit --libdir they get installed into
# lib/$ISAPART64/python$VERSION. There is a make variable DESTSHARED=
# workaround for this but that currently means we can't install both archs.
# Debian seems to put arch information in the 'SOABI' string (to create eg.
# "_ctypes.cpython-33m-x86_64-linux-gnu.so" but that seems to me like it could
# complicate building third party extensions. Upstream OmniOS python 2.6 puts
# 64 bit extensions in /64/ under lib-dynload but I can't seem to find how this
# is being done... just build 64-only for now.
BUILDARCH=64
make_install64() {
    logmsg '--- make install'
    logcmd $MAKE DESTDIR=$DESTDIR DESTSHARED=${PREFIX}/lib/python${VERMAJOR}/lib-dynload install || logerr '--- make install failed'
}

PKG_CONFIG="${PREFIX}/bin/pkg-config"
export PKG_CONFIG

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
