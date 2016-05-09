#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=CGI
VER=4.28
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/CGI
SUMMARY='Handle Common Gateway Interface requests and responses'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/L/LE/LEEJO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
