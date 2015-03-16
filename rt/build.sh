#!/usr/bin/bash
#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
#
# Copyright 2014 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=rt
VER=4.2.10
VERHUMAN=$VER
PKG=application/rt
SUMMARY="RT: Request Tracker"
DESC="$SUMMARY"

BUILDARCH=64
PREFIX=/opt/rt4
reset_configure_opts
CONFIGURE_OPTS="$CONFIGURE_OPTS --with-db-type=Pg --disable-smime --with-my-user-group"

export PERL=/opt/niksula/perl5/bin/perl

BUILD_DEPENDS_IPS='database/postgresql
security/gnupg
pkg:/niksula/perl5/Apache-Session
pkg:/niksula/perl5/CGI-Emulate-PSGI
pkg:/niksula/perl5/CGI-PSGI
pkg:/niksula/perl5/Class-Accessor
pkg:/niksula/perl5/Convert-Color
pkg:/niksula/perl5/Crypt-Eksblowfish
pkg:/niksula/perl5/Crypt-SSLeay
pkg:/niksula/perl5/CSS-Squish
pkg:/niksula/perl5/Data-GUID
pkg:/niksula/perl5/Data-ICal
pkg:/niksula/perl5/Date-Extract
pkg:/niksula/perl5/Date-Manip
pkg:/niksula/perl5/DateTime
pkg:/niksula/perl5/DateTime-Format-Natural
pkg:/niksula/perl5/DateTime-Locale
pkg:/niksula/perl5/DBD-Pg
pkg:/niksula/perl5/DBI
pkg:/niksula/perl5/DBIx-SearchBuilder
pkg:/niksula/perl5/Devel-GlobalDestruction
pkg:/niksula/perl5/Devel-StackTrace
pkg:/niksula/perl5/Email-Address
pkg:/niksula/perl5/Email-Address-List
pkg:/niksula/perl5/FCGI
pkg:/niksula/perl5/FCGI-ProcManager
pkg:/niksula/perl5/File-ShareDir
pkg:/niksula/perl5/File-Which
pkg:/niksula/perl5/GnuPG-Interface
pkg:/niksula/perl5/HTML-FormatExternal
pkg:/niksula/perl5/HTML-FormatText-WithLinks
pkg:/niksula/perl5/HTML-FormatText-WithLinks-AndTables
pkg:/niksula/perl5/HTML-Mason
pkg:/niksula/perl5/HTML-Mason-PSGIHandler
pkg:/niksula/perl5/HTML-Parser
pkg:/niksula/perl5/HTML-Quoted
pkg:/niksula/perl5/HTML-RewriteAttributes
pkg:/niksula/perl5/HTML-Scrubber
pkg:/niksula/perl5/HTTP-Message
pkg:/niksula/perl5/IPC-Run3
pkg:/niksula/perl5/JSON
pkg:/niksula/perl5/libwww-perl
pkg:/niksula/perl5/List-MoreUtils
pkg:/niksula/perl5/Locale-Maketext-Fuzzy
pkg:/niksula/perl5/Locale-Maketext-Lexicon
pkg:/niksula/perl5/Log-Dispatch
pkg:/niksula/perl5/LWP-Protocol-https
pkg:/niksula/perl5/MailTools
pkg:/niksula/perl5/MIME-tools
pkg:/niksula/perl5/MIME-Types
pkg:/niksula/perl5/Module-Refresh
pkg:/niksula/perl5/Module-Versions-Report
pkg:/niksula/perl5/Mozilla-CA
pkg:/niksula/perl5/Net-CIDR
pkg:/niksula/perl5/PerlIO-eol
pkg:/niksula/perl5/Plack
pkg:/niksula/perl5/Regexp-Common
pkg:/niksula/perl5/Regexp-Common-net-CIDR
pkg:/niksula/perl5/Regexp-IPv6
pkg:/niksula/perl5/Role-Basic
pkg:/niksula/perl5/Starlet
pkg:/niksula/perl5/Symbol-Global-Name
pkg:/niksula/perl5/TermReadKey
pkg:/niksula/perl5/Text-Password-Pronounceable
pkg:/niksula/perl5/Text-Quoted
pkg:/niksula/perl5/Text-Template
pkg:/niksula/perl5/Text-WikiFormat
pkg:/niksula/perl5/Text-Wrapper
pkg:/niksula/perl5/Time-ParseDate
pkg:/niksula/perl5/Tree-Simple
pkg:/niksula/perl5/UNIVERSAL-require
pkg:/niksula/perl5/URI
pkg:/niksula/perl5/XML-RSS'
# modules shipped with perl, which we need a newer version of
BUILD_DEPENDS_IPS="$BUILD_DEPENDS_IPS pkg:/niksula/perl5/CGI@4 pkg:/niksula/perl5/Encode@2.70"
RUN_DEPENDS_IPS="$BUILD_DEPENDS_IPS"

install_manifest() {
    tgtdir=${DESTDIR}/lib/svc/manifest/application
    mkdir -p $tgtdir
    install -m 0444 ${SRCDIR}/rt.xml ${tgtdir}/ || logerr 'manifest install failed'
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
install_manifest
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
