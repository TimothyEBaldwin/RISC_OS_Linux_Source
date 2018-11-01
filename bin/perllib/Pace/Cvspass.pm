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
# Cvspass.pm
#
# A perl module to process a user's .cvspass file to extract authentication
# details and canonicalised cvsroots for passing to cvs commands where the
# default repository is to be overridden.  This enables user-agnostic repository
# specifications to be used as this module can substitute in the username
# dynamically on request.
#
#
#
# $Id: Cvspass.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::Cvspass;
require Exporter;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(find_cvspass_repository);
@EXPORT_OK = qw(parse_cvspass cvspass_passwords);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }


#
# Some package-global variables to hold the loaded information
#
my %cvspass_passwords = ();
my $debug = 0;

#
# This routine reads the user's .cvspass file
#
sub parse_cvspass
{
  my ($envfilename, $filename, $windoze_filename, $repository);

  $envfilename = $ENV{"CVS_PASSFILE"};
  $filename = $ENV{"HOME"}.'/.cvspass';
  $windoze_filename = $ENV{"HOME"}.'/_cvspass';

  $envfilename ||= $filename;
  open(CVSPASS, '<'.$envfilename) or open(CVSPASS, '<'.$filename) or open(CVSPASS, '<'.$windoze_filename) || return ();
  %cvspass_passwords = ();
  while (<CVSPASS>) {
    s/\015?\012$/\n/;
    chomp;
    if (/^\/(\d+)\s+([^\s@]+)@([^\s@]+)\s*[A-Z](.*)$/) {
      # Versioned entry in .cvspass from cvs 1.11
      $cvspass_passwords{$3} = $2 if ($1 == 1);
    }
    elsif (/^(:[^\s@]+)@([^\s@]+)\s*[A-Z](.*)$/) {
      # Unversioned entry in .cvspass from cvs pre-1.11
      $cvspass_passwords{$2} = $1;
    }
    else {
      # Did not understand this line - sorry
    }
  }
  close CVSPASS;
  return %cvspass_passwords;
}

#
# This routine can be called to find authentication credentials for a CVS
# repository.  It permits you to specify the repository incompletely
# (from the @ onwards) to that the modules file isn't tied to one specific
# user.  The .cvspass is searched and an appropriate authentication token
# is prepended to the repository name automatically.
#
# This routine returns the canonical cvs root suitable for passing in a
# -d option to cvs.
#
# find_cvspass_repository('default') will return an empty string (indicating
# that the environment will supply the credentials automatically.
#
# find_cvspass_repository($ENV{'CVSROOT'}) will canonicalise any setting
# for the value of the environment variable and return it.
#
sub find_cvspass_repository
{
  my ($new_repository)=@_;
  return '' if ($new_repository =~ /^default$/i);

  # This evil regexp matches valid cvs root settings
  if ($new_repository =~ /^([^\s\@]*)\@([^\s\@:]+:)([0-9]+)?(\/[^\s\@]+)\s*$/) {
    # Look to substitute the method by one from .cvspass
    my ($auth,$repos,$portspec,$path) = ($1,$2,$3,$4);
    my ($cvspass, $testrepos);

    defined($repos) or $repos = '';
    defined($portspec) or $portspec = '';
    defined($path) or $path = '';

    print "* new repository: $new_repository\n" if $debug;
    print "* auth: $auth\n" if $debug;
    print "* repos: $repos\n" if $debug;
    print "* portspec: $portspec\n" if $debug;
    print "* path: $path\n" if $debug;

    $testrepos = $repos . $portspec . $path;
    print "+ Trying testrepos: $testrepos\n" if $debug;

    # Read the user cvs password file on the first time through
    # If there are no passwords, we'll read it each time - but there'll be
    # problems if there aren't any passwords there anyway.
    &parse_cvspass() unless %cvspass_passwords;

    if (!$portspec && !defined($cvspass_passwords{$testrepos})) {
      $portspec = '2401';
      $testrepos = $repos . $portspec . $path;
      print "+ Retrying testrepos: $testrepos\n" if $debug;
    }

    $repos = $testrepos;

    if (defined($cvspass_passwords{$repos})) {
      # We know this repository - did the user want us to supply the authorisation?
      my $length = length($auth);
      if ($length > 0) {
        if (substr($cvspass_passwords{$repos}, 0, $length) eq $auth) {
          $new_repository = $cvspass_passwords{$repos}.'@'.$repos;
        }
        else {
          # Leave it as is - user knows what they are doing.
        }
      }
      else {
        $new_repository = $cvspass_passwords{$repos}.'@'.$repos;
      }
    }
  }

  return $new_repository;

};

# End of module - return success to loader
1;

__END__

=head1 NAME

Cvspass.pm - interface to users' I<.cvspass> files

=head1 SYNOPSIS

E<lt>stringE<gt> B<find_cvspass_repository>(command)

=head1 OVERVIEW

This component provides a simple API to read the cached authentication
data stored in the user's I<.cvspass> file.

The major use of this package is to determine a canonical repository
setting from a partial specification.  This enables repositories to be
specified in a user-agnostic way and resolved at the last moment when
the correct authentication tokens are actually required.

=head1 DETAILS

=over 4

=item B<find_cvspass_repository>

This routine can be called to find authentication credentials for a CVS
repository.  It permits you to specify the repository incompletely
(from the @ onwards) to that the modules file isn't tied to one
specific user.  The I<.cvspass> is searched and an appropriate
authentication token is prepended to the repository name
automatically.

This routine returns a canonical cvs root suitable for passing in a
-d option to cvs.

=back

=head1 EXAMPLES

=over 4

=item find_cvspass_repository('@riscosopen.org:/home/rool/cvsroot')

This will search the cached authentication tokens for a specification which
matches and will return a string such as:

 :pserver:anonymous@riscosopen.org:/home/rool/cvsroot

=item find_cvspass_repository('default')

This will return an empty string (indicating that the default setting
from the environment or a CVS admin file will supply the credentials
automatically.

=back

=head1 FILES

=over 4

=item F<${CVS_PASSFILE}>

=item F<${HOME}/.cvspass>

=item F<${HOME}/_cvspass>

The file containing the cached user authentication tokens for B<CVS>.

=back

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

