#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Crypt-OpenSSL-Random
VER=0.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Crypt-OpenSSL-Random
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RU/RURBAN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
