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
#!/usr/local/perl -w
#
#
# CvsModules::Entry.pm
#
# This file contains package CvsModules::Entry
#
# This is an object type representing individual entries in a modules file.
#
# This package is used for Pace CVS systems to process configuration
# management files ("modules files") such as those stored in the repository
# in Products/<product>/<variant>/modules.
#
#
#
# $Id: Entry.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsModules::Entry;
require Exporter;
use Pace::CvsRepository;
use Pace::CvsModules::Index;
use Carp;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw();
@EXPORT_OK = qw(is_duplicate);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################
#
# Instantiate a new object 
#
sub new 
{
  my $invocant    = shift;
#  my $collection  = shift;
  my $class       = ref($invocant) || $invocant;
  my $self        = { @_ };
  bless $self, $class;
  croak "Mandatory values missing" unless $self->{path} && $self->{tag};
#  push @{ $collection->{modules} }, $self;

  my $opt_repos = $self->{opt_repos};
  $self->{opt_repos} = expand_repository_alias($opt_repos) || $opt_repos if $opt_repos;

  while (@_) {
    my $fn = shift;
    &create_accessor($fn) if ($fn && $fn =~ /^opt_/);
    shift;
  }
  $self;
}

sub show
{
  my $self = shift;
  my $showcomments = shift;
  print join("\n",@{$self->{comment_lines}})."\n"
          if $showcomments && $self->{comment_lines} && @{$self->{comment_lines}};
  print join('  ', map { defined($self->{$_}) ? $self->{$_} : () } qw(path tag track)), "\n";
  for (keys %{ $self }) {
    print (defined $self->{$_} ? "  $_ => $self->{$_}\n" : "$_ exists but undefined\n") if /^opt_/;
  }
  print "           $self->{trailing_comment}\n" if $showcomments && $self->{trailing_comment};
  if (ref $self eq "Pace::CvsModules::Subproduct") {
    print "======== Subproduct:\n";
    Pace::CvsModules::show $self;
    print "======== end of subproduct $self->{path}\n";
  }
}

# Expand the given module into a Subproduct object
sub make_into_subproduct {
    my $self = shift;
    my $collection = shift;
    
    $self->{currentcollection} = $collection;

    bless $self, Pace::CvsModules::Subproduct;
}

sub output_field ($$)
{
  my ($value, $minwidth) = @_;
  my $output;
  if ($value) {
    $output .= $value;
    $output .= ' ' x ($minwidth - length($value)) if ($minwidth > length($value));
    $output .= ' ';
  }
  $output;
}

# Generate a line for a modules file.
# 1st Argument says whether to include any comments (if there are any left).
# 2nd Argument, if present, is a hashref defining the minimum width for certain fields
# 3rd argument, if present, is a hash of columnwidths.
# Line(s) will be terminated with \n
sub output
{
  my $self = shift;
  my $showcomments = shift;
  my $columnwidths = shift;
  my $outputlines;
  $outputlines = join("\n",@{$self->{comment_lines}})."\n"
          if $showcomments && $self->{comment_lines} && @{$self->{comment_lines}};
  for (qw(path tag)) {
    $outputlines .= output_field($self->{$_},
                      $columnwidths && $columnwidths->{$_} ? $columnwidths->{$_} : 0);

  }
  for (grep /^opt_\w+$/ && $self->{$_}, keys %{ $self }) {
    (my $opt = $_) =~ s/^opt_/-/;
    my $value = $self->{$_};
    $value = qq['$value'] if $value =~ /[ #"]/;
    $value = find_repository_alias($value) || $value if $opt eq '-repos';
    $outputlines .= " $opt " . output_field($value,
                      $columnwidths && $columnwidths->{$_} ? $columnwidths->{$_} : 0);
  }
  $outputlines .=  " $self->{trailing_comment}" if $showcomments && $self->{trailing_comment};
  $outputlines .=  "\n";
}

# Parse options from comments, according to the arcane scheme used in CCG and DTD.
# See COMMENTS in the documentation for an explanation of the hash
#
sub parse_comments
{
  my $self = shift;
  my $defhash = shift;

  return unless $self->{comment_lines} && @{$self->{comment_lines}} && %$defhash;
  my @comments = @{$self->{comment_lines}};


  @{$self->{comment_lines}} = ();

  my $match = join ('|', keys %$defhash);

  for (@comments) {
    if (/^\s*#\s*($match)\s+/) {
      my $key = $+;
      my $value = $';
      my $def = $defhash->{$key};
      if (ref $def eq 'ARRAY') {
        #Multiple values - array of divider and list of keywords
        my $sep = $def->[0];
        my @parts = split($sep, $value);
        for (my $i=0; $i< @parts && $i < $#{$def}; $i++) {
          $self->{"opt_".$def->[$i+1]} ||= $parts[$i];
        }
      } else {
        #Single value - only set it if it's not there already
        $self->{"opt_$def"} ||= $value;
      }
    } else {
      # Not special - put it back in comment_lines
      push @{$self->{comment_lines}}, $_;
    }
  }
}

# Update the widths hash to max(value in widths, value in this object)
sub update_widths
{
  my $self = shift;
  my $widths = shift;

  while ((my $key, $value) = each %$self) {
    if ($value) {
      $widths->{$key} = length($value) unless ($widths->{$key} || 0) > length($value);
    }
  }
}

# Instantiate code dynamically as we come across objects
sub create_accessor
{
  my $field = shift; # Must be lexical to create the closure
  my $slot = __PACKAGE__ . '::' . $field;
  
  # This doesn't work reliably, so we use (lexical) no warnings instead: return if defined(*$slot) && *$slot;
  # Don't tell me that I'm blatting an existing function: "no warnings 'redefine'" DOES NOT WORK on ActivePerl
  local $^W = 0;
  no strict "refs";         # So symbolic ref to typeglob works.
  *$slot = sub {
    my $self = shift;
    $self->{$field} = shift if @_;
    return $self->{$field};
  }
}

# Remove this module from a CvsModules::Index
sub prune ($$$) {
    my $self = shift;
    my $index = shift;
    my $action = shift;
    $index->prune($self, $action);
}

# Create an index entry and add myself to the given module index
sub addtoindex ($$$) {
    my $self = shift;
    my $moduleindex = shift;
    my $parent = shift;

    print STDERR "addtoindex adding $self->{path} to moduleindex $moduleindex->{name}\n" 
        if $Pace::CvsModules::debug;
    $moduleindex->add( 
        new Pace::CvsModules::IndexEntry($self, $parent, 'direct', $moduleindex->nextcount, 0));
}

# Returns a string that identifies the module uniquely, i.e. contains both the
# path and the opt_dir (if any). Modules with distinct id are not duplicates, those
# with identical id's are duplicates and must be resolved.
sub id ($) {
    my $self = shift;
    my $id = $self->{path};
    $id =  $self->{opt_dir}.'/'.$id if $self->{opt_dir};
    $id;
}

# Will return a boolean whether the two modules are duplicates, which currently
# means whether they agree in both path and opt_dir.
sub is_duplicate ($$) {
    return shift->id == shift->id;
}


sub difference ($$;$) {
# Returns a list of hashes, indexed by option name.
# The list has four elements: unchanged, added, removed, changed
# The values of the hashes are the value of the option except for changed,
# where it is a reference to a list of 2 values.
# First element of the list is a count of differences, i.e. ignores entries in [1]
# If the third argument is given and true, only report opt_* arguments
    my $first = shift;
    my $second = shift;
    my $optsonly = shift;
    my @result = (0,{},{},{},{});

	print STDERR "Differencing module $first->{path}\n" if $Pace::CvsModules::debug>2;
    my @keys = keys %$first;
    @keys = grep (m/^opt_/, @keys) if $optsonly;
    for my $field (@keys) {
		next if $field eq 'comment_lines' ; #Don't try and compare comment lines
		next if $field eq 'currentcollection'; #Ditto collections
        if (exists $second->{$field}) {
            my $val1 = $first->{$field};
            my $val2 = $second->{$field};
            if ($val1 eq $val2) {
                $result[1]->{$field} = $val1;
            } else {
                $result[4]->{$field} = [$val1, $val2];
                $result[0]++;
				print STDERR "Field $field changed\n" if $Pace::CvsModules::debug>3;

            }
        } else {
            $result[3]->{$field} = $val1;
            $result[0]++;
			print STDERR "Field $field removed\n" if $Pace::CvsModules::debug>3;
        }
    }
    for my $field (keys %$second) {
		next if $field eq 'comment_lines' || $field eq 'currentcollection';
        $result[2]->{$field} = $second->{$field}, $result[0]++ unless exists $first->{$field};
    }
    return \@result;
}

sub target_path ($) {
# Returns the effective directory once the product has been checked out with
# getstable: i.e. the opt_dir if that is specified, otherwise the path
	my $self = shift;
	return $self->{opt_dir} || $self->{path};
}

# Create the standard accessors at the start though
BEGIN {
  create_accessor($_) for (qw(path tag track repos trailing_comment comment_lines opt_track opt_repos));
}

####################################
# End of module - return success to loader
print STDERR "Pace::CvsModules::Entry.pm loaded\n" if $Pace::CvsModules::debug;
1;
