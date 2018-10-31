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
# CvsModules.pm
#
# This file contains packages: CvsModules
#
# This is the object type for representing an entire file
#
# This package is used for Pace CVS systems to process configuration
# management files ("modules files") such as those stored in the repository
# in Products/<product>/<variant>/modules.
#
#
#
# $Id: CvsModules.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsModules;
$debug = 0;
require Exporter;
use vars qw(@ISA @EXPORT @EXPORT_OK);
use Carp;
use Pace::CvsModules::Entry;
use Pace::CvsModules::Subproduct;
use Pace::CvsModules::Index;

@ISA       = qw(Exporter);
@EXPORT    = qw(modules_create compare_modules_files load_modules_file use_modules_list
                iterator);
@EXPORT_OK = qw(show_modules_file create_module_entry);
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################


# Other required package-globals

# Hold the current list of comment lines
@comment_lines = ();


# Parses a single line of entry into the specified collection
sub create_module_entry
{
  my $collection = shift;
  my ($option, %fields, $comment);
  $_ = shift;
  s/\015?\012$/\n/;
  chomp; # \r\n OK

  #'Using repository' (deprecated - use -repos option)
  $collection->{opt_repos} = $1, return if /using repository\s+(\S+)/i;

  # Split it, taking note of quotes
  my @parts;
  my $rest = $_;
  while ($rest =~ s/^([^#]*)  # any prefix not including #, or none = $1
                  ([\'\"]) # either type of quote
                  (.*?)    # any text or none, non-greedy = $3
                  \2       # the same quote
                  //x      # replace with nothing
                  ) {
    push @parts, split (' ',$1), $3; #DON'T split $3!
  }
  # Now see if there's a comment
  if ($rest =~ s/(\s*#.*)$//) {
    $comment = $1;
  }

  push (@comment_lines, $comment || ''), return unless (@parts || $rest);

  push @parts, split(' ',$rest);

  my ($dir, $tag, @fields) = @parts;

  return unless $tag;

  # Old methods for specifying track
  $fields{opt_track} = 'track' if $tag eq 'HEAD';
  $fields{opt_track} = shift @fields if @fields && ($fields[0] =~ /^track$/i);

  while (@fields > 0) {
    ($option = shift @fields) =~ s/^-/opt_/;
    $fields{$option} = shift @fields;
  }

    # Certain options should be propagated down from the parent, if they are defined there
    # and not defined locally
    for $option (qw(opt_repos opt_dir)) {
        $fields{$option} ||= $collection->{$option} if 
                    defined $collection->{$option} && $collection->{$option};
    }
  $fields{comment_lines} = [@comment_lines] if  @comment_lines;
  $fields{trailing_comment} = $comment if $comment;
  @comment_lines = ();

  my $module = new Pace::CvsModules::Entry:: 
    path     => $dir,
    tag      => $tag,
    %fields;

  add_module($collection, $module); 
}

#
# This routine parses a modules file and returns an object representing
# the file that can be passed to the other functions in this package.
#
# Args: file, repository
sub load_modules_file ($;$)
{
  if (open(MODULES, '<'.shift)) {
    my $collection = use_modules_list(shift || '', <MODULES>);
    close MODULES;
    return $collection;
  }

  return undef;
}

# Creates a structure from a list (e.g. that returned by a clientop read op)
# Args: repository, lines
sub use_modules_list ($@)
{
  my $collection = &modules_create(shift);
  $collection->import_modules_list (@_);
}

# To read into an existing object
# Args: object, list of lines
sub import_modules_list ($@)
{
  my $collection = shift;
  map { create_module_entry($collection, $_)} @_;
  $collection->{end_comment} = [@comment_lines] if @comment_lines;
  $collection->merge_all_modules;
  return $collection;
}

sub import_modules_file ($$){
    my $collection = shift;
    if (open(MODULES, '<'.shift)) {
        $collection->import_modules_list(<MODULES>);
        close MODULES;
    }
}

sub add_module {
    my ($collection, $module) = @_;
    print STDERR "Adding module $module->{path}, tag $module->{tag}\n" if $Pace::CvsModules::debug>2;
    if (defined $module->{opt_subproduct}) {
        # Convert it into a subproduct
#       print "$module->{path} is a subproduct\n" if $Pace::CvsModules::debug;
        $module->make_into_subproduct($collection);
        $module->callback($collection);
    }
    push @{ $collection->{direct_modules}}, $module;
}

# Displays the data structures
sub show_modules_file
{
  shift->iterator(sub { print "Directory $_->{path} on tag $_->{tag}",
    (defined($_->{track})?" (track is $_->{track})":''), "\n"; });
}

# This function takes a list of array references and adds a "shortname" field
# to each object containing its disambiguated name.
sub modules_create_disambiguated_names
{
  my %leaftab;

  # Populate the hash with all the paths, and set all the shortnames to the leaf directory name
  # As we're going, push all the duplicate leafname objects into a hash keyed on the leafname.
  map {
    $_->{shortname} = &leaf_dir($_->{path});
    push @{ $leaftab{$_->{shortname}} }, $_;
  } @$_ for (@_);

  # Look through the accumulated data looking for real clashes, not exact duplicates
  # (because we'll see the same component in both files being compared)
  for (keys %leaftab) {
    my ($obj, %uniqs) = ($leaftab{$_});
    next unless grep { $_->{path} ne (@$obj)[0]->{path} } (@$obj);
    map { $uniqs{$_->{path}} = 1; } @$obj;
    %uniqs = &createshortaliases(keys %uniqs);
    $_->{shortname} = $uniqs{$_->{path}} for (@{ $leaftab{$_} });
  }
}

# Compare two modules files - takes two references to modules lists
# Optional third parameter (if not empty) means include unchanged
# components in the log message.
sub compare_modules_files
{
  my ($first, $second, $options) = @_;
  my (@removed, @added, @changed, @unchanged, @moved, @optschanged, $i, @dirmatch);

  croak "No new modules file provided to Pace::CvsModules::compare_modules_files" 
	unless $second;

  if ($first) {
  # Find entries in old array not in new array - ie. removed entries.
  # Entries in both are obviously simply "changed" (potentially).
  # Note that entries that differ in opt_dir are separate in the moduleindex,
  # so will never be compared - if the opt_dir of a module is changed, this 
  # function will report that one has been removed and another added.

    for $i ($first->{moduleindex}->moduleids) {
        print STDERR "Checking module $i\n" if $debug > 2;
        if ($second->{moduleindex}->entry($i)) {
            print STDERR "Checking module $i in second file\n" if $debug > 2;
            my $firstmod = $first->{moduleindex}->entry($i)->chosen->module;
            my $secondmod = $second->{moduleindex}->entry($i)->chosen->module;
            my $difference = $firstmod->difference($secondmod, 0);
            if ($difference && $difference->[0]) {
                # $difference is a list of hashes
                if ($firstmod->{tag} eq $secondmod->{tag}) {
                    push @optschanged, [$i, $difference];
                    print STDERR "Found options changed for module $i\n" if $debug > 1;
                } else {
                    push @changed, [$i, $difference];
                    print STDERR "Found module $i changed\n" if $debug > 1;
                }
            } else {
                # same
                push @unchanged, $i;
                print STDERR "Found module $i unchanged\n" if $debug > 1;
            }
        } else {
            push @removed, $i;
            print STDERR "Found module $i removed\n" if $debug > 1;
        }
    }
    # Now catch added ones by a quick pass through $second
    @added = grep !defined($first->{moduleindex}->entry($_)), $second->{moduleindex}->moduleids;
  } else {
	# No $first provided - put everything in $second into the @added array
    @added = $second->{moduleindex}->moduleids;
  }
    # Now have four arrays
    # @removed holds those in $first and not in $second
    # @added holds those in $second and not in $first
    # @unchanged holds those in both, and with all properties the same
    # @changed holds those that have changed 


  # Now generate the default log message and return it to our caller.  Return an
  # empty log message if there were no changes!
  return '' unless (@added || @removed || @changed || @optschanged || (@unchanged && $options));

  my $message = '';

  if (@added) {
    $message .= &make_banner('new component', scalar(@added)) . "\n";
    for (@added) {
        my $module = $second->{moduleindex}->entry($_)->chosen->module;
        $message .= "  $module->{path} ($module->{tag})\n" . &list_options($module);
    }
  }

  if (@removed) {
    $message .= &make_banner('removed component', scalar(@removed)) . "\n";
    for (@removed) {
        my $module = $first->{moduleindex}->entry($_)->chosen->module;
        $message .= "  $module->{path} ($module->{tag})\n". &list_options($module);
    }
  }

  if (@changed || @optschanged) {
    &modules_create_disambiguated_names($first->{direct_modules}, $second->{direct_modules});
    }

  if (@changed) {
    $message .= &make_banner('changed component', scalar(@changed)) . "\n";
    for (@changed) {
      my ($id, $diff) = (@$_);
      my $module1 = $first->{moduleindex}->entry($id)->chosen->module;
      my $module2 = $second->{moduleindex}->entry($id)->chosen->module;
      $message .= "  $module1->{shortname} ($module1->{tag} -> $module2->{tag})";
      $message .= &check_regress($module1->{path}, map { $_->{tag} } ($module1, $module2));
      $message .= ' (options also changed)' if $diff->[0] > 1;
      $message .= &check_moved($module1->{opt_repos}, $module2->{opt_repos});
      $message .= "\n" ;
    }
  }

  if (@optschanged) {
    $message .= &make_banner('component', scalar(@optschanged)) . " with changed options\n";
    for (@optschanged) {
        my ($id, $diff) = (@$_);
        my $module = $first->{moduleindex}->entry($id)->chosen->module;
        $message .= "  $module->{path} ($module->{tag})\n" . &list_options($module, $diff) ;
    }
  }


  if ($options && @unchanged) {
    $message .= &make_banner('unchanged component', scalar(@unchanged)) . "\n";
    for (@unchanged) {
        my $module = $first->{moduleindex}->entry($_)->chosen->module;
        $message .= "  $module->{path} ($module->{tag})\n";
    }
  }

  return $message;
}

sub make_banner
{
  return "$_[1] $_[0]" . ($_[1] == 1 ? '' : 's');
}

sub check_options
# Differences is the number of differences, when the change in 
{
  my $differences = shift;
  return $differences->[0] ? ' (options also changed)' : '';
}

sub list_options
# First arg is module
# Second arg, if present, is a list of differences
{
    my $module = shift;
    my $differences = shift;
    my $list = '';

#   unless ($differences) {
#       #Make a basic differences with only the 'unchanged' entries
#       my %options = map ($_, $module->{$_}), grep /opt_/, keys %$module;
#       $differences = [scalar keys %options, \%options, {}, {}, {}];
#   }  


  if ($differences) {
      for my $i (0 .. 2) {
        my $listref = $differences->[$i+2];
        next unless %$listref;
        my $type = ('option', 'added option', 'removed option', 'changed option')[($differences) ? $i+1 : 0];
        $list .= '    ' . &make_banner($type, scalar(keys %$listref)) . "\n";
        for my $j (sort grep { m/^opt_/ } keys %$listref) {
          my $presentation = $j;
          $presentation =~ s/^opt_//;
          $list .= '      ' . $presentation;
          if ($i != 1) {
            $list .=  ' (';
            $list .= $i == 2 ? $listref->{$j}->[0]. ' -> ' .$listref->{$j}->[1] :
                                $listref->{$j};
            $list .= ')';
          }
          $list .= "\n";
        }
      }
    }
  return $list;
}

sub check_moved
{
  my $left = shift || '';
  my $right = shift || '';
  return ($left eq $right) ? '' : '  (CHANGED REPOSITORY)';
}

# Return the leafname of a path (cf. path_dir)
sub leaf_dir {
  my $dir = shift;
  $dir =~ s/.+\/([^\/]+)\Z/$1/;
  return $dir;
}

# Return the pathname of a path (cf. leaf_dir)
sub path_dir {
  my $dir = shift;
  $dir =~ s/(.+)\/[^\/]+\Z/$1/;
  return $dir;
}

# Split a full pathname into its separate components
sub splitpath {
  return split('/', shift);
}

#
# All this messing about with substr is to stop module names like
# c++cmd confusing # the perl regexp parser ... :-(
#
sub check_regress {
  my ($dir, $old, $new)=@_;
  my ($dirlen, $olddir, $newdir);

  $dir=&leaf_dir($dir);
  $dirlen = length($dir) + 1;

  return '' unless substr($old, 0, $dirlen) eq ($dir . '-');
  return '' unless substr($new, 0, $dirlen) eq ($dir . '-');

  $old = substr($old, $dirlen);
  $new = substr($new, $dirlen);

  return '' unless $old =~ /\d+[\d\_\-]+\Z/;
  return '' unless $new =~ /\d+[\d\_\-]+\Z/;

  $old =~ s/\-/\_/g;
  $new =~ s/\-/\_/g;

  return (&compare_rev($old, $new) > 0) ? '  (REGRESSED)' : '';
}

# Compare two revision numbers.  Returns -1, 0 or 1 in a strcmp-like
# manner meaning "earlier than", "the same as" and "later than",
# depending on the relative values of the revision numbers.
# Works with branches too, although it takes no account of the dates
# on the differing branches.

# Note that this is using _ as the revision level separator because
# we are processing srccommit tags

sub compare_rev {
  my ($a,$b)=@_;
  my @crev_a = split(/\_/,$a);
  my @crev_b = split(/\_/,$b);

  while (@crev_a > 0) {
    my $result = (shift @crev_a) <=> (shift @crev_b);
    return $result if $result;
  }

  return 0 <=> scalar(@crev_b);
};


# Create the alias lists for the various duplicated leafname components
sub createshortaliases {
  my (%leafalias, $result);
  my @components = @_;
  my $thisleaf = &leaf_dir($_[0]);
  my @dirs = map { &path_dir($_) } @components;
  # First, try the parent directory name - most times this will be sufficient
  if (!&uniqc(2, map { &leaf_dir($_) } @dirs)) {
    # Whee! This was sufficient
    print "Next-level directory was sufficient ..\n  " . join("\n  ", @components) . "\n" if $debug > 1;
    $leafalias{$_} = &leaf_dir(&path_dir($_)) . '/' . $thisleaf for (@components);
  }
  elsif (!&uniqc(2, map { (&splitpath($_))[0] } @components)) {
    print "First components are unique though!\n" if $debug > 1;
    for (@components) {
      $leafalias{$_} = $_;
      my @comps = &splitpath($_);
      if (@comps > 3) {
        my $first = shift @comps;
        $leafalias{$_} = join('/', ($first, '...', splice(@comps, -2)));
      }
    }
  }
  else {
    print "Oh dear - it wasn't - so we'll just use the full path here for now\n" if $debug > 1;
    $leafalias{$_} = $_ for (@components);
  }

  return %leafalias;
}

# Execute "| sort | uniq -c | awk '$1 >= (first argument)'" over a list
sub uniqc {
  my ($min, %result) = (shift);
  $result{$_}++ for (@_);
  for (keys %result) {
    delete $result{$_} unless ($result{$_} >= $min);
  }
  return %result;
};

# Accessor
#
# a modules file object has two accessable members:
# an array reference called 'modules'.
sub modules { return shift->{modules}; }
# and one called end_comment
sub end_comment { return shift->{end_comment}; }

# Create a new object representing a modules file, with objects to
# come from the (optional) named repository.
sub modules_create
{
  return bless { opt_repos => shift, callingtree => {} };
}

# Proper (inheritable) constructor
sub new
{
  my $proto = shift;
  my $class = ref($proto) || $proto;
  my $self  = { opt_repos => shift, callingtree => {} };
  bless ($self, $class);
  return $self;
}

# Calls the user's function for each entry in the specifed modules file - the
# full list if it has been expanded, else the direct list only. 
sub iterator
{
  my $collection = shift;
  my $routine = shift;
  my $list = @{$collection->{modules}} ? $collection->{modules} :
                $collection->{direct_modules};
  $routine->($_, @_) for (@{ $collection->{modules} });
}


# Displays the file (for debugging)
# argument (bool) says whether to display comments
sub show
{
  my $self = shift;
  $self->iterator(\&Pace::CvsModules::Entry::show, @_);
  print join("\n", @{$self->{end_comment}}) if $_[0] && @{$self->{end_comment}};
}

# Get the column widths for output
sub get_widths
{
  my %widths = ();
  shift->iterator(\&Pace::CvsModules::Entry::update_widths, \%widths);
  %widths;
}

# Merge any expanded subproducts.
sub merge_all_modules ($){
    my $self = shift;

    unless ($self->{moduleindex}) {
        $self->{moduleindex} = new Pace::CvsModules::Index($self->path);
        print STDERR "merge_all_modules called for ".$self->{moduleindex}->name."\n" if $Pace::CvsModules::debug;

        # This is in 3 steps
        # 1. Add each module from direct_modules into the index, which will include
        #   adding the contents of any subproducts.

        for my $module (@{$self->{direct_modules}}) {
            $module->addtoindex($self->{moduleindex}, $self);
        }

        # 2. Merge the subproducts in the index, (to eliminate any duplicated ones first)
        $self->{moduleindex}->merge(1); 
        # 3. Merge the rest of the index
        $self->{moduleindex}->merge(0);
        # 4. Sort the result into the modules list.
        $self->{modules} = [$self->{moduleindex}->sort_modules];
    #   print STDERR $moduleindex->name . " has " . scalar(@{$self->{modules}}) . " modules merged\n" if
    #       $Pace::CvsModules::debug;
    }
}

sub path ($) {
    my $self = shift;
    return $self->{path} || "Master module file";
}

# Function for use by callbacks that load a subproduct - 
# checks the subproduct tree to make sure the given
# subproduct is not already in the tree. Returns true or false accordingly
sub checkloop ($$) {
    my $self = shift;
    my $subpath = shift;

    return !exists $self->{inclusiontree}->{$subpath};
}


####################################
# End of module - return success to loader
print STDERR "Pace::CvsModules.pm loaded\n" if $debug;
1;

__END__

=head1 NAME

CvsModules.pm - interface to Pace configuration management

=head1 SYNOPSIS

=head2 Class Pace::CvsModules

=over

E<lt>file objectE<gt> B<load_modules_file>(filename, [optional initial repository])

E<lt>file objectE<gt> B<use_modules_list>(initial repository, list of lines ...)

E<lt>file objectE<gt> B<import_modules_file>(file object, filename)

E<lt>file objectE<gt> B<import_modules_list>(file object, list of lines)

E<lt>stringE<gt> B<compare_modules_files>(old file object, new file object)

B<iterator>(file object, sub ref, args for sub)

E<lt>stringE<gt> B<show>(file object, [include_comments])

E<lt>file objectE<gt> B<modules_create>([optional initial repository])

E<lt>hashE<gt> B<get_widths>(file object)

E<lt>module objectE<gt> B<create_module_entry>(file object, line of text)

=back

=head2 Class Pace::CvsModulesEntry

=over

E<lt>stringE<gt> B<show>(module object, [include comments])

B<parse_comments>(module object, field-definition hash reference)

E<lt>stringE<gt> B<output>(module object, [include comments], [widths hash])

E<lt>subproduct objectE<gt> B<make_into_subproduct>(module object, collection)

E<lt>stringE<gt> B<target_path>(module object)

=back

=head2 Class Pace::CvsModulesSubproduct

=over

B<push_subproduct_callback>(callback function)

B<pop_subproduct_callback>()

=head3 Callback functions provided

=over

B<subproduct_fail>

B<subproduct_ignore>

B<subproduct_expand>

B<subproduct_expand_local>

B<subproduct_expand_checkout_or_local>

=back

=back

=head1 OVERVIEW

This package is used to process I<modules> files, typically found in
the I<Products/>B<PID>I</>B<variant>I</modules> files in B<CVS>.  It
provides methods for loading files, processing each component in turn,
for generating lines to be written to a file,
and for comparing two modules file to determine the differences between
them.

Modules files can contain references to other modules files (subproducts), and 
there is an elaborate mechanism for determining which version to use when 
a component is duplicated between modules files.

There is a further module Pace::CvsModules::Index which is used privately by Pace::CvsModules
for expanding subproducts: its objects and methods are unlikely to be useful outside
this module.

=head2 DEFINITIONS

=over 4

=item B<component>, B<module>

A B<component> is a unit of code (or other files) the Pace CVS structure. It
consists of a directory in a CVS repository, which contains a B<VersionNum> file.
It will normally contain other files, and may contain subdirectories or even
a directory tree. It is administered in CVS by the I<srccommit> script.

A I<component> is also referred to as a B<module> - the two words are used
interchangeably.

In this Perl module, a I<component> is represented by an B<module object>, (formally
a B<Pace::CvsModulesEntry> object).

=item B<modules file>

A B<modules file> represents a product: it is a file specifying a list
of I<components> and possibly I<subproducts>. See 'File formats' below for its format.
It should always be within the B<Products> tree in a CVS repository.

A I<modules file> may be thought of as a Software BOM.

In this Perl module, a I<modules file> is represented by a B<file object>, (formally 
a B<Pace::CvsModules> object).

=item B<subproduct>

A B<subproduct> is a I<modules file> which is being used as a component of a product
(or another subproduct). It has the format of a I<modules file>, and should also
be within the B<Products> tree in a CVS repository.

In this Perl module, a I<subproduct> is represented by a B<subproduct object>, (formally 
a B<Pace::CvsModulesSubproduct> object), which is both a I<file object> and a 
I<module object>

=back

=head1 DETAILS

=over 4

=item B<load_modules_file>

Returns a file object representing the parsed modules file.
This can be used as the invocant or parameter to I<compare_modules_files>.

If the modules file contains subproducts, their treatment depends on the current I<callback> 
(see below).

=item B<use_modules_list>

Used when you already have a list of lines from a modules file in memory, for example
when using I<clientop_checkout_object_readonly>.

If the list contains subproducts, their treatment depends on the current I<callback> 
(see below).

=item B<import_modules_file>

Used when you already have the B<file object> to read the modules file into.

=item B<import_modules_lines>

Used when you already have both the B<file object> and the list of lines from a
modules file.

=item B<compare_modules_files>

Returns a single-string multi-line changelog detailing the
changes between the old object and the new object.  The
returned message is suitable for use as a cvs commit message.

If the objects contain subproducts, the treatment of these will
depend on whether the subproducts were expanded when the objects
were created, i.e. on the callbacks specified. If the subproducts were expanded
then the list of changes will be in terms of individual components,
wherever they come from in the subproduct tree; if not, then the changelog will
simply record changed revisions of the subproducts themselves.

If the first object is empty or undefined, simply treats the whole contents of 
the second as added. 

If the second object is empty or undefined, B<croak>s.


=item B<iterator>

This provides a method of calling a user-defined function for each
module in the modules file.  e.g.

  $file->iterator(sub { print shift->{path},"\n"; })

That example will print the pathnames of all the modules.  The
following example will invoke the user function I<myfunc> and pass it a
I<Pace::CvsModulesEntry> object followed by the string parameter
shown.  An arbitrary number of extra parameters may be supplied and
the iterator will pass them on:

  $file->iterator(&myfunc, 'a parameter for myfunc');

If the modules file contains subproducts which have been expanded (via a I<callback>), 
the iterator will be over all the modules, not including the subproducts themselves. If
for some reason there has not been any expansion, the iteration will be over the directly
referenced modules, including the (unexpanded) subproducts.

=item B<show>

This prints out the contents of the object. If I<include_comments> is true, all the
comments from the original file are displayed. See the COMMENTS section.

=item B<modules_create>

This creates an (empty) file object. It has an optional parameter, the
name of the initial repository for modules in the file.

=item B<get_widths>

This returns a hash giving the maximum length of values for each key. It is designed to
be passed to the I<output> method, eg

 $Widths = $file->get_widths;
 $file->iterator(\&Pace::CvsModules::output(1,\%Widths));

=item B<create_module_entry>

This creates a new I<module object> from a single line of a
modules file. It takes two arguments: the file object into which the new object
is to be placed, and a string containing the line to be parsed.

If the line specifies a subproduct, the new object created will be a I<subproduct
object>, and the currently active I<callback> will be called.

=back

=head1 OBJECT TYPES

=over 4

=item B<Pace::CvsModules>

This is a class for representing a complete moduloes file.  The methods are
detailed above.  In addition there are several data members, which calling programs
may examine, but should not change.

=over 4

=item B<modules>

This is the ordered collection of references to B<CvsModuleEntry>
objects. If the file contains subproducts and they have been expanded, this list will
contain all the modules anywhere in the product tree. Any unexpanded subproducts will 
themselves occur in the list.

=item B<opt_repos>

This is used during construction of the object as a memory of which
repository the processed components are coming out of. It will be empty
unless it has been set either when the object was created, or by a
I<Using repository> line. See the REPOSITORY section.

=item B<end_comment>

This is an array reference to any comment lines at the end of the input file. See
the COMMENTS section.

=item B<direct_modules>

This is the ordered list of modules directly listed in the file, including any
subproducts. 

=item B<moduleindex>

This is a Pace::CvsModules::Index object, which is used for resolving duplicate module
references within a tree of subproducts. It is unlikely to be useful outside the subproduct 
algorithm.

=item B<inclusiontree>

This is a hash of subproducts used to check for loops in the subproduct tree. It is unlikely
to be useful outside the subproduct algorithm.

=back

B<modules> and B<end_comment> have (read-only) accessor functions.


=item B<Pace::CvsModulesEntry>

This is the class which holds the details of each component.  It has
several core attributes that are guaranteed to exist for a component.
Each has an accessor/mutator method of the same name:

=over 4

=item B<path>

The location of the component in the repository.

=item B<tag>

The tag on which the component should be checked out.  Usually, this
will be a symbolic tag.  However, it MAY be a branch tag, but in that
case you are strongly advised to use the I<track> option to ensure you
are using the latest version of a component on the specified branch.

If the module object is a subproduct object, this will generally be the CVS revision for
the file, rather than a tag.

=item B<track>

This is a deprecated form of the option B<opt_track>. See OPTIONS below

=item B<repos> I<(deprecated)>

This is a deprecated form of the option B<opt_repos> See the REPOSITORY section.

=item B<comment_lines>

This is a possibly empty list of non-module lines (empty or comment) that
preceded the module in the original file.
They will be precisely as read in, but without end of line characters.

=item B<trailing_comment>

This is any comment which followed the module on the same line in the original
file. It will include any whitespace preceding the # or at the end of the line

=back

There are also methods for processing the data:

=over 4

=item B<parse_comments> 

This method parses all the comments in the object (not the B<trailing_comment>)
looking for keywords defined in the B<definition_hash>. If it finds one, it
adds the data from the comment line to the object as an B<opt_xxx> member, and
deletes that comment line. Any comment lines which do not match are preserved.
The B<definition_hash> is a reference to a hash of B<keywords> (which must
appear as distinct words on the comment line) and definitions.
Each definition may be a simple string, specifying the
name of the option to be used (without the 'opt_' prefix).
Alternatively it can be an array reference. Then the first element of the array
is a string to be used as a separator, and the remaining elements are a list of
option names (without the 'opt_' prefix). In this case the comment line after
the keyword is split by the separator, and each part is assigned to the corresponding
option.
For example:

 $module->parse_comments({'__OWNER__' => 'owner',
                COLLECTION => ['\s*#\s*', 'collection', 'collectioncomment']});

This arcane structure is required because of the way collections were formerly
specified.


=item B<output>

This returns a string containing the line, with all the options that happen
to be defined in the object (including I<-repos> if B<opt_repos> is defined).
If B<include_comments> is true, the comment_lines and trailing_comment will be
output exactly as they were read from the modules file, except that any lines
that have been parsed by B<parse_comments> are omitted.
if B<width hash> is supplied, fields named in that hash reference will be output
with at least the corresponding width.

If you are not concerned with sorting or grouping the contents of the file,
you can call this method through the iterator, eg:

 $file->iterator(sub {push @lines, shift->output($includecomments, \%widths)});

=item B<target_path>

This returns the effective path of the module once it has been checked out via
I<getstable> or I<checkout>. Specifically, this is the I<-dir> path if that is 
defined for the module, and otherwise the I<path>. 

=back

Additionally, an object may have other attributes defined indicating
options found in the I<modules> file as it was loaded.  See the OPTIONS
section for information on standard options.  For each option specified
in the modules file I<-myopt myval>, there will be an attribute
B<opt_myopt> with a value of B<myval>.  If you have warnings enabled,
you will need to check the existence of options with I<defined> before
using them (cf. the standard attributes which are guaranteed to exist).
If any object is ever created with an option I<opt>, then an accessor
for that function will come into existence too.  Thus extra functions
may be generated dynamically depending on the I<modules> file being
used.  Such functions are never destroyed.

=back

=head2 FILE FORMATS

The format of the I<modules> file is dictated by this module.  Any hash
character indicates a comment up to the next end-of-line (but some comment lines
may contain useful information: see the COMMENTS section).  Lines
containing only whitespace are ignored.

A line which begins with the
two keywords I<Using Repository> and followed by a repository
specification (fully-qualified or partially-qualified) is acceptable,
as is the keyword I<default>.

I<Using Repository> is now deprecated: see the section REPOSITORY.

Otherwise, a line consists of whitespace separated fields: path, tag,
optional tracking flag, options.  If the tracking flag is present, it
is the keyword I<track>, otherwise that field is missing.  The options
are pairs of words: optionname optionvalue.  optionname B<must> start
with a hyphen (-).  B<optionvalue> may not be empty, and must be
quoted (with single or double quotes) if it contains spaces or hashes.

If the option I<-subproduct> is given on the line, then the line 
specifies a subproduct: the I<optionvalue> specifies how to treat
duplicated modules.

=head2 SUBPRODUCTS

A subproduct is indicated in a modules file by the option B<-subproduct>. (It
will usually have a path beginning I<Products/>, and a numeric I<tag> as well).

The optionvalue for option I<-subproduct> must be one of B<no_duplicates>, 
B<precedence_parent>, B<precedence_child> and B<precedence_newest>. This specifies
how duplicated modules are to be treated - see under DUPLICATE MODULES below.

Whether, and how, subproducts are expanded is controlled by the selection of callback
functions: see CALLBACK below.

=head2 CALLBACK

When a modules file is being processed (by I<load_modules_file> or I<use_modules_list>),
if a I<subproduct> line is encountered, the current B<callback> function is called.

There are several standard callback functions available, or a calling program may write
its own.

The standard ones are:

=over 4

=item B<subproduct_fail>

This directs that the script should stop with an error message if a subproduct line is 
encountered. This is the default behaviour if no other callback has been installed.
(Note that modules files which do not contain subproducts will be processed without 
error, so any scripts which use I<Pace::CvsModules> but have not been converted to
use subproducts should work unchanged as long as they are not given modules files
with subproducts).

=item B<subproduct_ignore>

This directs that the script should not attempt to process the subproduct detected: it
will have been entered in the I<direct_modules> list, and will be copied over to the 
I<modules> list at the end of reading in the main modules file.

=item B<subproduct_expand>

This directs that the script will attempt to expand the subproduct, by checking the 
subproduct file out normally and processing it recursively. It will 
use the revision of the subproduct file as specified in the line in the parent file. 

At the end of reading in the main modules file, all expanded subproducts will have their
contents  
merged into the I<modules> list, taking into account their duplication options.

=item B<subproduct_expand_in_passing>

This is the same as I<subproduct_expand>, except that it checks the subproduct out to
a temporary directory, so that it will not be left in the sandbox after the
head product has been processed.

=item B<subproduct_expand_local>

This directs that the script will attempt to expand the subproduct from a local file, 
i.e. from a file $WORKROOT/<<filename>, where <<filename> is the name of the 
subproduct in the modules file. Otherwise its behaviour is the same as I<subproduct_expand>

=item B<subproduct_expand_checkout_or_local>

This is the same as I<subproduct_expand>, except that it recognises the special 
pseudo-tag 'local' in the modules file, and will interpret it as an instruction to
expand the subproduct from $WORKROOT rather than by checking a version out. 

This is intended for temporary use while a product with subproducts is being worked on,
so as not to have to check in new versions of the subproducts until the work is complete.
Scripts that call this library should not allow this option for modules files in the 
repository.

=back

=head3 Installing callbacks

There is a stack of callback functions, initialised to hold a reference to I<subproduct_fail>
(which cannot be removed).

To install a new callback, use 

=over

 push_subproduct_callback(\&callback_function, [args]);

=back

It is important to use the backslash and the ampersand (or create an anonymous subroutine 
by the B<sub> keyword). A list of arguments may be given, which will be appended to the
two arguments always passed (see below).

To remove the callback and revert to the previously current one, use 
B<pop_subproduct_callback>.

=head3 User-defined callbacks

The calling program may also define its own callback function. The function will be called
with at least two arguments:

=over 

=item B<subproduct>

The first argument is a B<Pace::CvsModulesSubproduct> object that has already been created
from the line in the parent file. 

=item B<parent>

The second argument is a B<Pace::CvsModules> object representing the parent file. (It might
in fact be a B<Pace::CvsModulesSubproduct> object itself, if the subproduct tree is 
deeper than one level.

=item Other arguments

There may be other arguments as specified in the B<push_subproduct_callback> call.

=back


=head2 REPOSITORY

Every module is located in a particular repository. Most modules files
specify all components from the same repository, but some products include
components from several repositories. There are several ways of specifying the
repository for a component, which apply in the order given:

=over 4

=item 1

Specify it directly on the component definition line by -repos I<repository>

=item 2

I<(Deprecated) >
Specify it in a I<Using repository> directive in the file. This applies to all
subsequent components in the file (unless they have an explicit -repos until
the next I<Using repository>.

=item 3

Specify it as an argument to B<load_modules_file> or B<use_modules_list>.

=item 4

Do not specify it at all, and leave it up to the application to determine what
repository to use. In this case the component will not have an B<opt_repos> (or
B<repos>) attribute, and B<Pace::CvsModulesEntry::output> will not write B<-repos>
on the line.

=back

There are three forms of specifying a repository: a short alias, a partially-qualified
cvsroot, and a canonical cvsroot. I<Pace::CvsRepository> will convert between the first
two, and I<Pace::CvsPass> can generate the canonical form from the partially-qualified
form.

Pace::CvsModules normally uses the partially-qualified form in its interface, but understands
the short alias, and indeed B<Pace::CvsModulesEntry::output> will write the short alias
to a modules file.

=head2 OPTIONS

The options available for a module are unlimited, but there are several
standard ones which should not be reused:

=over 4

=item B<track>

If non-zero, then this component is tracking the branch specified in
the B<tag> field. Note that this option can be set in three ways:

=over 4

=item *

Explicitly by a B<-track track> on the component line

=item *

By the obsolete syntax B<track> third on the component line

=item *

Implicitly if the I<tag> has the value B<HEAD> on the component line

=back

=item B<repos>

The repository from which this component comes.  The value may come from the
component line, or from a previous I<Using repository> line (deprecated).
Note that the value of
this attribute will often
be a partially-qualified cvsroot which requires canonicalisation (which
can be done by I<Pace::CvsPasswd> for you).

=item B<dir>

The directory into which this component should be checked out.  Ordinarily,
this would be defaulted to the same as the path of the component.

=item B<owner>

The user id of the person owning the component for the purposes of the
project.  This enables a build system to pester the right person when a
build fails due to a fault in a component.

=item B<collection>


A tag for a meta-collection of components.

=item B<subproduct>

Specifies that this component is a subproduct, and should be expanded (if 
a suitable callback has been given).

=back

=head2 COMMENTS

When parsing a modules file, blank lines and comments are saved in the objects
in the following places:

=over 4

=item *

Any blank or comment lines preceding a component are held in the B<comment_lines>
member of the module object. Note that any header-comment in the file will go into
the first component object.

=item *

Any trailing comment on the end of a component line is held in B<trailing_comment> in
the component object.

=item *

Any comment lines at the end of the file are held in the B<end_comment> member
of the file object.

=back

I<Using Dependency> lines are parsed and discarded: they are not saved in the
structure.

The B<show> and B<output> methods each have an optional boolean argument
B<include_comments>: if this is B<true>, the comments will be included in an
appropriate way; otherwise they will be discarded.
Certain modules files (in DTD and CCG projects) have used the comments to convey
information about the components they precede in the file. B<parse_comments> will
parse this information and add it to the module object, deleting the comment
lines that are parsed.

=head2 DUPLICATED MODULES

If subproducts are used, and the same module is found twice in the tree, various rules are
applied, depending partly on the options specified on the subproduct lines. 

Note that unless I<precedence_newest> is used, the tag is ignored: the fact that two
competing instances of a module happen to have the same tag will not save them if the
rules fail to designate one of them uniquely.

=over 

=item *

If a module only occurs once in a tree, that instance is used, irrespective of any
duplication options. If a module occurs more than once, the rules must together designate
a unique instance of it to be used, otherwise the operation fails.

It is actually the pair {path, opt_dir} which must be examined to determine if
a module is duplicated: two modules with the same path but different I<-dir> (or
one of them lacking I<-dir>) are not treated as duplicates.

=item *

Two instances of a module in the same file are always illegal (even if I<precedence_newest>
could apply).

=item *

If a subproduct is itself duplicated in the structure, these rules are applied to 
the subproduct to find the unique instance of it to be used (if the rules define such),
and then it is expanded. All subproducts are resolved in this way before other modules
are considered.

=item *

If any I<no_duplicates> applies to a duplicated module, the operation fails.

=item *

If there are subproducts of subproducts, the rules are applied within the subproduct first, 
and only if duplications can be resolved there are they propagated to the higher level.

=item *

Specifically, any number of I<precedence_parent> options may co-occur, provided that any 
module which is duplicated has a copy in the parent; then all the copies in subproducts
are ignored. But if this option occurred in two subproducts and not in the main product, it
would fail.

More than one I<precedence_child> options cannot apply to a module in several subproducts,
as they would fail to designate a unique instance.

Any number of I<precedence_newest> options can apply, over different levels. In this case 
only, if more than one instance has the same highest tag, that tag is used.

It is possible to combine I<precedence_newest> and I<precedence_parent> options, provided
they do in fact identify the same unique instance in the tree. Any other combination cannot
identify a unique instance and will fail.

=back

=head1 DEPENDENCIES

This package uses Pace::CvsRepository to read and write short repository names,
Pace::CvsClientop to read in modules files, and Pace::CvsModules::Index to 
determine which instance of duplicated modules to use.


=head1 REVISION CONTROL

stewart.brodie@pace.co.uk

    $Author: rool $
    $Date: 2008/06/09 20:35:27 $
    $Revision: 1.1 $

=cut
