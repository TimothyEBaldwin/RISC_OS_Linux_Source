# This source code in this file is licensed to You by Castle Technology
# Limited ("Castle") and its licensors on contractual terms and conditions
# ("Licence") which entitle you freely to modify and/or to distribute this
# source code subject to Your compliance with the terms of the Licence.
# 
# This source code has been made available to You without any warranties
# whatsoever. Consequently, Your use, modification and distribution of this
# source code is entirely at Your own risk and neither Castle, its licensors
# nor any other person who has contributed to this source code shall be
# liable to You for any loss or damage which You may suffer as a result of
# Your use, modification or distribution of this source code.
# 
# Full details of Your rights and obligations are set out in the Licence.
# You should have received a copy of the Licence with this source code file.
# If You have not received a copy, the text of the Licence is available
# online at www.castle-technology.co.uk/riscosbaselicence.htm
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
