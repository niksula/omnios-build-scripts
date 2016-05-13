#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Text-Autoformat
VER=1.74
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Text-Autoformat
SUMMARY='Automatic text wrapping and reformatting'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Text-Reform"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/N/NE/NEILB $PROG $VER
# because we previously published 1.669006, we need to make this version larger
# in realities other than perl as well. just add trailing zeroes...
VER="${VER}0000"
patch_source
prep_build
buildperl
make_package
clean_up
