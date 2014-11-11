#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Parser
VER=3.71
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Parser
SUMMARY='HTML parser class'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Tagset"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS HTML-Parser 3.71
patch_source
prep_build
buildperl
make_package
clean_up
