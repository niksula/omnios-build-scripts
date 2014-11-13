#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=JSON
VER=2.90
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/JSON
SUMMARY='JSON (JavaScript Object Notation) encoder/decoder'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MAKAMAKA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
