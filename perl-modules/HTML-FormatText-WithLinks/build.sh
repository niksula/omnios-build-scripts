#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-FormatText-WithLinks
VER=0.14
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-FormatText-WithLinks
SUMMARY='HTML to text conversion with links as footnotes'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/HTML-Format
pkg:/niksula/perl5/HTML-Tree"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/ST/STRUAN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
