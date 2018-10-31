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
# CvsModules::Index.pm
#
# This file contains *three* packages: Index, IndexList and IndexEntry
#
# This are used to build a structure whereby subproducts can be merged in,
# taking account of duplicates
#
# An Index object is the full index for a modules file, with the possibly
# competing versions of each module from it and its contained subproducts. 
#
# It contains a hash by id (pathname & opt_dir) of IndexList objects
#
# The IndexList contains all the versions of a single module or subproduct,
# actually in the form of another hash indexed by action (i.e. treatment of
# duplicates: 'direct', 'no_duplicates', 'precedence_parent', 'precedence_child',
# or 'precedence_newest'). 
# The values in the hash are lists of IndexEntry objects - lists, because there
# could be multiple copies with the same action.
#
# The IndexEntry contains a pointer to a module (which will be in the direct_modules
# list of some CvsModules object), together with its parent, action, and two order
# values used for sorting.
#
# These packages are used for Pace CVS systems to process configuration
# management files ("modules files") such as those stored in the repository
# in Products/<product>/<variant>/modules.
#
#
#
# $Id: Index.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
###########################################################################

package Pace::CvsModules::Index;
require Exporter;
use Carp;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw(add replace entry nextcount sort_modules);
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################

package Pace::CvsModules::IndexEntry;
require Exporter;
use Carp;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw();
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################

package Pace::CvsModules::IndexList;
require Exporter;
use Carp;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Exporter);
@EXPORT    = qw();
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

####################################################
#
package Pace::CvsModules::IndexEntry;
#
# This is a single entry for a module in a CvsModules::IndexList
#
# It contains
# [0] - the module (or subproduct)
# [1] - the parent
# [2] - the action for the parent (or 'direct')
# [3] - the 'order' of the parent
# [4] - the 'suborder', or order within the parent
#

sub new ($@) {
	my $invocant = shift;
	my $class = ref($invocant) || $invocant;

	my $self = [@_];
	return bless $self, $class;
}

# Create a new entry to represent the module in the parent
# The action must be compatible, and the new order is given
sub promote ($$$$) {
	my $self = shift;
	my $newaction = shift;
	my $parentorder = shift;
	my $order = shift;

	if ($newaction eq 'direct') {
		croak "ERROR: Pace::CvsModules::IndexEntry::promote called for simple module";
	}
	unless ($self->[2] eq 'direct' || $self->[2] eq $newaction) {
		# any other combination is inconsistent, but OK if there are in fact no
		# duplicates, so set the resulting action to 'no_duplicates'
		$newaction = 'no_duplicates';
	}
	my $newentry = [$self->[0],
					$self->[1],
					$newaction,
					$parentorder,
					$order];
	return bless $newentry, ref($self);
}

sub module ($;$) {
	my $self = shift;
	$self->[0] = shift if @_;
	return $self->[0];
}

sub parent ($;$) {
	my $self = shift;
	$self->[1] = shift if @_;
	return $self->[1];
}
 
sub action ($) {
	return shift->[2];
}

sub order ($) {
	return shift->[3];
}

sub suborder ($) {
	return shift->[4];
}

sub path ($) {
	return shift->[0]->{path};
}

sub tag ($) {
	return shift->[0]->{tag};
}

sub dir ($) {
	return shift->[0]->{opt_dir};
}

sub id ($) {
	return shift->[0]->id;
}

sub issubproduct ($) {
	return (ref shift->[0] eq 'Pace::CvsModulesSubproduct');
}

# If the entry holds a subproduct, remove all its contents from the index
sub prune ($$) {
	my $self = shift;
	my $index = shift;

	if ($self->issubproduct) {
		$_->prune($index, $self->action) foreach (@{$self->[0]->{direct_modules}});
	}
}

#########################################
#
package Pace::CvsModules::IndexList;
#
# This contains CvsModuleIndexEntry objects corresponding
# to duplicate versions of the same module or subproduct
# It actually contains a hash of lists of them, indexed by the action
#
sub new ($$$;@) {
	my $invocant = shift;
	my $class = ref($invocant) || $invocant;

	my $self = {path=>shift, parentindex=>shift, count=>0, list=>{}};
	bless $self,$class;
	$self->add($_) foreach @_;
	return $self;
}

sub path ($) {
	return shift->{path};
}

sub count ($) {
	return shift->{count};
}

sub parentindex ($) {
	return shift->{parentindex};
}

sub issubproduct ($) {
	return shift->{issubproduct};
}

sub chosen ($) {
	return shift->{chosen};
}

# Add a CvsModules::IndexEntry
sub add ($$) {
	my $self = shift;
	my $newentry = shift;
	my $newpath = $newentry->path;

	croak "Adding module $newpath to wrong index $self->{path}" unless $newpath eq $self->{path};
	my $action = $newentry->action;
	push @{$self->{list}->{$action}}, $newentry;
	print STDERR "Adding module $newpath to action $action, " .
		scalar @{$self->{list}->{$action}} . " entries now\n" if $Pace::CvsModules::debug;
	$self->{issubproduct} = $newentry->issubproduct;
	$self->{count}++;
	return $self;
}

sub remove ($$) {
	my $self = shift;
	my $entry = shift;

	my $list = $self->{list}->{$entry->action};
	foreach (0 .. @$list) {
		$self->{count}--, return splice (@$list, $_, 1) if $list->[$_] == $entry;
	}
}

# Look at all the versions of the module, and decide which one
# to use (or error). Call 'prune' on all the rest, which will delete their
# contents if they are subproducts.
sub merge ($) {
	my $self = shift;

	if ($self->count > 1) {
		my $list = $self->{list};
		if (exists $list->{no_duplicates}) {
			croak "Duplicate module $self->{path} found in $self->{parentindex}->{name} but 'no_duplicates' was specified"; 
		} elsif (exists $list->{precedence_child}) {
			# A child entry can be combined with nothing but a direct
			if (@{$list->{precedence_child}} == 1 &&
			  		(exists $list->{direct} && @{$list->{direct}} == 1) &&
			  		(!exists $list->{precedence_parent} || @{$list->{precedence_parent}} != 1) &&
			  		(!exists $list->{precedence_newest} || @{$list->{precedence_newest}} != 1)) {
				# lose the parent
				$list->{direct}->[0]->prune($self->{parentindex});
				return $self->{chosen} = $list->{precedence_child}->[0];
			} else {
				croak "Module $self->{path} duplicated in $self->{parentindex}->{name} and cannot be resolved."
			}
		} elsif (exists $list->{direct}) {
			# Have a direct entry - can be combined with one or more parent entries,
			# or one or more newest,
			# or both parent and newest, provided it is the newest.

			# Can't have two direct - in same file
			croak "Module $self->{path} duplicated within $self->{parentindex}->{name}." if @{$self->{list}->{direct}} > 1;

			my $newest = $list->{direct}->[0];
			if (exists $list->{precedence_newest}) {
				foreach (@{$list->{precedence_newest}}) {
					if ($_->tag gt $newest->tag) {
						$newest->prune($self->{parentindex});
						$newest = $_;
					} else {
						$_->prune($self->{parentindex});
					}
				}				
			}
			if (exists $list->{precedence_parent}) {
				# Is 'newest' inconsistent with parent?
				croak "Module $self->{path} duplicated in $self->{parentindex}->{name} and cannot be resolved" 
					unless $newest == $list->{direct}->[0];	
				$_->prune($self->{parentindex}) foreach (@{$list->{precedence_parent}});
			}
			return $self->{chosen} = $newest;
		} elsif (exists $list->{precedence_parent}) {
			#Can't have a parent if there is no 'direct' to be the parent
			croak "Module $self->{path} duplicated in $self->{parentindex}->{name} and cannot be resolved" 
		} elsif (exists $list->{precedence_newest}) {
			# Must be >1 newest
			my @entries = @{$list->{precedence_newest}};
			my $newest = shift @entries;
			foreach (@entries) {
				if ($_->tag gt $newest->tag) {
					$newest->prune($self->{parentindex});
					$newest = $_;
				} else {
					$_->prune($self->{parentindex});
				}
			}
			return $self->{chosen} = $newest;
		} else {
			croak "ERROR: Unknown option(s) '".join(", ", keys %$list). "' found";
		}
	} elsif ($self->count == 1) {
		# There's a version chosen by default - find it
		for (values %{$self->{list}}) {
			return $self->{chosen} = $_->[0];
		}
	}
}

# Remove a module from the list
sub prune ($$$) {
	my $self = shift;
	my $module = shift;
	my $action = shift;
	
	my $list = $self->{list}->{$action};
	foreach (0 .. @$list) {
		$self->{count}--, return splice (@$list, $_, 1) if $list->[$_]->tag == $module->tag;
	}
}
		
# Copy all my contents to a higher level index
sub promote ($$$$) {
	my $self = shift;
	my $parentindex = shift;
	my $action = shift;
	my $order = shift;

	my @entries = sort {$a->order <=> $b->order || 
			$a->suborder <=> $b->suborder} map @$_, values %{$self->{list}};

	my $suborder = 0;
	$parentindex->add($_->promote($action,$order,$suborder++)) foreach (@entries);
}
########################################
#
# Holds all the duplicate versions of a module - i.e. the different instances
# found in the product and subproduct. 
# ix is a hash indexed by the module path and directory, containing an IndexList of
# all the instances of that module. 
#
# Note that a module is identified by both pathname and opt_dir (if any). If either
# of these is different, the modules are not considered duplicates. For this reason
# the concatenation of the path name and opt_dir is used as the hash key.
#
package Pace::CvsModules::Index;

sub new ($$) {
	my $invocant = shift;
	my $class = ref($invocant) || $invocant;
	my $name = shift;

	my $self = {counter => 0, name => $name, ix => {}};
	return bless $self, $class;
}

sub nextcount ($) {
	return shift->{counter}++;
}

# Add the given entry
sub add ($$) {
	my $self = shift;
	my $entry = shift;
	my $id = $entry->id;
	$self->{ix}->{$id} ||= new Pace::CvsModules::IndexList($entry->path, $self);
	$self->{ix}->{$id}->add($entry);
}

sub replace ($$$) {
	my $self = shift;
	my $id = shift;
	my $entry = shift;
	croak "Module $entry->{path} not found in $self->{name}" unless  $self->{ix}->{$id};
	$self->{ix}->{$id} = $entry;
}

sub entry ($$) {
	my ($self, $id) = @_;
	return $self->{ix}->{$id};
}

sub name ($) {
	return shift->{name};
}

sub merge ($$) {
	my $self = shift;
	my $subproductsonly = shift;


	foreach my $list (values %{$self->{ix}}) {
		$list->merge if !$subproductsonly || $list->issubproduct;
	}
}
# Delivers a list of all the module id's in the index
sub moduleids ($) {
	my $self = shift;
	my @ids = keys %{$self->{ix}};
	print STDERR $self->name."->moduleids returning ". scalar (@ids) . " items\n" if $Pace::CvsModules::debug;
	return @ids;
}

# Delivers a list of CvsModulesEntry references, sorted according to
# order and suborder
sub sort_modules {
	my $self = shift;
	print STDERR "Modules index $self->{name} has ".keys (%{$self->{ix}}) . " modules in it\n"
		if $Pace::CvsModules::debug;
	my @list = map $_->chosen->module, 
		sort {$a->chosen->order <=> $b->chosen->order || 
			$a->chosen->suborder <=> $b->chosen->suborder} 
							grep (!$_->{issubproduct} && exists $_->{chosen}, 
								values %{$self->{ix}});
	print STDERR "sort_modules returning a list of ". scalar(@list) . " entries\n" if $Pace::CvsModules::debug;
	return @list;
}

# Remove a module from the index
sub prune ($$) {
	my $self = shift;
	my $module = shift;
	my $list = $self->{ix}->{$module->id};

	$list->prune($module) if defined $list;
}

# Add all the modules into a higher-level moduleindex
sub promote ($$$) {
	my $self = shift;
	my $parentindex = shift;
	my $action = shift;

	# Iterate through my lists
	$_->promote($parentindex, $action, $self->{counter}) foreach (values %{$self->{ix}});
}


-1;
