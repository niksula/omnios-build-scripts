#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBD-Pg
VER=3.5.3
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBD-Pg
SUMMARY='DBI PostgreSQL interface'
DESC="$SUMMARY"

PATH=$PATH:/opt/pgsql/bin
BUILDARCH=64

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/database/postgresql
pkg:/niksula/perl5/App-Info
pkg:/niksula/perl5/DBI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TU/TURNSTEP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
