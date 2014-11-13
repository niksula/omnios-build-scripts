#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=DateTime-Format-Mail
VER=0.401
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/DateTime-Format-Mail
SUMMARY='Convert between DateTime and RFC2822/822 formats'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/DateTime
pkg:/niksula/perl5/Params-Validate"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BO/BOOK $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
