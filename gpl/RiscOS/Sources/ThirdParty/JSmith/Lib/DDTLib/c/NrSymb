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


void	DDT_FindNearestSymbol( DDT_instruction_info2* block)
/*
Finds the nearest previous code symbol to block->instruction, in
low-level debugging table section in block.
 */
	{
	DDT_symbol*	syms;
	char*		stringtable;
	int		i;
	int		best_i;
	unsigned int	best_value;

	block->symbol.name = NULL;

	if ( block->section->flags.data.language != 0)	return;

	syms = (DDT_symbol*) (block->section + 1);
	stringtable = (char*) ( syms + block->section->name_or_nsyms.nsyms);

	best_i = -1;
	best_value = 0;

	Desk_Debug_Printf( Desk_error_PLACE "Num lowlevel syms = %i\n", block->section->name_or_nsyms.nsyms);

	for ( i=0; i<block->section->name_or_nsyms.nsyms; i++)	{
		//Desk_Debug_Printf( Desk_error_PLACE "sym at 0x%p '%s'\n", (void*) syms[i].value, stringtable + syms[ i].flags.stridx);

		if ( syms[i].flags.symboltype==1/*code*/ && (void*) syms[i].value <= block->instruction)	{
			if ( syms[i].value > best_value)	{
				best_value = syms[i].value;
				best_i = i;
				}
			}
		}

	if ( best_i != -1)	{
		block->symbol.name = stringtable + syms[ best_i].flags.stridx;
		block->symbol.symbol = syms[ best_i];
		}
	}
