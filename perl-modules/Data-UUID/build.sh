#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Data-UUID
VER=1.221
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Data-UUID
SUMMARY='Globally/Universally Unique Identifiers (GUIDs/UUIDs)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
