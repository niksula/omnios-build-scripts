#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Negotiate
VER=6.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Negotiate
SUMMARY='choose a variant to serve'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
