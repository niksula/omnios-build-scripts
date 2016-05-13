#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=POSIX-strftime-Compiler
VER=0.41
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/POSIX-strftime-Compiler
SUMMARY='GNU C library compatible strftime for loggers and servers'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Module-Build"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZEBURO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
