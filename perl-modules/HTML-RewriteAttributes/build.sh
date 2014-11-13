#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-RewriteAttributes
VER=0.05
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-RewriteAttributes
SUMMARY='concise attribute rewriting'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/HTML-Tagset"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TS/TSIBLEY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
