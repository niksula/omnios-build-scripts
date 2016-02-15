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

PROG=znapzend
VER=0.15.1
VERHUMAN=$VER
PKG=service/storage/znapzend
SUMMARY="zfs backup with mbuffer and ssh support"
DESC="$SUMMARY"

BUILDARCH=64
BUILD_DEPENDS_IPS='pkg:/niksula/perl5/Mojolicious
pkg:/niksula/perl5/Mojo-IOLoop-ForkCall'
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"
PREFIX=${PREFIX}/perl5
PATH=${PREFIX}/bin:${PATH}
CONFIGURE_OPTS_64="--prefix=$PREFIX --enable-pkgonly --mandir=/opt/niksula/share/man --exec-prefix=/opt/niksula --libdir=$(perl -MConfig -e 'print "$Config{sitelib}"') --enable-svcinstall=/lib/svc/manifest/oep"

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
