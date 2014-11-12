#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Digest-SHA1
VER=2.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Digest-SHA1
SUMMARY='Perl interface to the SHA-1 algorithm'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
