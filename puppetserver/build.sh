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
# Copyright 2015 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=puppetserver
VER=2.1.1
VERHUMAN=$VER
PKG=system/management/puppetserver
SUMMARY="Puppet configuration management - server component"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='runtime/ruby'
RUN_DEPENDS_IPS='system/management/puppet@4 application/facter@3'
BUILDARCH=32

# ruby needs to be in PATH
PATH=${PATH}:${PREFIX}/bin

install_service() {
    methoddir=${DESTDIR}/lib/svc/method
    manifestdir=${DESTDIR}/lib/svc/manifest/application
    mkdir -p $methoddir $manifestdir
    install -m 0555 ${SRCDIR}/method-puppetserver ${methoddir}/puppetserver || logerr 'install method script failed'
    install -m 0444 ${SRCDIR}/puppetserver.xml ${manifestdir}/ || logerr 'install svc manifest failed'
}

# this is not an actual source package; they just ship a binary jar. however,
# seeing how the build dependencies are non-trivial, let's just use the binary
# for now (at least the release tarball is signed...)
build() {
    pushd $TMPDIR/$BUILDDIR >/dev/null
    # puppetlabs don't ship a license file in this tarball...
    logcmd wget -qO LICENSE.md "https://github.com/puppetlabs/puppet-server/blob/puppet-server-${VER}/LICENSE.md" || logerr 'failed to get license from the interwebs'
    # put stuff where puppetlabs assumes it goes, ie. /opt/puppetlabs and
    # /etc/puppetlabs, but keep the executable in $PREFIX/sbin
    logcmd make bindir=${PREFIX}/sbin confdir=/etc prefix=/opt/puppetlabs datadir=/opt/puppetlabs/server/apps DESTDIR=$DESTDIR install-puppetserver || logerr 'make install failed'
    logcmd install -m0644 ext/default ${DESTDIR}/etc/puppetlabs/puppetserver/ || logerr 'install defaults file failed'
    install_service
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
