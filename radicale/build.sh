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

PROG=Radicale
VER=0.10
VERHUMAN=$VER
PKG=application/radicale
SUMMARY="CalDAV and CardDAV Server"
DESC="$SUMMARY"

BUILDARCH=64

BUILD_DEPENDS_IPS='niksula/runtime/python'
DEPENDS_IPS='=niksula/runtime/python@3.4'
PYTHON=${PREFIX}/bin/python3

# python_build function could work here if we were building on multiarch
# python, but currently niksula python is 64bit only, so hack by hand.
build() {
    pushd $TMPDIR/$BUILDDIR >/dev/null
    logmsg "--- setup.py build"
    logcmd $PYTHON ./setup.py build || logerr "--- build failed"
    logmsg "--- setup.py install"
    logcmd $PYTHON ./setup.py install --root=$DESTDIR || logerr "--- install failed"
    popd >/dev/null
}

install_manifest() {
    tgtdir=${DESTDIR}/lib/svc/manifest/network
    mkdir -p $tgtdir
    install -m 0444 ${SRCDIR}/radicale.xml ${tgtdir}/
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_manifest
make_package
clean_up
