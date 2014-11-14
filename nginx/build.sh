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

PROG=nginx
VER=1.6.2
VERHUMAN=$VER
PKG=service/network/http/nginx
SUMMARY="nginx [engine x] is an HTTP and reverse proxy server"
DESC="$SUMMARY"

PREFIX=/opt/nginx
BUILDARCH=64
CONFIGURE_OPTS_64="--prefix=$PREFIX
--with-ipv6
--with-http_ssl_module
--with-ld-opt=-m64
--http-client-body-temp-path=tmp/client_body
--http-proxy-temp-path=tmp/proxy
--http-fastcgi-temp-path=tmp/fastcgi
--http-uwsgi-temp-path=tmp/uwsgi
--http-scgi-temp-path=tmp/scgi"

nginx_modules="ngx_http_auth_pam_module-1.3"

add_modules() {
    local orig_builddir="$BUILDDIR"
    for mod in $nginx_modules; do
        BUILDDIR=$mod
        download_source $PROG $mod ""
        CONFIGURE_OPTS="$CONFIGURE_OPTS --add-module=../$mod"
    done
    BUILDDIR="$orig_builddir"
}

install_manifest() {
    smfdir=${DESTDIR}/lib/svc/manifest/http
    mkdir -p ${smfdir}
    install -m 0444 ${SRCDIR}/nginx.xml ${smfdir}/
}

init
download_source $PROG $PROG $VER
patch_source
add_modules
prep_build
build
make_isa_stub
install_manifest
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:
