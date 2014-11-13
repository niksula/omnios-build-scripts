#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=FCGI-ProcManager
VER=0.24
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/FCGI-ProcManager
SUMMARY='A perl-based FastCGI process manager'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BO/BOBTFISH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
