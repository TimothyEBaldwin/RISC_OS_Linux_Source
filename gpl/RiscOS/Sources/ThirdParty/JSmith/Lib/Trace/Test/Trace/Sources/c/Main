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

#include "Desk.Debug.h"

#include "Trace.Trace.h"



static int	Factorial( int n)
	{
	return (n<=2) ? n : n*Factorial( n-1);
	}

static void	Bar( void)
	{
	printf( "Hello\n");
	}


static int	AddressTest( void)
	{
	char	dummy[ 199];
	dummy[0] = 0;
	dummy[1] = 6;
	dummy[56] = 43;
	dummy[122] = 33;
	return dummy[0];
	}

static void	Foo( void)
	{
	printf( "Hello\n");
	Bar();
	}


static void	FnStart( const char* fnname)
	{
	printf( "Function '%s' entered\n", fnname);
	}

static void	FnStop( const char* fnname)
	{
	printf( "Function '%s' exited\n", fnname);
	}

static void	Address( const void* address)
	{
	printf( "Address 0x%p executed\n", address);
	}

int	main( void)
	{
	Trace_IgnoreFunctions( "Desk_* Wild_* FnStart FnStop ");
	Trace_SetHandlers( FnStart, FnStop);
	Desk_Debug_SetNestingIndentation( "  ");
	Trace_IgnoreFunctions( "zxs Addre*");
	Trace_InterceptAllFunctions();
	Foo();
	Trace_InterceptAddress( (int*) AddressTest+4);
	
	Trace_SetAddressHandler( Address);
	printf( "AddressTest returned %i\n", AddressTest());
	
	printf( "10! = %i\n", Factorial( 10));
	
	printf( "Press <Esc> to terminate\n");
	for(;;)	;
	
	return 0;
	}
