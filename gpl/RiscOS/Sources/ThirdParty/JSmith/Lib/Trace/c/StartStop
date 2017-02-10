/* 
 * Copyright Julian Smith.
 * 
 * This file is part of Trace.
 * 
 * Trace is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 * 
 * Trace is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Trace.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <stdio.h>

#include "Trace/Trace.h"


static int			tracedepth		= 0;
static FILE*			global_reference	= NULL;
static Trace_printffn		global_printffn		= NULL;
static Trace_nameprocessor	nameprocessor		= NULL;

static void	Trace__Indent()
	{
	int	i;
	if ( !global_printffn)
		{
		global_printffn		= fprintf;
		global_reference	= stderr;
                }
	global_printffn( global_reference, "Trace: %3i ", tracedepth);
	for ( i=0; i<tracedepth; i++)
		global_printffn( global_reference, " |");
	}


Trace_nameprocessor	Trace_SetNameProcessor( Trace_nameprocessor processfn)
{
	Trace_nameprocessor	old = nameprocessor;
	nameprocessor = processfn;
	return old;
}


void	Trace_SetPrintfFn( Trace_printffn fn, FILE* reference)
	{
	if ( fn)
		{
		global_printffn		= fn;
		global_reference	= reference;
		}
	}


static const char*	Transform( const char* name)
{
	static char	buffer[ 256];
	if ( nameprocessor)
	{
		if ( nameprocessor( name, buffer, 256))
			return name;	// Processor failed.
		return buffer;
	}
	else return name;
}


void	Trace_StartHandler( const char* name)
	{
	tracedepth++;
	Trace__Indent();
	global_printffn( global_reference, " %s\n", Transform( name));
	}

void	Trace_StopHandler( const char* name)
	{
	Trace__Indent();
	global_printffn( global_reference, "~%s\n", Transform( name));
	tracedepth--;
	}
