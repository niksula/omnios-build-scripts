#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Test-EOL
VER=1.6
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Test-EOL
SUMMARY='Check the correct line endings in your project'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/F/FR/FREW $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
