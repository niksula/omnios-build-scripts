#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Log-Any
VER=1.040
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Log-Any
SUMMARY='Bringing loggers and listeners together'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DA/DAGOLDEN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
