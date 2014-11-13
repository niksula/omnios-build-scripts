#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Number-Delta
VER=1.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Number-Delta
SUMMARY='Compare the difference between numbers against a given tolerance'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DA/DAGOLDEN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
