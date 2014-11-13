#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=GnuPG-Interface
VER=0.50
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/GnuPG-Interface
SUMMARY='supply object methods for interacting with GnuPG'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/MooX-HandlesVia
pkg:/niksula/perl5/MooX-late
pkg:/security/gnupg"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# Makefile.PL uses 'which gcc'
PATH=/opt/niksula/bin:$PATH

init
download_source authors/id/A/AL/ALEXMV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
