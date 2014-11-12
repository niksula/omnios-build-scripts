#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Without-Module
VER=0.18
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Without-Module
SUMMARY='Test fallback behaviour in absence of modules'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CO/CORION $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
