#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-SharedFork
VER=0.29
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-SharedFork
SUMMARY='fork test'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Requires"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/EX/EXODIST Test-SharedFork 0.29
patch_source
prep_build
buildperl
make_package
clean_up
