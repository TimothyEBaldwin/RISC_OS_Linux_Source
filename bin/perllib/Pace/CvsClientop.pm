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
# CvsClientop.pm
#
# A perl package to checkout files from and commit files back to CVS from
# a temporary directory.  This enables users of this module to have files
# obtained from the repository and cleaned up again afterwards.
#
#
#
# $Id: CvsClientop.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsClientop;
require Exporter;
use     POSIX qw(tmpnam);
use     Carp;
use     Cwd;
use     File::Path;
use     Pace::Cvsrc;
use     Pace::CvsRepository;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(
  clientop_set_repository
  clientop_checkout_object_readonly
  clientop_checkout_object_readwrite
  clientop_checkin_object
  clientop_checkout_object
  );
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }


my $testing   = '';       # Stops files being committed if set to '-n'
my $debug     = 0;


# Our private data structures
my ($tmpdir, $cvsrootparam, $cvsrepository);

# Initialisation and finalisation code
END
{
  if ($tmpdir) {
    chdir;
    &File::Path::rmtree($tmpdir, $debug, 1);
    $tmpdir = '';
  }
}

# Checkout some objects read/write so that they can be edited and
# then recommitted later.  If you are not going to want to edit the
# file, use checkout_objects_readonly instead.  This routine returns
# the root pathname to the temporary directory if it succeeded in
# checking stuff out, an empty string otherwise.
#
sub clientop_checkout_object_readwrite
{
  my ($obj, $op, $resultref) = @_;
  my $oldcwd = &cwd();
  my $result;
  my $cvsoptions = &find_cvs_compression_option;
  $tmpdir ||= tmpnam();
  &File::Path::mkpath($tmpdir, $debug, 0700);
  &clientop_set_repository() unless $cvsrepository;
  chdir $tmpdir or croak "Temporary directory $tmpdir does not exist";
  print "Using temporary directory $tmpdir\n" if $debug;
  $op ||= 'co';
  $result = &execute("cvs -f $cvsoptions -Q $cvsrootparam $op $obj", $resultref);
  chdir $oldcwd;
  return $result ? '' : $tmpdir;
}

# Checkout some objects read-only. If you are going to want to edit the
# file, use checkout_objects_readwrite instead.  This routine returns
# the contents of the file as an array of strings (or an empty array if
# the file was empty/not found)
#
sub clientop_checkout_object_readonly
{
  my ($files, $op) = @_;
  my $clioptions = '';
  my $cvsoptions = &find_cvs_compression_option;
  &clientop_set_repository() unless $cvsrepository;
  $clioptions = '-r HEAD' if ($files !~ /\^-[rD]/);
  $op ||= 'co';
  print "cvs -f $cvsoptions -Q $cvsrootparam co -p $clioptions $files |" if $debug || $testing;
  if (open(CVSCLIENTOP, "cvs -f $cvsoptions -Q $cvsrootparam $op -p $clioptions $files |")) {
    @results = <CVSCLIENTOP>;
    close CVSCLIENTOP;
  }
  else {
    croak "Checkout failed: $!\n";
  }
  return @results;
}

# Checkout some objects normally (i.e. to the current sandbox).
# Returns true if the checkout succeeded.
#
sub clientop_checkout_object
{
  my ($obj, $op, $resultref) = @_;
  my $oldcwd = &cwd();
  my $result;
  my $cvsoptions = &find_cvs_compression_option;
  &clientop_set_repository() unless $cvsrepository;
  $op ||= 'co';
  $result = &execute("cvs -f $cvsoptions -Q $cvsrootparam $op $obj", $resultref);
  return $result ? 0 : 1;
}

# Checkin some modified object with the specified log message.  The object MUST
# have been previously checked out with clientop_checkout_object_readwrite.
# Read-only checked out files cannot be modified.
#
sub clientop_checkin_object
{
  my ($object, $messagefilename, $messagelines, $resultref) = @_;
  my $oldcwd = &cwd();
  my ($result, $cvsciflags);
  my $cvsoptions = &find_cvs_compression_option;

  chdir $tmpdir or croak "Temporary directory $tmpdir does not exist";

  if (!$messagefilename) {
    $messagefilename = 'tmplog.txt';
    open(CVSCLIENTOP, '>'.$messagefilename) or croak 'Unable to create temporary file for log message';
    foreach (@$messagelines) { print CVSCLIENTOP; }
    close(CVSCLIENTOP);
  }

  $cvsciflags = '-F ' . $messagefilename; 
  $result = &execute("cvs -f $cvsoptions -Q $cvsrootparam $testing ci $cvsciflags $object", $resultref);
  chdir $oldcwd;
  return $result ? 0 : 1;
}

#
# get repository from CVS control file in preference to environment variable
#
sub clientop_set_repository
{
  my $cvsroot = &auto_detect_repository(@_);
  
  croak 'cannot establish a path to repository root' unless $cvsroot;
  $cvsrepository = $cvsroot;
  $cvsrootparam = '-d '.$cvsroot;

  print "Canonical repository is $cvsrepository\n" if $testing || $debug;
  return $cvsroot;
}


sub execute {
  my ($command, $outputcapture) = @_;
  print "-- executing: $command\n" if $debug;
  if (ref($outputcapture)) {
    if (open(COMMAND,$command . ' |')) {
      push(@{ $outputcapture }, $_) while <COMMAND>;
      close COMMAND;
    }
  }
  else {
    system($command);
  }
  return ($? >> 8);
}

# End of module - return success to loader
1;

__END__


=head1 NAME

CvsClientop.pm - checkout and checkin files to I<CVS>

=head1 SYNOPSIS

E<lt>stringE<gt> B<clientop_set_repository>([optional repository])

E<lt>array of stringsE<gt> B<clientop_checkout_object_readonly>(filename, [operation])

E<lt>array refE<gt> B<clientop_checkout_object_readwrite>(filename, [operation])

E<lt>boolE<gt> B<clientop_checkin_object_file>(filename, log filename, log message, [output receiver])


=head1 OVERVIEW

These functions are provided to process files held under CVS control.
Facilities are provided to checkout files read-only or read-write and a
function is provided to commit a changed file back to the repository.


=head1 DETAILS

=over 4

=item B<clientop_set_repository>

Sets the repository which is going to be accessed.  If a parameter is
supplied, then that is the repository to access, otherwise the
repository will be derived from a CVS/Root file found relative to the
current directory, of the I<CVSROOT> environment variable.

=back

=over 4

=item B<clientop_checkout_object_readonly>

Returns the contents of the specified file as an array of strings.  The
CVS operation to be performed is I<checkout> by default, but may be
altered by specifying the operation parameter explicitly.  The only
useful alternative is I<update>.

By default, the HEAD revision will be checked out.  However, you can
override this by including a revision specifier at the B<start> of the
filename.  For example:

C<clientop_checkout_object_readonly('-r 1.12 CVSROOT/Access');>

=back

=over 4

=item B<clientop_checkout_object_readwrite>

This function checks out the specified file into a temporary
directory.  It returns the name of the temporary directory under which
the file has been checked out.  The CVS operation to be performed is
I<checkout> by default, but may be altered by specifying the operation
parameter explicitly.  The only useful alternative is I<update>.

By default, the HEAD revision will be checked out.  However, you can
override this by including a revision specifier at the B<start> of the
filename as for I<clientop_checkout_object_readonly>.  Obviously it is
not useful to checkout on a symbolic tag, but this capability may be
useful if you need to check out on a specific branch of the repository
instead of the trunk.

=back

=over 4

=item B<clientop_checkin_object>

Commits a change to the repository for the specified file.  If the
message filename parameter is non-empty, then this is taken as the name
of the file which contains the log message to be used during the commit
and the log message parameter is ignored.  If the message filename
parameter is empty, then the log message parameter is a reference to an
array of strings comprising the log message.

Any output generated during the commit will be allowed to be sent to
the standard output streams.  To capture the output, pass a reference
to an array in the output receiver parameter.  The clientop module will
I<push> each line of output into the array.  To discard such output, pass
an anonymous array reference (B<[]>)

=back

=head1 DEPENDENCIES

This package relies on the Pace::Cvsrc package to interface to the user's
configuration settings for B<CVS>.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

