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

PROG=ghostscript
VER=9.16
VERHUMAN=$VER
PKG=print/filter/ghostscript
SUMMARY="Ghostscript, a Postscript and PDF interpreter"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='print/cups library/liblcms'

CUPSCONFIG="${PREFIX}/bin/cups-config"
export CUPSCONFIG

init
download_source $PROG $PROG $VER
patch_source
# force usage of shared lcms2, jpeg (configure uses local copies
# unconditionally if present)
rm -f ${TMPDIR}/${BUILDDIR}/lcms2/include/lcms2.h
rm -f ${TMPDIR}/${BUILDDIR}/jpeg/jpeglib.h
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
