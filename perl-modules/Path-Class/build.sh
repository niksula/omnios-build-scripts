#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Path-Class
VER=0.35
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Path-Class
SUMMARY='Cross-platform path specification manipulation'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KW/KWILLIAMS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
