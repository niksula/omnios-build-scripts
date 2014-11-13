#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MooX-Types-MooseLike
VER=0.27
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MooX-Types-MooseLike
SUMMARY='some Moosish types and a type builder'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Module-Runtime"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MATEU $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
