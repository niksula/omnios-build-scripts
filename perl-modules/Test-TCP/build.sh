#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-TCP
VER=2.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-TCP
SUMMARY='testing TCP program'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-SharedFork"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TOKUHIROM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
