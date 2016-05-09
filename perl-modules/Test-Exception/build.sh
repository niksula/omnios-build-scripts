#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Exception
VER=0.43
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Exception
SUMMARY='Test exception-based code'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Sub-Uplevel"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/EX/EXODIST $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
