#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=CGI-Emulate-PSGI
VER=0.20
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/CGI-Emulate-PSGI
SUMMARY='PSGI adapter for CGI'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
