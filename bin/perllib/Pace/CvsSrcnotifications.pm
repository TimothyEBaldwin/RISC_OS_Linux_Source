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
# CvsSrcnotifications.pm
#
#
# This is a package for Pace CVS systems used to interrogate
# the srcnotifications file to determine the user choices 
# for receving change notification e-mails.
#
# Reads $ENV{'CVSROOT'}/CVSROOT/user-config/srcnotifications by default.
# Call notifications_reinit with a filename parameter to override this.
#
#
#
# $Id: CvsSrcnotifications.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsSrcnotifications;
require Exporter;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(find_srcnotification_details find_user_notifications delete_notification);
@EXPORT_OK = qw(write_srcnotifications srcnotifications_reinit);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

my $debug     = 0;

# An array (of objects) containing all the notifications
my @notifications;

# Generate all the accessor methods.
#
# This magic taken from Programming Perl (3rd ed) page 338 ...
# ... and then fixed by me because the code in the book's WRONG
# (unless you have a printing of the book after March 2001)
#
for my $field (qw(selfnotify cancel email branch)) {
  my $slot = __PACKAGE__ . "::$field";
  no strict "refs";         # So symbolic ref to typeglob works.
  *$slot = sub {
    my $self = shift;
    $self->{$field} = shift if @_;
    return $self->{$field};
  };
}

# A special case that cannot be handled by the above closures.
sub path
{
  my $self = shift;
  if (defined($_[0])) {
    $self->{path} = shift;
    $self->{path_length} = length($self->{path});
  }
  return $self->{path};
}

# Other required package-globals
my ($notify_file);


# Return to the initial state
sub notifications_reinit
{
  @notifications = ();
  $notify_file = shift;
}

#
# Sets the filename we are going to use *for reading*.
# Defaults to a locally readable file.
#
sub establish_filenames
{
  if ($_[0]) {
    $notify_file = $_[0];
  }
  else {
    $notify_file = $ENV{'CVSROOT'}.'/CVSROOT/user-config/srcnotifications';
  }
}


# Create a new notification and enter it into the database
sub new
{
  my $invocant = shift;
  my $class = ref($invocant) || $invocant;
  my $self = { @_ };
  bless $self, $class;
  push @notifications, $self;
  # Optimise ...
  $self->{path_length} = length($self->{path});
}

#
# This routine parses the srcnotifications file and stores the data
# in an internal hash for access by the other routines in this package.
#
sub parse_srcnotifications
{
  &establish_filenames() unless $notify_file;
  if (open(NOTIFY, '<'.$notify_file)) {
    @notifications = ();
    while (<NOTIFY>) {
      my $cancel;
      s/\015?\012/\n/g;
      chomp; # \r\n OK
      my ($email, $branch, $path, $selfnotify) = split(':', $_);
      next unless $selfnotify;
      if ($path =~ /^-(.*)$/) {
        $path = $1;
        $cancel = 1;
      }
      else {
        $cancel = 0;
      }
      $selfnotify = ($selfnotify !~ /^no$/i);
      $branch = '' if $branch =~ /^all$/i;
      new Pace::CvsSrcnotifications::
        email      => $email,
        branch     => $branch,
        path       => $path,
        selfnotify => $selfnotify,
        cancel     => $cancel
        ;
    }
    close NOTIFY;
  }
}

# Returns a list of users to whom e-mail notifications should be sent
# regarding a change by user $uid in directory $dir (optionally on a
# specified branch $branch, and optionally matching other e-mail
# addresses)
#
sub find_srcnotification_details 
{
  my ($uid, $dir, $branch, @supplementaries) = @_;
  my (%reply, $f);
  my $dirlen = length($dir);

  &parse_srcnotifications() unless @notifications;
  push @supplementaries, $uid;
  $branch = 'TRUNK' unless $branch;

  print "uid: $uid; dir: $dir; branch: $branch\n" if $debug;

  for $n (sort { ($a->{path}) cmp ($b->{path}) } @notifications) {
    # See if we need to add this person to the mailing list.
    # Basically, set $reply{username} to 1 or delete the
    # hash entry if we see a notification cancellation.
    next if $n->{branch} and ($n->{branch} ne $branch);
    next unless $n->{path} eq substr($dir, 0, $n->{path_length});
    # To get here, we know the path and branch are right
    if ($n->{cancel}) {
      delete $reply{$n->{email}};
    }
    else {
      my $ignore = 0;
      if (!$n->{selfnotify}) {
      # check user doesn't match any supplied email address
        for (@supplementaries) {
          $ignore = 1, last if $n->{email} eq $_;
        }
      }
      $reply{$n->{email}} = $n unless $ignore;
      print "ignoring notification due to self notify block\n" if $debug && $ignore;
    }
  }

  return (keys %reply);
}

# Returns a list of objects which are the notifications for a given
# user (with the aliases specified)
#
sub find_user_notifications
{
  my $match = $_[0];
  &parse_srcnotifications() unless @notifications;
  return map { $_->{email} eq $match ? $_ : () } @notifications;
}


# Deletes a given notification - note that this only removes it from our
# internal records, you need to rewrite the file and commit it if you
# really want to change stuff.
#
sub delete_notification
{
  for $location (0..$#notifications) {
    next unless $notifications[$location] eq $_[0];
    splice @notifications, $location, 1;
    last;
  }
}

# Returns a single string containing the new contents of the srcnotifications
# file, including any changes that have been made.  We sort it by mail address
# and then path (then branch, then cancel status, then self-notification)
#
sub write_srcnotifications
{
  my $result;

  for (sort { 
              $a->{email} cmp $b->{email}
              ||
              $a->{path} cmp $b->{path}
              ||
              $a->{branch} cmp $b->{branch}
              ||
              $a->{cancel} <=> $b->{cancel}
              ||
              $a->{selfnotify} <=> $b->{selfnotify}
            } @notifications)
  {
    $result .= join(':', (
        $_->{email},
        $_->{branch} ? $_->{branch} : 'all',
        $_->{cancel} ? '-'.$_->{path} : $_->{path},
        $_->{selfnotify} ? 'Yes' : 'No')) . "\n";
  }

  return $result;
}


# End of module - return success to loader
1;

=head1 NAME

CvsSrcnotifications.pm - interface to users' B<CVS> e-mail preferences

=head1 SYNOPSIS

E<lt>filenameE<gt> B<notifications_reinit>([optional filename containing notifications])

E<lt>array of stringsE<gt> B<find_srcnotification_details>(uid, dir, branch, e-mail addresses ...)

E<lt>array of objectsE<gt> B<find_user_notifications>(e-mail address string)

B<delete_notification>(object to delete)

E<lt>stringE<gt>   B<write_srcnotifications>

=head1 OVERVIEW

This component provides an API to process the e-mail notification
database held on the CVS server.  The file contains details of which
users have requested an e-mail notification when a change occurs in
specified directories.

=head1 DETAILS

=over 4

=item B<notifications_reinit>

Re-initialises this package and optionally sets the filename that
will be read when the notifications package is first queried.

=item B<find_srcnotification_details>

Returns an array of users to whom e-mail notifications should be sent
regarding a change by user $uid in directory $dir (optionally on a
specified branch $branch, and optionally matching other e-mail
addresses)

=item B<find_user_notifications>

Returns an array of objects which match the given e-mail address.
Objects in the returned array are suitable for modifications and
for passing to delete_notification.

=item B<delete_notification>

Removes the given object from the notifications data structure.
The object should have been returned by an earlier call to this
package.

=item B<write_srcnotifications>

Returns a single string which is the entire contents of the file
(including any changes made) suitably for recommitting back as
an updated version to the repository.

=back

=head1 FILES

F<${CVSROOT}/CVSROOT/user-config/srcnotifications>

The file containing the e-mail preferences for the B<CVS> repository.

=head1 OBJECT TYPE

The objects of type B<Pace::CvsSrcnotifications> have several accessors.

=over 4

=item B<selfnotify>

=item B<cancel>

=item B<email>

=item B<branch>

=item B<path>

=back

There is also a constructor available (B<new>) which takes a class
and then fields (named explicitly using the names shown above). e.g.:

 new Pace::CvsSrcnotifications:: 
  email => *, path => *, branch => *, selfnotify => *, cancel => *

I<email> [mandatory] is the e-mail address

I<path> [mandatory] is the directory name

I<branch> [optional] is the branch name (default is all branches)

I<selfnotify> [optional] is 1 to include this e-mail address
even when that person is the one who is making the change.
Default is 0.

I<cancel> [optional] is 1 if this is this is an exclusion (default is 0)

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut


