#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Inspector
VER=1.28
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Inspector
SUMMARY='Get information about a class and its structure'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AD/ADAMK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
