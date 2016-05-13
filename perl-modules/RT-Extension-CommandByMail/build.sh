#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=RT-Extension-CommandByMail
VER=2.01
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/RT-Extension-CommandByMail
SUMMARY='Change ticket metadata via email'
DESC="$SUMMARY"

BUILDARCH=64
PREFIX=/opt/rt4
PERL_MAKEFILE_OPTS="INSTALLDIRS=vendor INSTALLVENDORLIB=${PREFIX}/lib"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/application/rt@4.2.12"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/B/BP/BPS $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
