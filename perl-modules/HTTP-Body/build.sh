#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Body
VER=1.19
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Body
SUMMARY='HTTP Body Parser'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Deep
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GE/GETTY HTTP-Body 1.19
patch_source
prep_build
buildperl
make_package
clean_up
