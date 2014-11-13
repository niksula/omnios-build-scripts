#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Data-GUID
VER=0.048
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Data-GUID
SUMMARY='globally unique identifiers'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Sub-Install
pkg:/niksula/perl5/Data-UUID
pkg:/niksula/perl5/Sub-Exporter"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
