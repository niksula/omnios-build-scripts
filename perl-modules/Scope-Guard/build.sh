#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Scope-Guard
VER=0.21
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Scope-Guard
SUMMARY='lexically-scoped resource management'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CH/CHOCOLATE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
