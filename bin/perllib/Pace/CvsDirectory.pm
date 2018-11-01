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
# CvsDirectory.pm
#
# This package is used for Pace CVS systems to process CVS admin
# directories as found in checked out copies of directories.  Using
# the provided facilities, one can be protected from changes in format
# of these files.
#
#
#
# pod docs at end
#
# $Id: CvsDirectory.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsDirectory;
require Exporter;
use     File::Spec;
use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(
  directory_root directory_tag directory_template directory_repository
  directory_entries directory_baserev
  );
@EXPORT_OK = qw(
  _directory_load
  );
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

# Other required package-globals
my $debug = 0;

# This routine loads the contents of an administrative file and returns
# a reference to an array of lines - it returns an empty array ref on an error.
# Parameters: filename, optional base directory.
sub _directory_load
{
  my ($leafname, $basedir) = @_;
  $basedir ||= File::Spec->curdir;
  open(CVSADMINDIR, '< '.File::Spec->catdir($basedir, 'CVS', $leafname)) or return [];
  local $/;
  my $result = <CVSADMINDIR>;
  close CVSADMINDIR;
  $result =~ s/\015?\012/\n/g;
  my @results = split(/\n/, $result);
  return \@results;
}

sub directory_root
{
  return shift @{ &_directory_load('Root', @_) };
}

# This routine removes any repository prefix on the entry in this file
sub directory_repository
{
  my $rep = shift @{ &_directory_load('Repository', @_) };
  if ($rep && $rep =~ m|^[/:]|) {
    # Fully-qualified filename!?  Erk.
    my $root = &directory_root(@_);
    my $len = length($root);
    if (substr($rep, 0, $len+1) eq $root.'/') {
      $rep = substr($rep, $len+1);
    }
  }

  return $rep;
}

sub directory_template
{
  return &_directory_load('Template', @_);
}

sub directory_tag
{
  my $tag = (shift @{ &_directory_load('Tag', @_) }) || '';;
  return $tag =~ /^(.)(.*)$/ ? ($1, $2) : ('', '');
}

# A helper function for do_directory_entries which enables us to process multiple
# files (Entries and Entries.Log).  Takes two parameters: reference to the result
# array, and reference to the entry objects returned by _directory_load.
sub do_directory_entries
{
  my ($result, $lines) = @_;

  for (@$lines) {
    if (m|^/(.*)$|) {
      my ($name, $revision, $timestamp, $options, $tagdate) = split('/', $1, 5);

      $$result{$name} = new Pace::CvsEntries:: 
       type => '/',
       name => $name,
       revision => $revision,
       timestamp => $timestamp,
       options => $options,
       tagdate => $tagdate;
    }
    elsif (m|^D/(.+)$|) {
      my ($name, @fillers) = split('/', $1, 5);
      $$result{$name} = new Pace::CvsEntries:: 
       type => 'D',
       name => $name;
    }
    elsif (m|^D$|) {
      # Indicates that the program which wrote the Entries file supports subdirectories
    }
    elsif (m|^(.)(.+)?$|) {
      # Unknown line - but keep it in case people are interested
      $$result{$1.$2} = new Pace::CvsEntries::
        type => $1,
        data => $2;
    }
  }
}

sub directory_entries
{
  my %result = ();

  &do_directory_entries(\%result, &_directory_load('Entries', @_));
  &do_directory_entries(\%result, &_directory_load('Entries.Log', @_));

  return values %result;
}

sub directory_baserev
{
  my $entries = &_directory_load('Baserev', @_);
  my %result = ();

  for (@$entries) {
    if (m|^B(.*)$|) {
      my ($name, $revision, $expansion) = split('/', $1, 3);

      $result{$name} = new Pace::CvsBaserev:: 
       type => 'B',
       name => $name,
       revision => $revision,
       expansion => $expansion;
    }
    elsif (m|^(.)(.+)$|) {
      # Unknown line - but keep it in case people are interested
      $result{$1.$2} = new Pace::CvsBaserev::
        type => $1,
        data => $2;
    }
    else {
      # Dunno
    }
  }

  return values %result;
}

##################################################################################
package Pace::CvsEntries;

sub new
{
  my $invocant    = shift;
  my $class       = ref($invocant) || $invocant;
  return bless { @_ }, $class;
}

# Generate all the accessor methods.
#
# This magic taken from Programming Perl (3rd ed) page 338 ...
# ... and then fixed by me because the code in the book's WRONG
# (unless you have a printing of the book after March 2001)
#
for my $field (qw(type name revision timestamp options tagdate data)) {
  my $slot = __PACKAGE__ . "::$field";
  no strict "refs";         # So symbolic ref to typeglob works.
  *$slot = sub {
    my $self = shift;
    $self->{$field} = shift if @_;
    return $self->{$field};
  };
}

##################################################################################
package Pace::CvsBaserev;

sub new
{
  my $invocant    = shift;
  my $class       = ref($invocant) || $invocant;
  return bless { @_ }, $class;
}

# Generate all the accessor methods.
#
# This magic taken from Programming Perl (3rd ed) page 338 ...
# ... and then fixed by me because the code in the book's WRONG
# (unless you have a printing of the book after March 2001)
#
for my $field (qw(type name revision expansion data)) {
  my $slot = __PACKAGE__ . "::$field";
  no strict "refs";         # So symbolic ref to typeglob works.
  *$slot = sub {
    my $self = shift;
    $self->{$field} = shift if @_;
    return $self->{$field};
  };
}

# End of module - return success to loader
1;

__END__

=head1 NAME

CvsDirectory.pm - process B<CVS> admin directories

=head1 SYNOPSIS

E<lt>stringE<gt> B<directory_root>([optional directory])

E<lt>stringE<gt> B<directory_repository>([optional directory])

E<lt>array refE<gt> B<directory_template>([optional directory])

E<lt>(type,value)E<gt> B<directory_tag>([optional directory])

E<lt>array of refE<gt> B<directory_entries>([optional directory])

E<lt>array of refE<gt> B<directory_baserev>([optional directory])

=head1 OVERVIEW

These functions are provided to process the contents of files found
inside CVS's admin directories in user sandboxes.  The format of these
files is liable to vary depending on the version of CVS that created
them.  These functions process those files in a version-neutral manner,
making the contents available to in a uniform manner to the caller.

All string data is chomped, so there are no trailing newlines in any of
the returned data.

All functions accept an optional parameter which is an alternative
base directory to look in.  The default is the current directory.

=head1 DETAILS

=over 4

=item B<directory_root>

Returns the contents of CVS/Root file (ie. -d param for cvs) as a string.

=back

=over 4

=item B<directory_repository>

Returns location of directory inside the repository
This routine will attempt to remove any prefix on this
location so that the location returned is relative to the
repository root.  Return value is a string.

=back

=over 4

=item B<directory_entries>

Returns the contents of the Entries file as an array of
references to Pace::CvsEntries objects.  See object types
section below.

=back

=over 4

=item B<directory_baserev>

Returns the contents of the Baserev file as an array of
references to Pace::CvsBaserev objects.  See object types
section below.

=back

=over 4

=item B<directory_template>

Returns the contents of the log message template file (if any).  
The value returned is a reference to an array of strings - one
per line in the file.

=back

=over 4

=item B<directory_tag>

Returns the contents of the sticky tag file as a pair (list with two
items in it).  The first is an identifier character for the tag type.
This is the first letter of the first line of the Tag file or an empty
string if there was no sticky tag.  If the first item is non-empty,
then the second is the rest of the line - the value for the tag.  Valid
known tag types include: T (branch tag), N (non-branch tag), D (date
spec)

=back

=head1 OBJECT TYPES

=over 4

=item B<Pace::CvsEntries>

Methods are automatically generated and are named:  I<type> ('/' or 'D'),
I<name>, I<revision>, I<timestamp>, I<options>, I<tagdate>.  Additionally, there is a
method I<data> which is the content of the entire line after the
identifying first character if the line type was not known.

=back

=over 4

=item B<Pace::CvsBaserev>

Methods are automatically generated and are named:
I<type>, I<name>, I<revision> and I<expansion>.

=back

=head1 EXTRA FUNCTION

E<lt>array refE<gt> B<_directory_load>(leafname, [optional directory])

There is another function I<_directory_load> which is exported but
which should not normally be used.  It can be used to load the contents
of a file into an array.  It returns a reference to an array of
strings.  It should only be used if there is no alternative API for
reading the file you require.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

