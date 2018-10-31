# Copyright 1997 Acorn Computers Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Makefile for UnicodeLib
#

COMPONENT  = UnicodeLib
TARGET    ?= ucode
EXPDIR     = ${LIBDIR}${SEP}Unicode
LIBRARIES  = ${LIBRARY} ${LIBRARYZM} ${LIBRARYD}
LIBDEPENDS = unictype
CDFLAGS    = -DDEBUG=1
OBJS       = autojp unictype utf8 utf16 encoding iso2022 eightbit iso6937 \
             shiftjis johab bigfive enc_utf7 enc_utf8 enc_ascii enc_utf16 \
             enc_ucs4 enc_scsu enc_system acorn combine riscos
HDRS       = autojp charsets encoding iso10646 iso3166 \
             languages unictype utf8 combine

include CLibrary

clean::
        ${RM} mkunictype
        ${RM} c${SEP}unictype

unictype: mkunictype data${SEP}UnicodeData
        ${RUN}mkunictype < data${SEP}UnicodeData > c${SEP}unictype

mkunictype: mkunictype.c
        ${MAKE} -f mkunictype/mk THROWBACK=${THROWBACK}

# Dynamic dependencies:
