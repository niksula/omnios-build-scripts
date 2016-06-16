#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=constant-defer
VER=6
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/constant-defer
SUMMARY='Constant subs with deferred value calculation.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KR/KRYDE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
