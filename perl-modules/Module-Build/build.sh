#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Module-Build
VER=0.4218
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Module-Build
SUMMARY='Build and install Perl modules'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/L/LE/LEONT $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
