#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Devel-GlobalDestruction
VER=0.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Devel-GlobalDestruction
SUMMARY='Provides function returning the equivalent of C<${^GLOBAL_PHASE} eq DESTRUCT> for older perls.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Sub-Exporter-Progressive"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/H/HA/HAARG $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
