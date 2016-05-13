#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Util
VER=1.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Util
SUMMARY='Module name tools and transformations'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MATTLAW $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
