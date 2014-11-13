#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Locale-Maketext-Lexicon
VER=1.00
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Locale-Maketext-Lexicon
SUMMARY='Use other catalog formats in Maketext'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DRTECH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
