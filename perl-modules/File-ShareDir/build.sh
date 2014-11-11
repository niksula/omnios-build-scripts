#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=File-ShareDir
VER=1.102
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/File-ShareDir
SUMMARY='Locate per-dist and per-module shared files'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Inspector
pkg:/niksula/perl5/File-ShareDir-Install"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RE/REHSACK File-ShareDir 1.102
patch_source
prep_build
buildperl
make_package
clean_up
