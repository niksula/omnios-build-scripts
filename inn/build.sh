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

PROG=inn
VER=2.5.4
VERHUMAN=$VER
PKG=service/network/nntp/inn
SUMMARY="INN (InterNetNews) is a very full-featured and flexible news server package"
DESC="$SUMMARY"

BUILDARCH=64

BUILD_DEPENDS_IPS='niksula/runtime/perl database/bdb'
RUN_DEPENDS_IPS='security/gnupg'

export PERL=${PREFIX}/perl5/bin/perl
export GPGV=${PREFIX}/bin/gpgv
PREFIX=/opt/news
reset_configure_opts

# install chowns/chgrps binaries, so make it not fail and use local.mog to
# change ownership. also don't make isa stubs; bindir seems to have subdirs.
CONFIGURE_OPTS="$CONFIGURE_OPTS --with-spool-dir=/var/spool/news --with-perl --enable-ipv6 --with-news-user=$(whoami) --with-news-group=$(id -gn) --bindir=${PREFIX}/bin"

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
