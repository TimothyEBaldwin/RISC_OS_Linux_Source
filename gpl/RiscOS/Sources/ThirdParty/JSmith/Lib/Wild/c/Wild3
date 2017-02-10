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
#include <ctype.h>
#include <string.h>

#include "Desk/Debug.h"
#include "Desk/Error.h"

#include "PlainArgv/StrTok.h"

#include "Wild/Wild.h"


typedef struct	{
	wild_wildfn2	fn;
	void*		reference;
	char*		excludes;
	}
	Wild_block3;


static void	FileFn3( const char* canonpath, const char* path, void* reference)
	{
	Wild_block3*	block = (Wild_block3*) reference;
	char*		exclude;
	
	Desk_Debug2_Printf( Desk_error_PLACE "exclude is %s\n", block->excludes);
	
	if ( block->excludes)	{
		for	(
			exclude=PlainArgv_StrTok( block->excludes); 
			exclude; 
			exclude=PlainArgv_StrTok( block->excludes)
			)
			{
			wild_match	match = Wild_PathMatches( canonpath, exclude);
			Desk_Debug3_Printf( "---" Desk_error_PLACE "Wild FileFn3 exclude canon is %i '%s' '%s'\n", match, exclude, canonpath);
			if ( wild_match_YES == match)	{
				/* Need to finish strtok to restore block->excludes	*/
				while ( PlainArgv_StrTok( block->excludes))	;
				return;
				}
			}
		}
	
	/* No matches	*/
	block->fn( canonpath, path, block->reference);
	}


void	Wild_ScanPath3( const char *paths0, char* excludes, wild_wildfn2 fn, void *reference)
	{
	char*		paths = (char*) paths0;
	Wild_block3	block;
	char*		path;
	#ifdef Desk_DEBUG
		int	len = strlen( paths);
	#endif
	block.fn	= fn;
	block.reference	= reference;
	block.excludes	= excludes;
	
	Desk_Debug2_Printf( Desk_error_PLACE "paths='%s'\n", paths);
	
	for	(
		path = PlainArgv_StrTok( paths);
		path;
		path = PlainArgv_StrTok( paths)
		)
		{
		Desk_Debug2_Printf( Desk_error_PLACE "Wild_ScanPath3 calling ScanPath2 with path '%s'\n",
			path
			);
		Wild_ScanPath2( path, FileFn3, &block);
		#ifdef Desk_DEBUG
			{
			int	i;
			Desk_Debug2_Printf( "paths is:\n");
			for ( i=0; i<len; i++)	{
				if ( iscntrl( paths[i]))	Desk_Debug3_Printf( "<%i>", paths[i]);
				else				Desk_Debug3_Printf( "%c", paths[i]);
				}
			Desk_Debug2_Printf( "\n");
			}
		#endif
		}
	}
