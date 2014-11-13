#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=TermReadKey
VER=2.32
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/TermReadKey
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

NO_PARALLEL_MAKE=1

init
download_source authors/id/J/JS/JSTOWE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
