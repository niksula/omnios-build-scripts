#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Devel-StackTrace-AsHTML
VER=0.15
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Devel-StackTrace-AsHTML
SUMMARY='Displays stack trace in HTML'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Devel-StackTrace"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
