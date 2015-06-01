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

PROG=pigeonhole
VER=0.4.8
VERHUMAN=$VER
PKG=mail/dovecot/pigeonhole
SUMMARY="Sieve support for Dovecot"
DESC="$SUMMARY"

DOVECOT_VER=2.2
BUILDDIR=dovecot-${DOVECOT_VER}-${PROG}-${VER}

BUILDARCH=64
CONFIGURE_OPTS_64="$CONFIGURE_OPTS_64 --with-dovecot=${PREFIX}/lib/amd64/dovecot"
# dovecot-config will give link options correctly but won't set rpath
LDFLAGS64="$LDFLAGS64 -R${PREFIX}/lib/amd64/dovecot"

BUILD_DEPENDS_IPS="service/network/imap/dovecot@$DOVECOT_VER"

install_procmail2sieve() {
    install -m 0755 ${SRCDIR}/files/procmail2sieve ${DESTDIR}${PREFIX}/bin || logerr 'failed to install procmail2sieve'
}

init
# we need to incorporate the dovecot version used to build since the plugin ABI
# can change between minor versions
RUN_DEPENDS_IPS="=$(pkg list -Hv dovecot|cut -d, -f1)" || logerr 'cannot get dovecot version'
download_source $PROG $BUILDDIR ""
patch_source
prep_build
build
install_procmail2sieve
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
