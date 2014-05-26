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

PROG=puppet
VER=3.6.1
VERHUMAN=$VER
PKG=system/management/puppet
SUMMARY="Declarative configuration management tool"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='runtime/ruby-20'
DEPENDS_IPS='runtime/ruby-20 application/hiera application/facter'
NOSCRIPTSTUB=1

PATH="${PATH}:${PREFIX}/bin"

build() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    logcmd ./install.rb --destdir=${DESTDIR} || logerr 'build failed'
    mkdir -p ${DESTDIR}/etc/puppet
    cp ${SRCDIR}/files/puppet.conf ${DESTDIR}/etc/puppet
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
