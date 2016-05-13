#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Clone
VER=0.38
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Clone
SUMMARY='recursively copy Perl datatypes'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GARU $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
