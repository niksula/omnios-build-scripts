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

PROG=socat
VER=1.7.2.4
VERHUMAN=$VER
PKG=network/socat
SUMMARY="Multipurpose relay (SOcket CAT)"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/build/autoconf'

#CPPFLAGS="$CPPFLAGS -D_XOPEN_SOURCE=600 -std=c99"
#CFLAGS="$CFLAGS -D_XOPEN_SOURCE=600 -std=c99"

# https://www.illumos.org/issues/4409 - not yet in r151006
#CPPFLAGS="$CPPFLAGS -D__EXTENSIONS__"

run_autoconf() {
    pushd ${TMPDIR}/$BUILDDIR >/dev/null
    logcmd autoconf || logerr 'autoconf failed'
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
run_autoconf
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
