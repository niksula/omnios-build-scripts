#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Server-Starter
VER=0.17
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Server-Starter
SUMMARY='a superdaemon for hot-deploying server programs'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Proc-Wait3
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Scope-Guard"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZUHO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
