#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Sub-Install
VER=0.928
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Sub-Install
SUMMARY='install subroutines into packages easily'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS Sub-Install 0.928
patch_source
prep_build
buildperl
make_package
clean_up
