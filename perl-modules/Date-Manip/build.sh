#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Date-Manip
VER=6.53
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Date-Manip
SUMMARY='Date manipulation routines'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Inter"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SB/SBECK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
