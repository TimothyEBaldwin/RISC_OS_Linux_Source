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
# CvsModules::Subproduct.pm
#
# This file contains package CvsModules::Subproduct
#
# This third inherits from both CvsModules and CvsModulesEntry, 
# and represents a modules file which is itself a component
#
# This package is used for Pace CVS systems to process configuration
# management files ("modules files") such as those stored in the repository
# in Products/<product>/<variant>/modules.
#
#
#
# $Id: Subproduct.pm,v 1.1 2008/06/09 20:35:27 rool Exp $
#
package Pace::CvsModules::Subproduct;
require Exporter;
use Carp;
use Pace::CvsClientop;
use Pace::Cvsrc;

use vars qw(@ISA @EXPORT @EXPORT_OK);

@ISA       = qw(Pace::CvsModules Pace::CvsModules::Entry);
@EXPORT    = qw(push_subproduct_callback 
				pop_subproduct_callback 
				subproduct_fail 
				subproduct_ignore 
				subproduct_expand
				subproduct_expand_in_passing 
				subproduct_expand_local
				subproduct_expand_checkout_or_local);
@EXPORT_OK = qw();
sub VERSION      { $_ = '$Revision: 1.1 $'; return $1 if (/\:\s+(\S+)/); }

###########################################################################

# Stack of callback functions
@_callback_functions = [\&subproduct_fail];

# args: the function reference, and an optional list of args
sub push_subproduct_callback {
    push @_callback_functions, [@_];
}

sub pop_subproduct_callback {
    pop @_callback_functions if @_callback_functions > 1;
}

###################################################################
# Standard functions to be used as callbacks
#
# Default - error on meeting a subproduct
#
sub subproduct_fail {
    my $subproduct = shift;
    croak("No method provided to expand subproduct $subproduct->{path}");
}
#
# Ignore - do not expand the subproduct, just leave it
#
sub subproduct_ignore {
}

#
# Expand local: expect to read the subproduct modules file from the local
# workspace
#
sub subproduct_expand_local {
    my $subproduct = shift;
    my $context = shift;
    my $workroot = shift || $ENV{WORKROOT} || "/home/working";
    my $path = $subproduct->{path};
    $context->checkloop($path) || croak "Subproduct $path is included recursively";

    my $filename = "$workroot/$path/modules";
    open (SUBPRODUCT, $filename) ||
        croak "Cannot open local subproduct file $filename";

    $subproduct->import_modules_list(<SUBPRODUCT>);
	$subproduct->propagateinclusiontree($context);
}

#
# Expand: check the subproduct modules file out normally and expand them
#
sub subproduct_expand {
    my $subproduct = shift;
    my $context = shift;
    my $path = $subproduct->{path};
    $context->checkloop($path) || croak "Subproduct $path is included recursively";
	clientop_checkout_object("-r $subproduct->{tag} $path/modules") ||
		croak "Failed to checkout out $path/modules";

    $subproduct->import_modules_file("$path/modules");
	$subproduct->propagateinclusiontree($context);
}

#
# Expand_in_passing: check the subproduct modules file out to a temp directory and expand them
#
sub subproduct_expand_in_passing {
    my $subproduct = shift;
    my $context = shift;
    my $path = $subproduct->{path};
    $context->checkloop($path) || croak "Subproduct $path is included recursively";
    my @lines = clientop_checkout_object_readonly ("-r $subproduct->{tag} $path/modules");
    croak "$path/modules, tag $subproduct->{tag} not found" unless @lines;
    $subproduct->import_modules_list(@lines);
	$subproduct->propagateinclusiontree($context);
}

#
# Expand_checkout_or_local: check the subproduct modules file out unless its
# tag is 'local', in which case use a local copy
#
sub subproduct_expand_checkout_or_local {
    my ($subproduct, $context) = @_;
    if ($subproduct->tag eq 'local') {
        subproduct_expand_local(@_);
    } else {
        subproduct_expand(@_);
    }
}

##########################################################################
# Internal functions

# Actual callback routine - calls the currently set function
#
sub callback {
    my $self = shift;
    my $context = shift;
    my @args = @{$_callback_functions[-1]};
    my $function = shift @args;

    &{$function} ($self, $context, @args);
}

# Remove this subproduct from a CvsModules::Index and recurse
sub prune ($$$) {
    my $self = shift;
    my $index = shift;
    my $action = shift;
    $_->prune($index, $action) for (@{$self->{direct_modules}});
    $index->prune($self, $action);
}

# Add myself and my contents to the given module index
sub addtoindex ($$$) {
    my $self = shift;
    my $moduleindex = shift;
    my $parent = shift;

    my $action = $self->{opt_subproduct};

    # First add myself
    Pace::CvsModules::Entry::addtoindex($self, $moduleindex, $parent);

    # Now add the contents of my moduleindex
    $self->{moduleindex}->promote($moduleindex, $action) if $self->{moduleindex};
}

# Copies the subproduct inclusion tree from the parent into this
# subproduct, and adds its own path. This is so that any subproducts
# included in this one can test for loops.
sub propagateinclusiontree ($$) {
	my $self = shift;
	my $parent = shift;

    $self->{inclusiontree} = {%{$parent->{inclusiontree}}};
    $self->{inclusiontree}->{$self->{path}} = 1;
}

####################################
# End of module - return success to loader
print STDERR "Pace::CvsModules::Subproduct.pm loaded, exporting: \n(".
	join(" ",@EXPORT) . ")\n" if $Pace::CvsModules::debug;
1;
