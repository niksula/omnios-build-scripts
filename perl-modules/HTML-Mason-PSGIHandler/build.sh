#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Mason-PSGIHandler
VER=0.53
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Mason-PSGIHandler
SUMMARY='PSGI handler for HTML::Mason'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Plack
pkg:/niksula/perl5/HTML-Mason
pkg:/niksula/perl5/CGI-PSGI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RU/RUZ $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
