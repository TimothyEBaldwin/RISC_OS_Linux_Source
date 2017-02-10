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
#ifndef __Defs_h
#define	__Defs_h

extern DDT_ddtinfo_handle	DDT_global_lastddtinfohandle;
//extern char*	DDT_global_file_address;
#define	FILEADDRESS( ptr)									\
	(											\
		((DDT_debugareadata*) DDT_global_lastddtinfohandle)->file_address +		\
			(									\
				(char*)(ptr) - 							\
				((DDT_debugareadata*) DDT_global_lastddtinfohandle)->data	\
			)									\
	)

#endif
