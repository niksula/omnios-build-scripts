#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=CGI-PSGI
VER=0.15
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/CGI-PSGI
SUMMARY='Adapt CGI.pm to the PSGI protocol'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/CGI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
