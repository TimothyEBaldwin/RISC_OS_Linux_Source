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
# Cvsrc.pm
#
# A perl package to process a user's .cvsrc file and make the options available
# to tbe caller to enable specific options to be picked up by default (e.g.
# finding the -z setting for cvs operations)
#
#
#
# $Id: Cvsrc.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::Cvsrc;
require Exporter;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(find_cvsrc_option find_cvs_compression_option);
@EXPORT_OK = qw(parse_cvsrc cvsrc_options);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

#
# Some package-global variables to hold the loaded information
#
my %cvsrc_options = ();

#
# This routine parses the user's .cvsrc file and populates a hash with the information.
#
sub parse_cvsrc
{
  my ($command, $args);
  my $filename = $ENV{"HOME"}.'/.cvsrc';
  my $windoze_filename = $ENV{"HOME"}.'/_cvsrc';

  # Initialise the hash with a statement disabling compression so that
  # not having a .cvsrc file doesn't cause this routine to be called
  # repeatedly.  Any real declaration will take precedence over this. 
  %cvsrc_options = (_readfile_ => 'yes');

  open(CVSRC, '<'.$filename) || open(CVSRC, '<'.$windoze_filename) || return %cvsrc_options;
  while (<CVSRC>) {
    s/\015?\012$/\n/;
    chomp; # \r\n OK
    ($command, $args) = split(" ", $_, 2);
    $cvsrc_options{$command} = $args if $command && $args;
  }
  close CVSRC;
  return %cvsrc_options;
}

#
# find_cvsrc_option will look for the options for a given set of keywords
# For each parameter, it will concatename all the options and return a
# single string containing all the options.  The ability to pass multiple
# parameters is of questionable benefit (why would it be useful?)
#
sub find_cvsrc_option {
  my (@options, $keyword);

  &parse_cvsrc() unless %cvsrc_options;
  for $keyword (@_) {
    push(@options, $cvsrc_options{$keyword}) if $cvsrc_options{$keyword};
  }

  return join(' ', @options);
}


# The specific API to get the generic cvs compression option.
sub find_cvs_compression_option {
  my $cvsoptions = &find_cvsrc_option('cvs');
  return '-z'.$1 if ($cvsoptions =~ /-z\s*(\d)/);
  return '';
}

# End of module - return success to loader
1;

__END__

=head1 NAME

Cvsrc.pm - interface to users' I<.cvsrc> files

=head1 SYNOPSIS

E<lt>stringE<gt> B<find_cvsrc_option>(command)

E<lt>stringE<gt> B<find_cvs_compression_option>(command)

=head1 OVERVIEW

This component provides a simple API to read the default options
associated with a given command in the I<.cvsrc> file.  All string data
is chomped, so there are no trailing newlines in any of the returned
data.

The major use of this package is to determine safe optional options
that the user has configured when a script needs to invoke CVS using
the I<-f> cvs option to prevent it reading the I<.cvsrc> file.
Typically, this means the compression option.

Since the most common use of this script is to extract the compression
option to be passed to cvs, then an explicit API is provided to extract
this information.


=head1 DETAILS

=over 4

=item B<find_cvsrc_option>

A string of options is returned corresponding to any settings the user
may have in their I<.cvsrc> file for the specified command.  Use B<cvs>
as the command for cvs options (ie. those that go before the
subcommand), and the subcommand itself to get those which follow the
subcommand.  An empty string is returned if there is no entry for the
specified command.

=item B<find_cvs_compression_option>

A string is returned which is either empty, or a compression option if
one is mandated by the .cvsrc file.  The string is suitable for passing
as a single argument to a cvs command.

=back

=head1 FILES

=over 4

=item F<${HOME}/.cvsrc>

=item F<${HOME}/_cvsrc>

The file containing the user preferences for B<CVS>.

=back

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut

