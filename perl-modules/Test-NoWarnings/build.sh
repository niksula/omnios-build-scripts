#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-NoWarnings
VER=1.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-NoWarnings
SUMMARY='Make sure you didnt emit any warnings while testing'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Tester"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AD/ADAMK Test-NoWarnings 1.04
patch_source
prep_build
buildperl
make_package
clean_up
