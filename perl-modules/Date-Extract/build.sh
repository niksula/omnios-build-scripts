#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Date-Extract
VER=0.05
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Date-Extract
SUMMARY='extract probable dates from strings'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-MockTime
pkg:/niksula/perl5/DateTime-Format-Natural
pkg:/niksula/perl5/Class-Data-Inheritable"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHARYANTO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
