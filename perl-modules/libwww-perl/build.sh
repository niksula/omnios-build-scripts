#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=libwww-perl
VER=6.08
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/libwww-perl
SUMMARY='The World-Wide Web library for Perl'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/HTTP-Cookies
pkg:/niksula/perl5/Net-HTTP
pkg:/niksula/perl5/Encode-Locale
pkg:/niksula/perl5/LWP-MediaTypes
pkg:/niksula/perl5/HTTP-Daemon
pkg:/niksula/perl5/File-Listing
pkg:/niksula/perl5/HTTP-Negotiate
pkg:/niksula/perl5/WWW-RobotRules
pkg:/niksula/perl5/HTTP-Date
pkg:/niksula/perl5/HTTP-Message"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MS/MSCHILLI libwww-perl 6.08
patch_source
prep_build
buildperl
make_package
clean_up
