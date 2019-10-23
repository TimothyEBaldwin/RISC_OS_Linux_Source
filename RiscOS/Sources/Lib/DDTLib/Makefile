# Copyright RISC OS Open Limited.
# 
# This file is part of DDTLib.
# 
# Wild is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
# 
# Wild is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
# Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with DDTLib.  If not, see <http://www.gnu.org/licenses/>.
# 
# Makefile for DDTLib
#

COMPONENT  = DDTLib
OBJS       = ThrowBack SrcPos SectFile Print1 NrSymb GetProc DDT2 \
             DDT AIFHeader
HDRS       = AIFHeader DDT DDT2
CDEFINES   = -DNDEBUG
ASMDEFINES = -pd "Desk_AS_EMBED_FNNAMES SETA 0"

include CLibrary

# Dynamic dependencies:
