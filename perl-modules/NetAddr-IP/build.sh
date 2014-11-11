#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=NetAddr-IP
VER=4.075
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/NetAddr-IP
SUMMARY='Manages IPv4 and IPv6 addresses and subnets'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIKER NetAddr-IP 4.075
patch_source
prep_build
buildperl
make_package
clean_up
