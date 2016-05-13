#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTTP-Message
VER=6.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTTP-Message
SUMMARY='HTTP style messages'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Encode-Locale
pkg:/niksula/perl5/HTTP-Date
pkg:/niksula/perl5/IO-HTML
pkg:/niksula/perl5/LWP-MediaTypes
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
