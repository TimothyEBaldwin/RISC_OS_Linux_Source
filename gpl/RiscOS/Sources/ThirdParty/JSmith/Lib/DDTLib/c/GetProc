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

#include "DDTLib/DDT2.h"


DDT_procedure*	DDT_GetEnclosingProcedure( char* instruction, DDT_section* section)
{
	DDT_itemheader*	item;

	if ( 0==section->flags.data.language)
	{
		Desk_Debug_Printf( Desk_error_PLACE "DDT_GetEnclosingProcedure called for linker low level section\n");
		return NULL;
	}

	for	(
		item = &section->header;
		(char*) item < (char*) section + section->debugsize;
		item = (DDT_itemheader*) ((char*) item + item->itemlength)
		)
	{
		//Desk_Debug3_Printf( Desk_error_PLACE "DDT_GetEnclosingProcedure: looking at item type %i\n", item->itemkind);

		if ( (DDT_itemtype) item->itemkind == DDT_itemtype_PROC)
		{
			DDT_procedure*	proc = (DDT_procedure*) item;
			DDT_endproc*	endproc;
			if ( instruction < proc->startaddr)	continue;
			// Find endproc
			endproc = (DDT_endproc*) ((char*) section + proc->endproc);
			Desk_Debug_Assert( (DDT_itemtype) endproc->header.itemkind == DDT_itemtype_PROC_END);
			if ( instruction >= endproc->endaddr)	continue;
			// If we reach here, we are in this procedure.
			// We don't attempt to cope with nested procedures...

			// Find filename according to proc item...
			// Doesn't work at all. enclosing section has filename
			/*
				{
				char	filename[ 256];
				DDT_string*	filenamestring = (DDT_string*) ((char*) section + proc->fileentry);
				DDT_CopyString( filename, 256, filenamestring);
				Desk_Debug3_Printf( "Filename according to proc is '%s'\n", filename);
				}
			*/

			return proc;
		}
		else
		{
			//Desk_Debug3_Printf( Desk_error_PLACE "DDT_GetEnclosingProcedure: skipping item type %i\n", item->itemkind);
		}

		if ( item->itemlength<=0)
		{
			Desk_Debug_Printf( Desk_error_PLACE "item 0x%p has illegal length %i\n", item, item->itemlength);
			break;
		}
	}
	return NULL;
}
