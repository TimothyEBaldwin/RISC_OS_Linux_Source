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
/*
Copyright © 1995 Julian Smith
 */

#ifndef __Wild_Wild_h
#define	__Wild_Wild_h

#ifdef __cplusplus
extern "C"	{
#endif


#ifndef __Desk_Core_h
	#include "Desk.Core.h"
#endif


typedef enum	{
	wild_match_NO,
	wild_match_SUB,
	wild_match_YES
	}
	wild_match;
/*
This is the result of a wild comparison
wild_match_SUB means that there was no match, but the string could be
the start of a perfect match.

Eg Wild_PathMatches( "abcd", "a*.*") will return wild_match_SUB.
*/



typedef void	(*wild_wildfn)( const char *path, void *reference);
/*
Called by Wild_ScanPath.
 */

typedef void	(*wild_wildfn2)( const char* canonpath, const char* path, void *reference);
/*
Called by Wild_ScanPath2.
 */


void	Wild_ScanPath( const char *path, wild_wildfn fn, void *reference);
/*
Calls 'fn' for every path which matches 'path'. See Wild_PathMatches for
details of matching.
 */




void	Wild_ScanPath2( const char *path, wild_wildfn2 fn, void *reference);
/*
As Wild_ScanPath, except that multiple paths are expanded (eg
'system:modules.*'). 

Note that this expects a different function type - a wild_wildfn2. This
function should expect two strings, one a canonicalised version of the
other.

For example, if '<Run$Path> = "ADFS::4.$.Lib1,ADFS::4.$.Lib2", and 'Lib1
contains 'abc' and 'Lib2' contains ayz', then the result of calling
Wild_ScanPath23( "Run:a*", fn, NULL, keep) is to pass 'fn' the following
pairs of strings:

Iteration	path			canonpath
------------------------------------------------------------
1		Run:abc			ADFS::4.$.Lib1.abc
2		Run:ayz			ADFS::4.$.Lib2.ayz"
3
...

 */



void	Wild_ScanPath3( const char *paths, char* excludes, wild_wildfn2 fn, void *reference);
/*
As Wild_ScanPath2, but accepts space-separated list of paths, and
space-separated list of wild-carded filenames to exclude.
The strings pointed to by 'paths' and 'excludes' are used with strtok,
but are restored afterwards.
 */


void	Wild_ScanPath4( const char *pathsandexcludes, wild_wildfn2 fn, void *reference);
/*
'pathsandexcludes' should be "foo.* *.bar...* -x {excludes}". Splits up
string, and calls Wild_ScanPath3.
 */


wild_match	Wild_StringMatches( const char *s, const char *wild);
/*
Compares 'path' with the wild-carded string 'wild'.

'*' matches any number (including 0) of characters. '#' matches any
single character (ecxept '.').
 */

wild_match	Wild_PathMatches( const char *path, const char *wild);
/*
Compares 'path' with the wild-carded string 'wild'. '*' and '#' are
matched as in Wild_StringMatches, '...' matches any number of
directories.
 */


wild_match	Wild_PathMatches2( const char *path, const char *wilds);
/*
Compares 'path' with all of the space-separated wild-carded strings in
'wilds'. '*' and '#' are matched as in Wild_StringMatches, '...' matches
any number of directories.

Returns the best match from all the different wild strings.
 */


wild_match	Wild_PathMatches3( const char *path, const char *wilds, const char* excludes);
/*
Compares with all strings in 'wilds' and 'excludes'.
 */

wild_match	Wild_PathMatches4( const char* path, const char* wilds_and_excludes);
/*
wilds_and_excludes is '{wilds} [ -x {excludes}]'.
 */



extern Desk_bool	wild__casesensitive;
/*
Use Wild_CaseSensitive and Wild_CaseInsensitive to set this.
The Wild library will initially be case insensitive.
 */

#define Wild_CaseSensitive()	(wild__casesensitive = TRUE)
/*
Makes all subsequent Wild_ calls case-sensitive.
 */

#define Wild_CaseInsensitive()	(wild__casesensitive = FALSE)
/*
Makes all subsequent Wild_ calls case-insensitive (the default).
 */


#ifdef __cplusplus
}
#endif


#endif
