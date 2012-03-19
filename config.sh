#############################################################################
# Configuration for the build system
#############################################################################

# Which server to fetch files from
MIRROR=mirrors.omniti.com

# Default prefix for packages (may be overridden)
PREFIX=/usr

# Prefix for package names - e.g. OMNIfoo, CSWfoo, SUNWfoo
# Not currently used
PKGPREFIX=

# Temporary directories
# TMPDIR is used for source archives and build directories
#    to avoid collision on shared build systems,
#    TMPDIR includes a username
# DTMPDIR is used for constructing the DESTDIR path
TMPDIR=/tmp/build_$USER
DTMPDIR=$TMPDIR

# Log file for all output
LOGFILE=$PWD/build.log

# Where to put built SVR4 packages
OUTDIR=$MYDIR/../packages

# Default patches dir
PATCHDIR=patches

# Do we create isaexec stubs for scripts and other non-binaries (default yes)
NOSCRIPTSTUB=

# Determine package format (may be overridden by user)
if test -z "$PKGFMT"; then
    # If the pkg command exists, it is an IPS system
    if test -x /usr/bin/pkg; then
        PKGFMT=IPS
    else
        PKGFMT=SVR4
    fi
fi

# IPS package server URL and publisher
PKGPUBLISHER=jeos.omniti.com
PKGSRVR=http://pkg.omniti.com:10006/

#############################################################################
# Perl stuff
#############################################################################

# Perl versions we currently build against
PERLVERLIST="5.8.8 5.14.2"

# Full paths to bins
PERL32=/usr/perl5/5.14.2/bin/$ISAPART/perl
PERL64=/usr/perl5/5.14.2/bin/$ISAPART64/perl

# Default Makefile.PL options
PERL_MAKEFILE_OPTS="INSTALLSITEBIN=/opt/omni/bin/_ARCHBIN_ \
                    INSTALLSITESCRIPT=/opt/omni/bin/_ARCHBIN_ \
                    INSTALLSITEMAN1DIR=$PREFIX/man/site/man1 \
                    INSTALLSITEMAN3DIR=$PREFIX/man/site/man3 \
                    INSTALLDIRS=site"

# Accept MakeMaker defaults so as not to stall build scripts
export PERL_MM_USE_DEFAULT=true

# When building perl modules, run make test
# Unset in a build script to skip tests
PERL_MAKE_TEST=1

#############################################################################
# Paths to common tools
#############################################################################
WGET=wget
PATCH=gpatch
MAKE=gmake
TAR=tar
GZIP=gzip
BUNZIP2=bunzip2
XZCAT=xzcat
AWK=/usr/xpg4/bin/awk

# Figure out number of logical CPUs for use with parallel gmake jobs (-j)
# Default to 1.5*nCPUs as we assume the build machine is 100% devoted to
# compiling.  
# A build script may serialize make by setting NO_PARALLEL_MAKE
LCPUS=`psrinfo | wc -l`
MAKE_JOBS="-j $[ $LCPUS + ($LCPUS / 2) ]"
NO_PARALLEL_MAKE=

# Remove install dir by default. You can set this in a build script when
# testing to speed up building a package
DONT_REMOVE_INSTALL_DIR=

#############################################################################
# C compiler options - these can be overriden by a build script
#############################################################################
# Figure out our instruction set capabilities.  We assume that if we find
# i386 that we also have amd64 (we don't deploy production systems on
# 32-bit-only hardware.)  If SPARC, assume a minimum of v8plus which is
# needed by some packages like Perl.
#
# These variables will be passed to the build to construct multi-arch 
# binary and lib directories in DESTDIR

if test -n "`isalist | grep i386`"; then
    ISAPART=i386
    ISAPART64=amd64
else
    ISAPART=sparcv8plus
    ISAPART64=sparcv9
fi

# For jeos we always want GCC
CC=/opt/gcc-4.6.2/bin/gcc
CXX=/opt/gcc-4.6.2/bin/g++

# CFLAGS applies to both builds, 32/64 only gets applied to the respective
# build
CFLAGS=""
CFLAGS32=""
CFLAGS64="-m64"

# Generic/32/64 bit versions just like CFLAGS
LDFLAGS=""
LDFLAGS32=""
LDFLAGS64="-m64"

# And CPPFLAGS also
CPPFLAGS=""
CPPFLAGS32=""
CPPFLAGS64=""

# And CXXFLAGS also
CXXFLAGS=""
CXXFLAGS32=""
CXXFLAGS64="-m64"

# Python
PYTHONPATH=/usr
PYTHON=$PYTHONPATH/bin/python2.6
PYTHONLIB=$PYTHONPATH/lib

# Default configure command - almost always sufficient
CONFIGURE_CMD="./configure"

# Default configure options - replace/add to as needed
# This is a function so it can be called again if you change $PREFIX
# This is far from ideal, but works
reset_configure_opts() {
    # If it's the global default (/usr), we want sysconfdir to be /etc
    # otherwise put it under PREFIX
    if [[ $PREFIX == "/usr" ]]; then
        SYSCONFDIR=/etc
    else
        SYSCONFDIR=$PREFIX/etc
    fi
    CONFIGURE_OPTS_32="--prefix=$PREFIX
        --sysconfdir=$SYSCONFDIR
        --includedir=$PREFIX/include
        --bindir=$PREFIX/bin/$ISAPART
        --sbindir=$PREFIX/sbin/$ISAPART
        --libdir=$PREFIX/lib
        --libexecdir=$PREFIX/libexec"

    CONFIGURE_OPTS_64="--prefix=$PREFIX
        --sysconfdir=$SYSCONFDIR
        --includedir=$PREFIX/include/$ISAPART64
        --bindir=$PREFIX/bin/$ISAPART64
        --sbindir=$PREFIX/sbin/$ISAPART64
        --libdir=$PREFIX/lib/$ISAPART64
        --libexecdir=$PREFIX/libexec/$ISAPART64"
}
reset_configure_opts

# Configure options to apply to both builds - this is the one you usually want
# to change for things like --enable-feature
CONFIGURE_OPTS=""

# Vim hints
# vim:ts=4:sw=4:et:
