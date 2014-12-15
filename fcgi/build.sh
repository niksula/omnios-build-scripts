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

PROG=fcgi
VER=2.4.0
VERHUMAN=$VER
PKG=library/fcgi
SUMMARY="FastCGI Development Kit"
DESC="$SUMMARY"

NO_PARALLEL_MAKE=1
CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-static"

install_catman() {
    # only preformatted man pages shipped with fcgi
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    MAN1=${DESTDIR}${PREFIX}/share/man/cat1
    MAN3=${DESTDIR}${PREFIX}/share/man/cat3
    mkdir -p ${MAN1} ${MAN3}
    install -m 0444 doc/*.1 ${MAN1}/ || logerr 'failed to install man1'
    install -m 0444 doc/*.3 ${MAN3}/ || logerr 'failed to install man3'
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_catman
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
