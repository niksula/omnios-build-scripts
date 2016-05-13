#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=boolean
VER=0.45
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/boolean
SUMMARY='Boolean support for Perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/I/IN/INGY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
