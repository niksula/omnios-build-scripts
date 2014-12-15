#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Config-General
VER=2.56
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Config-General
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TL/TLINDEN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
