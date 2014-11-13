#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=CSS-Squish
VER=0.10
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/CSS-Squish
SUMMARY='Compact many CSS files into one big file'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/Test-LongString"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TS/TSIBLEY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
