#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MailTools
VER=2.13
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MailTools
SUMMARY='Various e-mail related modules'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/TimeDate"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MARKOV MailTools 2.13
patch_source
prep_build
buildperl
make_package
clean_up
