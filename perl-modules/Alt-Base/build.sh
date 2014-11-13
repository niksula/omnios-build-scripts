#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Alt-Base
VER=0.02
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Alt-Base
SUMMARY='Base class for alternate module'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Exception
pkg:/niksula/perl5/Alt"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHARYANTO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
