#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IPC-ShareLite
VER=0.17
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IPC-ShareLite
SUMMARY='Lightweight interface to shared memory'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AN/ANDYA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
