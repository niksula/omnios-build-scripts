#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Devel-Cycle
VER=1.12
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Devel-Cycle
SUMMARY='Find memory cycles in objects'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/L/LD/LDS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
