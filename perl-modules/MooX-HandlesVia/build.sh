#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=MooX-HandlesVia
VER=0.001005
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/MooX-HandlesVia
SUMMARY='NativeTrait-like behavior for Moo.'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Role-Tiny
pkg:/niksula/perl5/Moo
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/MooX-Types-MooseLike
pkg:/niksula/perl5/Class-Method-Modifiers
pkg:/niksula/perl5/Data-Perl
pkg:/niksula/perl5/Test-Exception"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/M/MA/MATTP $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
