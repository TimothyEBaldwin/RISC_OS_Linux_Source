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
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#include "Desk/Filing.h"
#include "Desk/Debug.h"
#include "Desk/Error2.h"
#include "Desk/DeskMem.h"
#include "Desk/SWI.h"
#include "Desk/KernelSWIs.h"

#include "Wild/Wild.h"

#include "IsMultiple.h"



typedef struct	{
	wild_wildfn2	fn;
	void		*reference;
	char		oldprefix[ 256];	/* Will contain 'Run:' or 'System:'	*/
	int		newprefixlen;
	}
	wild_keepblock;
/*
This struct holds info on the original multiple-path filepath, so that
our wild_wildfn can intercept calls from Wild_ScanPath and replace the
canonicalised path with a path containing the original multiple-path
prefix.

Eg if <Run$Path> was "ADFS::4.Lib1,ADFS::4.Lib2", Wild_ScanPath2(
"Run:a*", fn, ...) would call 'fn' with a string such as
"ADFS::4.$.Lib1.abc" and "ADFS::4.$.Lib2.ayz" but, if Wild_ScanPath3 is
used, fn would be called with "Run:abc" and "Run:ayz".
 */




static	void	PrefixReplacementFn( const char* path, void *reference)
{
wild_keepblock*	keep = (wild_keepblock*) reference;
char		replacementpath[ 256] = "";

strcat( replacementpath, keep->oldprefix);
strcat( replacementpath, &path[ keep->newprefixlen]);

keep->fn( path, replacementpath, keep->reference);
}




static void	Wild__ScanPath2( 
		const char*	string,
		wild_keepblock*	keep
		)
{
/* Check for path-variables	*/
char	*paths = PathIsMultiplePath( string);

if ( !paths)	Wild_ScanPath( string, PrefixReplacementFn, keep);

else	{
	
	char	newpath[ 256];
	char	*path;
	char	*tail = strchr( string, ':') + 1;
	
	Desk_Debug_Printf( "WildLib: Found sys path var in '%s'\n", string);
	Desk_Debug_Assert( tail!=(char *)1);
	
	if ( keep->oldprefix[0] == 0)	{
		/* This will happen on top-level call to this function	*/
		strncat( keep->oldprefix, string, tail-string);
		}
		
	for( path=paths; *path ; )	{
	
		int	len;
		
		/* Find first non-space chr	*/
		for ( ; isspace( *path) && *path; path++)	;
		
		if (*path==0)	break;
		
		/* Find end of sub-path	*/
		for ( len=0; !isspace(path[len]) && path[len]!=',' && path[len]; len++)	;
		
		strncpy( newpath, path, len);
		strcpy( newpath+len, tail);
		
		Desk_Debug_Printf( "WildLib: " Desk_error_PLACE "Calling ScanWildPath for '%s'\n", newpath);
		
		keep->newprefixlen	= len;
		Wild__ScanPath2( newpath, keep);
		
					
		if (path[len]==0)	break;
		path += len+1;
				
		}
	
	Desk_DeskMem_Free( paths);
	}

}




void	Wild_ScanPath2(  const char *path, wild_wildfn2 fn, void *reference)
{
wild_keepblock	keep;

keep.fn			= fn;
keep.reference		= reference;
keep.oldprefix[0]	= 0;
keep.newprefixlen	= 0;

Wild__ScanPath2(  path, &keep);
}



