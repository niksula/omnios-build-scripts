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

PROG=procmail      # App name
VER=3.22            # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=mail/procmail            # Package name (e.g. library/foo)
SUMMARY="Versatile e-mail processor"      # One-liner, must be filled in
DESC="Can be used to create mail-servers, mailing lists, sort your incoming mail into separate folders/files (very convenient when subscribing to one or more mailing lists or for prioritising your mail), preprocess your mail, start any programs upon mail arrival (e.g. to generate different chimes on your workstation for different types of mail) or selectively forward certain incoming mail automatically to someone."         # Longer description, must be filled in

CONFIGURE_CMD=":"
MAKE="$MAKE LOCKINGTEST=110 VISIBLE_BASENAME=/usr"

init
download_source $PROG $PROG $VER
patch_source
prep_build
MAKE="$MAKE BASENAME=${DESTDIR}/usr MANDIR=\$(BASENAME)/share/man"
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
