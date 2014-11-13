#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBIx-DBSchema
VER=0.44
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBIx-DBSchema
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/DBI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/I/IV/IVAN $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
