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
#ifndef __PlainArgv_PlainArgv_h
#define __PlainArgv_PlainArgv_h


#ifndef __Desk_DeskMem_h
	#include "Desk.DeskMem.h"
#endif

void	PlainArgv_Copy( char *buffer, int n);
/*
Copies original argv[n] into buffer, withouth any 
substitution of system variables etc.

Uses _kernel_command_string()

Doesn't cope properly with quoted spaces etc.
*/


void	PlainArgv_GetCanonFilename( char* buffer, int size);
/*
Gets filename of RunImage, canonicalises and puts in 'buffer'.
'size' is size of buffer.
 */


int		PlainArgv_GetFlag( int argc, char* argv[], char* flag);
/* Returns argument number of specified flag, or -1	*/

Desk_bool	PlainArgv_GetBOOLParam( int argc, char* argv[], char* flag);

char*		PlainArgv_GetStringParam( int argc, char* argv[], char* flag, char* otherwise);


typedef struct	{
	char**	argv;
	int	argc;
	}
	PlainArgv_argsblock;

void	PlainArgv_GetArgs( PlainArgv_argsblock* args, char* string);
/*
Extracts arguments in 'string', and puts into args. 'string' is
corrupted (0's inserted etc).
 */


void	PlainArgv_CatArgsToBuffer( Desk_deskmem_buffer* buffer, int argc, char* argv[]);
/*
Makes string of args, and puts into buffer
 */


#endif
