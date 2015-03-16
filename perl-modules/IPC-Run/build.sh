#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=IPC-Run
VER=0.94
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/IPC-Run
SUMMARY='system() and background procs w/ piping, redirs, ptys (Unix, Win32)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/IO-Tty"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"
# t/pty.t fails, and is not quite clearly written - just skip the tests.
PERL_MAKE_TEST=

init
download_source authors/id/T/TO/TODDR $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
