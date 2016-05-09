#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=URI
VER=1.71
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/URI
SUMMARY='Uniform Resource Identifiers (absolute and relative)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
