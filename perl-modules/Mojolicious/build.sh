#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mojolicious
VER=6.61
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mojolicious
SUMMARY='Real-time web framework'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SR/SRI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
