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

#include "Wild/Wild.h"



void	Wild_ScanPath4( const char *pathsandexcludes0, wild_wildfn2 fn, void *reference)
	{
	char*	pathsandexcludes = (char*) pathsandexcludes0;
	char*	x = strstr( pathsandexcludes, " -x ");
	char*	excludes;
	
	Desk_Debug2_Printf( Desk_error_PLACE "Wild_ScanPath4( '%s'...)\n", pathsandexcludes0);
	
	if (!x)	excludes = "";
	
	else	{
		excludes = x+4;
		*x = 0;	/* terminate paths before excludes.	*/
		}
	
	Wild_ScanPath3( pathsandexcludes, excludes, fn, reference);
	
	if ( x)	*x = ' ';	/* Restore string	*/
	}
