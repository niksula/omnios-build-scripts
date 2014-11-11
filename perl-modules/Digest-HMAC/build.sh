#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Digest-HMAC
VER=1.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Digest-HMAC
SUMMARY='Keyed-Hashing for Message Authentication'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS Digest-HMAC 1.03
patch_source
prep_build
buildperl
make_package
clean_up
