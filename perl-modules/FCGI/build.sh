#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=FCGI
VER=0.78
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/FCGI
SUMMARY='Fast CGI module'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# distclean removes 'configure' and clean removes 'fcgi_config.h.in', but both
# are required for the build to succeed. Just don't do anything.
make_clean() {
    :
}

init
download_source authors/id/E/ET/ETHER $PROG $VER
patch_source
prep_build
buildperl
make_package
clean_up
