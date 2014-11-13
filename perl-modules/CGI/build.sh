#!/usr/bin/bash

#
# NOTE: 'CGI' is also shipped with perl, but we need this newer version.
#

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=CGI
VER=4.09
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/CGI
SUMMARY='unknown'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# man pages are already shipped with perl runtime package
PERL_MAKEFILE_OPTS="$PERL_MAKEFILE_OPTS INSTALLMAN3DIR=none"

init
download_source authors/id/L/LE/LEEJO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
