#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-Which
VER=1.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-Which
SUMMARY='Portable implementation of the which utility'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Script"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AD/ADAMK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
