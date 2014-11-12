#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Method-Modifiers
VER=2.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Method-Modifiers
SUMMARY='Provides Moose-like method modifiers'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
