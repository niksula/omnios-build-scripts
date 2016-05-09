#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mojo-IOLoop-ForkCall
VER=0.17
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mojo-IOLoop-ForkCall
SUMMARY='run blocking functions asynchronously by forking'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Mojolicious
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/IO-Pipely"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JB/JBERGER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
