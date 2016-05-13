#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBI
VER=1.636
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBI
SUMMARY='Database independent interface for Perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TI/TIMB $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
