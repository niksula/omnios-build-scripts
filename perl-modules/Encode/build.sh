#!/usr/bin/bash

# XXX this is shipped with perl, but we need a newer one

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Encode
VER=2.70
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Encode
SUMMARY='unknown'
DESC="$SUMMARY"

NO_PARALLEL_MAKE=1

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DA/DANKOGAI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
