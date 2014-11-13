#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Apache-Session
VER=1.93
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Apache-Session
SUMMARY='A persistence framework for session data'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Deep
pkg:/niksula/perl5/Test-Exception"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CH/CHORNY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
