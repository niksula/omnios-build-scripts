#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Starlet
VER=0.24
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Starlet
SUMMARY='a simple, high-performance PSGI/Plack HTTP server'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-TCP
pkg:/niksula/perl5/libwww-perl
pkg:/niksula/perl5/Parallel-Prefork
pkg:/niksula/perl5/Plack
pkg:/niksula/perl5/Server-Starter"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# https://rt.cpan.org/Public/Bug/Display.html?id=100317
PERL_MAKE_TEST=

init
download_source authors/id/K/KA/KAZUHO $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
