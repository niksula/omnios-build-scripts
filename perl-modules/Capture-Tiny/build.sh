#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Capture-Tiny
VER=0.27
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Capture-Tiny
SUMMARY='Capture STDOUT and STDERR from Perl, XS or external programs'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DA/DAGOLDEN Capture-Tiny 0.27
patch_source
prep_build
buildperl
make_package
clean_up
