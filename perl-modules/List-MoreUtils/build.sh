#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=List-MoreUtils
VER=0.415
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/List-MoreUtils
SUMMARY='Provide the stuff missing in List::Util'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Exporter-Tiny"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RE/REHSACK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
