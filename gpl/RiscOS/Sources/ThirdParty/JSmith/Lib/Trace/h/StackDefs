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
#ifndef __Stack_h
#define __Stack_h

#ifndef __kernel_h
	#include "kernel.h"
#endif

#ifndef __desk_core
	#include "Desk/Core.h"
#endif


typedef enum	{
	Stack_stacktype_USR,
	Stack_stacktype_SVC,
	Stack_stacktype_MISC
	}
	Stack_stacktype;


typedef struct	{
	_kernel_stack_chunk*	_chunk;	/* Points to a valid _kernel_stack_chunk only with USR mode stack.	*/
	
	char*			bottom;	/* First usable word in chunk (ie just above 7 words reserved for Acorn	*/
	char*			top;	/* First word above chunk						*/
		
	Stack_stacktype	stacktype;
	}
	Stack_stackchunk_block;


void	Stack_GetPreviousStackChunk( Stack_stackchunk_block* stackchunk);
void	Stack_GetCurrentStackChunk2( Stack_stackchunk_block* stackchunk);

#define	Stack_GetCurrentStackChunk( /* Stack_stackchunk_block* */ stackchunk)	\
		do	{								\
			(stackchunk)->_chunk = _kernel_current_stack_chunk();		\
			Stack_GetCurrentStackChunk2( stackchunk);			\
			}								\
			while (0)

void	Stack_RegisterMiscStack( void* bottom, void* top);
void	Stack_UnRegisterMiscStack( void* bottom);



typedef struct	{
	_kernel_unwindblock		frame;
	char*				language;
	char*				bottom;	/* Either prevfp+4 or bottom of chunk	*/
	char*				top;	/* Either fp-12 or top of chunk	*/
	Stack_stackchunk_block	chunk;
	}
	Stack_stackframe_block;


void	Stack_GetCurrentStackFrame( Stack_stackframe_block* frame);
int	Stack_GetPreviousStackFrame( Stack_stackframe_block* frame);
/*
Returns value from _kernel_unwind().
 */


void*	Stack__GetCaller_FP( void);
#define	Stack__GetCaller_LR()	(((unsigned int*) Stack__GetCaller_FP())[-1])
#define	Stack__GetCaller_LR_ns()	(Stack__GetCaller_LR() &0x03fffffc)
#define	Stack__GetCaller()		((void*) (Stack__GetCaller_LR_ns()-4))

/*
The macro 'Stack__GetCaller()' returns a (void*) pointer to the
instruction which called the present function (provided this instruction
was in a function which set up a stack-frame).
_LR returns the link register.
_LR_ns strips status register flags.
Stack__GetCaller returns the instruction before that pointed to by
lr.
 */

#define	Stack__GetCallerFP()		((void*) (((unsigned int*) Stack__GetCaller_FP())[-3]))
/*
Return's caller's fp
 */











#endif
