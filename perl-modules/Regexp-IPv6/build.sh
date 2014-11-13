#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Regexp-IPv6
VER=0.03
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Regexp-IPv6
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/S/SA/SALVA $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
