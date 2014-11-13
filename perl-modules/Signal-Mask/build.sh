#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Signal-Mask
VER=0.008
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Signal-Mask
SUMMARY='Signal masks made easy'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/IPC-Signal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/L/LE/LEONT $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
