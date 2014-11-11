#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Sub-Exporter
VER=0.987
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Sub-Exporter
SUMMARY='a sophisticated exporter for custom-built routines'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Params-Util
pkg:/niksula/perl5/Data-OptList
pkg:/niksula/perl5/Sub-Install"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS Sub-Exporter 0.987
patch_source
prep_build
buildperl
make_package
clean_up
