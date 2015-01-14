#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=Mail-SpamAssassin
VER=3.4.0
VERHUMAN="$VER (perl$PERLVER)"
PKG=niksula/perl5/Mail-SpamAssassin
SUMMARY='SpamAssassin is an extensible email filter which is used to identify spam'
DESC="$SUMMARY"

BUILD_DEPENDS_IPS="=pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/runtime/perl@$PERLVER_MINOR
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/NetAddr-IP
pkg:/niksula/perl5/Mail-DKIM
pkg:/niksula/perl5/Net-DNS
pkg:/niksula/perl5/Digest-SHA1
pkg:/niksula/perl5/DB_File
pkg:/niksula/perl5/Encode-Detect
pkg:/niksula/perl5/HTTP-Date
pkg:/niksula/perl5/IO-Socket-INET6
security/gnupg"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

# if we pure_install, we won't get rules files and default configuration
make_pure_install() {
    make_install
}
PERL_MAKEFILE_OPTS="$PERL_MAKEFILE_OPTS
INSTALLVENDORSCRIPT=/opt/niksula/bin
INSTALLVENDORMAN1DIR=/opt/niksula/share/man/man1
SYSCONFDIR=/opt/niksula/etc
LOCALSTATEDIR=/opt/niksula/var"

# same problem with make as in NetAddr-IP/build.sh
NO_PARALLEL_MAKE=1

# gpg needs to be in PATH during build
PATH=$PATH:/opt/niksula/bin

install_manifest() {
    tgtdir=${DESTDIR}/lib/svc/manifest/mail
    mkdir -p ${tgtdir}
    install -m 0444 ${SRCDIR}/spamd.xml ${tgtdir}/spamassassin-spamd.xml || logerr 'manifest install failed'
}

init
download_source authors/id/K/KM/KMCGRAIL/SpamAssassin $PROG $VER
patch_source
prep_build
buildperl
install_manifest
make_isa_stub
make_package
clean_up
