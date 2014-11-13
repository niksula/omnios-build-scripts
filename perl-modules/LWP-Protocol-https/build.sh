#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=LWP-Protocol-https
VER=6.06
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/LWP-Protocol-https
SUMMARY='Provide https support for LWP::UserAgent'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/IO-Socket-SSL
pkg:/niksula/perl5/Net-HTTP
pkg:/niksula/perl5/libwww-perl
pkg:/niksula/perl5/Mozilla-CA"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MS/MSCHILLI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
