#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-Reform
VER=1.20
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-Reform
SUMMARY='Manual text wrapping and reformatting'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CH/CHORNY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
