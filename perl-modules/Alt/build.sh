#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Alt
VER=0.16
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Alt
SUMMARY='Alternate Module Implementations'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Exception"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/I/IN/INGY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
