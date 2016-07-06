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
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

PROG=puppet-lint
VER=2.0.0
VERHUMAN=$VER
PKG=system/management/puppet/puppet-lint
SUMMARY="Check that your Puppet manifests conform to the style guide"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='runtime/ruby'
DEPENDS_IPS='system/management/puppet runtime/ruby =runtime/ruby@2.2'
NOSCRIPTSTUB=1
TAR=gtar
REMOVE_PREVIOUS=1

GEM=${PREFIX}/bin/gem

build() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    gemdir=${DESTDIR}$($GEM environment gemdir) || logerr 'cannot get gemdir'
    # we could use 'gem build' and 'gem install' if they actually worked with
    # the release tarball of this particular gem; the gemspec expects output
    # from git ls-files so it will obviously not work without having the source
    # repo cloned
    logcmd $GEM build ${PROG}.gemspec || logerr 'gem build failed'
    logcmd $GEM install --local --install-dir $gemdir ./${PROG}-${VER}.gem \
        --bindir ${DESTDIR}${PREFIX}/bin || logerr 'gem install failed'
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
