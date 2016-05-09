#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Moo
VER=2.001001
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Moo
SUMMARY='Minimalist Object Orientation (with Moose compatibility)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Role-Tiny
pkg:/niksula/perl5/Devel-GlobalDestruction
pkg:/niksula/perl5/Class-Method-Modifiers
pkg:/niksula/perl5/Module-Runtime"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/H/HA/HAARG $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
