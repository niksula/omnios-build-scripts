#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Package-Stash
VER=0.37
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Package-Stash
SUMMARY='routines for manipulating stashes'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Dist-CheckConflicts
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Module-Implementation
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DO/DOY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
