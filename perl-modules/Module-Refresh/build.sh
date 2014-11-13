#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Refresh
VER=0.17
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Refresh
SUMMARY='Refresh %INC files when updated on disk'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Path-Class"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AL/ALEXMV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
