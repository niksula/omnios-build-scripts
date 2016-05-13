#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Time
VER=0.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Time
SUMMARY='Overrides the time() and sleep() core functions for testing'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/File-Slurp"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SA/SATOH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
