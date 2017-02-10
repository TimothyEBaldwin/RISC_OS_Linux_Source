/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
#include "Desk.DeskMem.h"

#include "PlainArgv.StrTok.h"


typedef struct	{
	char*	base;
	char*	end;
	}
	strtok_block;

#define	end_FIRST ((char*) 1)


#define	RemoveThread								\
	{									\
	list_len--;								\
	list[ thread] = list[ list_len];					\
	list = Desk_DeskMem_Realloc( list, list_len*sizeof( strtok_block));	\
	}


char*	PlainArgv_StrTok( char* base)
	{
	static strtok_block*	list		= NULL;
	static int		list_len	= 0;
	
	int	thread;
	char*	next;
	
	if ( !base)	return NULL;
	
	for ( thread=0; thread<list_len; thread++)	{
		if ( list[ thread].base==base)	break;
		}
	
	if (thread==list_len)	{
		/*printf( "Creating new thread for base %p\n", base);
		*/
		thread = list_len;
		list_len++;
		list = Desk_DeskMem_Realloc( list, list_len*sizeof( strtok_block));
		list[ thread].base	= base;
		list[ thread].end	= end_FIRST;
		}
	
	
	if ( list[ thread].end == NULL)	{
		RemoveThread
		return NULL;
		}
	
	
	else if ( list[ thread].end == end_FIRST)	{
		next = list[ thread].base;
		}
	
	else	{
		*(list[ thread].end) = ' ';
		next = list[ thread].end + 1;
		}
	
	while ( *next && *next==' ')	next++;
	
	if ( *next==0)	{
		RemoveThread
		return NULL;
		}
	
	/* Find end of this token.	*/
		{
		char*	end = next;
		while ( *end && *end!=' ')	end++;
		if ( *end)	{
			list[ thread].end = end;
			*end = 0;
			}
		else	list[ thread].end = NULL;
		}
	
	return next;
	}
