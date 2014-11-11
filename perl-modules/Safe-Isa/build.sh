#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Safe-Isa
VER=1.000005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Safe-Isa
SUMMARY='Call isa, can, does and DOES safely on things that may not be objects'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER Safe-Isa 1.000005
patch_source
prep_build
buildperl
make_package
clean_up
