#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=LWP-MediaTypes
VER=6.02
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/LWP-MediaTypes
SUMMARY='guess media type for a file or a URL'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
