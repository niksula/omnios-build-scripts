#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-MockTime
VER=0.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-MockTime
SUMMARY='Replaces actual time with simulated time '
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DD/DDICK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
