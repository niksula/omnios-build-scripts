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

PROG=procmail
VER=3.22
VERHUMAN=$VER
PKG=mail/procmail
SUMMARY="Versatile e-mail processor"
DESC="Can be used to create mail-servers, mailing lists, sort your incoming mail into separate folders/files (very convenient when subscribing to one or more mailing lists or for prioritising your mail), preprocess your mail, start any programs upon mail arrival (e.g. to generate different chimes on your workstation for different types of mail) or selectively forward certain incoming mail automatically to someone."

CONFIGURE_CMD=':'

make_prog() {
    $MAKE $MAKE_JOBS LOCKINGTEST=110 CFLAGS="$CFLAGS"
}

make_install32() {
    $MAKE VISIBLE_BASENAME=/usr BASENAME=${DESTDIR}/usr MANDIR='$(BASENAME)'/share/man BINDIR_TAIL=bin/$ISAPART install
}
make_install64() {
    $MAKE VISIBLE_BASENAME=/usr BASENAME=${DESTDIR}/usr MANDIR='$(BASENAME)'/share/man BINDIR_TAIL=bin/$ISAPART64 install
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
