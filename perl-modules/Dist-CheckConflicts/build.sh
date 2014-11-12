#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Dist-CheckConflicts
VER=0.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Dist-CheckConflicts
SUMMARY='declare version conflicts for your dist'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Module-Runtime"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DO/DOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
