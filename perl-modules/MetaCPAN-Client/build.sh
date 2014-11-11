#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MetaCPAN-Client
VER=1.007001
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MetaCPAN-Client
SUMMARY='A comprehensive, DWIM-featured client to the MetaCPAN API'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/JSON-MaybeXS
pkg:/niksula/perl5/Safe-Isa
pkg:/niksula/perl5/Try-Tiny
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Search-Elasticsearch"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MICKEY MetaCPAN-Client 1.007001
patch_source
prep_build
buildperl
make_package
clean_up
