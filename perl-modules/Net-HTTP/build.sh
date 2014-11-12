#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Net-HTTP
VER=6.07
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Net-HTTP
SUMMARY='Low-level HTTP connection (client)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MS/MSCHILLI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
