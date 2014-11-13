#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MooX-late
VER=0.015
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MooX-late
SUMMARY='easily translate Moose code to Moo'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Type-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TOBYINK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
