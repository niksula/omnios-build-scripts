#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-vFile-asData
VER=0.08
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-vFile-asData
SUMMARY='parse vFile formatted files into data structures'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Accessor-Chained"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RC/RCLAMP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
