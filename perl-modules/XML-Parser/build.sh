#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=XML-Parser
VER=2.44
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/XML-Parser
SUMMARY='A perl module for parsing XML documents'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/libwww-perl"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# same problem as in NetAddr-IP
NO_PARALLEL_MAKE=1

init
download_source authors/id/T/TO/TODDR $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
