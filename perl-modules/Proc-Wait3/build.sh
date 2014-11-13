#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Proc-Wait3
VER=0.04
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Proc-Wait3
SUMMARY='Perl extension for wait3 system call'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/C/CT/CTILMES $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
