#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-Slurper
VER=0.008
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-Slurper
SUMMARY='A simple, sane and efficient module to slurp a file'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/L/LE/LEONT $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
