#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-NoTabs
VER=1.4
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-NoTabs
SUMMARY='Check the presence of tabs in your project'
DESC="$SUMMARY"

TAR=gtar

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BO/BOBTFISH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
