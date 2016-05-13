#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Net-CIDR
VER=0.18
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Net-CIDR
SUMMARY='Manipulate IPv4/IPv6 netblocks in CIDR notation'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MR/MRSAM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
