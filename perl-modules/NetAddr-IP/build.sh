#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=NetAddr-IP
VER=4.079
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/NetAddr-IP
SUMMARY='Manages IPv4 and IPv6 addresses and subnets'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# Makefile.PL apparently sets MAKE = make explicitly. We could workaround by
# giving MAKE=gmake argument to make, but actually just opting for serial build
# will do (because the failure comes from the difference in space accepted
# between -j and number in dmake/gmake)
NO_PARALLEL_MAKE=1

init
download_source authors/id/M/MI/MIKER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
