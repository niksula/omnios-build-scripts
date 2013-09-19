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

PROG=passwdqc
VER=1.3.0
VERHUMAN=$VER
PKG=system/security/passwdqc
SUMMARY="password/passphrase strength checking and policy enforcement toolset"
DESC="$SUMMARY"

# NOTE: this installs in /usr (it needs to, since it ships a PAM module)
PREFIX=/usr

MAKEDIRS32="SECUREDIR_SUN=/usr/lib/security SHARED_LIBDIR_SUN=/usr/lib BINDIR=/usr/bin/$ISAPART DEVEL_LIBDIR=/usr/lib SHARED_LIBDIR_REL=."
MAKEDIRS64="SECUREDIR_SUN=/usr/lib/security/$ISAPART64 SHARED_LIBDIR_SUN=/usr/lib/$ISAPART64 BINDIR=/usr/bin/$ISAPART64 DEVEL_LIBDIR=/usr/lib/amd64 SHARED_LIBDIR_REL=."

CFLAGS='-Wall -W -O2'
CONFIGURE_CMD=:

make_prog32() {
    logcmd $MAKE $MAKE_JOBS $MAKEDIRS32 CFLAGS="$CFLAGS" || logerr 'make failed'
}
make_prog64() {
    logcmd $MAKE $MAKE_JOBS $MAKEDIRS64 CFLAGS="$CFLAGS -m64" LDFLAGS='-m64' LDFLAGS_shared='-m64 --shared' || logerr 'make failed'
}
make_install32() {
    logcmd $MAKE $MAKE_JOBS $MAKEDIRS32 DESTDIR="$DESTDIR" install || logerr 'make install failed'
}
make_install64() {
    logcmd $MAKE $MAKE_JOBS $MAKEDIRS64 DESTDIR="$DESTDIR" install || logerr 'make install failed'
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
