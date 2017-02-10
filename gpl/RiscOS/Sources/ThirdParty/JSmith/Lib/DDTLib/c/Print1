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
#include "DDTLib/DDT2.h"


void	DDT_PrintDDTInfo_2( DDT_printffn fn, void* reference, DDT_instruction_info2* ddtinfo, const char* separator)
{
	if ( ddtinfo->section)
	{
		DDT_sourcepos	nullpos = { -1, -1};	// These are unsigned really.

		if ( ddtinfo->name[0])
			fn( reference, "Module name '%s'.    %s", ddtinfo->name, separator);
		else	fn( reference, "Module name unknown. %s", separator);

		if ( ddtinfo->pos.linenumber != nullpos.linenumber)
			fn( reference, "File '%s', line %4i, column %3i. %s",
				ddtinfo->filename,
				ddtinfo->pos.linenumber,
				ddtinfo->pos.linepos,
				separator
				);

		else if ( ddtinfo->filename[0])
			fn( reference, "File '%s' (no line-number information available). %s",
				ddtinfo->filename,
				separator
				);

		if ( ddtinfo->symbol.name)
			fn( reference,
				"Offset %4i bytes after %s code-symbol '%s' (from linker's debugging data). %s",
				(char*) ddtinfo->instruction - (char*) ddtinfo->symbol.symbol.value,
				(ddtinfo->symbol.symbol.flags.global) ? "global" : "local ",
				ddtinfo->symbol.name,
				separator
				);

		if ( ddtinfo->proc)
			fn( reference,
					"Proc/fn '%s', offset %4i. %s",
					ddtinfo->procname,
					(char*) ddtinfo->instruction - (char*) ddtinfo->proc->startaddr,
					separator
					);
		else	fn( reference, "No proc/fn information. %s", separator);
	}
	else	fn( reference, "No DDT information available. %s", separator);
}


void	DDT_PrintDDTInfo_1( DDT_printffn fn, void* reference, DDT_instruction_info2* ddtinfo)
{
	DDT_PrintDDTInfo_2( fn, reference, ddtinfo, "");
}
