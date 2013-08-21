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
datadir=$1
[ -n "$datadir" ] || {
    echo "Please provide directory containing quake3 data files pak[0-8].pk3"
    echo "on the command line."
    exit 1
} >&2

PROG=q3data
VER=1.0
VERHUMAN=$VER
PKG=games/quake3/data
SUMMARY="Quake III Arena data files"
DESC="$SUMMARY"

build() {
    target=${DESTDIR}/usr/share/games/quake3/baseq3
    mkdir -p $target
    pushd "$datadir" >/dev/null
    for n in `seq 0 8`; do
        install -m 0644 pak${n}.pk3 ${target}/ || logerr "pak${n}.pk3 not found"
    done
    ln -s /etc/quake3/baseq3.cfg ${target}/server.cfg
    mkdir -p ${DESTDIR}/etc/quake3
    cat > ${DESTDIR}/etc/quake3/baseq3.cfg <<EOF
exec ffa.config
EOF
    popd >/dev/null
}

init
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
