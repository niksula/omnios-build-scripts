#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Probe-Perl
VER=0.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Probe-Perl
SUMMARY='Information about the currently running perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KW/KWILLIAMS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
