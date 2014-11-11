#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mail-SpamAssassin
VER=3.004000
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mail-SpamAssassin
SUMMARY='SpamAssassin is an extensible email filter which is used to identify spam'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/NetAddr-IP
pkg:/niksula/perl5/Mail-DKIM
pkg:/niksula/perl5/Net-DNS
pkg:/niksula/perl5/Digest-SHA1"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/K/KM/KMCGRAIL Mail-SpamAssassin 3.004000
patch_source
prep_build
buildperl
make_package
clean_up
