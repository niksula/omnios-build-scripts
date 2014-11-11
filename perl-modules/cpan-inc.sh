PREFIX=/opt/niksula/perl5
PERL32=${PREFIX}/bin/i386/perl
PERL64=${PREFIX}/bin/amd64/perl
export PERL=${PREFIX}/bin/perl
PERLVER=$($PERL -e 'print $^V'|tr -d 'v')
PERLVER_MINOR=${PERLVER%.*}

PERL_MAKEFILE_OPTS="INSTALLDIRS=vendor"
PERL_BUILDPL_OPTS="--installdirs=vendor"

MIRROR=ftp://ftp.funet.fi/pub/languages/perl/CPAN/
