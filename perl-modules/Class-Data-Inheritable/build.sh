#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Class-Data-Inheritable
VER=0.08
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Class-Data-Inheritable
SUMMARY='Inheritable, overridable class data'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TM/TMTM $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
