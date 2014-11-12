#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Stream-Buffered
VER=0.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Stream-Buffered
SUMMARY='temporary buffer to save bytes'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DO/DOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
