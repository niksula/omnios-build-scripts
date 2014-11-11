#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=JSON-MaybeXS
VER=1.002006
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/JSON-MaybeXS
SUMMARY='Use L<Cpanel::JSON::XS> with a fallback to L<JSON::XS> and L<JSON::PP>'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/Test-Without-Module"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

init
download_source authors/id/E/ET/ETHER JSON-MaybeXS 1.002006
patch_source
prep_build
buildperl
make_package
clean_up
