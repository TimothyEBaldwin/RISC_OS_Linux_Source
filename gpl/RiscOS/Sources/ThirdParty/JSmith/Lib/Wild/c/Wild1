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
#include <stdio.h>
#include <ctype.h>

#include "Desk/File.h"
#include "Desk/Filing.h"
#include "Desk/Debug.h"
#include "Desk/Error2.h"
#include "Desk/Str.h"
#include "Desk/DeskMem.h"
#include "Wild/Wild.h"


#define MAXNAME 256


Desk_bool	wild__casesensitive = Desk_bool_FALSE;




wild_match	Wild_StringMatches( const char *s, const char *wild)
{
if ( *wild==0)	return wild_match_YES;

for(;;)	{
	if ( *wild=='#')	{
		wild++;
		s++;
		}
	
	else if ( *wild=='*')	{
		const char	*ss = s;
		
		for(;;)	{
			wild_match	m = Wild_StringMatches( ss, wild+1);
			if ( m==wild_match_YES)	return m;
			ss++;
			if ( *ss==0)	return wild_match_NO;
			}
		}
	
	else	{
		if ( wild__casesensitive && *wild!=*s)
			return wild_match_NO;
		
		if ( !wild__casesensitive && toupper(*wild)!=toupper(*s))
			return wild_match_NO;
		
		wild++;
		s++;
		}
	
	
	if ( *s==0)	{
		if	(
			wild[0]==0
			||
			( wild[0]=='*' && wild[1]==0)
			)
			return wild_match_YES;
		
		else return wild_match_NO;
		}
	
	if ( *wild==0)	return wild_match_NO;
	}
}		
		



static wild_match	CleanReturn( wild_match match, char *wildend, char *pathend)
{
Desk_Debug3_Printf( Desk_error_PLACE "CleanReturn %i\n", match);
if ( wildend)	*wildend = '.';
if ( pathend)	*pathend = '.';
/*Debug_Printf( error_PLACE "%i\n", match);*/
return match;
}


static wild_match	Wild_PathMatches0( const char *path, const char *wild)
{
char*	pathend;
char*	wildend;

Desk_Debug2_Printf( Desk_error_PLACE "Wild_PathMatches0 called. path='%s', wild='%s'\n", path, wild);

for(;;)	{
	wildend = strchr( wild+1, '.');
	pathend = strchr( path+1, '.');
	
	if ( wildend)	*wildend = 0;
	if ( pathend)	*pathend = 0;
	
	Desk_Debug2_Printf( Desk_error_PLACE "path='%s', wild='%s'\n", path, wild);
	
	if ( wild[0]=='.')	{
		const char*	newpath = path;
		const char*	newwild = wild+2;
		
		if ( pathend)	*pathend = '.';
		if ( wildend)	*wildend = '.';
		
		for(;;)	{
			wild_match	m = Wild_PathMatches( newpath, newwild);
			
			if ( m==wild_match_YES)
				return CleanReturn( m, wildend, pathend);
			
			
			newpath = strchr( newpath, '.');
			
			if ( !newpath)
				return CleanReturn( wild_match_SUB, wildend, pathend);
			
			newpath += 1;
			}
		}
	
	else	{
		if ( Wild_StringMatches( path, wild) == wild_match_NO)
			return CleanReturn( wild_match_NO, wildend, pathend);
					
		}
	
	if ( !pathend)	{
		
		if ( !wildend)
			return CleanReturn( wild_match_YES, wildend, pathend);
	
		else if ( wildend[1]=='.' &&  wildend[2]==0)
			return CleanReturn( wild_match_YES, wildend, pathend);
		
		else	return CleanReturn( wild_match_SUB, wildend, pathend);
		}
	
	if ( !wildend)
		return CleanReturn( wild_match_NO, wildend, pathend);
	
	*wildend = '.';
	*pathend = '.';
	path = pathend + 1;
	wild = wildend + 1;
	}	
}


wild_match	Wild_PathMatches( const char *path, const char *wild)
{
wild_match	m = Wild_PathMatches0( path, wild);
Desk_Debug2_Printf( Desk_error_PLACE "WildLib: Wild_PathMatches %i, %s %s\n", m, path, wild);
return m;
}





typedef struct	{
	const char	*wildpath;
	wild_wildfn	fn;
	void		*reference;
	Desk_bool	remove_csd;
	}
	wild_block;


static char*	ActualPath( char* path, wild_block* wild)
	{
	return (wild->remove_csd) ? path+2 : path;
	}



static Desk_os_error	*StartDirFn( const char *dir, Desk_filing_fulldirentry *filedata, void *reference)
{
wild_match	match;
wild_block	*wild = (wild_block *) reference;

Desk_Debug_Printf( Desk_error_PLACE "Wild StartDirFn, name='%s', attrib=%i\n", dir, filedata->attrib);

Desk_UNUSED( filedata);

Desk_Debug2_Printf( Desk_error_PLACE "StartDirFn called for dir '%s'\n", dir);


match = Wild_PathMatches( dir, wild->wildpath);

Desk_Debug2_Printf( 
	Desk_error_PLACE
	"WildLib: Start dir: match=%i: dir '%s'   wildpath '%s'\n\n", 
	match,
	dir,
	wild->wildpath
	);

if ( match==wild_match_NO)
	return Desk_filing_scan_PRUNE;

/*
if ( ! (filedata->attrib & (1<<0)))
{
	Desk_Debug_Printf( Desk_error_PLACE "unreadable\n");
	return Desk_filing_scan_PRUNE;
	// unreadable directory.
}
*/
else	return NULL;
}




static Desk_os_error	*FileFn( const char *dir, Desk_filing_fulldirentry *filedata, void *reference)
{
char		wholepath[ 256];
wild_match	match;
wild_block	*wild = (wild_block *) reference;

Desk_Debug2_Printf( Desk_error_PLACE "FileFn called with dir '%s', leafname '%s'\n", dir, filedata->name);

sprintf( wholepath, "%s.%s", dir, filedata->name);

match = Wild_PathMatches( wholepath, wild->wildpath);

if ( match==wild_match_YES)
	wild->fn( ActualPath( wholepath, wild), wild->reference);

return NULL;
}



void	Wild_ScanPath( const char *wildpath0, wild_wildfn fn, void *reference)
{
wild_block	wild;
char		path[ 256]="";
const char	*c;
const char	*c2;
char*		wildpath;

Desk_Debug3_Printf( Desk_error_PLACE "WildLib: wildpath='%s'\n", wildpath0);

wild.remove_csd = Desk_bool_FALSE;

if ( wildpath0[0]=='.' || wildpath0[0]=='*')	{
	Desk_Debug3_Printf( Desk_error_PLACE "Prefixing with '@.'\n");
	wildpath = Desk_DeskMem_Malloc( 2 + strlen( wildpath0));
	strcpy( wildpath, "@");
	strcat( wildpath, wildpath0);
	wild.remove_csd = Desk_bool_TRUE;
	}
else	{
	wildpath = (char*) wildpath0;
	wild.remove_csd = Desk_bool_FALSE;
	}

c = strpbrk( wildpath, "*#");
c2= strstr( wildpath, "...");

wild.wildpath	= wildpath;
wild.reference	= reference;
wild.fn		= fn;

if ( !fn)	Desk_Error_ReportFatal( 1, "Wild_ScanWildPath needs a function\n");

if ( c2 && !c)	c = c2+1;
else if ( c2 && c)	if ( c2<c)	c = c2+1;

/*if (!c)	Error_ReportFatal( 1, "Need at least one wild-character");
*/
if (!c)	c = wildpath + strlen( wildpath);

{
	c--;
	while ( c>wildpath && *c!='.')	c--;
	}

/*
If there are wild characters, c is the first element in wildname which
contains wild-characters. If there are no wild characters, c is the leaf
of the wildname.
 */
 
strncat( path, wildpath, c-wildpath);

Desk_Debug3_Printf( "WildLib: Non-wild path is '%s'\n", path);

/* 28 Jan 1996 - get around ImageFSFix bug	*/
Desk_Debug_Printf( Desk_error_PLACE "Calling Desk_File_IsDirectory( path='%s')\n", path);
if ( path[0] && !Desk_File_IsDirectory( path))	{
	Desk_Debug3_Printf( Desk_error_PLACE "WildLib: Non-wild directory doesn't exist\n");
	return;
	}


Desk_Debug2_Printf( Desk_error_PLACE "Wild_ScanPath calling Filing_ScanDir with '%s'\n", path);
//Desk_Filing_ScanDir( path, StartDirFn, FileFn, NULL, &wild);
Desk_Filing_ScanDir2( path, StartDirFn, FileFn, NULL, Desk_bool_TRUE, &wild);
Desk_Debug2_Printf( Desk_error_PLACE "Wild_ScanPath called Filing_ScanDir\n");

if ( wildpath != wildpath0)	Desk_DeskMem_Free( wildpath);
}

