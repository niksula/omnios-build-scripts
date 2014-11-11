#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Import-Into
VER=1.002004
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Import-Into
SUMMARY='Import packages into other packages'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Runtime"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER Import-Into 1.002004
patch_source
prep_build
buildperl
make_package
clean_up
