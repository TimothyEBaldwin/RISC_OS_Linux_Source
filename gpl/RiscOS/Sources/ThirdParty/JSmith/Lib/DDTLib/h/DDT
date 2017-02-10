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
#ifndef __DDT_DDT_h
#define __DDT_DDT_h


typedef struct	{
	void*	instruction;
	char	filename[ 256];
	int	linenumber;
	int	column;
	}
	DDT_instruction_info;


typedef void*	DDT_ddtinfo_handle;



void	DDT_FindDDTInfoForInstruction( DDT_ddtinfo_handle handle, DDT_instruction_info* block, void* ptr);
/*
Fills in 'block' for the instruction at address 'ptr'.
 */



void	DDT_DDTInfo( DDT_instruction_info* block, void* ptr);
/*
Calls DDT_FindDDTInfoForInstruction with most recent DDT_ddtinfo_handle
found in DDT_LoadDDTInfoForFile().

DDT_FindDDTInfoForInstruction is nicer.
 */


DDT_ddtinfo_handle	DDT_LoadDDTInfo( void);
/*
This should be done early in main(), because the filename to be loaded
is found from _kernel_command_string(), which may contain a system
variable which could change, such as <Obey$Dir>.

Returns 0 if couldn't load info.
 */


DDT_ddtinfo_handle	DDT_GetDDTInfo( const void* ddtinfo, int len);
/*
Expects 'len' bytes of DDT info to be at address 'ddtinfo'.
 */


DDT_ddtinfo_handle	DDT_LoadDDTInfoForFile( const char* filename);
/*
Attempts to load debugging information from the specified file. This
should be done early in main(), because the filename to be loaded is
found from _kernel_command_string(), which may contain a system variable
which could change, such as <Obey$Dir>.

Returns 0 if error, otherwise opaque handle to be passed to
DDT_FindDDTInfoForAddress.
 */




#endif
