#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Tagset
VER=3.20
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Tagset
SUMMARY='data tables useful in parsing HTML'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PETDANCE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
