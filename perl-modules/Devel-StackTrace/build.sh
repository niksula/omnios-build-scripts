#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Devel-StackTrace
VER=2.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Devel-StackTrace
SUMMARY='An object representing a stack trace'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
