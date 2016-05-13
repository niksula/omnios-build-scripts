#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=List-UtilsBy
VER=0.10
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/List-UtilsBy
SUMMARY='higher-order list utility functions'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PEVANS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
