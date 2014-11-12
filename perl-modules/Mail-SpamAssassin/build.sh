#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mail-SpamAssassin
VER=3.4.0
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

# if we pure_install, we won't get rules files and default configuration
make_pure_install() {
    make_install
}
# install bins to user path
PERL_MAKEFILE_OPTS="$PERL_MAKEFILE_OPTS installvendorbin=/opt/niksula/bin"
# same problem with make as in NetAddr-IP/build.sh
NO_PARALLEL_MAKE=1

init
download_source authors/id/K/KM/KMCGRAIL/SpamAssassin $PROG $VER
patch_source
prep_build
buildperl
make_isa_stub
make_package
clean_up
