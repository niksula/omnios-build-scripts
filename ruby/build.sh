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

PROG=ruby
VER=2.2.5
VERHUMAN=$VER
PKG=runtime/ruby
SUMMARY="Ruby $VER"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/build/pkgconf library/libffi'

# required for configure.in patch
BUILD_DEPENDS_IPS="$BUILD_DEPENDS_IPS developer/build/autoconf"
gen_configure() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    logcmd autoconf || logerr 'autoconf failed'
    popd >/dev/null
}

# if we do distclean, we need ruby to regenerate some files, so skip it
make_clean() {
     logcmd $MAKE clean
}

# signbit macro that is needed for miniruby requires c99
CFLAGS="$CFLAGS -std=c99"
# ruby (at least 2.0.0) looks for dynamic libs in rubylibdir by default during
# runtime, and from the arch dir only as fallback, so we need to put 32bit
# dynamic libs in a place other than where the shared .rb files reside.
# Let's use the following directory structure:
#
#     bin/{i386,amd64}/*
#     lib/{,amd64}/libruby.so*
#     lib/ruby/2.1.0/*.rb
#     lib/ruby/2.1.0/{i386,amd64}/*.so
#
# --enable-multiarch causes ruby 2.1 to put both bit width binaries in the same
# place (lib/ruby/2.1.0/i386-solaris2.11). We still need to pass that flag
# because it also causes a #define.

CONFIGURE_OPTS="$CONFIGURE_OPTS --enable-shared --enable-multiarch"
CONFIGURE_OPTS_32="$CONFIGURE_OPTS_32
--with-archlibdir=${PREFIX}/lib
--with-archincludedir=${PREFIX}/include
--with-rubylibprefix=${PREFIX}/lib/ruby
--with-rubyarchprefix=${PREFIX}/lib/ruby/${ISAPART}
--with-rubysitearchprefix=${PREFIX}/lib/ruby/${ISAPART}"
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64
--with-archlibdir=${PREFIX}/lib/${ISAPART64}
--with-archincludedir=${PREFIX}/include/${ISAPART64}
--with-rubylibprefix=${PREFIX}/lib/ruby
--with-rubyarchprefix=${PREFIX}/lib/ruby/${ISAPART64}
--with-rubysitearchprefix=${PREFIX}/lib/ruby/${ISAPART64}"

init
download_source $PROG $PROG $VERHUMAN
patch_source
prep_build
gen_configure
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
