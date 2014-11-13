#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Manifest
VER=2.02
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Manifest
SUMMARY='Interact with a t/test_manifest file'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BD/BDFOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
