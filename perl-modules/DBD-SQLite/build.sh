#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DBD-SQLite
VER=1.44
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DBD-SQLite
SUMMARY='Self Contained SQLite RDBMS in a DBI Driver'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/DBI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/I/IS/ISHIGAKI $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
