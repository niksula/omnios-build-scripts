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

PROG=facter
VER=3.1.0
VERHUMAN=$VER
PKG=application/facter
SUMMARY="Facter, a system inventory tool"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='runtime/ruby developer/build/cmake library/c++/yaml-cpp library/c++/boost developer/java/jdk'
DEPENDS_IPS='=runtime/ruby@2.1'
BUILDARCH=32

# we need ruby to build
PATH="$PATH:${PREFIX}/bin"

build() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    rm -rf release
    mkdir release
    cd release
    ISALIST=i386 logcmd ${PREFIX}/bin/cmake -DJAVA_HOME=/usr/java -DBOOST_ROOT=/opt/boost -DCMAKE_INSTALL_PREFIX=$PREFIX -DCMAKE_INSTALL_RPATH="/opt/niksula/lib:/opt/boost/lib" .. || logerr 'cmake failed'
    ISALIST=i386 make_prog
    # tests need to pass with and without ISALIST
    logcmd $MAKE test || logerr 'make test failed'
    ISALIST=i386 logcmd $MAKE test || logerr 'ISALIST=i386 make test failed'
    ISALIST=i386 make_install
    popd >/dev/null
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
