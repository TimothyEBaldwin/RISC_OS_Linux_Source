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
#ifndef __AIFHeader_h
#define __AIFHeader_h

extern char*	DDT_AIFHeader_ro_base;
extern char*	DDT_AIFHeader_rw_base;
extern char*	DDT_AIFHeader_zi_base;
extern char*	DDT_AIFHeader_rw_limit;
extern char*	DDT_AIFHeader_ro_limit;
extern char*	DDT_AIFHeader_zi_limit;


typedef struct	{
	int	BL_decompress_code;
	int	BL_selfreloc_code;
	int	BL_zeroinit_code;
	int	BL_imageentrypoint;
	int	swi_OS_Exit;
	int	size_ro;
	int	size_rw;
	int	size_debug;
	int	size_zeroinit;
	int	debug_type;
	int	image_base;
	int	workspace;
	int	reserved[ 4];
	int	zeroinitcode[ 16];
	}
	DDT_AIFHeader_block;




#endif
