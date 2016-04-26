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

PROG=uwsgi
VER=2.0.12
VERHUMAN=$VER
PKG=niksula/runtime/python/uwsgi
SUMMARY="The uWSGI server"
DESC="$SUMMARY"

BUILD_DEPENDS_IPS='niksula/runtime/python'
REMOVE_PREVIOUS=1
TAR=gtar
export CC='gcc -m64'

init
download_source $PROG $PROG $VER
patch_source
prep_build
niksula_python_build
make_package
clean_up
