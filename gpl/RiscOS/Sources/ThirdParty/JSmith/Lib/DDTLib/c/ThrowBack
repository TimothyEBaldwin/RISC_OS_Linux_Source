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
#include <stdarg.h>
#include <string.h>

#include "Desk/Debug.h"

#include "DDTLib/DDT2.h"

#include "swis.h"


#define	DDEUtils_ThrowbackStart	0x42587
#define	DDEUtils_ThrowbackSend	0x42588
#define	DDEUtils_ThrowbackEnd	0x42589



void	DDT_Throwback( DDT_instruction_info2* ddtinfo, const char* rootfilename, const char* format, ...)
{
	DDT_sourcepos		nullpos = { -1, -1};
	va_list	va;

	va_start( va, format);

	if ( ddtinfo->section && ddtinfo->pos.linenumber!=nullpos.linenumber && ddtinfo->pos.linepos != nullpos.linepos)
	{
		if (NULL == _swix( DDEUtils_ThrowbackStart, 0))
		{
			char	canonfilename[ 256];
			char	message[ 1024];
			/*
			Add '...!RunImage.^.' to start of filename if the filename
			doesn't look like a full name.
			 */
			if (	   ddtinfo->filename[0]=='<' 	/* eg <Foo$Dir>	*/
				|| ddtinfo->filename[0]=='@'
				|| strchr( ddtinfo->filename, '$')
				|| strchr( ddtinfo->filename, ':')
				)
				{
				/* Filename is complete	*/
				strcpy( canonfilename, ddtinfo->filename);
				}
			else	{
				/* Filname seems to be incomplete.	*/
				sprintf( canonfilename, "%s.^.%s",
					rootfilename,
					ddtinfo->filename
					);
				}

			Desk_Debug2_Printf( "Throwback filename is '%s'\n", canonfilename);

			vsprintf( message, format, va);

			_swix( DDEUtils_ThrowbackSend, _IN(0)|_IN(2), 0, ddtinfo->filename);
			_swix( DDEUtils_ThrowbackSend, _IN(0)|_INR(2,5),
				2, canonfilename, ddtinfo->pos.linenumber, 4, message
				);
			_swix( DDEUtils_ThrowbackEnd, 0);
		}
	}

	va_end( va);
}
