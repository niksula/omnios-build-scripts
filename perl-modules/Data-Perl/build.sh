#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Data-Perl
VER=0.002009
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Data-Perl
SUMMARY='Base classes wrapping fundamental Perl data types.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Method-Modifiers
pkg:/niksula/perl5/strictures
pkg:/niksula/perl5/Test-Deep
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/Role-Tiny
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Test-Output
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MATTP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
