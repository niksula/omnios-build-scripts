#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Plack
VER=1.0033
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Plack
SUMMARY='Perl Superglue for Web frameworks and Web Servers (PSGI toolkit)'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/Try-Tiny
pkg:/niksula/perl5/Test-Requires
pkg:/niksula/perl5/File-ShareDir-Install
pkg:/niksula/perl5/HTTP-Body
pkg:/niksula/perl5/Devel-StackTrace-AsHTML
pkg:/niksula/perl5/Apache-LogFormat-Compiler
pkg:/niksula/perl5/Stream-Buffered
pkg:/niksula/perl5/Test-TCP
pkg:/niksula/perl5/Devel-StackTrace
pkg:/niksula/perl5/Filesys-Notify-Simple
pkg:/niksula/perl5/HTTP-Message
pkg:/niksula/perl5/File-ShareDir
pkg:/niksula/perl5/Hash-MultiValue"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MI/MIYAGAWA Plack 1.0033
patch_source
prep_build
buildperl
make_package
clean_up
