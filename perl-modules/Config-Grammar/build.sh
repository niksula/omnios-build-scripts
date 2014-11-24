#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Config-Grammar
VER=1.10
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Config-Grammar
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DS/DSCHWEI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
