#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Mix
VER=0.005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Mix
SUMMARY='dynamic class mixing'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Params-Classify"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/Z/ZE/ZEFRAM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
