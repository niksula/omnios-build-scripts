#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=PerlIO-eol
VER=0.14
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/PerlIO-eol
SUMMARY='PerlIO layer for normalizing line endings'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AU/AUDREYT $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
