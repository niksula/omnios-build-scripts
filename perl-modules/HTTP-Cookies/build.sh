#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Cookies
VER=6.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Cookies
SUMMARY='HTTP cookie jars'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTTP-Date
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GA/GAAS HTTP-Cookies 6.01
patch_source
prep_build
buildperl
make_package
clean_up
