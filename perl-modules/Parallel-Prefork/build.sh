#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Parallel-Prefork
VER=0.18
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Parallel-Prefork
SUMMARY='A simple prefork server framework'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Accessor-Lite
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Proc-Wait3
pkg:/niksula/perl5/Scope-Guard
pkg:/niksula/perl5/Signal-Mask
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Test-SharedFork"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZUHO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
