#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Accessor-Chained
VER=0.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Accessor-Chained
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Accessor"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RC/RCLAMP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
