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

PROG=cups-filters
VER=1.0.44
VERHUMAN=$VER
PKG=print/cups-filters
SUMMARY="OpenPrinting filters and backends for CUPS"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='print/cups library/liblcms library/libijs library/libpoppler library/libqpdf'

CONFIGURE_OPTS="$CONFIGURE_OPTS --with-cups-config=${PREFIX}/bin/cups-config --without-jpeg --without-tiff --with-pdftops=pdftops --with-pdftops-path=${PREFIX}/bin/pdftops"

# configure script looks at *BOTH* PKG_CONFIG and PKGCONFIG separately
PKG_CONFIG=${PREFIX}/bin/pkg-config
PKGCONFIG=$PKG_CONFIG
export PKG_CONFIG PKGCONFIG

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
