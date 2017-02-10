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


void	DDT_FindDDTInfoForInstruction2( DDT_debugareadata* debugarea, DDT_instruction_info2* block, void* instruction)
	{
	block->instruction	= instruction;
	block->debugdata	= debugarea;
	block->section		= NULL;
	block->proc		= NULL;
	block->filename[0]	= 0;
	block->procname[0]	= 0;
	block->name[0]		= 0;
	block->pos.linenumber	= -1;
	block->pos.linepos	= -1;
	block->symbol.name	= NULL;

	block->section		= DDT_GetEnclosingSection( (char*) instruction, block->debugdata);

	if ( !block->section)	return;

	DDT_CopySectionFilename( block->name, 256, block->section);

	block->proc		= DDT_GetEnclosingProcedure( (char*) instruction, block->section);

	if ( block->proc)	DDT_CopyString( block->procname, 256, &block->proc->name);

	DDT_GetSourcePos( block, (char*) instruction, block->section);

	DDT_FindNearestSymbol( block);
	}




void	DDT_FindDDTInfoForInstruction3( DDT_ddtinfo_handle debugarea, DDT_instruction_info2* block, void* instruction)
	{
	DDT_FindDDTInfoForInstruction2( (DDT_debugareadata*) debugarea, block, instruction);
	}
