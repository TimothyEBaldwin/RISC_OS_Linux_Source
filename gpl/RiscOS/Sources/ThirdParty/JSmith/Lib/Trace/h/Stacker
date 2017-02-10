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
#ifndef __Trace_Stacker
#define	__Trace_Stacker

#include <stdarg.h>

void	Trace_Stacker_StartHandler( const char* fnname);
/*
Describes the current stack frame. Note that this frame will have been
set up by the /caller/ of 'fnname'.

Output is sent to the function most recently passed to
Trace_Stacker_SetOutputFunction() (default is stderr).

Trace_Stacker_StartHandler() should not be called directly, but passed
to Trace_SetHandlers().
 */

void	Trace_Stacker_StopHandler( const char* fnname);
/*
Does nothing.
 */





void	Trace_Stacker_Max_StartHandler( const char* fnname);
/*
Outputs diagnostic and backtrace when total stack usage is a new
maximum.

Note that the backtrace will contain a few Trace_Stacker functions.

Also note that the stack usage is taken to be the total size of all
stack chunks used by the client program including the chunk headers etc.
Chunks used by the Trace library itself are ignored.
 */

void	Trace_Stacker_Max_StopHandler( const char* fnname);




typedef int	(*Trace_Stacker_outputfn)( void* reference, const char* format, va_list va);

void	Trace_Stacker_SetOutputFunction( Trace_Stacker_outputfn fn, void* reference);
/*
The default output is to stderr.
 */



#endif
