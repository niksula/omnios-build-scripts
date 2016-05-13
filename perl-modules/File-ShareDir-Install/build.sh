#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-ShareDir-Install
VER=0.10
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-ShareDir-Install
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/G/GW/GWYN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
