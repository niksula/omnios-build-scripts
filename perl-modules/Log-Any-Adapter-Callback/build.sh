#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Log-Any-Adapter-Callback
VER=0.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Log-Any-Adapter-Callback
SUMMARY='Send Log::Any logs to a subroutine'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Log-Any-Adapter"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHARYANTO Log-Any-Adapter-Callback 0.09
patch_source
prep_build
buildperl
make_package
clean_up
