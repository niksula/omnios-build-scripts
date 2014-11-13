#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Tree-Simple
VER=1.24
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Tree-Simple
SUMMARY='A simple tree object'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Exception"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RS/RSAVAGE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
