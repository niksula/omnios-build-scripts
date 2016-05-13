#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-FormatText-WithLinks-AndTables
VER=0.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-FormatText-WithLinks-AndTables
SUMMARY='Converts HTML to Text with tables intact'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-FormatText-WithLinks
pkg:/niksula/perl5/HTML-Formatter
pkg:/niksula/perl5/HTML-Tree"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DA/DALEEVANS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
