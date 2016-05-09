#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Scalar-List-Utils
VER=1.45
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Scalar-List-Utils
SUMMARY='Common Scalar and List utility subroutines'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PEVANS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
