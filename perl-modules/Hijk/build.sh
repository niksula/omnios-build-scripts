#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Hijk
VER=0.17
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Hijk
SUMMARY='Fast & minimal low-level HTTP client'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Exception
pkg:/niksula/perl5/Plack"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AV/AVAR Hijk 0.17
patch_source
prep_build
buildperl
make_package
clean_up
