#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Container
VER=0.12
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Container
SUMMARY='Glues object frameworks together transparently'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Params-Validate"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KW/KWILLIAMS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
