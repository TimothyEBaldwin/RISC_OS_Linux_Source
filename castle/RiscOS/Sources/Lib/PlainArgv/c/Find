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
#include <ctype.h>
#include <string.h>

#include "Desk.Debug.h"
#include "Desk.DeskMem.h"
#include "Desk.Error.h"
#include "Desk.Error2.h"

#include "PlainArgv.PlainArgv.h"



void	PlainArgv_GetArgs( PlainArgv_argsblock* args, char* string)
	{
	char*	start;
	char*	end;
	int	i;
	
	args->argc = 0;
	args->argv = NULL;
	
	Desk_Debug_Printf( Desk_error_PLACE "Scanning '%s'\n", string);
	
	for ( start = string;;)	{
		
		while ( isspace( *start))	{
			*start = 0;
			start++;
			}
		
		Desk_Debug_Printf( Desk_error_PLACE "start = %i\n", start-string);
		
		if ( start[0]=='\"')	{
			*start = 0;
			start++;
			end = strchr( start, '\"');
			if (!end)	Desk_Error2_HandleText( "Couldn't find closing quote");
			}
		else	{
			end = start;
			while ( !isspace( *end) && *end)	end++;
			}
		
		if ( end==start)	break;
		
		args->argc++;
		if ( *end==0)	break;
		
		*end = 0;
		start = end+1;
		}
	
	args->argv = Desk_DeskMem_CallocType( args->argc, char*);
	start = string;
	
	for ( i=0; i<args->argc; i++)	{
		Desk_Debug_Printf( Desk_error_PLACE "start = %i\n", start-string);
		while ( *start==0)	start++;	/* We have added some extra 0s (eg to replace opening '"'	*/
		Desk_Debug_Printf( Desk_error_PLACE "start = %i\n", start-string);
		args->argv[i] = start;
		start += strlen( start)+1;
		Desk_Debug_Printf( Desk_error_PLACE "Argv[%i]='%s' (0x%p)\n", i, args->argv[i], args->argv[i]);
		}
	}
