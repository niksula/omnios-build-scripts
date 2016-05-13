#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Cookie-Baker
VER=0.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Cookie-Baker
SUMMARY='Cookie string generator / parser'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Test-Time
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZEBURO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
