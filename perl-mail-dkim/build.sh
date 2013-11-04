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

AUTHORID=JASLONG
PROG=Mail-DKIM
MODNAME=Mail::DKIM
VER=0.40
VERHUMAN=$VER
PKG=niksula/perl/$(echo $PROG | tr '[A-Z]' '[a-z]')  # Module name, lowercased
SUMMARY="Signs/verifies Internet mail with DKIM/DomainKey signatures"
DESC="$SUMMARY"

MIRROR=ftp://ftp.funet.fi/pub/languages/perl/

PREFIX=/opt/niksula
reset_configure_opts

NO_PARALLEL_MAKE=1

# Only 5.16.1 and later will get individual module builds
PERLVERLIST="5.18.1"

# Add any additional deps here; perl runtime added below
BUILD_DEPENDS_IPS="niksula/perl/net-dns niksula/perl/crypt-openssl-rsa niksula/perl/mailtools"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# We require a Perl version to use for this build and there is no default
case $DEPVER in
    5.18.1)
        RUN_DEPENDS_IPS="$RUN_DEPENDS_IPS niksula/runtime/perl"
        ;;
    "")
        logerr "You must specify a version with -d DEPVER. Valid versions: $PERLVERLIST"
        ;;
esac

# Uncomment and set PREFIX if any modules install site binaries
#save_function make_isa_stub make_isa_stub_orig
#make_isa_stub() {
#    PREFIX=/usr make_isa_stub_orig
#}

rm_sample_script() {
    # lib/perl5/site_perl/5.18.1/Mail/sample_mime_lite.pl hardcodes
    # /usr/bin/perl hashbang so pkgdepend will make this depend on system perl.
    # let's just remove the sample
    rm -f ${DESTDIR}${PREFIX}/lib/perl5/site_perl/$DEPVER/Mail/sample_mime_lite.pl
}

init
test_if_core
download_source CPAN/authors/id/${AUTHORID:0:1}/${AUTHORID:0:2}/${AUTHORID} $PROG $VER
patch_source
prep_build
buildperl
rm_sample_script
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
