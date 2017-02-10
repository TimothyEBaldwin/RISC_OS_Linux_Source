/* 
 * Copyright Julian Smith.
 * 
 * This file is part of Wild.
 * 
 * Wild is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 * 
 * Wild is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Wild.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <string.h>

#include "Desk/Debug.h"
#include "Desk/Error.h"
#include "Desk/DeskMem.h"
#include "Desk/KernelSWIs.h"


#include "IsMultiple.h"



#ifdef __riscos

char*	PathIsMultiplePath( const char *path)
{
int	pathlen;
char*	colon;


Desk_Debug3_Printf( Desk_error_PLACE "path='%s'\n", path);

colon = strchr( path, ':');

if ( !colon)				return NULL;
if ( colon[1]==':' || colon[1]=='$')	return NULL;
if ( colon==path)			return NULL;

pathlen = colon-path;

	{
	char	*varvalue;
	/*int	varvaluelen;*/
	char	*varname	= Desk_DeskMem_Malloc( 1+pathlen + 5);
	
	strncpy( varname, path, pathlen);
	strcpy( &varname[ pathlen], "$Path");
	
	Desk_Debug3_Printf( "varname='%s'\n", varname);
	
	varvalue = Desk_OS_ReadVarVal_AutoAlloc( varname);
	Desk_DeskMem_Free( varname);
	
	if ( varvalue==NULL)	return NULL;	/* Doesn't exist	*/
	
	Desk_Debug3_Printf( "varvalue='%s'\n", varvalue);
	
	return varvalue;
	
	}


}


#endif
