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

#include "DeskLib:Filing.h"
#include "DeskLib:File.h"
#include "DeskLib:Debug.h"

#include "Wild.Wild.h"


static void	FileFn( const char* canonpath, const char* path, void *reference)
	{
	UNUSED( path);
	UNUSED( reference);
	printf( "FileFn. %s\n", canonpath);
	}



static os_error*	FoundFileFn( const char* dirname, filing_fulldirentry* filedata, void* reference)
	{
	UNUSED( dirname);
	UNUSED( filedata);
	UNUSED( reference);
	return NULL;
	}

int	main( void)
	{
	#ifdef DeskLib_DEBUG
		debug_level = 5;
	#endif
	printf( "started\n");
	printf( "%i\n", File_IsDirectory( "ADFS::Anne.$.!Scrap.ScrapDirs.ScrapDir.ABCD.*"));
	
	Filing_ScanDir(
		"ADFS::Anne.$.!Scrap.ScrapDirs.ScrapDir.ABCD.*",
		NULL,
		FoundFileFn,
		NULL,
		NULL
		);
	printf( "finished\n");
	Wild_ScanPath4( "ADFS::Anne.$.!Scrap.ScrapDirs.ScrapDir.ABCD.*", FileFn, (void*) 0x12345);
	printf( "finished\n");
	return 0;
	}
