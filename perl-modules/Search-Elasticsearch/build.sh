#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Search-Elasticsearch
VER=1.15
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Search-Elasticsearch
SUMMARY='The official client for Elasticsearch'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/Log-Any-Adapter
pkg:/niksula/perl5/JSON-MaybeXS
pkg:/niksula/perl5/namespace-clean
pkg:/niksula/perl5/Test-Exception
pkg:/niksula/perl5/Sub-Exporter
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/Any-URI-Escape
pkg:/niksula/perl5/Package-Stash
pkg:/niksula/perl5/libwww-perl
pkg:/niksula/perl5/Test-Deep
pkg:/niksula/perl5/HTTP-Message
pkg:/niksula/perl5/Try-Tiny
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/Hijk
pkg:/niksula/perl5/Log-Any-Adapter-Callback
pkg:/niksula/perl5/Log-Any"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DRTECH $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
