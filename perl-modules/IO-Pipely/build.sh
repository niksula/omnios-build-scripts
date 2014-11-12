#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IO-Pipely
VER=0.005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IO-Pipely
SUMMARY='Portably create pipe() or pipe-like handles, one way or another.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RC/RCAPUTO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
