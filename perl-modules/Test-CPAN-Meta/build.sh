#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-CPAN-Meta
VER=0.25
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-CPAN-Meta
SUMMARY='Validate your CPAN META.json files'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BA/BARBIE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
