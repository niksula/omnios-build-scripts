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

PROG=rrdtool
VER=1.4.8
VERHUMAN=$VER
PKG=application/rrdtool
SUMMARY="data logging and graphing system for time series data"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='library/cairo library/pango perl/manual'

PKGCONFIG=${PREFIX}/bin/pkg-config
export PKGCONFIG

# getting the perl install paths right is complicated to escape since it
# requires passing an arg with spaces to configure. In addition to conform to
# KYSTY we should not depend on system perl
CONFIGURE_OPTS="$CONFIGURE_OPTS --disable-perl"
# not so much KYSTY with these, but we need them to generate the documentation
# (though it already is generated in the tarball, it will get removed by 'make
# clean' for the second build (not for the first build because there is no
# makefile until configure has been run))
export POD2MAN=/usr/perl5/5.16.1/bin/pod2man
export POD2HTML=/usr/perl5/5.16.1/bin/pod2html

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
