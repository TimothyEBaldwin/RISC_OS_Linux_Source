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

#include "Trace.Trace.h"
#include "Trace.Stacker.h"



static void	Bar( void)
	{
	int	array[ 1000];
	printf( "Bar: array = '%p'\n", array);
	}

static void	Foo( void)
	{
	int	array[ 3000];
	printf( "Foo: array = '%p'\n", array);
	Bar();
	}


int	main( void)
	{
	//Trace_IgnoreFunctions( "Desk_*");
	Trace_SetHandlers( Trace_Stacker_StartHandler, Trace_Stacker_StopHandler);
	Trace_InterceptAllFunctions();
	printf( "Hello world\n");
	Foo();
	Trace_SetHandlers( Trace_Stacker_Max_StartHandler, Trace_Stacker_Max_StopHandler);
	Foo();
	return 0;
	}
