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
# CvsAccess.pm
#
# A perl package to process the CVSROOT/Access file in the repository and
# provides methods for determining whether a particular operation may be
# carried out by a given user in a given directory.
#
#
#
# $Id: CvsAccess.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsAccess;
require Exporter;
use     Carp;
require User::pwent;
#require Pace::NisLookup;
use     Pace::CvsClientop;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(check_access_details check_user_is_admin check_user_is_buildmaster);
@EXPORT_OK = qw(use_access);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

my $debug     = 0;


# Our private data structure for holding the Access file content.  All of
# these hold references to arrays.
my %access_entry = ();
my %access_groups = ();
my @buildmaster_groups = ();

my $access_file = '';

# A useful constant
my $AccessFileName = 'CVSROOT/Access';

#
# Sets the default Access file name
#
sub establish_filename
{
  $access_file = $ENV{'CVSROOT'}.'/'.$AccessFileName unless $access_file;
  $access_file;
}

#
# This routine splits a list of comma-separated entries with whitespace
#
sub split_spacecomma_list
{
  $_ = shift @_;
  s/^\s+//;
  s/\s+$//;
  return split(/[,\s]+/);
}

#
# This routine parses the CVSROOT/Access file and stores the data
# in an internal hash for access by the other routines in this package.
# This routine accepts a list of lines to be treated as a new access
# file, and parses it.
#
# Now, check the tags against the tags file.  Format:
#   Format: <Tag>,<Tag>...: <username>,<username>...
#
sub use_access
{
  %access_entry = ();
  foreach $_ (@_) {
    my @fields;
    ++$line;
    s/\015?\012$/\n/g;
    chomp; # \r\n OK
    s/(\\(\\|\#))|(\#.*)/$2/g; # Strip comments
    next unless $_;
    if (/^\@([^:]+):\s*(.*)\s*/) {
      # Group declaration - store the array reference
      my ($tag, $members) = ($1, $2);
      $access_groups{$tag} = [ split_spacecomma_list($members) ];
      push (@buildmaster_groups, $access_groups{$tag}) if ($tag =~ /.*BuildMasters$/i);
    }
    elsif(/^([^:]+):(.+)$/) {
      # Access declaration
      my @tags = split_spacecomma_list($1);
      my @users = split_spacecomma_list($2);
      my $tag;
      my $user;

      foreach $user (@users) {
        foreach $tag (@tags) {
          $tag = 'TRUNK' unless $tag;
          push(@{ $access_entry{$tag} }, $user);
        }
      }
    }
    else {
      carp "At line $line in ACL file: unrecognised line";
    }
  }
}

sub parse_access
{
  my @lines;
  my $filename = &establish_filename();

  print "Access file determined: $filename\n" if $debug;

  if ($filename =~ m|^/| && open(ACCESS, '<'.$filename)) {
    @lines = <ACCESS>;
    close ACCESS;
  }
  else {
    @lines = &clientop_checkout_object_readonly($AccessFileName);
  }

  &use_access(@lines);
}

sub ensure_access_loaded
{
  # We might not have loaded the file yet ...
  &parse_access() unless %access_entry;
}

# This function is used to determine whether the user has commit access to
# the specified directory on the specified branch, and optionally, for the
# specified files.  It returns non-zero if access is permitted, zero if not.
#
sub check_access_details 
{
  my ($user, $branch, $directory, @files) = @_;
  my ($tag, $thetag, $thedir, $applies);
  my $permit_access = -1;
  my $filechecks = 0;

  $branch = 'TRUNK' unless $branch;

  print "Searching Access file: user=$user branch=$branch dir=$directory\n" if $debug;

  # Allow access if the name starts with the userid
  return 1 if (substr($branch, 0, length($user)+1) eq ($user . '_'));

  # We might not have loaded the file yet ...
  &ensure_access_loaded();

  # Important to sort the hash to ensure most-specific entry "wins"
  foreach $tag (sort keys %access_entry) {
    if ($tag =~ /^([^\(]*)\(([^\)]*)\)$/) {
      # Directory-specific entry
      ($thetag, $thedir) = ($1, $2);
    }
    else {
      # Branch only
      ($thetag, $thedir) = ($tag, '');
    }

    # Does the branch name match? (permit wildcards now!)
    next unless ($thetag eq $branch) or ($thetag eq '*');

    if (substr($directory, 0, length($thedir)) eq $thedir) {
      # This declaration applies
      print "Found a relevant line (tag is $tag)\n" if $debug;
      $permit_access = &int_search_list($permit_access, $user, $access_entry{$tag});

    }
    elsif (($directory.'/') eq substr($thedir, 0, length($directory)+1) && @files) {
      # This declaration might apply - need to check files.
      my $leaf = substr($thedir, length($directory)+1);
      if ($leaf =~ /^([^\/]+)$/) {
        for $f (@files) {
          if ($1 eq $f) {
            # This declaration applies to one of our files
            my $result;
            print "Found a relevant line (tag is $tag)\n" if $debug;
            $result = &int_search_list(-1, $user, $access_entry{$tag});
            $result = $permit_access if ($result == -1);
            return 0 unless $result; # File was explicitly denied - no hope of success so leave now
            $filechecks += 1;
          }
        }
        $permit_access = 1 if ($filechecks == @files);
      }
    }
    else {
      # Line does not apply
    }
  }

  # Final tidy up - if we had any files listed, and the explicit checks
  # did not concur with the access rights requested.
  $permit_access = 1 if (@files && ($filechecks == @files));
  $permit_access = 0 if $permit_access == -1;

  return $permit_access;
}

# Update the access permission flag (-1 = unknown, 0 = reject, 1 = permit) based on
# whether $user appears in the list $listref (a reference to a list).  Returns the
# new access permission flag.
sub int_search_list
{
  my ($permit_access, $user, $listref) = @_;
  my $entry;

  for $entry ( @$listref ) {
    print " -> $entry\n" if $debug;
    if ($entry eq '-') {
      $permit_access = 0;
    }
    elsif ($entry =~ /^\+(.*)$/) {
      $permit_access = 1 if &nis_group_check_membership($user, $1);
    }
    elsif ($entry =~ /^\-(.*)$/) {
      $permit_access = 0 if $1 eq $user;
    }
    elsif ($entry =~ /^\@(.*)$/) {
      print "     (Access group)\n" if $debug;
      $permit_access = &int_search_list($permit_access, $user, $access_groups{$1});
      print "     (end Access group)\n" if $debug;
    }
    elsif ($entry eq '*') {
      $permit_access = 1;
    }
    else {
      $permit_access = 1 if $entry eq $user;
    }
  }
  
  return $permit_access;
}

sub check_user_is_admin
{
  # We might not have loaded the file yet ...
  &ensure_access_loaded();

  return (&int_search_list(-1, $_[0], $access_groups{'Admin'} ) == 1) ? 1 : 0;
}

sub check_user_is_buildmaster
{
  my $groupref;

  # We might not have loaded the file yet ...
  &ensure_access_loaded();
  return 1 if &check_user_is_admin($_[0]);

  for $groupref (@buildmaster_groups) {
    return 1 if (&int_search_list(-1, $_[0], $groupref) == 1);
  }
  return 0;
}

# End of module - return success to loader
1;

__END__

=head1 NAME

CvsAccess.pm - process the Pace Access control file for B<CVS>

=head1 SYNOPSIS

E<lt>boolE<gt> B<check_access_details>(user id, branch, directory, [optional list of files])

E<lt>boolE<gt> B<check_user_is_admin>(user id)

E<lt>boolE<gt> B<check_user_is_buildmaster>(user id)

=head1 OVERVIEW

This package is used to verify whether a specified user may carry
out various actions.  It will return yes or no answers to various
questions based on the content of the ACL file without the caller
needing to understand the format of the file.

=head1 DETAILS

=over 4

=item B<check_access_details>

This function is used to determine whether the user has commit access to
the specified directory on the specified branch, and optionally, for the
specified files.  It returns non-zero if access is permitted, zero if not.

=back

=over 4

=item B<check_user_is_admin>

Returns 1 if the user is in group I<@Admin>, otherwise zero.

=back

=over 4

=item B<check_user_is_buildmaster>

Returns non-empty if the specified user is a buildmaster or
administrator.  Being a buildmaster involves being listed in a group
name which ends in the string BuildMasters (e.g. I<@A164BuildMasters>,
I<@BuildMasters>)

=back

=head1 FILES

=over 4

=item F<${CVSROOT}/CVSROOT/Access>

=back

The access control list file which is consulted.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

