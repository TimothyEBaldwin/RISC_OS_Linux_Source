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
#ifndef __Trace_h
#define __Trace_h

#ifdef __cplusplus
extern "C"	{
#endif


#include <stdio.h>


typedef void	(*Trace_fnstarthandler)	( const char* fnname);
typedef void	(*Trace_fnstophandler)	( const char* fnname);
typedef void	(*Trace_addresshandler)	( const void* address);
typedef	void	(*Trace__genericfn)	( void);
typedef	int	(*Trace_printffn)	( FILE* reference, const char* fmt, ...);


void	Trace_StartHandler( const char* fnname);
/*
Default handler of function start. Outputs indented function name to
stderr.

Also see Trace_StopHandler_Verbose.
 */

void	Trace_StopHandler( const char* fnname);
/*
Default handler of function stop. Outputs indented function name to
stderr.

Also see Trace_StopHandler_Verbose.
 */


typedef int (*Trace_nameprocessor)( const char *instring, char *outstring, int maxlen);
/*
Pointer to a function which converts function names. The function should
return non-zero if an error occurred, or make 'outstring' contain the new
name. 'outstring' is assumned to be a buffer of at least 'maxlen' characters.
 */


#ifdef Trace_TRACE

	void	Trace_SetHandlers( Trace_fnstarthandler starthandler, Trace_fnstophandler stophandler);
	/*
	Sets the user-supplied functions which will be called before and after
	each intercepted function.

	Note that any functions already intercepted will now call the
	new handlers - the handler to call isn't stored with each
	wrapper code.

	Initially, the handlers are Trace_StartHandler and
	Trace_StopHandler.
	 */

	void	Trace_SetPrintfFn( Trace_printffn fn, FILE* reference);
	/*
	Makes Trace_StartHandler and Trace_StopHandler call 'fn' instead of
	the default fprintf( stderr, ...).
	 */

	Trace_nameprocessor	Trace_SetNameProcessor( Trace_nameprocessor processfn);
	/*
	Sets the name processor to be used by Trace_StartHandler and
	Trace_StopHandler. Returns the old name processor (initially NULL).
	 */

	int	Trace_InterceptAllFunctions( void);
	/*
	Seaches for embedded function names in the executable and inserts
	veneers around each function which call the Trace library before and
	after each function.
	 */


	int	Trace_IgnoreFunctions( char* names);
	/*
	Makes future calls to Trace_InterceptAllFunctions ignore all functions
	which match any space-separated wild-carded specification within the
	string pointed to by 'names'.

	'#' matches any character, '*' matches any number of characters.
	Take care not to leave a space at the end of 'names' - this will
	be interpreted as '*'.

	Note that a copy is /not/ made of the string pointed to by 'names', so
	this string should be permanent.

	Returns 0 if ok, 1 if failed (eg out of memory).
	 */

	#define	Trace_InterceptFunction( fnname)	\
			Trace__InterceptFunction( (Trace__genericfn) fnname, #fnname)
	/*
	Call this to intercept an individual function. Useful for functions
	which don't use any stack - cc doesn't bother to embed the function name
	in code for such functions so Trace_InterceptAllFunctions() doesn't find
	them.

	Note that 'fnname' is intercepted even if it matches any spec passed
	previously to Trace_IgnoreFunctions.

	Returns 0 if fnname was succesfully found and modified for profiling.
	Non-zero indicates an error.
	 */

	int	Trace__InterceptFunction( Trace__genericfn fn, const char* fnname);
	/*
	For internal use only.
	 */


	void	Trace_SetAddressHandler( Trace_addresshandler handler);
	/*
	Sets the function to be called when intercepted addresses are
	executed.
	See Trace_InterceptAddress().
	 */

	int	Trace_InterceptAddress( void* address);
	/*
	Calls the handler past to Trace_SetAddressHandler whenever the
	specified address is executed.
	 */

	void	Trace_SetVerboseLevel( int level);

	void	Trace_SetUseRMA( int yes);
	/*
	If yes is non-0, Trace will use OS_Module to allocate memory
	for its wrapper code instead of malloc(). This is for when
	malloc() allocates memory from a dynamic area (code won't run in
	a dynamic area because RISC OS uses the ARM in 26 bit mode).
	 */

#else
	#define	Trace_SetHandlers( starthandler, stophandler)
	#define	Trace_InterceptAllFunctions()		0
	#define	Trace_IgnoreFunctions( names)		0
	#define	Trace_InterceptFunction( fnname)	0
	#define	Trace__InterceptFunction( fn, fnname)	0
	#define	Trace_SetAddressHandler( handler)
	#define	Trace_InterceptAddress( address)	0
	#define	Trace_SetVerboseLevel( level)
	#define	Trace_SetUseRMA( yes)
	#define	Trace_SetPrintfFn( fn, reference)
	#define	Trace_SetNameProcessor( processfn)	((Trace_nameprocessor) 0)

#endif


#ifdef __cplusplus
}
#endif

#endif
