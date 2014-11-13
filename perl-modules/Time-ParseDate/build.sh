#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Time-ParseDate
VER=2013.1113
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Time-ParseDate
SUMMARY='Parse and format time values'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MU/MUIR/modules $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
