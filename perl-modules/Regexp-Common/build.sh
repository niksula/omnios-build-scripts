#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Regexp-Common
VER=2016020301
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Regexp-Common
SUMMARY='Provide commonly requested regular expressions'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AB/ABIGAIL $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
