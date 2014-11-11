#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=namespace-clean
VER=0.25
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/namespace-clean
SUMMARY='Keep imports and functions out of your namespace'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/B-Hooks-EndOfScope
pkg:/niksula/perl5/Package-Stash"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RI/RIBASUSHI namespace-clean 0.25
patch_source
prep_build
buildperl
make_package
clean_up
