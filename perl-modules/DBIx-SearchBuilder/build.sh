#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBIx-SearchBuilder
VER=1.66
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBIx-SearchBuilder
SUMMARY='Encapsulate SQL queries and rows in simple perl objects'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Cache-Simple-TimedExpiry
pkg:/niksula/perl5/Class-Accessor
pkg:/niksula/perl5/Class-ReturnValue
pkg:/niksula/perl5/Clone
pkg:/niksula/perl5/DBD-SQLite
pkg:/niksula/perl5/DBI
pkg:/niksula/perl5/DBIx-DBSchema
pkg:/niksula/perl5/Want"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AL/ALEXMV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
