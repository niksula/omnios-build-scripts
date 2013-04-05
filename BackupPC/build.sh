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

PROG=BackupPC      # App name
VER=3.2.1            # App version
VERHUMAN=$VER   # Human-readable version
#PVER=          # Branch (set in config.sh, override here if needed)
PKG=backup/backuppc            # Package name (e.g. library/foo)
SUMMARY="high-performance, enterprise-grade system for backing up PCs"      # One-liner, must be filled in
DESC="$SUMMARY"         # Longer description, must be filled in

BUILD_DEPENDS_IPS='runtime/perl-5142/manual'

build() {
    pushd $TMPDIR/$BUILDDIR >/dev/null
    DIRPREFIX=/usr/share/backuppc
    DATADIR=/var/lib/backuppc
    logcmd ./configure.pl --batch --hostname XXXXXX --uid-ignore \
        --install-dir $DIRPREFIX --dest-dir $DESTDIR --data-dir $DATADIR \
        --cgi-dir ${DIRPREFIX}/cgi-bin --html-dir ${DIRPREFIX}/image \
        --html-dir-url /backuppc/image --no-set-perms --config-dir /etc/backuppc \
        --log-dir /var/log/backuppc
    /usr/perl5/5.14.2/bin/pod2man doc/BackupPC.pod backuppc.8
    perl -e "s/.IX Title.*/.SH NAME\nbackuppc \\- BackupPC manual/g" -p -i.tmp backuppc.8
    install -d ${DESTDIR}/usr/share/man/man8
    install -m 0644 backuppc.8 ${DESTDIR}/usr/share/man/man8/
    install -d ${DESTDIR}/lib/svc/manifest/backup
    install -m 0444 ${SRCDIR}/backuppc.xml ${DESTDIR}/lib/svc/manifest/backup/
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
