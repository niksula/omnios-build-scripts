#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Exporter-Tiny
VER=0.042
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Exporter-Tiny
SUMMARY='an exporter with the features of Sub::Exporter but only core dependencies'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TOBYINK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
