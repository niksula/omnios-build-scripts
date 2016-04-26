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

PROG=psycopg2
VER=2.6.1
VERHUMAN=$VER
PKG=niksula/runtime/python/psycopg2
SUMMARY="Python-PostgreSQL Database Adapter"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='niksula/runtime/python database/postgresql'
REMOVE_PREVIOUS=1

PG_CONFIG=/opt/pgsql/bin/pg_config
PY_BUILD_EXT_OPTS="--pg-config $PG_CONFIG --rpath $($PG_CONFIG --libdir)"
niksula_python_build() {
    PYTHON=${PYTHON-${PREFIX}/bin/python3}
    PYTHON_MAJOR=$($PYTHON -c 'import sys; print("%d.%d" % sys.version_info[0:2])') \
        || logerr "cannot determine major version of $PYTHON"
    DEPENDS_IPS="$DEPENDS_IPS =niksula/runtime/python@$PYTHON_MAJOR"
    pushd $TMPDIR/$BUILDDIR > /dev/null
    logmsg '--- setup.py install'
    logcmd $PYTHON setup.py build_ext $PY_BUILD_EXT_OPTS build \
        install --root=$DESTDIR || logerr '--- build failed'
    popd >/dev/null
}


init
download_source $PROG $PROG $VER
patch_source
prep_build
niksula_python_build
make_package
clean_up
