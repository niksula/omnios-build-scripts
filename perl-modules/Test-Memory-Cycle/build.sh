#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Memory-Cycle
VER=1.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Memory-Cycle
SUMMARY='Verifies code hasnt left circular references'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Devel-Cycle
pkg:/niksula/perl5/PadWalker"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PETDANCE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
