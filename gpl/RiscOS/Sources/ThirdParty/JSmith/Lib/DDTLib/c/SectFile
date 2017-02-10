/* 
 * Copyright Julian Smith.
 * 
 * This file is part of DDT.
 * 
 * DDT is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 * 
 * DDT is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with DDT.  If not, see <http://www.gnu.org/licenses/>.
 */
#include <string.h>

#include "Desk/Debug.h"
#include "Desk/Error.h"

#include "DDTLib/DDT2.h"



void	DDT_CopyString( char* buffer, int buflen,DDT_string* string)
	{
	buffer[0] = 0;
	if ( string->length >= buflen)	return;
	strncat( buffer, string->first3, string->length);
	}


void	DDT_CopySectionFilename( char* buffer, int buflen, DDT_section* section)
{
	if ( section->flags.data.language==0)
	{
		buffer[0] = 0;	// Low-level only, so no filename.
	}
	else
	{
		DDT_CopyString( buffer, buflen, &section->name_or_nsyms.name);
	}
}

