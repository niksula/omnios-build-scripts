#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Encode-Detect
VER=1.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Encode-Detect
SUMMARY='An Encode::Encoding subclass that detects the encoding of data'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JG/JGMYERS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
