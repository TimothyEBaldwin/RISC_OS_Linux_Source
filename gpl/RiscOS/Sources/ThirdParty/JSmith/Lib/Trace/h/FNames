/* 
 * Copyright Julian Smith.
 * 
 * This file is part of Trace.
 * 
 * Trace is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 * 
 * Trace is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Trace.  If not, see <http://www.gnu.org/licenses/>.
 */
typedef struct	{
	unsigned int	length	: 24;
	unsigned int	ff_code	:  8;
	}
	Trace_fnname_infoword;


const Trace_fnname_infoword*	Trace_FName_FindNext( const Trace_fnname_infoword* current, const char* limit);
/*
Returns NULL if no function name marker is found.
 */


#define	Trace_FNName_GetName( infoword)	( (char*) (infoword) - (infoword)->length)
/*
const char*	Trace_FNName_GetName( Trace_fnname_infoword* infoword);
 */
