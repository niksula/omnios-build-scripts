#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DB_File
VER=1.835
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DB_File
SUMMARY='Perl5 access to Berkeley DB version 1.x'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
database/bdb"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PM/PMQS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
