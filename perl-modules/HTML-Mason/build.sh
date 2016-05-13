#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=HTML-Mason
VER=1.56
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/HTML-Mason
SUMMARY='High-performance, dynamic web site authoring system'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/CGI
pkg:/niksula/perl5/Cache-Cache
pkg:/niksula/perl5/Class-Container
pkg:/niksula/perl5/Exception-Class
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/Log-Any
pkg:/niksula/perl5/Params-Validate
pkg:/niksula/perl5/Test-Deep"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
