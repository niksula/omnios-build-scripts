#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Tree
VER=5.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Tree
SUMMARY='Work with HTML in a DOM-like tree structure'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/HTML-Tagset
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CJ/CJM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
