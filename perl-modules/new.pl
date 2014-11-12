#!/opt/niksula/perl5/bin/perl
# This script creates omnios-build build scripts for the given perl module
# packages and all their dependencies using MetaCPAN, and outputs the release
# names in build order. Requires internet connectivity due to the fact that
# MetaCPAN::Client uses the MetaCPAN web API.
# Caveats:
#  - Only most recent available versions are considered.
#  - We don't actually model the dependencies as a graph at the moment, but
#  instead just traverse the requirements depth-first and place them into an
#  array.
#  - build/configure/runtime/test dependencies are not considered different;
#  all of them are required at build time and as runtime dependencies in the
#  packages generated by the output build scripts.
#  - License actions are not added to packages (eg. local.mog).
#  - This is probably slower and uglier than it needs to be because I have no
#  idea what I'm doing when programming perl.

use strict;
use warnings;
use diagnostics;

use MetaCPAN::Client;
use Config;
use File::Path;

my @deps;
my %modules;
my $client = MetaCPAN::Client->new;

sub module_release {
    my $mod = shift;
    if (!exists($modules{$mod})) {
        my $rel = $client->release($mod->distribution);
        $modules{$mod} = $rel;
    }
    return $modules{$mod};
}

sub module_pkgname {
    my $mod = shift;
    return if module_is_core($mod);
    my $rel = module_release($mod);
    my $relname = ${$rel->metadata}{name};
    return "pkg:/niksula/perl5/$relname";
}

sub module_is_core {
    my $mod = shift;
    # XXX: 'perl' is a special case; it's not a module, but still listed in
    # prereqs for some releases.
    return 1 if $mod eq "perl";
    $mod =~ s,::,/,g;
    $mod = $mod . ".pm";
    # What we actually want to know is not whether the module was ever shipped
    # with some version of perl, but whether the module is currently shipped in
    # the same package as the perl runtime we are using. 'privlib' and
    # 'archlibexp' _should_ be only used by that, unless someone installs a
    # module onto the build machine using INSTALLDIRS=core. If we need to
    # account for that then we should call pkg(1).
    my $privlib = $Config{privlib};
    my $archlib = $Config{archlibexp};
    return (-e "${privlib}/${mod}" || -e "${archlib}/${mod}");
}

sub all_deps {
    my %builddep;
    my %rundep;
    my %confdep;
    my %testdep;
    my %prereq = %{shift()};
    if (exists($prereq{configure}{requires})) {
        %confdep = %{$prereq{configure}{requires}};
    }
    if (exists($prereq{build}{requires})) {
        %builddep = %{$prereq{build}{requires}};
    }
    if (exists($prereq{runtime}{requires})) {
        %rundep = %{$prereq{runtime}{requires}};
    }
    if (exists($prereq{test}{requires})) {
        %testdep = %{$prereq{test}{requires}};
    }
    my %alldep = (%confdep, %builddep, %rundep, %testdep);
    return %alldep;
}

sub add_deps {
    my $mod = $client->module($_[0]);
    return if module_is_core($_[0]);
    my $rel = module_release($mod);
    my %metadata = %{$rel->metadata};
    my %provides;
    if ($rel->provides) {
        %provides = map { $_ => $rel } @{$rel->provides};
    }
    # even if "provides" doesn't include it, $mod should be in this release.
    $provides{$_[0]} = $rel;
    if (exists($metadata{prereqs})) {
        my %req = %{$metadata{prereqs}};
        my %alldep = all_deps(\%req);
        for my $dep (keys %alldep) {
            add_deps($dep) unless exists($modules{$dep});
        }
    }
    %modules = (%modules, %provides);
    push(@deps, $rel);
}

foreach my $mod (@ARGV) {
    add_deps($mod);
}
foreach my $rel (@deps) {
    my %meta = %{$rel->metadata};
    my $name = $meta{name};
    my $ver = $meta{version};
    my $abstract = $meta{abstract};
    my $author = $rel->author;
    my $id1 = substr $author, 0, 1;
    my $id2 = substr $author, 0, 2;
    my $dlpath = "authors/id/${id1}/${id2}/${author}";
    my %alldep = all_deps(\%{$meta{prereqs}});
    my @deppkg = map { module_pkgname($_) } (keys %alldep);
    my %depset;
    @depset{@deppkg} = ();
    my $perlpkg = 'pkg:/niksula/runtime/perl@$PERLVER_MINOR';
    # we need both incorporate dep ('=') and require for the perl package
    my $depstr = join("\n", ("=${perlpkg}", $perlpkg, keys %depset));
    # This is pretty ugly, but our output here is a shell literal string in
    # single-quotes (because using double-quotes would be dangerous), which
    # does not allow single-quotes inside it. Additionally we can't put double
    # quotes in it because omnios-build will interpolate the SUMMARY variable
    # without regard for what's in it, and then the generated package manifest
    # will be invalid. Just drop both types of quotes from the abstract.
    $abstract =~ s,['"],,g;
    my $script = <<EOF;
#!/usr/bin/bash

. ../../../lib/functions.sh
. ../cpan-inc.sh

PROG=$name
VER=$ver
VERHUMAN="\$VER (perl\$PERLVER)"
PKG=niksula/perl5/$name
SUMMARY='$abstract'
DESC="\$SUMMARY"

BUILD_DEPENDS_IPS="$depstr"
RUN_DEPENDS_IPS="\$BUILD_DEPENDS_IPS"

init
download_source $dlpath \$PROG \$VER
patch_source
prep_build
buildperl
make_package
clean_up
EOF
    File::Path::make_path($name);
    if (! -f "${name}/build.sh") {
        open(my $f, ">${name}/build.sh");
        print ($f $script);
        chmod(0755, $f);
        close($f);
    } else {
        print STDERR "${name}/build.sh already exists, not overwriting\n";
    }
    print "$name\n";
}
