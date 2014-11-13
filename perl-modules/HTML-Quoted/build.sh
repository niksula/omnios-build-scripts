#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Quoted
VER=0.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Quoted
SUMMARY='extract structure of quoted HTML mail message'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TS/TSIBLEY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
