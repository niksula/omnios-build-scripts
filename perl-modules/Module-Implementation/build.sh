#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Implementation
VER=0.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Implementation
SUMMARY='Loads one of several alternate underlying implementations for a module'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Try-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
