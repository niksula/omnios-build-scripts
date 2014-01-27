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

PROG=hiera
VER=1.3.1
VERHUMAN=$VER
PKG=application/hiera
SUMMARY="Light weight hierarchical data store"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='runtime/ruby-20'
DEPENDS_IPS='runtime/ruby-20'
NOSCRIPTSTUB=1

build() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    # hiera doesn't ship a install.rb like facter and puppet so just do this
    # manually
    targetlibdir=${DESTDIR}/${PREFIX}/lib/ruby/site_ruby/2.0.0
    targetbindir=${DESTDIR}/${PREFIX}/bin
    mkdir -p $targetlibdir $targetbindir
    logcmd cp -PR lib/* ${targetlibdir}/
    logcmd cp -PR bin/* ${targetbindir}/
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
