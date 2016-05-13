#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-FormatText-WithLinks
VER=0.15
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-FormatText-WithLinks
SUMMARY='HTML to text conversion with links as footnotes'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Formatter
pkg:/niksula/perl5/HTML-Tree
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/ST/STRUAN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
