#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-Script
VER=1.07
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-Script
SUMMARY='Basic cross-platform tests for scripts'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Probe-Perl
pkg:/niksula/perl5/IPC-Run3"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AD/ADAMK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
