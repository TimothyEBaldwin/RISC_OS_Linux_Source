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
#include "PlainArgv.StrTok.h"

#include "Desk/Debug.h"
#include "Desk/Error.h"

#include "Wild/Wild.h"




wild_match	Wild_PathMatches2( const char *path, const char *wilds0)
	{
	char*		wilds = (char*) wilds0;	/* We modify wilds0, must restore it afterwards.	*/
	const char*	wild;
	wild_match	bestmatch = wild_match_NO;
	
	Desk_Debug2_Printf( Desk_error_PLACE "Wild_PathMatches2( '%s', '%s')\n", path, wilds);
	
	for	(
		wild=PlainArgv_StrTok( wilds);
		wild;
		wild=PlainArgv_StrTok( wilds)
		)
		{
		wild_match	match = Wild_PathMatches( path, wild);
		if ( (int) match > (int) bestmatch)	bestmatch = match;
		if ( wild_match_YES==match)	{
			while ( PlainArgv_StrTok( wilds))	;	/* Need to finish strtok to restore wilds	*/
			break;
			}
		}
	
	return bestmatch;
	}


wild_match	Wild_PathMatches3( const char *path, const char *wilds, const char* excludes)
	{
	return ( wild_match_YES==Wild_PathMatches2( path, excludes)) ? wild_match_NO : Wild_PathMatches2( path, wilds);
	}
