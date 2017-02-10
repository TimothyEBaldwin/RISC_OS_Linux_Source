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
int	Chunks_c_dummy;

#else


#include "Desk/Debug.h"
#include "Desk/Error.h"

#include "StackDefs.h"


#define	Stack_SVCSTACK_BASE		((char*) 0x1c00000)
#define	Stack_SVCSTACK_SIZE		8192
#define	Stack_SVCSTACK_TOP		(Stack_SVCSTACK_BASE + Stack_SVCSTACK_SIZE)
#define	Stack_SVCSTACK_BOTTOM	(Stack_SVCSTACK_BASE + 7*sizeof(int))


#define	Stack_GetStackTopBottom( stackchunk)									\
	do	{												\
		(stackchunk)->bottom	= ((char*) ((stackchunk)->_chunk+1)) + 7*sizeof(int);			\
		(stackchunk)->top	= ((char*) (stackchunk)->_chunk) + (stackchunk)->_chunk->sc_size;	\
		}												\
	while (0)




typedef struct	{
	char*	top;
	char*	bottom;
	}
	Stack_stack_miscchunk;


static Stack_stack_miscchunk	Stack_Stack_miscchunk = { NULL, NULL	};



void	Stack_RegisterMiscStack( void* bottom, void* top)
	{
	Desk_Debug5_Printf( Desk_error_PLACE "Registering misc stack, 0x%p-0x%p\n", bottom, top);
	Stack_Stack_miscchunk.top	= top;
	Stack_Stack_miscchunk.bottom	= bottom;
	}

void	Stack_UnRegisterMiscStack( void* bottom)
	{
	if ( bottom != Stack_Stack_miscchunk.bottom)	{
		Desk_Debug_Printf( "Stack_UnRegisterMiscStack called for unknown stack at 0x%p\n", bottom);
		//Stack_DiagnosticWhere( Stack__GetCaller(), "Stack_UnRegisterMiscStack called for unknown stack");
		}
	else	{
		Stack_Stack_miscchunk.top	= NULL;
		Stack_Stack_miscchunk.bottom	= NULL;
		}
	}


void	Stack_GetCurrentStackChunk2( Stack_stackchunk_block* stackchunk)
	{
	
	/* stackchunk->_chunk	= _kernel_current_stack_chunk();*/
	/* Now done in Stack_GetCurrentStackChunk2 macro.*/
	
	if ( NULL == stackchunk->_chunk)	return;
	
	stackchunk->stacktype = Stack_stacktype_USR;
	
	if ( (char*) stackchunk->_chunk + sizeof( _kernel_stack_chunk) == Stack_SVCSTACK_BASE)	{
		/* SVC stack - not a valid _kernel_stack_chunk, so we hack it...	*/
		stackchunk->stacktype	= Stack_stacktype_SVC;
		stackchunk->bottom	= (char*) Stack_SVCSTACK_BASE + 7*sizeof(int);
		stackchunk->top		= (char*) Stack_SVCSTACK_BASE + Stack_SVCSTACK_SIZE;
		Desk_Debug5_Printf( "Checking SVC stack, from 0x%p to 0x%p\n", stackchunk->bottom, stackchunk->top);
		}
	
	else if (
		Stack_Stack_miscchunk.bottom 
		&&
		( (char*) stackchunk->_chunk + sizeof( _kernel_stack_chunk) >= Stack_Stack_miscchunk.bottom)
		&&
		( (char*) stackchunk->_chunk + sizeof( _kernel_stack_chunk) < Stack_Stack_miscchunk.top)
		)
		{
		stackchunk->stacktype	= Stack_stacktype_MISC;
		stackchunk->bottom	= (char*) Stack_Stack_miscchunk.bottom + 7*sizeof( int);
		stackchunk->top		= (char*) Stack_Stack_miscchunk.top;
		Desk_Debug5_Printf( "Checking misc stack, from 0x%p to 0x%p\n", stackchunk->bottom, stackchunk->top);
		}
	
	else	{
		Stack_GetStackTopBottom( stackchunk);
		}
	}




void	Stack_GetPreviousStackChunk( Stack_stackchunk_block* stackchunk)
	{
	Desk_Debug5_Printf( Desk_error_PLACE "Stack_GetPreviousStackChunk called\n");
	
	if ( stackchunk->stacktype == Stack_stacktype_SVC || stackchunk->stacktype == Stack_stacktype_MISC)	{
		Desk_Debug5_Printf( Desk_error_PLACE "SVC/MISC stack\n");
		stackchunk->_chunk = NULL;
		stackchunk->bottom	= NULL;
		stackchunk->top		= NULL;
		}
	else	{
		Desk_Debug5_Printf( Desk_error_PLACE "USR stack\n");
		stackchunk->_chunk = stackchunk->_chunk->sc_prev;
		if ( stackchunk->_chunk)	Stack_GetStackTopBottom( stackchunk);
		else				stackchunk->bottom = stackchunk->top = NULL;
		
		Desk_Debug5_Printf( Desk_error_PLACE "new chunk header is 0x%p. Chunk is 0x%p-0x%p\n", 
			stackchunk->_chunk, 
			stackchunk->bottom, 
			stackchunk->bottom
			);
		}
	}


#endif
