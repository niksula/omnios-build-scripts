#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Role-Tiny
VER=1.003004
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Role-Tiny
SUMMARY='Roles. Like a nouvelle cuisine portion size slice of Moose.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/H/HA/HAARG Role-Tiny 1.003004
patch_source
prep_build
buildperl
make_package
clean_up
