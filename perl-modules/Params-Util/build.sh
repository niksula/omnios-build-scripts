#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Params-Util
VER=1.07
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Params-Util
SUMMARY='Simple, compact and correct param-checking functions'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AD/ADAMK Params-Util 1.07
patch_source
prep_build
buildperl
make_package
clean_up
