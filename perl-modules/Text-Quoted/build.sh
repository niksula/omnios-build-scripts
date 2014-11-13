#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-Quoted
VER=2.08
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-Quoted
SUMMARY='Extract the structure of a quoted mail message'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Text-Autoformat"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TS/TSIBLEY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
