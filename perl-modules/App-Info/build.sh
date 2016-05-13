#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=App-Info
VER=0.57
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/App-Info
SUMMARY='Information about software packages on a system'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DW/DWHEELER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
