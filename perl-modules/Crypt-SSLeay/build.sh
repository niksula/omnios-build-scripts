#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Crypt-SSLeay
VER=0.72
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Crypt-SSLeay
SUMMARY='OpenSSL support for LWP'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/LWP-Protocol-https
pkg:/niksula/perl5/Path-Class
pkg:/niksula/perl5/Try-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/N/NA/NANIS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
