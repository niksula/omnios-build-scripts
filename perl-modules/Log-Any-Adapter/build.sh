#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Log-Any-Adapter
VER=0.11
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Log-Any-Adapter
SUMMARY='Tell Log::Any where to send its logs'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Guard
pkg:/niksula/perl5/Capture-Tiny
pkg:/niksula/perl5/Devel-GlobalDestruction
pkg:/niksula/perl5/Log-Any"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JS/JSWARTZ Log-Any-Adapter 0.11
patch_source
prep_build
buildperl
make_package
clean_up
