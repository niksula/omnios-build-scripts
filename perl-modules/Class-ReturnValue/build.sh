#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-ReturnValue
VER=0.55
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-ReturnValue
SUMMARY='A smart return value object'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Devel-StackTrace"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JE/JESSE $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
