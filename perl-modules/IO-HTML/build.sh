#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IO-HTML
VER=1.001
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IO-HTML
SUMMARY='Open an HTML file with automatic charset detection'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CJ/CJM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
