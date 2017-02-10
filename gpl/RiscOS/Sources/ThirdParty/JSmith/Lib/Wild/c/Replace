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
#include <ctype.h>

#include "Desk/Debug.h"
#include "Desk/Error2.h"
#include "Desk/Filing.h"

#include "Wild/Replace.h"



static int	CatNthTwig( Desk_deskmem_buffer* out, const char* path, int n, const char* separators)
/* Cats n-th twig - 0 is leaf, 1 is parent of leaf etc, ie it's backwards...	*/
// return 1 if nothing copied.
{
const char*	p;
const char*	p2;

Desk_Debug_Printf( "CatNthTwig: out='%s', path='%s', n=%i\n", Desk_DeskMem_BufferGetString( out), path, n);

for ( p=path+strlen(path)-1; p>=path && n; p--)	{
	//if ( *p=='.')	n--;
	if ( strchr( separators, *p))	n--;
	}

for ( p2 = p-1; p2>=path; p2--)	{
	//if ( *p2=='.' || *p2==':')	break;
	if ( strchr( separators, *p2))	break;
	}

if ( p-p2>0 && p2+1>=path)	Desk_DeskMem_BufferStrNCat( out, p2+1, p-p2);

Desk_Debug_Printf( "CatNthTwig: out='%s'\n\n", Desk_DeskMem_BufferGetString( out));

if ( p2>=path)	return 0;
else		return 1;
}



static int	CatFirstNTwigs( Desk_deskmem_buffer* out, const char* path, int n, const char* separators)
// return 1 if nothing copied.
{
const char*	p;
Desk_Debug_Printf( "\nCatFirstNTwigs: out='%s', path='%s', n=%i\n", Desk_DeskMem_BufferGetString( out), path, n);

for ( p=path+strlen(path)-1; p>=path && n; p--)	{
	Desk_Debug_Printf( "%i", *p);
	//if ( *p=='.' || *p==':')	n--;
	if ( strchr( separators, *p))	n--;
	}
Desk_Debug_Printf( "\nn=%i, p-path=%i", n, p-path);

if (p>path)	Desk_DeskMem_BufferStrNCat( out, path, 1+p-path);	// Don't include the last separator.

Desk_Debug_Printf( "CatFirstNTwigs: out='%s'\n\n", Desk_DeskMem_BufferGetString( out));

if ( p>path)	return 0;
else		return 1;
}


/*
static void	Wild_Replace_RemoveDoubleDots( Desk_deskmem_buffer* buffer)
	{
	char*	a = Desk_DeskMem_BufferGetString( buffer);
	char*	b = a;
	// Copy b to a
	for(;;)	{
		while ( b[0]=='.' && b[1]=='.')	b++;
		*a = *b;
		if ( *a==0)	return;
		a++;
		b++;
		}
	}
*/



void	Wild_Replace_ReplaceCat( Desk_deskmem_buffer* buffer, const char* replacestring, const char* name)
	{
	const char*	code;
	const char*	n;
	
	Desk_Debug_Printf( "Wild_Replace_ReplaceCat replacestring='%s', name='%s'\n", replacestring, name);
	
	for ( n=name, code=replacestring; *code; )	{
	
			{
			/* Copy any non-special chrs...	*/
			const char* c = code;
			while ( c[0]!='*' && c[0]!='#' && c[0]!='&' && c[0])	c++;
			Desk_DeskMem_BufferStrNCat( buffer, code, c-code);
			code = c;
			}
		
		if ( code[0] == 0)	break;
		
		/*
		if ( code[1] == 0)	{
			Desk_Debug2_Printf( "Ignoring single '%c (character number %i)' at end of replace string '%s'\n",
				code[0], code[0], replacestring
				);
			break;
			}
		*/
		
		else if ( code[0] == '*')	{
			if ( code[1]=='*')
			{
				Desk_DeskMem_BufferStrCat( buffer, "*");
				code+=2;
			}
			else	{
				int nothing;
				if (!isdigit( code[1]))	Desk_Error2_HandleTextf( "* should be followed by a digit");
				
				nothing = CatFirstNTwigs( buffer, name, code[1]-'0', ":.");
				code += 2;
				
				if ( nothing && code[0]=='.')	code++;	// Skip following '.' if *. didn't add anything.
				}
			}
		
		else if ( code[0]=='#')	{
			if ( code[1]=='#')
			{
				Desk_DeskMem_BufferStrCat( buffer, "#");
				code += 2;
			}
			else if ( code[1]=='/')
			{
				if (!isdigit( code[2]))	Desk_Error2_HandleTextf( "#/ should be followed by a digit");
				CatNthTwig( buffer, name, code[2]-'0', ":./");
				code+=3;
			}
			else	{
				if (!isdigit( code[1]))	Desk_Error2_HandleTextf( "# should be followed by a digit");
				CatNthTwig( buffer, name, code[1]-'0', ":.");
				code += 2;
				}
			}
		
		else if ( code[0]=='&')	{
			if ( code[1]=='&')
			{
				Desk_DeskMem_BufferStrCat( buffer, "&");
				code+=2;
			}
			else
			{
			/* Cat leafname excluding '/'	*/
			char*	leaf = Desk_Filing_FindLeafname( name);
			char*	end = strchr( leaf, '/');
			if (!end)	end = leaf + strlen( leaf);
			Desk_DeskMem_BufferStrNCat( buffer, leaf, end-leaf);
			code += 1;
			}
			}
		}
	
	//Wild_Replace_RemoveDoubleDots( buffer);
	}



void	Wild_Replace_Replace( Desk_deskmem_buffer* buffer, const char* replacestring, const char* name)
	{
	Desk_DeskMem_BufferStrCpy( buffer, "");
	Wild_Replace_ReplaceCat( buffer, replacestring, name);
	}
