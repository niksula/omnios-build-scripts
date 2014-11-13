#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Locale-Maketext-Fuzzy
VER=0.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Locale-Maketext-Fuzzy
SUMMARY='Maketext from already interpolated strings'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AU/AUDREYT $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
