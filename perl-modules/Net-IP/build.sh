#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Net-IP
VER=1.26
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Net-IP
SUMMARY='Perl extension for manipulating IPv4/IPv6 addresses'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MANU Net-IP 1.26
patch_source
prep_build
buildperl
make_package
clean_up
