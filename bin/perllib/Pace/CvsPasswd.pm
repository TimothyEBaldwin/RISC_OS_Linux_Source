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
# CvsPasswd.pm
#
# This is a server-side package for Pace CVS systems used to interrogate
# the password file for user information.  As an enhancement, it will
# interrogate the system for information on users not in the passwd file,
# so that a consistent interface can be used by callers regardless of
# whether the user is virtual or real.
#
#
#
# $Id: CvsPasswd.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsPasswd;
require Exporter;
use     User::pwent;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(
  find_cvspass_details is_system_user use_passwd passwd_reinit write_passwd
  delete_user
  pw_make_crypted_password pw_make_random_password pw_check_password);
@EXPORT_OK = qw(parse_passwd use_passwd_file);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

# %passwd_entry is a hash keyed on the cvs username.  Each value is an object of
# type CvsPasswd.  Call the access function find_cvspass_details to look stuff up.
my %passwd_entry = ();

# Other required package-globals

# Clean out any stored state we may have
sub passwd_reinit
{
  %passwd_entry = ();
  return \%passwd_entry;
}

# Instantiate a new object and dump it in the hash table
sub new
{
  my $invocant = shift;
  my $class    = ref($invocant) || $invocant;
  my $self     = { usertype => 1, @_ };
  bless $self, $class;
  $passwd_entry{$self->{uid}} = $self;
}

# Generate all the accessor methods.
#
# This magic taken from Programming Perl (3rd ed) page 338 ...
# ... and then fixed by me because the code in the book's WRONG
# (unless you have a printing of the book after March 2001)
#
for my $field (qw(uid password usermap email realname)) {
  my $slot = __PACKAGE__ . "::$field";
  no strict "refs";         # So symbolic ref to typeglob works.
  *$slot = sub {
    my $self = shift;
    $self->{$field} = shift if @_;
    return $self->{$field};
  };
}

# Parses a single line of entry into the hash
sub create
{
  my $line = shift;
  $line =~ s/\015?\012/\n/g;
  chomp $line; # \r\n OK
  my @fields = split(':', $line);

  return new Pace::CvsPasswd:: 
    uid      => $fields[0],
    password => $fields[1],
    usermap  => $fields[2],
    realname => $fields[3],
    email    => $fields[4],
    @_
  if @fields > 1;
}

#
# This routine parses a password file and stores the data
# in an internal hash for access by the other routines in this package.
#
sub use_passwd_file
{
  if (open(PASSWD, '<'.shift)) {
    &passwd_reinit();
    map { create($_)} <PASSWD>;
    close PASSWD;
  }
}

#
# This routines kicks off the load of the standard password file
#
sub parse_passwd
{
  &use_passwd_file($ENV{'CVSROOT'}.'/CVSROOT/passwd');
}

#
# This routine takes a list of password file entries and populates the hash
# with them.
#
sub use_passwd
{
  &passwd_reinit();
  map { create($_) } @_;
}

# Returns the specified object from the password file
# <object> &find_cvspass_details(user id)
sub find_cvspass_details
{
  my ($theuid) = shift;
  &parse_passwd() unless %passwd_entry;
# &establish_system_user($theuid) unless defined($passwd_entry{$theuid});
  return $passwd_entry{$theuid};
}

# Removes the specified user from the cache
#
sub delete_user
{
  delete $passwd_entry{$_->{uid}} for @_;
}


#
# This auxiliary routine is used to populate our hashed password file
# with a system user who is not explicitly mentioned in the CVS password
# file.  We retrieve the user information from the system and pretend
# that the user appeared in the password file instead so that it appears
# that the information has come from the same place.
#
sub establish_system_user
{
  my $theuid = shift;
  my $sysuser = getpwnam($theuid);
  
  if ($sysuser) {
    # Remember this data came from getpwnam and not the file
    my $self = new Pace::CvsPasswd::
      uid      => $sysuser->name,
      password => $sysuser->passwd,
      usermap  => $sysuser->name,
      email    => $sysuser->name,
      realname => $sysuser->gecos,
      usertype => 2;
    $self;
  }
}

# Is this user known?  Returns:
#
# 0 => user not known
# 1 => user in CVSROOT/passwd
# 2 => user in system user database
#
sub is_system_user
{
  my $user = &find_cvspass_details(shift);
  return ($user->{usertype} eq 2);
}

# Returns a string to write to a file containing the entire password file
# together with any modifications that may have been made *to users in
# the file*.  System users are not output.
sub write_passwd
{
  my $answer = '';
  my $obj;

  foreach $obj (sort keys %passwd_entry) {
    $_ = $passwd_entry{$obj};
    $answer .= "$_->{uid}:$_->{password}:$_->{usermap}:$_->{realname}:$_->{email}\n" if ($_->{usertype} eq 1);
  }

  return $answer;
}

#
# These routines combine to generate random crypted passwords and validate entered plaintext passwords
#
sub int_pw_makesalt
{
  my @salt = ('a'..'z', 'A'..'Z', '0'..'9');
  my $rnd1 = int rand(@salt);
  my $rnd2 = int rand(@salt);
  return $salt[$rnd1] . $salt[$rnd2];
}

sub pw_make_crypted_password
{
  my ($password, $salt) = @_;
  $salt = &int_pw_makesalt() unless $salt;
  return crypt($password, $salt);
}

sub pw_make_random_password
{
  return &int_pw_makesalt().&int_pw_makesalt().&int_pw_makesalt().&int_pw_makesalt();
}

sub pw_check_password
{
  my ($uid, $plain) = @_;
  my $user = &find_cvspass_details($uid);
  return 0 unless $user;
  return 1 unless $user->password;
  return $user && (&pw_make_crypted_password($plain, $user->password) eq $user->password);
}

# End of module - return success to loader
1;

__END__

=head1 NAME

CvsPasswd.pm - interface to the CVS user database file

=head1 SYNOPSIS

E<lt>hash refE<gt> B<passwd_reinit>

B<use_passwd>(array of lines)

B<use_passwd_file>(filename)

E<lt>objectE<gt> B<find_cvspass_details>(user id)

E<lt>boolE<gt> B<is_system_user>(user id)

B<delete_user>(user id)

E<lt>multiline stringE<gt> B<write_passwd>

E<lt>stringE<gt> B<pw_make_crypted_password>(password, [optional salt])

E<lt>stringE<gt> B<pw_make_random_password>

E<lt>boolE<gt>   B<pw_check_password>(user id, plaintext password)

=head1 OVERVIEW

This component provides a simple API to read and write entries in the
user database (password) file in a given CVS repository.  This package
does not provide a mechanism for obtaining such a file - that is left
to the caller to obtain via whatever method is appropriate.

=head1 DETAILS

=over 4

=item B<passwd_reinit>

Clears the cache of user ids and returns a reference to the internal
hash used to hold the user cache.  Please do NOT abuse the returned
reference.  Ignore it unless you really really want it.

=item B<use_passwd>

Clears any cached information and uses the array of lines supplied to
repopulate the cache of user ids.

=item B<use_passwd_file>

Pre-loads the password list with the contents of the file - presumably obtained
from I<CvsClientop.pm>'s read/write checkout (use B<use_passwd> for r/o operation)

=item B<find_cvspass_details>

Returns the object named by user id containing details of the user's
authentication in the user database.  Returns undef if the user does
not exist.  See object type definition below for details of the
I<Pace::CvsPasswd> objects.

=item B<is_system_user>

Returns non-zero if the specified user-id is authenticated from the
system rather than the CVS password file.  Will return false if the
user is not known (use find_cvspass_details to check existence).

=item B<delete_user>

Removes the specified user from the user database cache.  It does not
remove the user from the active user database - the caller must commit
an updated revision of the file to do that (see I<write_passwd>).

=item B<write_passwd>

Generates what it thinks is a complete up-to-date password file
including any changes made since the data was loaded and returns it as
a multiline string that can be written out as-is to a file and
committed.

=item B<pw_make_crypted_password>(password, [optional salt])

Encrypts a password either using a random salt or the specified salt.  It
returns a crypted string suitable for insertion into the password file in
the CVS user database.

=item B<pw_make_random_password>

This function returns a new random password.  It returns you the cleartext
version, such that it can be e-mailed to a user for use when authenticating
against B<CVS>.

=item B<pw_check_password>(user id, plaintext password)

Validates a supplied password against that stored in the user database.
It returns non-empty only if the password matches.

=back

=head1 OBJECT TYPE

=over 4

=item B<Pace::CvsPasswd>

This is an object representing a user in the user database.  It has
the following accessor/mutator functions:

=over 4

=item B<uid>

=item B<password>

=item B<usermap>

=item B<realname>

=item B<email>

=back

There are two constructors:

=over 4

=item B<new>(E<lt>classE<gt> field assignments ...)

To set the various attributes, specify them by name. e.g.

new Pace::CvsPasswd:: uid =E<gt> sbrodie, usermap =E<gt> sources, ...;

=item B<create>(a single line from the user database)

=back

=back

=head1 REPOSITORY FILES

=over 4

=item F<CVSROOT/passwd>

The file containing the user database.

=back

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

