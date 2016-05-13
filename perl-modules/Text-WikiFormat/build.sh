#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-WikiFormat
VER=0.81
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-WikiFormat
SUMMARY='module for translating Wiki formatted text into other formats'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CY/CYCLES $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
