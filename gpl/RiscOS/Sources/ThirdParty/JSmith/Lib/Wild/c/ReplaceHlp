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
#include "Wild/Replace.h"


static char     text[] =
	"    '##' is replaced by '#'\n"
	"\n"
	"    '#0' is replaced by the leafname, '#1' by the leafname of the\n"
	"    parent directory and so on.\n"
	"\n"
	"    '#/0 #/1 ... are as #0 #1 ..., except that '/' is treated as\n"
	"    a separator as well as '.'. This enables one to extract (for\n"
	"    example) filename suffixes etc.\n"
	"\n"
	"    '*0' is replaced by the whole path, '*1' by the path with\n"
	"    the leaf omitted, '*2' by the path with the leaf and its\n"
	"    parent omitted etc.\n"
	"\n"
	"    '**' is replaced by '*'\n"
	"\n"
	"    &' is replaced by the leaf of the path, excluding any\n"
	"    file suffixes such as '/c', '/c++' etc. This is for use\n"
	"    with NFS-style naming of source files.\n"
	"    Thus '&' is equivalent to '#/1'.\n"
	;

const char*	Wild_Replace_HelpString( void)
{
	return text;
}
