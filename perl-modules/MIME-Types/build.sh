#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MIME-Types
VER=2.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MIME-Types
SUMMARY='Definition of MIME types'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MARKOV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
