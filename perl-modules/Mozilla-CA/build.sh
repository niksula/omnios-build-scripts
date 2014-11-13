#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mozilla-CA
VER=20130114
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mozilla-CA
SUMMARY='Mozillas CA cert bundle in PEM format'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AB/ABH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
