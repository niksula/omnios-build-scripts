#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Crypt-OpenSSL-RSA
VER=0.28
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Crypt-OpenSSL-RSA
SUMMARY='RSA encoding and decoding, using the openSSL libraries'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Crypt-OpenSSL-Random"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PE/PERLER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
