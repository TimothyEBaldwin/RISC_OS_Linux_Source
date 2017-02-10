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
#ifdef USE_UNIXLIB
int	Stacker_c_dummy;

#else

#include <stdio.h>

#include "Desk/BackTrace.h"
#include "Desk/Error.h"
#include "Desk/Debug.h"

#include "Trace/Stacker.h"

#include "StackDefs.h"


static Trace_Stacker_outputfn	global_outputfn		= NULL;
static void*			global_outputref	= NULL;


static int	Trace_Stacker_Printf( const char* format, ...)
	{
	va_list	va;
	int	n;
	va_start( va, format);
	n = (global_outputfn) ? global_outputfn( global_outputref, format, va) : vfprintf( stderr, format, va);
	va_end( va);
	return n;
	}

static int	Trace_Stacker_Printf2( void* reference, const char* format, ...)
	{
	va_list	va;
	int	n;
	va_start( va, format);
	n = (global_outputfn) ? global_outputfn( global_outputref, format, va) : vfprintf( stderr, format, va);
	va_end( va);
	return n;
	Desk_UNUSED( reference);
	}



#define Mask26Bits ((1u<<26)-1)
#define PCMask (Mask26Bits & ~3)




static int	UnWind( Stack_stackframe_block* frame)
	{
	if ( frame->frame.sp == (int) frame->top)	if ( Stack_GetPreviousStackFrame( frame) <= 0)	return 1;
	if ( Stack_GetPreviousStackFrame( frame) <= 0)	return 1;
	if ( frame->frame.sp == (int) frame->top)	if ( Stack_GetPreviousStackFrame( frame) <= 0)	return 1;
	if ( Stack_GetPreviousStackFrame( frame) <= 0)	return 1;
	if ( frame->frame.sp == (int) frame->top)	if ( Stack_GetPreviousStackFrame( frame) <= 0)	return 1;
	
	/*
	If sp points to first chr above stack frame, then this frame
	is the first of a new chunk created by stack extension code.
	In this case, there will be an extra frame inserted by the
	stack extension code, so we have to unwind one more time.
	 */
	
	return 0;
	}

static const char*	GetFnName( Stack_stackframe_block* frame)
	{
	int*	f = (int*) frame->frame.fp;
	int	ff = (*f) & PCMask;
	void*	fff = (void*) ff;
	//printf( Desk_error_PLACE "f=0x%p, ff=0x%p, fff=0x%p\n", f, (void*) ff, fff);
	if ( fff)	return Desk_BackTrace_GetFunctionName( fff);
	return NULL;
	}

void	Trace_Stacker_StartHandler( const char* fnname)
	{
	Stack_stackframe_block	frame;
	const char*		realfnname = NULL;
	char			array[ 4096];	// Force stack extension here. Otherwise stack ext can sometimes happen, and som,etimes not.
	if ( array[0]==0)	frame.frame.fp = 0;
	
	Trace_Stacker_Printf( "On entry to function '%s': ", fnname);
	Stack_GetCurrentStackFrame( &frame);
	
	/*
	if ( Stack_GetPreviousStackFrame( &frame) <= 0)	return;
	if ( Stack_GetPreviousStackFrame( &frame) <= 0)	return;
	
	if ( frame.frame.sp == (int) frame.top)
		{
		Desk_Debug_Printf( Desk_error_PLACE "unwinding extra\n");
		if ( Stack_GetPreviousStackFrame( &frame) <= 0)	return;
		}
	
	If sp points to first chr above stack frame, then this frame
	is the first of a new chunk created by stack extension code.
	In this case, there will be an extra frame inserted by the
	stack extension code, so we have to unwind one more time.
	 
	*/
	
	UnWind( &frame);
	
	/*
		{
		int*	f = (int*) frame.frame.fp;
		int	ff = (*f) & PCMask;
		void*	fff = (void*) ff;
		//printf( Desk_error_PLACE "f=0x%p, ff=0x%p, fff=0x%p\n", f, (void*) ff, fff);
		if ( fff)	realfnname = Desk_BackTrace_GetFunctionName( fff);
		}
	*/
	
	realfnname = GetFnName( &frame);
	
	Trace_Stacker_Printf( "stack frame is 0x%p-0x%p (%i bytes) from function '%s'\n", 
		frame.bottom, 
		frame.top, 
		frame.top-frame.bottom,
		(realfnname) ? realfnname : "--unknown--"
		);
	Desk_BackTrace_OutputToFFunctionWithPrefix( Trace_Stacker_Printf2, NULL, "    ");
	}

void	Trace_Stacker_Max_StartHandler( const char* fnname)
	{
	Stack_stackframe_block	frame;
	int			stackusage;
	const char*		realfnname = NULL;
	static int		global_maxusage = 0;
	char			array[ 4096];	// Force stack extension here. Otherwise stack ext can sometimes happen, and som,etimes not.
	if ( array[0]==0)	frame.frame.fp = 0;
	
	//Trace_Stacker_Printf( "On entry to function '%s': ", fnname);
	Stack_GetCurrentStackFrame( &frame);
	UnWind( &frame);
	
		{
		_kernel_stack_chunk*	chunk = frame.chunk._chunk;
		stackusage	= 0;
		for ( chunk=frame.chunk._chunk; chunk; chunk=chunk->sc_prev)
			stackusage += (int) chunk->sc_size;
		}
	
	if ( stackusage <= global_maxusage)	return;
	
	global_maxusage = stackusage;
	realfnname = GetFnName( &frame);
	
	Trace_Stacker_Printf( "New max stack usage '%i' bytes on entry to '%s' from function '%s'. Backtrace:\n", stackusage, fnname, realfnname);
	Desk_BackTrace_OutputToFFunctionWithPrefix( Trace_Stacker_Printf2, NULL, "    ");
	Trace_Stacker_Printf( "\n");
	
	Desk_UNUSED( fnname);
	}



void	Trace_Stacker_StopHandler( const char* fnname)
	{
	Desk_UNUSED( fnname);
	}

void	Trace_Stacker_Max_StopHandler( const char* fnname)
	{
	Desk_UNUSED( fnname);
	}



void	Trace_Stacker_SetOutputFunction( Trace_Stacker_outputfn fn, void* reference)
	{
	if ( fn)
		{
		global_outputfn		= fn;
		global_outputref	= reference;
		}
	}

#endif
