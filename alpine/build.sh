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

PROG=re-alpine
VER=2.03
VERHUMAN=$VER
PKG=mail/re-alpine
SUMMARY="The continuation of the Alpine email client from University of Washington"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='library/aspell'
RUN_DEPENDS_IPS='library/aspell@0.60.6.1,5.11-0.151006:20140922T115103Z'
# put aspell in PATH
PATH=${PATH}:${PREFIX}/bin

CONFIGURE_OPTS="--with-ssl-dir=/etc/ssl
--with-ssl-include-dir=/usr/include/openssl
--without-ldap
--without-tcl
--with-system-pinerc=${PREFIX}/etc/pine.conf
--with-system-fixed-pinerc=${PREFIX}/etc/pine.conf.fixed
--with-passfile=.pine-passfile
"

CFLAGS="$CFLAGS -g"
LDFLAGS="$LDFLAGS -g"

# configure will default to /usr/bin/make if MAKE is not set but it actually
# needs gnu make, so put MAKE in env. It also needs to be a full path for this
# to work
MAKE=/usr/bin/gmake
export MAKE

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
ln -s alpine ${DESTDIR}${PREFIX}/bin/pine
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
