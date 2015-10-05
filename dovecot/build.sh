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

PROG=dovecot
VER=2.2.19
VERHUMAN=$VER
PKG=service/network/imap/dovecot
SUMMARY="dovecot secure IMAP server"
DESC="$SUMMARY"

install_manifest() {
    tgtdir=${DESTDIR}/lib/svc/manifest/network/imap
    mkdir -p ${tgtdir}
    install -m 0444 ${SRCDIR}/dovecot.xml ${tgtdir}/ || logerr 'manifest install failed'
}

BUILDARCH=64
# by default we get libexec/amd64/dovecot, but we're not making isa stubs there
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64 --libexecdir=${PREFIX}/libexec --disable-static"

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_manifest
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
