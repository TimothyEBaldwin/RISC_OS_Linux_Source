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
int	Frames_c_dummy;

#else

#include "Desk/Debug.h"
#include "Desk/BackTrace.h"
#include "Desk/Error.h"

#include "StackDefs.h"



#define	Stack_PTR_INSIDE_CHUNK( ptr, /*Stack_stackchunk_block*/ chunk)	\
	(									\
	(char*) (ptr) >= (chunk)->bottom 					\
	&& 									\
	(char*) (ptr) < (chunk)->top						\
	)

static int	Stack__FillInFrameDetails( Stack_stackframe_block* frame, char* prevfp)
	{
	/* 
	Need to find sl ourselves - _kernel_unwind seems to leave it unchanged even when sp changes to a new chunk.
	We simply look for stack chunk containing sp, starting with the chunk given by the existing sl, and
	stepping backwards along the linked list of chunks.
	Note that this will only work when stackframes are being walked backwards.
	 */
	
	/*chunk = Stack__CHUNK_FROM_SL( frame->frame.sl);*/
	
		
	if ( frame->chunk.stacktype != Stack_stacktype_USR)	{
		/* single stack chunk, so if sp not in this chunk, we're in trouble...	*/
		
		Desk_Debug5_Printf( Desk_error_PLACE "Stack__FillInFrameDetails. SVC/misc stack\n");
		
		if ( (char*) frame->frame.sp < frame->chunk.bottom && (char*) frame->frame.sp >= frame->chunk.top)	{
			Desk_Debug5_Printf( Desk_error_PLACE "Invalid stack SVC/misc stack-frame - sp not in stack chunk\n");
			Desk_Debug_Printf( "*** Invalid stack SVC/misc stack-frame - sp 0x%p not in stack chunk 0x%p-0x%p\n", 
				(void*) frame->frame.sp,
				frame->chunk.bottom,
				frame->chunk.top
				);
			return 1;
			}
		
		if ( prevfp >= frame->chunk.bottom && prevfp < frame->chunk.top)	frame->bottom = prevfp+4;
		else									frame->bottom = frame->chunk.bottom;
		
		frame->top	= (char*) frame->frame.fp - 12;
		}
	
	
	else	{
		/* USR stack. We find previous chunks until sp is within the chunk.	*/
		/* 28 Oct 1996 Start with current chunk - may be problems with chunk mentioned in frame structure being out of date?*/
		
		Stack_GetCurrentStackChunk( &frame->chunk);
		
		for	(
			;
			(char*) frame->frame.sp <= frame->chunk.bottom || (char*) frame->frame.sp > frame->chunk.top;
				/* sp pointing to frame->chunk.top is considered /inside/ the chunk*/
				/* (sp points to the last used word of stack.*/
				/* Thus sp is referring to a different chunk if sp > chunk.top or < chunk.bottom.*/
				/* Sim so referes t different chunk if sp=chunk.bottom (though this would*/
				/* never happen...*/
			/*!Stack_PTR_INSIDE_CHUNK( frame->frame.sp, &frame->chunk);*/
			/*(char*) frame->frame.sp < frame->chunk.stack.bottom || (char*) frame->frame.sp > frame->chunk.stack.top;*/
			Stack_GetPreviousStackChunk( &frame->chunk)
			)
			{
			Desk_Debug5_Printf( Desk_error_PLACE "New chunk is 0x%p-0x%p (%i bytes)\n", 
				frame->chunk.bottom, 
				frame->chunk.top,
				frame->chunk.top - frame->chunk.bottom
				);
			if ( NULL == frame->chunk._chunk)	{
				Desk_Debug_Printf( "*** Couldn't find stack chunk for frame with sp=0x%p\n", (void*) frame->frame.sp);
				return 1;	/* Couldn't find stackchunk for 'frame'	*/
				}
			}
		
		
		if ( Stack_PTR_INSIDE_CHUNK( prevfp, &frame->chunk))	frame->bottom = prevfp+4;
		else							frame->bottom = frame->chunk.bottom;
		
		if ( Stack_PTR_INSIDE_CHUNK( frame->frame.fp, &frame->chunk))	frame->top = (char*) frame->frame.fp-12;
		else									frame->top = frame->chunk.top;
		}
	
	/*frame->frame.sl = (int) ((char*) chunk + 560);*/
	frame->frame.sl = (int) (frame->chunk.bottom + 512);
	
	
	Desk_Debug5_Printf( 
		Desk_error_PLACE "Stack__FillInFrameDetails. prevfp=0x%p fp=0x%p sl=0x%p sp=0x%p bottom=0x%p top=0x%p chunkbottom=0x%p chunktop=0x%p\n",	
		prevfp, (void*) frame->frame.fp, (void*) frame->frame.sl, (void*) frame->frame.sp, frame->bottom, frame->top,
		frame->chunk.bottom, frame->chunk.top
		);
	
	return 0;
	}



	
void	Stack_GetCurrentStackFrame( Stack_stackframe_block* frame)
	{
	Desk_BackTrace_SupportCurrentFrame( &frame->frame);
	Stack_GetCurrentStackChunk( &frame->chunk);
	Stack__FillInFrameDetails( frame, NULL);
	}



#define Mask26Bits ((1u<<26)-1)
#define PCMask (Mask26Bits & ~3)


int	Stack_GetPreviousStackFrame( Stack_stackframe_block* frame)
	{
	char*	prevfp	= (char*) frame->frame.fp;
	int	ret;
	
	Desk_Debug5_Printf( Desk_error_PLACE "Stack_GetPreviousStackFrame calling _kernel_unwind, frame.fp=0x%p sp=0x%p pc=0x%p sl=0x%p\n",
		(void*) frame->frame.fp,
		(void*) frame->frame.sp,
		(void*) frame->frame.pc,
		(void*) frame->frame.sl
		);
	
	ret = _kernel_unwind( &frame->frame, &frame->language);
	if ( ret == 0)	return ret;	/* ret < 0 - stack corrupt*/
					/* ret = 0 - end of stack*/
					/* ret > 0 - ok*/
	if ( ret < 0)	{
		Desk_Debug_Printf( "_kernel_unwind failed to unwind stack\n");
		return ret;
		}
	
	Desk_Debug5_Printf( Desk_error_PLACE "_kernel_unwind returned %i, frame.fp=0x%p sp=0x%p pc=0x%p sl=0x%p\n",
		ret,
		(void*) frame->frame.fp,
		(void*) frame->frame.sp,
		(void*) frame->frame.pc,
		(void*) frame->frame.sl
		);
	
		{
		/* _kernel_unwind doesn't always let you know when the SVC stack is finished*/
		/* we detect special cases as follows:*/
		unsigned int*	fp;
		unsigned int*	save_code_pointer;
		
		fp = (unsigned int*) (frame->frame.fp & PCMask);
		Desk_Debug5_Printf( Desk_error_PLACE "fp = 0x%p\n", fp);
		if ( fp==0)	return 0;
		save_code_pointer = (unsigned*) (*fp & PCMask);
		Desk_Debug5_Printf( Desk_error_PLACE "save code ptr = 0x%p\n", save_code_pointer);
		if ( save_code_pointer==NULL)	return 0;
		}
	
	if ( 0 != Stack__FillInFrameDetails( frame, prevfp))	return -1;
	return ret;
	}

#endif
