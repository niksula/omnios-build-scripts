#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-Autoformat
VER=1.669006
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-Autoformat
SUMMARY='Automatic text wrapping and reformatting'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Text-Reform"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DC/DCONWAY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
