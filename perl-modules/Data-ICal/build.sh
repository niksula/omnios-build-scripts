#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Data-ICal
VER=0.21
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Data-ICal
SUMMARY='Generates iCalendar (RFC 2445) calendar files'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Text-vFile-asData
pkg:/niksula/perl5/Class-ReturnValue
pkg:/niksula/perl5/Class-Accessor
pkg:/niksula/perl5/Test-LongString
pkg:/niksula/perl5/Test-NoWarnings
pkg:/niksula/perl5/Test-Warn"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AL/ALEXMV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
