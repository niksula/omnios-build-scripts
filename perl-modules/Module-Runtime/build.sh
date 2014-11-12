#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Runtime
VER=0.014
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Runtime
SUMMARY='runtime module handling'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/Z/ZE/ZEFRAM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
