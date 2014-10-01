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

PROG=aspell
VER=0.60.6.1
DICTPROG=aspell6-en
DICTVER=7.1-0
VERHUMAN="$VER, with $DICTVER English dictionary"
PKG=library/aspell
SUMMARY="GNU Aspell spell-checker"
DESC="$SUMMARY"

LDFLAGS64="$LDFLAGS64 -L/usr/gnu/lib/amd64 -R/usr/gnu/lib/amd64" 
LDFLAGS32="$LDFLAGS32 -L/usr/gnu/lib -R/usr/gnu/lib" 
CONFIGURE_OPTS="$CONFIGURE_OPTS --enable-curses=ncurses --enable-curses-include=/usr/include/ncurses"

save_function make_install make_install_orig
make_install() {
    make_install_orig
    logmsg 'Building dictionary files'
    pushd $TMPDIR/${DICTPROG}-${DICTVER} >/dev/null
    orig_path=$PATH
    # this has a "configure" but it doesn't work the usual way, and we need
    # aspell to build the dictionary. isa stubs don't exist at this time
    logmsg "cwd is $(pwd)"
    if [ "$ISALIST" = "$ISAPART" ]; then
        logcmd gmake distclean
        logcmd gmake clean
        PATH=${orig_path}:${DESTDIR}${PREFIX}/bin/$ISAPART
        CONFIGURE_OPTS= CONFIGURE_OPTS_32= configure32 || logerr 'configure failed'
        make_prog32 || logerr 'make failed'
        logcmd gmake install DESTDIR=$DESTDIR || logerr 'make install failed'
    else
        logcmd gmake distclean
        logcmd gmake clean
        PATH=${PATH}:${DESTDIR}${PREFIX}/bin/$ISAPART64
        CONFIGURE_OPTS= CONFIGURE_OPTS_64= configure64 || logerr 'configure failed'
        make_prog64 || logerr 'make failed'
        logcmd gmake install DESTDIR=$DESTDIR || logerr 'make install failed'
    fi
    PATH=$orig_path
    unset orig_path
    popd >/dev/null
}

get_dict() {
    logmsg 'Downloading and extracting dictionary source'
    pushd ${TMPDIR} >/dev/null
    if ! [ -r ${DICTPROG}-${DICTVER}.tar.bz2 ]; then
        get_resource ${PROG}/${DICTPROG}-${DICTVER}.tar.bz2 || logerr 'download failed'
    fi
    logcmd extract_archive ${DICTPROG}-${DICTVER}.tar.bz2 || logerr 'extract failed'
    popd >/dev/null
}

init
download_source $PROG $PROG $VER
patch_source
get_dict
prep_build
build
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
