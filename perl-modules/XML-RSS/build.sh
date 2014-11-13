#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=XML-RSS
VER=1.55
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/XML-RSS
SUMMARY='creates and updates RSS files'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/XML-Parser
pkg:/niksula/perl5/DateTime-Format-W3CDTF
pkg:/niksula/perl5/Test-Manifest
pkg:/niksula/perl5/DateTime-Format-Mail
pkg:/niksula/perl5/DateTime"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SH/SHLOMIF $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
