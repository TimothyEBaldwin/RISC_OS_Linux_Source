# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
# 
#
# CvsVersionNum.pm
#
# A perl package to process a VersionNum file.
#
#
#
# $Id: CvsVersionNum.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsVersionNum;
require Exporter;
use     Carp;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(parse_versionnum_file);
@EXPORT_OK = qw(parse_versionnum);
sub VERSION  { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

# Accessor
sub major      { my $self = shift; if (@_) { $self->{major} = shift; } return $self->{major}; }

#
# Some package-global variables to hold the loaded information
#

# No globals - all objects are returned and caller must keep them if they want the
# information.

#
# These routines parse VersionNum files
#
sub parse_versionnum
{
  $_ = shift;
  chomp; # \r\n OK
  croak "VersionNum file format not recognised - has it been messed with?" unless m|^.*\((.*)\).*$|;
  my $self = { major => $1 };
  bless $self; 

  for (@_) {
    s/\015?\012$/\n/g;
    chomp; # \r\n OK
    if (/\#define\s+(\S+)\s*$/) {
      $self->{$1} = '';
    }
    elsif (/\#define\s+(\S+)\s+(.*)\s*$/) {
      my ($field, $value) = ($1, $2);
      $value =~ s/^"(.*)"$/$1/;
      $self->{$field} = $value;
    }
  }

  return $self;
}

sub parse_versionnum_file
{
  my $filename = shift;
  if (open(VERSIONNUM, '<'.$filename)) {
    my @contents = <VERSIONNUM>;
    close(VERSIONNUM);
    return &parse_versionnum(@contents);
  }

  return undef;
}


# End of module - return success to loader
1;

__END__

=head1 NAME

CvsVersionNum.pm - wrapper for reading and interpreting VersionNum files

=head1 SYNOPSIS

E<lt>objectE<gt> parse_versionnum_file(filename)

E<lt>objectE<gt> parse_versionnum(list of lines)

=head1 OVERVIEW

This package provides interfaces for interpreting I<VersionNum> files.
The two parsing functions return an object representing the parsed data
which can then be queried for values.
 
=head1 DETAILS

=over 4

=item B<parse_versionnum_file>

Reads the given file and returns an object representing it or
undef if a problem occurred opening the file.  Really just a
wrapper around B<parse_versionnum>.

=item B<parse_versionnum>

A function which will parse a file held in an array of lines.
Useful when you use I<clientop_checkout_object_readonly>.

=back

=head1 OBJECT TYPE

The B<Pace::CvsVersionNum> objects returned by the API have one standard
accessor (B<major>) and other accessible values set to the names of the
macros which have been #defined in the file.  The values are stripped
of any quoting.

$obj-E<gt>{fieldname} is undef if the file did not contain a definition for
the named fieldname.

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

