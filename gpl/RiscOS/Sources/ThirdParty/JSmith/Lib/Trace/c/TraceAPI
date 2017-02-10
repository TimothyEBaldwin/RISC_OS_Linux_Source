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
#include "Desk/Debug.h"
#include "Desk/Error.h"

#include "Trace/Trace.h"

#include "IntTrace.h"


static Trace_fnstarthandler	global_starthandler	= Trace_StartHandler;
static Trace_fnstophandler	global_stophandler	= Trace_StopHandler;

int	Trace__verbose = 0;


void	Trace_SetVerboseLevel( int level)
	{
	Trace__verbose = level;
	fprintf( stderr, "Trace: verbose level set to %i\n", level);
	}

void	Trace_SetHandlers( Trace_fnstarthandler starthandler, Trace_fnstophandler stophandler)
	{
	global_starthandler	= starthandler;
	global_stophandler	= stophandler;
	}


void	Trace__StartHandler( const char* fnname)
	{
	Desk_Debug_Printf( Desk_error_PLACE "Trace__StartHandler( '%s')\n", fnname);
	if ( global_starthandler)	global_starthandler( fnname);
	}

void	Trace__StopHandler( const char* fnname)
	{
	Desk_Debug_Printf( Desk_error_PLACE "Trace__StoptHandler( '%s')\n", fnname);
	if ( global_stophandler)	global_stophandler( fnname);
	}
