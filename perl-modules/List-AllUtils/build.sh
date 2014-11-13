#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=List-AllUtils
VER=0.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/List-AllUtils
SUMMARY='Combines List::Util and List::MoreUtils in one bite-sized package'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Warnings
pkg:/niksula/perl5/List-MoreUtils"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
