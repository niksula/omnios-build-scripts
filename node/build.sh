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
# Copyright 2015 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=node
VER=0.10.41
VERHUMAN=$VER
PKG=runtime/node
SUMMARY="JavaScript runtime built on Chrome's V8 JavaScript engine"
DESC="$SUMMARY"

# tools/genv8constants.py excepts GNU 'objdump' to be in PATH
PATH=${PATH}:/usr/gnu/i386-pc-solaris2.11/bin

BUILDDIR=${PROG}-v${VER}
BUILD_DEPENDS_IPS='runtime/python-26 developer/gnu-binutils'
BUILDARCH=64
CONFIGURE_OPTS="--prefix=$PREFIX --shared-zlib --shared-openssl"
CONFIGURE_OPTS_64="--dest-cpu=x64"

init
download_source $PROG $PROG v$VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
