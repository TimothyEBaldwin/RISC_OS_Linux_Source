# Copyright 2008 Castle Technology Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
# CvsRepository.pm
#
# This is a small package for Pace CVS systems used to map repository
# aliases to fully-qualified repository specifiers.  This can be used
# to present users with repository aliases instead of full cvsroot
# settings.
#
#
#
# $Id: CvsRepository.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsRepository;
require Exporter;
use     Carp;
use     Pace::CvsDirectory;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(
  find_repository_alias
  expand_repository_alias
  strip_cvsroot_from_absolute_path
  auto_detect_repository
  split_cvsroot_parts
  );
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

my $debug = 0;

# Other required package-globals
my %aliases = (
  'rool'        =>   '@riscosopen.org:/home/rool/cvsroot'
);

sub find_repository_alias
{
  my ($cvsroot) = @_;
  my $key;

  if ($cvsroot =~ m!^[^\@]*\@([^:]+)(:)(/.*$)!) {
    $cvsroot = '@'.$1.$2.$3;
  }
  elsif ($cvsroot =~ m!^(/.*)!) {
    $cvsroot = '@riscosopen.org:'.$1;
  }

  print "Searching for $cvsroot ...\n" if $debug;

  foreach $key (keys %aliases) {
    print "Checking $key ($aliases{$key})\n" if $debug;
    return $key if $aliases{$key} eq $cvsroot;
  }

  return undef;
}

sub expand_repository_alias
{
  return $aliases{$_[0]};
}

# If $root prefix matches $repo, strip it, plus the / separator.  The
# return value is as you would find in a CVS/Repository file: the path
# to the component without the root on the front and without the trailing
# /
sub strip_cvsroot_from_absolute_path
{
  my ($root, $repo) = @_;

  $root = &canonify($root);
  $repo = &canonify($repo);
  chop $repo;

  my $len = length($root);
  $repo = (substr($repo, 0, $len) eq $root) ? substr($repo, $len) : '';

  croak "Root does not match repository (". join(', ', @_) . ")\n" unless $repo;
  return $repo;
}

sub canonify {
  (my $dir = (shift) . '/') =~ s!//+!/!g;
  $dir;
}

sub auto_detect_repository
{
  # Any parameter to this function that is non-empty and not 'default' is OK ...
  my $paramroot = shift;
  return $paramroot if (defined($paramroot) && $paramroot && $paramroot ne 'default');

  # Look for a local CVS admin directory
  my $fileroot = &directory_root;
  $fileroot = '' unless defined($fileroot);
  
  # If not available from a file, read the environment
  return $fileroot || $ENV{'CVSROOT'};
}


# This routine takes a CVS Root and splits it apart into many parts and returns a
# reference to a hash containing the exploded string.  This can be used to dissect
# a CVSROOT setting, the return value from directory_root() etc.  The fields are
# named: full, method, user, path, portspec, server, auth.  auth is method and user
# concatenated, if appropriate.
#
# Port number is taken from the first available match from:
# 1) explicit in CVSROOT; 2) environment variable; 3) /etc/services; 4) built-in default
#
# This is what CVS does in src/client.c:get_port_number
sub split_cvsroot_parts
{
  my %cvsaccessmethods = (
    'pserver' => { has_port => 2401, has_env => 'CVS_CLIENT_PORT', has_portname => 'cvspserver' },
    'gserver' => { has_port => 2401, has_env => 'CVS_CLIENT_PORT', has_portname => 'cvspserver' },
    'kserver' => { has_port => 1999, has_env => 'CVS_PORT',        has_portname => 'cvs'        },
    'ext'     => { has_port => 514,  needs_env_map => 'CVS_RSH',   has_portname => 'shell'      },
    'server'  => { has_port => 514,  needs_env_map => 'CVS_RSH',   has_portname => 'shell'      },
    'local'   => { },
    'fork'    => { },
    'undefined' => { }
  );

  my $result = shift @_;
  my %answer = ('full' => $result);

  # Attempt to parse a repository specification - 
  if ($result =~ /^([^\s\@]*)\@([^\s\@:]+:)([0-9]+)?(\/[^\s\@]+)\s*$/) {
    my ($auth, $server, $portspec, $path, $method) = ($1,$2,$3,$4);

    $server =~ s/:$//;
    if ($auth =~ /^:([^:]+):(.*)$/) {
      ($answer{'method'},$answer{'user'}) = (lc $1,$2);
      carp "Unknown access method $answer{'method'}" unless defined $cvsaccessmethods{$answer{'method'}};
    }
    else {
      $answer{'method'} = 'undefined'; # Should never happen ...
      $answer{'user'} = 'undefined'; # Should never happen ...
    }

    $method = $answer{'method'};

    unless ($portspec) {
      my $data = $cvsaccessmethods{$method};
      my ($environment, $servicesfile, $defaultport) = ($data->{'has_env'}, $data->{'has_portname'}, $data->{'has_port'});

      if (defined $data->{'needs_env_map'}) {
        my $var = $ENV{$data->{'needs_env_map'}};
        if (defined($var) && $var =~ /^(\S+)(\s.*)?$/) {
          my $command;
          # Remove pathname and executable extension from program
          ($command = lc $1) =~ s/^.*[\\\/]([^\\\/])(?:\.(?:exe|com|bat))?$/$1/;
          $command = 'shell' if $command eq 'rsh'  # Remap to the usual service name in /etc/services
                           || $command eq 'remsh'; # Do we actually *have* any HP-UX machines?
          $servicesfile = $command;
        }
        else {
          $servicesfile = 'shell';
        }
      }

      # print STDERR "Looking at $environment, service $servicesfile, default $defaultport\n" if $debug;
      $portspec = (defined($environment) && $environment) ? $ENV{$environment} : '';
      ($_, $_, $portspec, $_) = getservbyname($servicesfile, 'tcp') unless $portspec || !$servicesfile;
      $portspec ||= $defaultport;
    }

    $path ||= '';

    ($answer{'auth'}, $answer{'server'}, $answer{'portspec'}, $answer{'path'}) = ($auth, $server, $portspec, $path);
  }
  elsif ($result =~ m|^/|) {
    ($answer{'method'}, $answer{'path'}) = ('local', $result);
  }

  return \%answer;
}


# End of module - return success to loader
1;

__END__

=head1 NAME

CvsRepository.pm - operations on repository names and locations

=head1 SYNOPSIS

E<lt>stringE<gt> B<expand_repository_alias>(alias)

E<lt>stringE<gt> B<find_repository_alias>(full repository)

E<lt>stringE<gt> B<strip_cvsroot_from_absolute_path>(CVSROOT, abs_path)

E<lt>stringE<gt> B<auto_detect_repository>(optional repository spec)

E<lt>hashrefE<gt> B<split_cvsroot_parts>(CVSROOT)

=head1 OVERVIEW

This component provides a simple mapping between short single word names
for various repository and a partially qualified cvs root setting.  The
B<Cvspass> package should be used to canonicalise the returned cvs root.

This component also provides facilities for processing repository pathnames

=head1 DETAILS

=over 4

=item B<expand_repository_alias>

This function looks up the short name in the internal data structure
and returns the partially-qualified root setting it finds, or undef
if unable to expand it.

=item B<find_repository_alias>

This function tries to match the passed repository against the table
stored in the file to find a single word alias which represents the
repository.  It returns undef if it was not able to find a suitable
alias.

=item B<strip_cvsroot_from_absolute_path>

This function strips the CVSROOT setting from the front of an absolute
pathname which points into the repository.  The return value is as you
would find in a CVS/Repository file: the path to the component without
the root on the front and without the trailing /.

B<NOTE:> This only works on method-less CVSROOTs.

=item B<auto_detect_repository>

This function is used to establish the current CVS repository being
used.  It returns its optional parameter if it is not empty and not
the string I<default>.  Otherwise, it returns the contents of the
I<CVS/Root> file, if present.  Otherwise, it returns the value of
the environment variable B<CVSROOT>.

=item B<split_cvsroot_parts>

This routine takes a CVSROOT and splits it apart into many parts and
returns a reference to a hash containing the exploded string.  This can be
used to dissect a CVSROOT setting, the return value from directory_root()
etc.  The fields are named B<full>, B<path> and B<method> are always set.
If appropriate, B<portspec>, B<server>, B<auth> and B<user> are also set.
B<auth> is the concatenation of the B<method> and B<user> fields as
found in the CVSROOT string.

Note that environment variables can affect the value of B<portspec> if
the port number is not specified explicitly.  Each protocol has a default
port number too.  Specifically, the default port number for pserver and
gserver is 2401, but overridden by C<CVS_CLIENT_PORT>; the default port
for kserver is 1999, but overridden by C<CVS_PORT>; the default port
number for server and ext is 514, but may change if C<CVS_RSH> is set.
If C<CVS_RSH> is set to B<ssh>, then the port number is 22.  Otherwise,
the program name is looked up in the services file to find a match.

=back

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

