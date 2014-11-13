#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IPC-Run3
VER=0.048
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IPC-Run3
SUMMARY='run a subprocess with input/ouput redirection'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
