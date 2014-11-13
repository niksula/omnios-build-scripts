#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DateTime
VER=1.12
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DateTime
SUMMARY='A date and time object for Perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Params-Validate
pkg:/niksula/perl5/DateTime-TimeZone
pkg:/niksula/perl5/DateTime-Locale
pkg:/niksula/perl5/Test-Warnings
pkg:/niksula/perl5/Try-Tiny
pkg:/niksula/perl5/Test-Fatal"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
