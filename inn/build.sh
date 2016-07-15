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

PROG=inn
VER=2.6.0
VERHUMAN=$VER
PKG=service/network/nntp/inn
SUMMARY="INN (InterNetNews) is a very full-featured and flexible news server package"
DESC="$SUMMARY"

BUILDARCH=64
NO_PARALLEL_MAKE=1

BUILD_DEPENDS_IPS='niksula/runtime/perl@5.22 database/bdb'
RUN_DEPENDS_IPS='=niksula/runtime/perl@5.22 security/gnupg'

export PERL=${PREFIX}/perl5/bin/perl
export GPGV=${PREFIX}/bin/gpgv
PREFIX=/opt/news
reset_configure_opts

# don't make isa stubs; bindir seems to have subdirs.
CONFIGURE_OPTS="$CONFIGURE_OPTS --with-bdb=/opt/niksula --bindir=${PREFIX}/bin --enable-reduced-depends --without-openssl --without-krb5 --without-sasl"

install_manifest() {
    manifestdir=${DESTDIR}/lib/svc/manifest/network/nntp
    mkdir -p $manifestdir
    cp ${SRCDIR}/files/inn.xml ${manifestdir}/
}
install_exec_attr() {
    targetdir=${DESTDIR}/etc/security/exec_attr.d
    mkdir -p $targetdir
    cp ${SRCDIR}/files/innbind.exec_attr ${targetdir}/innbind
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_manifest
install_exec_attr
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
