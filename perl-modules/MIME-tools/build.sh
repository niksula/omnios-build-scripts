#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MIME-tools
VER=5.505
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MIME-tools
SUMMARY='Tools to manipulate MIME messages'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Deep
pkg:/niksula/perl5/MailTools"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DS/DSKOLL $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
