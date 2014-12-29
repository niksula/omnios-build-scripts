#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=RT-Extension-CommandByMail
VER=1.00
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/RT-Extension-CommandByMail
SUMMARY='Change metadata of ticket via email'
DESC="$SUMMARY"

BUILDARCH=64
PREFIX=/opt/rt4
PERL_MAKEFILE_OPTS="INSTALLDIRS=vendor INSTALLVENDORLIB=${PREFIX}/lib"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/application/rt@4.2.9"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/A/AL/ALEXMV $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
