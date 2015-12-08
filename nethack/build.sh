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

PROG=nethack
VER=3.6.0
VERHUMAN=$VER
PKG=games/nethack
SUMMARY="NetHack, roguelike dungeon crawl game"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='developer/lexer/flex'

BUILDARCH=64
MAKE_JOBS=

configure64() {
    pushd sys/unix >/dev/null
    logcmd sh setup.sh hints/unix || logerr 'setup.sh failed'
    popd >/dev/null
}

make_prog64() {
    logmsg '--- make'
    logcmd $MAKE CC="$CC" LINK="$CC" CFLAGS="$CFLAGS $CFLAGS64 -I../include" LFLAGS="$LDFLAGS $LDFLAGS64" WINTTYLIB=-lncurses LEX=flex $MAKE_JOBS all || logerr '--- make failed'
}

make_install64() {
    HACKDIR=${DESTDIR}${PREFIX}/games/lib/nethack
    VAR_PLAYGROUND=${DESTDIR}/var/games/nethack
    MANDIR=${DESTDIR}${PREFIX}/share/man/man6
    logmsg '--- make install'
    logcmd $MAKE HACKDIR=$HACKDIR VARDIR=$VAR_PLAYGROUND PREFIX=${DESTDIR}${PREFIX} CHOWN=: CHGRP=: SHELLDIR=${DESTDIR}${PREFIX}/bin install || logerr 'make install failed'
    mkdir ${DESTDIR}${PREFIX}/etc
    logcmd install -m 0644 sys/unix/sysconf ${DESTDIR}${PREFIX}/etc/nethackrc || logerr 'install nethackrc failed'
    # install manpages too
    pushd doc >/dev/null
    mkdir -p $MANDIR
    logcmd $MAKE MANDIR=$MANDIR manpages || logerr 'make manpages failed'
    popd >/dev/null
    # usr/games/nethack is normally a wrapper script but we don't need one (and
    # it has the tmpdir paths in it anyway, so it doesn't work)
    mv ${HACKDIR}/nethack ${DESTDIR}${PREFIX}/bin
    ln -sf ../bin/nethack ${DESTDIR}${PREFIX}/games/nethack
}

init
VERNUM=${VER//./}
download_source $PROG "nethack-$VERNUM-src"
patch_source
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
