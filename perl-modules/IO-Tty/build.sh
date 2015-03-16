#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IO-Tty
VER=1.12
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IO-Tty
SUMMARY='Pseudo ttys and constants'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/T/TO/TODDR $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
