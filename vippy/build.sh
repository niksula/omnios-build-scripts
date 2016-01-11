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

PROG=vippy
VER=0.0.11
PKG=runtime/node/$PROG
SUMMARY="VIP management (juggler of IPs)"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="runtime/node"
DEPENDS_IPS="runtime/node"

BUILDARCH=64

# need 'node' in PATH, and 'make' to be gmake
PATH=${PREFIX}/bin:/usr/gnu/bin:$PATH

# XXX normally we would like to keep local copies of all sources we build
# packages from, but unfortunately there does not seem to be a way to tell npm
# to not hit the online repository for dependencies. So let's just do what
# everyone else is doing and blindly install things directly from the interwebs
# npm repository.
build_npm() {
    mkdir -p ${DESTDIR}${PREFIX}/lib
    pushd ${DESTDIR}${PREFIX}/lib >/dev/null
    logcmd npm install $PROG@$VER || logerr '--- npm install failed'
    rm -f npm-debug.log
    popd >/dev/null
}

init
prep_build
build_npm
logcmd mkdir -p $DESTDIR$PREFIX/bin || logerr "mkdir bin failed"
logcmd mkdir -p $DESTDIR$PREFIX/sbin || logerr "mkdir sbin failed"
logcmd ln -s ../lib/node_modules/.bin/vippyctl $DESTDIR$PREFIX/bin/vippyctl \
	|| logerr "Failed to link vippyctl"
logcmd ln -s ../lib/node_modules/.bin/vippyd $DESTDIR$PREFIX/sbin/vippyd \
	|| logerr "Failed to link vippyd"
logcmd mkdir -p $DESTDIR/lib/svc/manifest/network \
	|| logerr "Failed to mkdir for SMF manifest"
logcmd cp $SRCDIR/files/vippy.xml $DESTDIR/lib/svc/manifest/network/vippy.xml \
	|| logerr "Failed to place SMF manifest"
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
