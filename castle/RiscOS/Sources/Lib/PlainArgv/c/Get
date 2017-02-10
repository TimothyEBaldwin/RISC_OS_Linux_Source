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
#include <string.h>
#include <stdio.h>

#include "PlainArgv.PlainArgv.h"


int	PlainArgv_GetFlag( int argc, char* argv[], char* flag)
{
int	a;
char	flag2[256];
sprintf( flag2, "-%s", flag);

for ( a=0; a<argc; a++)	{
	if (0==strcmp( argv[a], flag2))	return a;
	}
return -1;
}

Desk_bool	PlainArgv_GetBOOLParam( int argc, char* argv[], char* flag)
{
if ( PlainArgv_GetFlag( argc, argv, flag) == -1)	return Desk_bool_FALSE;
return Desk_bool_TRUE;
}

char*	PlainArgv_GetStringParam( int argc, char* argv[], char* flag, char* otherwise)
{
static char	empty[] = "";
int	a = PlainArgv_GetFlag( argc, argv, flag);

if (a==-1)	return otherwise;
a++;
if ( a>=argc)	return empty;
return argv[a];
}
