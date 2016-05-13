#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DateTime-Format-Natural
VER=1.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DateTime-Format-Natural
SUMMARY='Parse informal natural language date/time strings'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Clone
pkg:/niksula/perl5/DateTime
pkg:/niksula/perl5/DateTime-TimeZone
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Module-Build
pkg:/niksula/perl5/Module-Util
pkg:/niksula/perl5/Params-Validate
pkg:/niksula/perl5/Test-MockTime
pkg:/niksula/perl5/boolean"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SC/SCHUBIGER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
