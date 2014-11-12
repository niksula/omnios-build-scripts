#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Any-URI-Escape
VER=0.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Any-URI-Escape
SUMMARY='Load URI::Escape::XS preferentially over URI::Escape'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/P/PH/PHRED $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
