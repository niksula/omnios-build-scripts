#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Server-Starter
VER=0.32
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Server-Starter
SUMMARY='a superdaemon for hot-deploying server programs'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Test-SharedFork
pkg:/niksula/perl5/Test-TCP"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZUHO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
