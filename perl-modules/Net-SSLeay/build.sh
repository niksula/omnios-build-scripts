#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Net-SSLeay
VER=1.66
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Net-SSLeay
SUMMARY='Perl extension for using OpenSSL'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIKEM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
