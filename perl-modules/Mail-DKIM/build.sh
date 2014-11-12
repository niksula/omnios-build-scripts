#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mail-DKIM
VER=0.40
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mail-DKIM
SUMMARY='Signs/verifies Internet mail with DKIM/DomainKey signatures'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Crypt-OpenSSL-RSA
pkg:/niksula/perl5/Net-DNS
pkg:/niksula/perl5/MailTools"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/J/JA/JASLONG $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
