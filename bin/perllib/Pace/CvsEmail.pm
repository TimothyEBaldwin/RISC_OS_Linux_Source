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
# CvsEmail.pm
#
# This package is used by the Pace CVS systems to send e-mails.
#
#
#
# $Id: CvsEmail.pm,v 1.2 2008/06/10 12:06:22 rool Exp $
#
package Pace::CvsEmail;
require Exporter;
use Carp;
use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(send_email);
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.2 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################

# Other required package-globals
my $debug = 0;

# Options for sendmail: 
#   -oi  = . on a line doesn't terminate mail
#   -t   = look for recipients in body of message
#   -odq = queue mail don't deliver (avoids swamping machine)
#   -bv  = *debug* address verification mode - will NOT send mail with this option
my $mailsoftware = $debug ? '| /bin/cat' : '| /bin/sendmail -oi -t';

sub send_email
{
  my $self = new Pace::CvsEmail:: @_;
  $self->transmit;
}

sub transmit
{
  my $self = shift;

  # Basic message integrity check - there must be a To header and a message body!
  return undef unless defined $self->{'Text'} ;
  return undef unless defined $self->{'To'} ;

  # Start the mailer process.
  open(EMAIL, $mailsoftware) or return undef;
 
  # Remove the magic "header" that is actually the body of the e-mail
  # whilst we write out the mail headers ...
  my $text = delete $self->{'Text'};

  print EMAIL &_format_header($_, $self->{$_}) for keys %$self;
  print EMAIL "\n", $$text, "\n";
  close EMAIL;

  # ... and add the body of the e-mail back into the object before returning
  $self->add_headers(Text => $text);

  return $? >> 8;
}

# This function generates an e-mail header.  If the value is a simple scalar, then the
# header: value is output as-is.  If the value is an array (ref), then it is treated as
# a list of addresses (ie. a To: Cc: or Bcc: field) and the value is comma-separated and
# wrapped at $maxwidth columns.
#
sub _format_header
{
  my ($header, $value) = @_;
  if (ref($value) eq "SCALAR") {
    return $$value ? "$header: $$value\n" : '';
  }
  croak "Only scalars and array references may be header values ($header)\n", unless ref($value) eq "ARRAY";
  my ($maxwidth, $accum, @result) = (72, '', ());

  for (@$value) {
    # Empty values could cause problems - remove them
    next unless $_;
    my $widthremaining = $maxwidth - length($accum);
    if (length($_) > $widthremaining) {
      push @result, $accum.",\n";
      $accum = '';
    }
    if (!$accum) {
      $accum = (@result) ? '  ' :$header . ': ';
    }
    else {
      $accum .= ', ';
    }
    $accum .= $_;
  }

  # Let's not bother with an empty headers - they confuse people
  return '' unless $accum || @result;

  push @result, $accum."\n";
  return join('', @result);
}

# Add a header to the hash - note this prevents duplicate headers!
sub add_headers
{
  my $self = shift;

  while (@_) {
    my $header = shift;
    my $value = shift;
    $header =~ y/ /-/;
    $self->{ucfirst lc $header } = ref($value) ? $value : \$value;
  }

  $self;
}

# Constructs a new e-mail object with the specified headers preset
sub new
{
  my $self = bless {}, shift;
  return $self->add_headers(Precedence => 'bulk', Subject => 'Untitled', "X-Mailer" => 'CvsEmail.pm '.&VERSION, @_);
}

sub __test_send_email
{
 &send_email(
   from => 'Code Submissions <code@riscosopen.org>',
   to   => [ 'Code Submissions <code@riscosopen.org>',
             'Info <info@riscosopen.org>' ],
   text => 'Hello from CvsEmail.pm'
 );
}

# End of module - return success to loader
1;

__END__

=head1 NAME

CvsEmail.pm - email sending interface for perl

=head1 SYNOPSIS

E<lt>resultE<gt> B<send_email>(fields ...)

E<lt>objectE<gt> B<new>(object, fields ...)

E<lt>objectE<gt> B<add_headers>(object, fields ...)
 
E<lt>resultE<gt> B<transmit>(object)

=head1 OVERVIEW

This package is used to send e-mail.  It accepts the header fields and
the message body and will attempt to send the e-mail to the intended
recipients.  There are two main methods supported: I<send_email> is a
one-shot complete e-mail in one function call; I<new>, I<add_headers>,
I<transmit> is a multi-phase e-mail transmission if that is required.

=head1 DETAILS

=over 4

=item B<send_email>

Returns undef if it never attempted to send the e-mail.
Returns the exit code of the mailer command otherwise.

 send_email(
   from => sbrodie,
   to => [ sbrodie, nbingham], 
   text => 'Hello from CvsEmail.pm'
 );

Headers must be unique - you cannot have multiple to lines.  The values
for each header are array references or scalar strings.  If the value
is an array reference, then the entries in the array will be joined
with commas and split across multiple copies of the header if
necessary.  Header names are not case-sensitive.  All header names will
be lowercased and the first character uppercased.

The body of the e-mail is held in a pseudo-header called B<Text>.  This
is a scalar containing the entire message.

=back

=over 4

=item B<new>

Creates a new e-mail object with some default mail headers.  All the
parameters are passed on to the I<add_headers> function.  Some default
headers are specified (X-Mailer, Precedence and Subject) automatically
but may be overridden by providing an alternative header of the same
name.

=back

=over 4

=item B<add_headers>

Adds more headers to an e-mail object.  See the I<send_email> section for
the details of the parameters constraints.

=back

=over 4

=item B<transmit>

Transmits the e-mail object through the mail system.  The return value is
as for the I<send_mail> function.

=back

=head1 OBJECT TYPE

The I<Pace::CvsEmail> object is constructed with the I<new> method
(optionally setting headers as well).  Extra headers are added with the
I<add_headers> method (API the same as I<send_email> interface), and
then the mail is transmitted using the I<transmit> method.  In fact,
the implementation of I<send_email> is equivalent to:

  my $self = new Pace::CvsEmail::;
  $self->add_headers(@_);
  $self->transmit;

The return value for I<transmit> matches that of I<send_email>.

=head1 DEPENDENCIES

This package does not depend on any other non-standard packages.

However, this package relies on I</bin/sendmail> for actually
sending the e-mail.  It also relies on sendmail breaking up the
message into multiple e-mails if the recipient list is too long.

=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/10 12:06:22 $
    $Revision: 1.2 $

=cut
