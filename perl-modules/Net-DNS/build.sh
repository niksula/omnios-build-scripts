#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Net-DNS
VER=0.81
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Net-DNS
SUMMARY='Perl DNS resolver module'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Digest-HMAC"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/N/NL/NLNETLABS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
