#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Exception-Class
VER=1.40
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Exception-Class
SUMMARY='A module that allows you to declare real exception classes in Perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Class-Data-Inheritable
pkg:/niksula/perl5/Devel-StackTrace"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
