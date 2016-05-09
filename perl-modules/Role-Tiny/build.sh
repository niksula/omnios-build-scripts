#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Role-Tiny
VER=2.000003
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Role-Tiny
SUMMARY='Roles. Like a nouvelle cuisine portion size slice of Moose.'
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
