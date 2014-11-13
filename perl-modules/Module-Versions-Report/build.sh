#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Versions-Report
VER=1.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Versions-Report
SUMMARY='report versions of all modules in memory'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JE/JESSE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
