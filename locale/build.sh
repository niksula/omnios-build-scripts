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
# Copyright 2016 OmniTI Computer Consulting, Inc.  All rights reserved.
# Use is subject to license terms.
#
# Load support functions
. ../../lib/functions.sh

# we publish at a higher version than OmniOS ships (0.5.11) while still
# following the incorporate constraints on 0.5.11.
# however, that's not enough because the 'omnios' publisher is most likely
# configured sticky, and higher ranked than 'niksula.hut.fi'. so to install
# this, one needs to:
#   pkg install pkg://niksula.hut.fi/locale pkg://niksula.hut.fi/locale/'*'
# to force a publisher change.
PROG=locale
VER=0.5.11.0
VERHUMAN=20161117
PKG=locale
SUMMARY="Replacement locale data files for OmniOS"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS=developer/bmake
REMOVE_PREVIOUS=1
MAKE=/opt/niksula/bin/bmake

build() {
    pushd ${TMPDIR}/${BUILDDIR} >/dev/null
    logcmd ${MAKE} ${MAKE_JOBS} || logerr 'make failed'
    logcmd ${MAKE} DESTDIR=${DESTDIR} MK_INSTALL_AS_USER=yes install || \
        logerr 'make install failed'
    popd >/dev/null
}

# depend on the renamed locale/* packages
RUN_DEPENDS_IPS='
pkg://niksula.hut.fi/locale/af@0.5.11.0
pkg://niksula.hut.fi/locale/ar@0.5.11.0
pkg://niksula.hut.fi/locale/as@0.5.11.0
pkg://niksula.hut.fi/locale/az@0.5.11.0
pkg://niksula.hut.fi/locale/be@0.5.11.0
pkg://niksula.hut.fi/locale/bg@0.5.11.0
pkg://niksula.hut.fi/locale/bg-extra@0.5.11.0
pkg://niksula.hut.fi/locale/bn@0.5.11.0
pkg://niksula.hut.fi/locale/bo@0.5.11.0
pkg://niksula.hut.fi/locale/bs@0.5.11.0
pkg://niksula.hut.fi/locale/ca@0.5.11.0
pkg://niksula.hut.fi/locale/ca-extra@0.5.11.0
pkg://niksula.hut.fi/locale/cs@0.5.11.0
pkg://niksula.hut.fi/locale/cs-extra@0.5.11.0
pkg://niksula.hut.fi/locale/da@0.5.11.0
pkg://niksula.hut.fi/locale/da-extra@0.5.11.0
pkg://niksula.hut.fi/locale/de@0.5.11.0
pkg://niksula.hut.fi/locale/de-extra@0.5.11.0
pkg://niksula.hut.fi/locale/el@0.5.11.0
pkg://niksula.hut.fi/locale/el-extra@0.5.11.0
pkg://niksula.hut.fi/locale/en@0.5.11.0
pkg://niksula.hut.fi/locale/en-extra@0.5.11.0
pkg://niksula.hut.fi/locale/es@0.5.11.0
pkg://niksula.hut.fi/locale/es-extra@0.5.11.0
pkg://niksula.hut.fi/locale/et@0.5.11.0
pkg://niksula.hut.fi/locale/fi@0.5.11.0
pkg://niksula.hut.fi/locale/fi-extra@0.5.11.0
pkg://niksula.hut.fi/locale/fil@0.5.11.0
pkg://niksula.hut.fi/locale/fr@0.5.11.0
pkg://niksula.hut.fi/locale/fr-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ga@0.5.11.0
pkg://niksula.hut.fi/locale/gu@0.5.11.0
pkg://niksula.hut.fi/locale/he@0.5.11.0
pkg://niksula.hut.fi/locale/hi@0.5.11.0
pkg://niksula.hut.fi/locale/hr@0.5.11.0
pkg://niksula.hut.fi/locale/hr-extra@0.5.11.0
pkg://niksula.hut.fi/locale/hu@0.5.11.0
pkg://niksula.hut.fi/locale/hu-extra@0.5.11.0
pkg://niksula.hut.fi/locale/hy@0.5.11.0
pkg://niksula.hut.fi/locale/id@0.5.11.0
pkg://niksula.hut.fi/locale/ii@0.5.11.0
pkg://niksula.hut.fi/locale/is@0.5.11.0
pkg://niksula.hut.fi/locale/is-extra@0.5.11.0
pkg://niksula.hut.fi/locale/it@0.5.11.0
pkg://niksula.hut.fi/locale/it-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ja@0.5.11.0
pkg://niksula.hut.fi/locale/ka@0.5.11.0
pkg://niksula.hut.fi/locale/kk@0.5.11.0
pkg://niksula.hut.fi/locale/km@0.5.11.0
pkg://niksula.hut.fi/locale/kn@0.5.11.0
pkg://niksula.hut.fi/locale/ko@0.5.11.0
pkg://niksula.hut.fi/locale/kok@0.5.11.0
pkg://niksula.hut.fi/locale/lt@0.5.11.0
pkg://niksula.hut.fi/locale/lt-extra@0.5.11.0
pkg://niksula.hut.fi/locale/lv@0.5.11.0
pkg://niksula.hut.fi/locale/lv-extra@0.5.11.0
pkg://niksula.hut.fi/locale/mk@0.5.11.0
pkg://niksula.hut.fi/locale/mk-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ml@0.5.11.0
pkg://niksula.hut.fi/locale/mn@0.5.11.0
pkg://niksula.hut.fi/locale/mr@0.5.11.0
pkg://niksula.hut.fi/locale/ms@0.5.11.0
pkg://niksula.hut.fi/locale/mt@0.5.11.0
pkg://niksula.hut.fi/locale/nb@0.5.11.0
pkg://niksula.hut.fi/locale/ne@0.5.11.0
pkg://niksula.hut.fi/locale/nl@0.5.11.0
pkg://niksula.hut.fi/locale/nl-extra@0.5.11.0
pkg://niksula.hut.fi/locale/nn@0.5.11.0
pkg://niksula.hut.fi/locale/or@0.5.11.0
pkg://niksula.hut.fi/locale/pa@0.5.11.0
pkg://niksula.hut.fi/locale/pl@0.5.11.0
pkg://niksula.hut.fi/locale/pl-extra@0.5.11.0
pkg://niksula.hut.fi/locale/pt@0.5.11.0
pkg://niksula.hut.fi/locale/pt-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ro@0.5.11.0
pkg://niksula.hut.fi/locale/ru@0.5.11.0
pkg://niksula.hut.fi/locale/ru-extra@0.5.11.0
pkg://niksula.hut.fi/locale/sa@0.5.11.0
pkg://niksula.hut.fi/locale/si@0.5.11.0
pkg://niksula.hut.fi/locale/sk@0.5.11.0
pkg://niksula.hut.fi/locale/sl@0.5.11.0
pkg://niksula.hut.fi/locale/sq@0.5.11.0
pkg://niksula.hut.fi/locale/sq-extra@0.5.11.0
pkg://niksula.hut.fi/locale/sr@0.5.11.0
pkg://niksula.hut.fi/locale/sv@0.5.11.0
pkg://niksula.hut.fi/locale/sv-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ta@0.5.11.0
pkg://niksula.hut.fi/locale/te@0.5.11.0
pkg://niksula.hut.fi/locale/th@0.5.11.0
pkg://niksula.hut.fi/locale/th-extra@0.5.11.0
pkg://niksula.hut.fi/locale/tr@0.5.11.0
pkg://niksula.hut.fi/locale/tr-extra@0.5.11.0
pkg://niksula.hut.fi/locale/ug@0.5.11.0
pkg://niksula.hut.fi/locale/uk@0.5.11.0
pkg://niksula.hut.fi/locale/ur@0.5.11.0
pkg://niksula.hut.fi/locale/vi@0.5.11.0
pkg://niksula.hut.fi/locale/zh_cn@0.5.11.0
pkg://niksula.hut.fi/locale/zh_hk@0.5.11.0
pkg://niksula.hut.fi/locale/zh_mo@0.5.11.0
pkg://niksula.hut.fi/locale/zh_sg@0.5.11.0
pkg://niksula.hut.fi/locale/zh_tw@0.5.11.0
'

init
BUILDDIR=${PROG}
download_source $PROG $PROG $VERHUMAN
prep_build
build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
