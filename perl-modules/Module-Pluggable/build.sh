#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Pluggable
VER=5.2
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Pluggable
SUMMARY='automatically give your module the ability to have plugins'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SI/SIMONW $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
