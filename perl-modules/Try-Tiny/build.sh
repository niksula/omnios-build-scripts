#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Try-Tiny
VER=0.22
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Try-Tiny
SUMMARY='minimal try/catch with proper preservation of $@'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DO/DOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
