#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Role-Basic
VER=0.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Role-Basic
SUMMARY='Just roles. Nothing else.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/O/OV/OVID $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
