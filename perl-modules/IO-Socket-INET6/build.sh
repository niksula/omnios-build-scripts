#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IO-Socket-INET6
VER=2.72
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IO-Socket-INET6
SUMMARY='Object interface for AF_INET/AF_INET6 domain sockets'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Socket6"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHLOMIF $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
