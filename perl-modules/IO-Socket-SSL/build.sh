#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IO-Socket-SSL
VER=2.027
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IO-Socket-SSL
SUMMARY='Nearly transparent SSL encapsulation for IO::Socket::INET.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Net-SSLeay"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SU/SULLR $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
