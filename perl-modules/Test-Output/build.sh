#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Output
VER=1.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Output
SUMMARY='Utilities to test STDOUT and STDERR messages.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Tester
pkg:/niksula/perl5/Capture-Tiny
pkg:/niksula/perl5/Sub-Exporter"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BD/BDFOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
