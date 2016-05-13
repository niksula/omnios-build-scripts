#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Formatter
VER=2.14
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Formatter
SUMMARY='Base class for HTML formatters'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/File-Slurper
pkg:/niksula/perl5/Font-AFM
pkg:/niksula/perl5/HTML-Tree
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Test-CPAN-Meta
pkg:/niksula/perl5/Test-EOL
pkg:/niksula/perl5/Test-NoTabs"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/N/NI/NIGELM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
