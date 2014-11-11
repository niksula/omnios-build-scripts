#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Apache-LogFormat-Compiler
VER=0.32
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Apache-LogFormat-Compiler
SUMMARY='Compile a log format string to perl-code '
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Try-Tiny
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/POSIX-strftime-Compiler
pkg:/niksula/perl5/Test-MockTime
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KA/KAZEBURO Apache-LogFormat-Compiler 0.32
patch_source
prep_build
buildperl
make_package
clean_up
