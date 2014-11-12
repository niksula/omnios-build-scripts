#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Fatal
VER=0.013
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Fatal
SUMMARY='incredibly simple helpers for testing code with exceptions'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Try-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
