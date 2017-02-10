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
#ifndef __DDT_DDT2_h
#define __DDT_DDT2_h

#ifndef __Desk_Core_h
	#include "Desk.Core.h"
#endif

#ifndef __AIFHeader_h
	#include "AIFHeader.h"
#endif

#ifndef __DDT_DDT_h
	#include "DDT.h"
#endif



typedef enum	{
	DDT_itemtype_SECTION		=  1,
	DDT_itemtype_PROC		=  2,
	DDT_itemtype_PROC_END		=  3,
	DDT_itemtype_VARIABLE		=  4,
	DDT_itemtype_TYPE		=  5,
	DDT_itemtype_STRUCT		=  6,
	DDT_itemtype_ARRAY		=  7,
	DDT_itemtype_SUBRANGE		=  8,
	DDT_itemtype_SET		=  9,
	DDT_itemtype_FILEINFO		= 10,
	DDT_itemtype_ENUM_CONTINUOUS	= 11,
	DDT_itemtype_ENUM_DISCONTINUOUS	= 12,
	DDT_itemtype_PROC_DECLARATION	= 13,
	DDT_itemtype_NAMESCOPE_BEGIN	= 14,
	DDT_itemtype_NAMESCOPE_END	= 15
	}
	DDT_itemtype;

typedef struct	{
	unsigned int	itemkind	: 16;	/*1 section, 2 procedure, 3 endproc, etc.	*/
	unsigned int	itemlength	: 16;
	}
	DDT_itemheader;


typedef struct	{
	struct	{
		unsigned int	stridx		: 24;
		unsigned int	global		:  1;
		unsigned int	symboltype	:  7;	/* 0 absolute, 1 code, 2 data, 3 zero init.	*/
		}
		flags;
	int	value;
	}
	DDT_symbol;


typedef struct	{
	char	length;
	char	first3[3];
	}
	DDT_string;


typedef struct	{
	DDT_itemheader	header;
	
	union	{
		int	value;
		struct	{
			unsigned int	language	:  8;
			unsigned int	debuglines	:  1;
			unsigned int	debugvars	:  1;
			unsigned int	spare		: 14;
			unsigned int	debugversion	:  8;
			}
			data;
		}
		flags;
	
	char*	codeaddr;
	char*	dataaddr;
	int	codesize;
	int	datasize;
	int	fileinfo;	/* Offset in debugging data *relative to this section*	*/
	int	debugsize;	/* Total size of all debug info for this section	*/
	
	union	{
		int		nsyms;
		DDT_string	name;
		}
		name_or_nsyms;
	}
	DDT_section;



typedef struct	{
	unsigned int	linenumber	: 22;
	unsigned int	linepos		: 10;
	}
	DDT_sourcepos;


typedef struct	{
	DDT_itemheader	header;
	
	int			type;	/* Return type.	*/
	int			args;
	DDT_sourcepos	sourcepos;
	void*			startaddr;
	void*			bodyaddr;	/* First instruction after procedure entry sequence.	*/
	int			endproc;
	int			fileentry;
	DDT_string		name;
	}
	DDT_procedure;


typedef struct	{
	DDT_itemheader	header;
	
	DDT_sourcepos	sourcepos;
	void*			endaddr;
	int			fileentry;
	int			nreturns;
	void*			retaddrs[1];
	}
	DDT_endproc;





typedef struct	{
	int	fragmentsize;
	int	firstline;
	int	lastline;
	char*	codeaddr;
	int	codesize;
	}
	DDT_fragment;
	/* Followed by some DDT_lineinfo's.	*/


typedef struct	{
	int	n;	/* Num fragments.	*/
	}
	DDT_fileinfo_data;
	/* Followed by n DDT_fragment's.	*/

/*
typedef struct	{
	DDT_itemheader	header;
	int			length;
	int			date;	|* Seconds since 1970.	*|
	DDT_string		filename;
	}
	DDT_fileinfo;
*/
/* Followed by a DDT_fileinfo_data;.	*/
/* Incorrect - use DDT_fileinfo2 instead	*/


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



typedef struct	{
	char*		data;
	int		size;
	Desk_bool	loaded;
	
	DDT_AIFHeader_block	aifheader;
	
	char*		file_address;	// Address in AIF file of start of debug data.
					// Useful for diagnostics - print data-'file_address' to get
					// data that can be compared with Zap's code addresses in original file.
	}
	DDT_debugareadata;




typedef struct	{
	void*			instruction;
	DDT_debugareadata*	debugdata;
	DDT_section*		section;
	DDT_procedure*		proc;
	char			filename[ 256];
	char			procname[ 256];
	char			name[ 256];	/* module name	*/
	DDT_sourcepos		pos;
	struct	{
		char*		name;		/* From low-level debug info	*/
		DDT_symbol	symbol;
		}
		symbol;
	}
	DDT_instruction_info2;


DDT_section*	DDT_GetEnclosingSection( char* instruction, DDT_debugareadata* ddtdata);
DDT_procedure*	DDT_GetEnclosingProcedure( char* instruction, DDT_section* section);
void		DDT_GetSourcePos( DDT_instruction_info2* info2, char* instruction, DDT_section* section);
void		DDT_CopySectionFilename( char* buffer, int buflen, DDT_section* section);
void		DDT_CopyString( char* buffer, int buflen, DDT_string* string);


void	DDT_FindDDTInfoForInstruction2( DDT_debugareadata* debugarea, DDT_instruction_info2* block, void* instruction);
/*
Fills in 'block' for address 'instruction'.
 */

void	DDT_FindDDTInfoForInstruction3( DDT_ddtinfo_handle debugarea, DDT_instruction_info2* block, void* instruction);
/*
As DDT_FindDDTInfoForInstruction2, except that usees opaque handle.
 */


void		DDT_FindNearestSymbol( DDT_instruction_info2* block);


typedef int (*DDT_printffn)( void* reference, const char* fmt, ...);

void	DDT_PrintDDTInfo_1( DDT_printffn fn, void* reference, DDT_instruction_info2* ddtinfo);
void	DDT_PrintDDTInfo_2( DDT_printffn fn, void* reference, DDT_instruction_info2* ddtinfo, const char* separator);


void	DDT_Throwback( DDT_instruction_info2* ddtinfo, const char* rootfilename, const char* format, ...);
	/*
	Makes a throwback item for the specified source position. If the
	filename isn't complete, it is prepended with 'rootfilename'.^.
	The throwback text is specified by format, ... as in printf,
	using an internal 1024-character buffer.
	Currently there's no control over the details of the throwback
	such as warning/error, severity etc.
	Returns quietly if ddtinfo doesn't have source info, or
	throwback SWIs fail.
	 */

#endif
