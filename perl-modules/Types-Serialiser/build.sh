#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Types-Serialiser
VER=1.0
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Types-Serialiser
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/common-sense"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/ML/MLEHMANN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
