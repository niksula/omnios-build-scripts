#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Tester
VER=0.109
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Tester
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/F/FD/FDALY Test-Tester 0.109
patch_source
prep_build
buildperl
make_package
clean_up
