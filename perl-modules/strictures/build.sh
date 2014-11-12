#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=strictures
VER=1.005005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/strictures
SUMMARY='turn on strict and make all warnings fatal'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/H/HA/HAARG $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
