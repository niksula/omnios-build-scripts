#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Error
VER=0.17022
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Error
SUMMARY='Error/exception handling in an OO-ish way'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHLOMIF $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
