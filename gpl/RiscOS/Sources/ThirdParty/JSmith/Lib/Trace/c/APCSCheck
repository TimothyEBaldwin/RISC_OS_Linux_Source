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

#include "Desk/LinkList.h"
#include "Desk/DeskMem.h"
#include "Desk/Debug.h"
#include "Desk/Error.h"

#ifdef USE_UNIXLIB
	#include "unixlib/sigstate.h"
	extern void*	GetFP( void);
#else
	#include "Desk/BackTrace.h"
#endif
/* Can't use "Desk.BackTrace.h" when using unixlib - unixlib's kernel.h is incomplete.	*/

#include "Trace/Trace.h"

#include "Trace/APCSCheck.h"
#include "APCSDefs.h"



typedef struct	{
	Desk_linklist_header	header;
	const char*		fnname;
	swi_regs		r;
	}
	function_info;



static Desk_linklist_header	function_list	= { NULL, NULL};
static Desk_bool		auto_correct	= Desk_bool_FALSE;

static function_info*	Trace_FindFunctionInfo( const char* fnname)
	{
	function_info*	f;
	for ( f=Desk_LinkList_FirstItem( &function_list); f; f=Desk_LinkList_NextItem( &f->header))	{
		if ( f->fnname == fnname)	return f;
		}
	return NULL;
	}


static function_info*	Trace_MakeFunctionInfo( const char* fnname)
	{
	function_info*	f = (function_info*) Desk_DeskMem_RawMalloc( sizeof( function_info));
	if ( !f)	return NULL;
	f->fnname = fnname;
	Desk_LinkList_AddToHead( &function_list, &f->header);
	return f;
	}



static void	Trace_PrintRegs( swi_regs* r)
	{
	int	i;
	for ( i=0; i<16; i++)	fprintf( stderr, "0x%08x ", r->r[i]);
	fprintf( stderr, "\n");
	}


void	Trace_APCSCheck_Start2( const char* fnname, swi_regs* r)
	{
	function_info*	finfo = Trace_FindFunctionInfo( fnname);
	
	//fprintf( stderr, "Trace_APCSCheck_Start2, fnname='%s'\n", fnname);
	//Trace_PrintRegs( r);
	
	if ( !finfo)	{
		//fprintf( stderr, "Adding function_infor for function '%s'\n", fnname);
		finfo = Trace_MakeFunctionInfo( fnname);
		if ( !finfo)	{
			fprintf( stderr, "Couldn't create internal info for function '%s'\n", fnname);
			return;
			}
		}
	//if ( (int) fnname != r->r[0])	fprintf( stderr, "Trace_APCSCheck_Start2, r0 (0x%08x) !=fnname (%p)\n", r->r[0], fnname);
	//fprintf( stderr, "APCSCheck_Start2: finfo for function '%s' is at address 0x%p\n", fnname, finfo);
	finfo->r = *r;
	Desk_Debug_Printf( Desk_error_PLACE "Trace_APCSCheck_Start2: '%s' entered\n", fnname);
	}




void	Trace_APCSCheck_Stop2( const char* fnname, swi_regs* r)
	{
	function_info*	finfo = Trace_FindFunctionInfo( fnname);
	int		i;
	Desk_bool	corruption = Desk_bool_FALSE;
	
	//fprintf( stderr, "Trace_APCSCheck_Stop2, fnname='%s'\n", fnname);
	//Trace_PrintRegs( r);
	
	Desk_Debug_Printf( Desk_error_PLACE "Trace_APCSCheck_Stop2: '%s' exited\n", fnname);
	
	//fprintf( stderr, "Trace_APCSCheck_Stop2 checking function '%s'\n", fnname);
	
	if ( !finfo)	{
		fprintf( stderr, "Trace APCSCheck: Return from unrecognised function '%s'\n", fnname);
		return;
		}
	
	//fprintf( stderr, "APCSCheck_Stop2: finfo for function '%s' is at address 0x%p\n", fnname, finfo);
	
	// Compare returned registers in r with those on entry in finfo->r.
	for ( i=4; i<=13; i++)	{
		int	newvalue = r->r[i];
		int	oldvalue = finfo->r.r[i];
		
		if ( i==12)	continue;	// Allowed to corrupt ip.
		#ifdef USE_UNIXLIB
			if ( i==10)	continue;	// UnixLib's contiguous stack is allowed to have a changing sl.
		#endif
		
		if ( newvalue != oldvalue)	{
			corruption = Desk_bool_TRUE;
			if ( auto_correct)	{
				r->r[i] = oldvalue;
				fprintf( stderr, "Trace APCSCheck: Restored correct value. ");
				}
			fprintf( stderr, "Trace APCSCheck: Function '%s' has corrupted register %i. Value on entry was 0x%08x=%i, value on exit=0x%08x=%i\n",
				fnname, i,
				oldvalue, oldvalue,
				newvalue, newvalue
				);
			}
		}
	
	// Check flags are preserved.
	if ( (r->r[15] & 0xff000003) != (finfo->r.r[15] & 0xff000003))	{
		
		corruption = Desk_bool_TRUE;
		
		fprintf( stderr, "Trace APCSCheck: Function '%s' has corrupted the processor flags. On entry value was 0x%08x, value on exit is 0x%08x\n",
			fnname,
			finfo->r.r[15] & 0xff000003,
			r->r[15]  & 0xff000003
			);
		
		if ( auto_correct)	{
			fprintf( stderr, "Trace APCSCheck: Restoring correct flags\n");
			r->r[15] = finfo->r.r[15];
			}
		}
	
	if ( corruption)	{
		#ifdef USE_UNIXLIB
			__backtrace( GetFP());
		#else
			Desk_BackTrace_OutputToStreamWithPrefix( stderr, "Trace APCSCheck: ");
		#endif
		fprintf( stderr, "\n\n");
		}
	}


void	Trace_APCSCheck_Init( void)
	{
	Trace_SetHandlers( Trace_APCSCheck_Start, Trace_APCSCheck_Stop);
	}


void	Trace_APCSCheck_SetAutoCorrect( int yesno)
	{
	auto_correct = (yesno) ? Desk_bool_TRUE : Desk_bool_FALSE;
	}
