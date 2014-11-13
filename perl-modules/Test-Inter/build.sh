#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Inter
VER=1.05
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Inter
SUMMARY='framework for more readable interactive test scripts'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SB/SBECK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
