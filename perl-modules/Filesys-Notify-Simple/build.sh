#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Filesys-Notify-Simple
VER=0.12
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Filesys-Notify-Simple
SUMMARY='Simple and dumb file system watcher'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-SharedFork"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA Filesys-Notify-Simple 0.12
patch_source
prep_build
buildperl
make_package
clean_up
