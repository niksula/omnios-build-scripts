#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Convert-Color
VER=0.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Convert-Color
SUMMARY='color space conversions and named lookups'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Number-Delta
pkg:/niksula/perl5/Module-Pluggable
pkg:/niksula/perl5/List-UtilsBy"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PEVANS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
