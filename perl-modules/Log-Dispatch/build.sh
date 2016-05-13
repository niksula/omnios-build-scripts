#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Log-Dispatch
VER=2.56
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Log-Dispatch
SUMMARY='Dispatches messages to one or more outputs'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Devel-GlobalDestruction
pkg:/niksula/perl5/Dist-CheckConflicts
pkg:/niksula/perl5/IPC-Run3
pkg:/niksula/perl5/Module-Runtime
pkg:/niksula/perl5/Params-Validate
pkg:/niksula/perl5/Test-Fatal
pkg:/niksula/perl5/Test-Requires"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/D/DR/DROLSKY $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
