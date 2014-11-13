#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Singleton
VER=1.5
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Singleton
SUMMARY='Base class for creating singleton objects'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHAY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
