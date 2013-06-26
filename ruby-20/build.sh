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

MIRROR=ftp://ftp.ruby-lang.org/pub/

PROG=ruby
VERHUMAN=2.0.0-p195
VER=2.0.0.195
PKG=runtime/ruby-20
SUMMARY="Ruby $VER"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/build/pkg-config library/libffi'

BUILDDIR=${PROG}-${VERHUMAN}

# if we do distclean, we need ruby to regenerate some files, so skip it
make_clean() {
     logcmd $MAKE clean
}

# signbit macro that is needed for miniruby requires c99
CFLAGS="$CFLAGS -std=c99"
# --enable-multiarch doesn't do exactly what we want so just hack around it by
# hand
CONFIGURE_OPTS="$CONFIGURE_OPTS --enable-shared --enable-multiarch"
CONFIGURE_OPTS_32="$CONFIGURE_OPTS_32
--with-rubyarchprefix=${PREFIX}/lib/ruby
--with-rubysitearchprefix=${PREFIX}/lib/ruby"
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64
--with-rubylibprefix=${PREFIX}/lib/ruby
--with-rubyarchprefix=${PREFIX}/lib/${ISAPART64}/ruby
--with-rubysitearchprefix=${PREFIX}/lib/${ISAPART64}/ruby
"

init
download_source ${PROG}/2.0 $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
