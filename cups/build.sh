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

PROG=cups
VER=1.7.1
VERHUMAN=$VER
PKG=print/cups
SUMMARY="Common Unix Printing System"
DESC="$SUMMARY"

make_install() {
    logmsg "--- make install"
    logcmd $MAKE DSTROOT=${DESTDIR} install || \
        logerr "--- Make install failed"
}

install_manifest() {
    smfdir=${DESTDIR}/lib/svc/manifest/print
    mkdir -p $smfdir
    cp ${SRCDIR}/cups.xml $smfdir
}

# disable DNS-SD/mDNS because incompatible libraries
CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-dnssd --with-cups-user=lp"

# fix runtime R_AMD64_PC32 relocation errors by using -shared for libs
save_function configure64 configure64_orig
configure64() {
    DSOFLAGS='-shared' configure64_orig
}

init
download_source $PROG $PROG ${VER}-source
patch_source
prep_build
build
install_manifest
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
