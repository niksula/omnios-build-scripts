#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBD-Pg
VER=3.4.2
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBD-Pg
SUMMARY='DBI PostgreSQL interface'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/DBI
pkg:/database/postgresql"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TU/TURNSTEP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
