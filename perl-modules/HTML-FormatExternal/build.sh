#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-FormatExternal
VER=22
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-FormatExternal
SUMMARY='HTML to text formatting using external programs.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/IPC-Run
pkg:/web/browser/lynx"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KR/KRYDE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
