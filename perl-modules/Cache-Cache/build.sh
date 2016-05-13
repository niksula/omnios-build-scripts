#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Cache-Cache
VER=1.08
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Cache-Cache
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Digest-SHA1
pkg:/niksula/perl5/Error
pkg:/niksula/perl5/IPC-ShareLite"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/R/RJ/RJBS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
