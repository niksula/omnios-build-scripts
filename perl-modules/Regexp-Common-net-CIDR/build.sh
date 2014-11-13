#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Regexp-Common-net-CIDR
VER=0.02
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Regexp-Common-net-CIDR
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Regexp-Common"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RU/RUZ $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
