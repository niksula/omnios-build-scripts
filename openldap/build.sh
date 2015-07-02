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
# Copyright 2011-2013 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=openldap
VER=2.4.41
VERHUMAN=$VER
PKG=application/openldap
SUMMARY="OpenLDAP, community developed LDAP software"
DESC="$SUMMARY"

BUILDARCH=32 # https://www.illumos.org/issues/4215 not yet fixed in 151006
BUILD_DEPENDS_IPS='database/bdb'

PREFIX=/opt/openldap
reset_configure_opts
CONFIGURE_OPTS="$CONFIGURE_OPTS --localstatedir=/var --enable-overlays --enable-crypt"

install_manifest() {
    smfdir=${DESTDIR}/lib/svc/manifest/network/ldap
    mkdir -p $smfdir
    cp ${SRCDIR}/files/slapd.xml $smfdir
}

# the default config file puts pidfile and argsfile under LOCALSTATEDIR/run,
# but that location won't be writable for openldap user (which we run slapd
# as), so let's ship a different default
install_slapdconf() {
    install -m 0600 ${SRCDIR}/files/slapd.conf ${DESTDIR}/${PREFIX}/etc/openldap/slapd.conf
}

install_solaris_schema() {
    for f in solaris.ldif solaris.schema; do
        install -m 0444 ${SRCDIR}/files/$f ${DESTDIR}/${PREFIX}/etc/openldap/schema/$f
    done
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
install_manifest
install_slapdconf
install_solaris_schema
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
