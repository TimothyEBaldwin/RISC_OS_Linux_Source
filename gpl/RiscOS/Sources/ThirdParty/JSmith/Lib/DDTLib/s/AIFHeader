; 
; Copyright Julian Smith.
; 
; This file is part of DDT.
; 
; DDT is free software: you can redistribute it and/or modify it under
; the terms of the GNU Lesser General Public License as published by the
; Free Software Foundation, either version 3 of the License, or (at your
; option) any later version.
; 
; DDT is distributed in the hope that it will be useful, but WITHOUT
; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
; Public License for more details.
; 
; You should have received a copy of the GNU Lesser General Public
; License along with DDT.  If not, see <http://www.gnu.org/licenses/>.
; 
	MACRO
	GETSYMBOL	$name, $extname

	EXPORT	$extname
	IMPORT	$name
$extname
	DCD	$name
	MEND

	AREA	AIFHeader_Area, DATA, REL

	GETSYMBOL	|Image$$RO$$Base|, DDT_AIFHeader_ro_base
	GETSYMBOL	|Image$$RW$$Base|, DDT_AIFHeader_rw_base
	GETSYMBOL	|Image$$ZI$$Base|, DDT_AIFHeader_zi_base
	GETSYMBOL	|Image$$RW$$Limit|, DDT_AIFHeader_rw_limit
	GETSYMBOL	|Image$$RO$$Limit|, DDT_AIFHeader_ro_limit
	GETSYMBOL	|Image$$ZI$$Limit|, DDT_AIFHeader_zi_limit

	END
