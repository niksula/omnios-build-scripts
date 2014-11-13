#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-Template
VER=1.46
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-Template
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MJ/MJD $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
