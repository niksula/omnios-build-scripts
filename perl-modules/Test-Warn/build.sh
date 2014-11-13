#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Warn
VER=0.30
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Warn
SUMMARY='Perl extension to test methods for warnings'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Sub-Uplevel"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CH/CHORNY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
