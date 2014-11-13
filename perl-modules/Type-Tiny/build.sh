#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Type-Tiny
VER=1.000005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Type-Tiny
SUMMARY='tiny, yet Moo(se)-compatible type constraint'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Exporter-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TOBYINK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
