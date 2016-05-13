#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Body
VER=1.22
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Body
SUMMARY='HTTP Body Parser'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTTP-Message
pkg:/niksula/perl5/Test-Deep"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GE/GETTY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
