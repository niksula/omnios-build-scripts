#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-Slurp
VER=9999.19
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-Slurp
SUMMARY='Simple and Efficient Reading/Writing/Modifying of Complete Files'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/U/UR/URI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
