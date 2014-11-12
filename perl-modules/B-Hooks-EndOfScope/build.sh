#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=B-Hooks-EndOfScope
VER=0.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/B-Hooks-EndOfScope
SUMMARY='Execute code after a scope finished compilation'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Implementation
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/Sub-Exporter-Progressive"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
