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

PROG=postgresql
VER=9.3.5
VERHUMAN=$VER
PKG=database/postgresql
SUMMARY="$PROG - Open Source Database System"
DESC="$SUMMARY"

BUILDARCH=64
PREFIX=/opt/pgsql
reset_configure_opts

CFLAGS="-O3"

CONFIGURE_OPTS="--enable-thread-safety
    --enable-debug
    --with-openssl
    --with-libxml
    --prefix=$PREFIX
    --with-readline"

# We don't want the default settings for CONFIGURE_OPTS_64
CONFIGURE_OPTS_64="--enable-dtrace DTRACEFLAGS=\"-64\""

build_man() {
    pushd ${TMPDIR}/${BUILDDIR}/doc/src/sgml > /dev/null
    logmsg '--- make man'
    logcmd $MAKE $MAKE_JOBS man || logerr '--- make man failed'
    logcmd $MAKE $MAKE_JOBS DESTDIR=${DESTDIR} install || logerr '--- installing manpages failed'
    popd >/dev/null
}

save_function build build_orig
build() {
    build_orig
    build_man
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
