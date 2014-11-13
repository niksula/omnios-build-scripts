#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-FormatText-WithLinks-AndTables
VER=0.02
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-FormatText-WithLinks-AndTables
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

BUILDDIR="$PROG" # doesn't extract in the usual $PROG-$VER dir

init
download_source authors/id/S/SF/SFRYER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
