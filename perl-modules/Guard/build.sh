#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Guard
VER=1.022
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Guard
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/ML/MLEHMANN Guard 1.022
patch_source
prep_build
buildperl
make_package
clean_up
