#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-Listing
VER=6.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-Listing
SUMMARY='parse directory listing'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTTP-Date"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
