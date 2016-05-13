#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Headers-Fast
VER=0.20
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Headers-Fast
SUMMARY='faster implementation of HTTP::Headers'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTTP-Date
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Test-Requires"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TOKUHIROM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
