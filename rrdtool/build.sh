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

PROG=rrdtool
VER=1.4.8
VERHUMAN=$VER
PKG=application/rrdtool
SUMMARY="data logging and graphing system for time series data"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='library/cairo library/pango niksula/runtime/perl pkg://niksula.hut.fi/developer/build/pkg-config'
RUN_DEPENDS_IPS='niksula/runtime/perl@5.20 =niksula/runtime/perl@5.20'

PKGCONFIG=${PREFIX}/bin/pkg-config
export PKGCONFIG

CONFIGURE_OPTS="$CONFIGURE_OPTS --with-perl-options=PREFIX=/opt/niksula/perl5 --disable-python"
save_function configure32 conf32_orig
save_function configure64 conf64_orig
configure32() {
    PERLLDFLAGS="$LDFLAGS $LDFLAGS32" PERLCCFLAGS="$CFLAGS $CFLAGS32" conf32_orig
}
configure64() {
    PERLLDFLAGS="$LDFLAGS $LDFLAGS64" PERLCCFLAGS="$CFLAGS $CFLAGS64" conf64_orig
}
export PERL=/opt/niksula/perl5/bin/perl
# we need these to generate the documentation (though it already is generated
# in the tarball, it will get removed by 'make clean' for the second build (not
# for the first build because there is no makefile until configure has been
# run))
export POD2MAN=/opt/niksula/perl5/bin/pod2man
export POD2HTML=/opt/niksula/perl5/bin/pod2html

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
