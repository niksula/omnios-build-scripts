#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Hash-MultiValue
VER=0.15
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Hash-MultiValue
SUMMARY='Store multiple values per key'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA Hash-MultiValue 0.15
patch_source
prep_build
buildperl
make_package
clean_up
