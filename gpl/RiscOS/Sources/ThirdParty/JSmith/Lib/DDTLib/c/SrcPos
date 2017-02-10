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
#include "Desk/Debug.h"
#include "Desk/Error.h"
#include "Desk/Ptr.h"

#include "DDTLib/DDT2.h"

#include "Defs.h"


#if 0
typedef struct
{
	int			len;	/* 0 means this the last one	*/
	int			date;
	DDT_string		filename;
	/*
	Followed by a DDT_fileinfo_data.
	 */
}
DDT_fileentry;

typedef struct
{
	DDT_itemheader	header;
	/* Followed by a number of DDT_fileentry's.	*/
}
DDT_fileinfo2;

#endif



void	DDT_GetSourcePos( DDT_instruction_info2* info2, char* instruction, DDT_section* section)
{
	DDT_fileentry*		fileentry;
	DDT_fileinfo2*		fileinfo2;
	int			asdversion = section->flags.data.debugversion;

	info2->pos.linenumber	= -1;
	info2->pos.linepos	= -1;
	info2->filename[0]	= 0;

	if ( section->fileinfo==0)	{
		Desk_Debug_Printf( Desk_error_PLACE "DDT_GetSourcePos: No fileinfo\n");
		return;
		}

	if ( asdversion != 2 && asdversion != 3)
	{
		Desk_Debug_Printf( Desk_error_PLACE "DDT_GetSourcePos: Unrecognised ASD version %i\n", asdversion);
		return;
	}


	fileinfo2	= (DDT_fileinfo2*) (((char*) section) + section->fileinfo);

	for (
		fileentry = (DDT_fileentry*) (fileinfo2+1);
		fileentry->len>0;
		fileentry=(DDT_fileentry*) ((char*) fileentry + fileentry->len)
		)
	{
		char*			c		= &fileentry->filename.first3[0] + fileentry->filename.length;
		DDT_fileinfo_data*	fileinfodata	= (DDT_fileinfo_data*) Desk_Ptr_ROUNDUP_WORD( c);
		DDT_fragment*		fragment;
		int			i;

		#ifdef Desk_DEBUG
		{
			char	buffer[ 256];
			DDT_CopyString( buffer, 256, &fileentry->filename);
			Desk_Debug_Printf( Desk_error_PLACE "fileentry at 0x%p [0x%p], %i fragments, filename='%s'\n",
				fileentry,
				FILEADDRESS( fileentry),
				fileinfodata->n,
				buffer
				);
		}
		#endif

		for ( fragment=(DDT_fragment*) (fileinfodata+1), i=0; i<fileinfodata->n; i++)
		{
			DDT_fragment*	fragend		= (DDT_fragment*) Desk_Ptr_ROUNDUP_WORD( (char*) fragment + fragment->fragmentsize);

			Desk_Debug_Printf( Desk_error_PLACE "fragment 0x%p [0x%p], code=0x%p-0x%p, codesize=%i, fragment size=%i\n",
				fragment,
				FILEADDRESS( fragment),
				fragment->codeaddr,
				fragment->codeaddr+fragment->codesize,
				fragment->codesize,
				fragment->fragmentsize
				);

			if ( instruction >= fragment->codeaddr && instruction < fragment->codeaddr+fragment->codesize)
			{
				int			line		= fragment->firstline;
				int			column		= 1;
				char*			code		= fragment->codeaddr;
				char*			lineinfo	= (char*) (fragment+1);

				Desk_Debug2_Printf( "fragment contains ptr\n");

				/* Search through line info for our code pointer	*/
				for ( ; lineinfo < (char*) fragend; )
				{
					char*	nextlineinfo;
					int	lineinc;
					int	colinc;
					int	codeinc;

					Desk_Debug3_Printf( "DDT_lineinfo at %p is is codeinc %i, lineinc %i\n",
						lineinfo, lineinfo[0], lineinfo[1]
						);

					if ( lineinfo[0]==0 && lineinfo[1]==0)
					{
						/* 3 half-word form	*/
						short int*	lineinfo2 = (short int*) lineinfo;
						Desk_Debug4_Printf( "Found 3 half-word line info\n");

						lineinc = lineinfo2[1];
						codeinc = lineinfo2[2];
						colinc	= -column;
						nextlineinfo = lineinfo + 6;

					}

					else if ( asdversion==3 && lineinfo[0]==0 && lineinfo[1]==64)
					{
						// column is not in ASD 2 spec.
						/* 4 half-word form	*/
						short int*	lineinfo3 = (short int*) lineinfo;
						Desk_Debug4_Printf( "Found 4 half-word line info\n");

						lineinc = lineinfo3[1];
						codeinc = lineinfo3[2];
						colinc	= lineinfo3[3] - column;
						nextlineinfo = lineinfo + 8;

					}

					else
					{
						Desk_Debug4_Printf( "Normal lineinfo.\n");

						lineinc = 0;
						if (lineinfo[1]<64)
						{
							Desk_Debug5_Printf( "No column change...\n");

							lineinc	= lineinfo[1];
							colinc	= 1-column;
						}
						else
						{
							colinc	= lineinfo[1]-64;
							lineinc	= 0;
							Desk_Debug5_Printf( "Column change %i\n", colinc);

						}
						codeinc	= lineinfo[0];
						nextlineinfo = lineinfo+2;
					}

					if ( instruction >= code && instruction < code+codeinc)
					{
						Desk_Debug2_Printf(	"Instruction at %p is line number %i, column %i\n",
							instruction, line, column
							);

						info2->pos.linenumber	= line;
						info2->pos.linepos	= column;
						DDT_CopyString( info2->filename, 256, &fileentry->filename);
						break;
					}

					Desk_Debug2_Printf( "line %i, column %i, code %p\n", line, column, code);

					Desk_Debug2_Printf( "lineinc=%i, columninc=%i, codeinc=%i\n", lineinc, colinc, codeinc);

					line	+= lineinc;
					column	+= colinc;
					code	+= codeinc;
					lineinfo = nextlineinfo;
				}

				if ( (char*) lineinfo >= (char*) fragend)
				{
					fprintf( stderr, "Couldn't find source pos for ptr %p\n", instruction);
				}

				break;
			}

			fragment = fragend;
		}
	}

	return;
}
