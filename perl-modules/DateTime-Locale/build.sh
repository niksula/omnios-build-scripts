#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DateTime-Locale
VER=1.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DateTime-Locale
SUMMARY='Localization support for DateTime.pm'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Dist-CheckConflicts
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Params-Validate
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/Test-Warnings"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
