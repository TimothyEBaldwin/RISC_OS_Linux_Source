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
# Makefile for Net[I|E|G]
#

COMPONENT    = Net
VPATH        = gwroute
LIBS         = ${UNIXLIB} ${INETLIB} ${SOCK5LIB} ${ASMUTILS}
OBJS         = ${OBJ${TARGET}}
CINCLUDES    = -ITCPIPLibs:,C:
HDRS         =
CFLAGS       = -wp
ROMCDEFINES  = -DROM
RESFSDIR     = ${RESDIR}${SEP}Net
CMHGDEPENDS  = mns mnsg mnsi
ifeq ("${CMDHELP}","None")
CMHGDEFINES += -DNO_INTERNATIONAL_HELP
endif

#
# Objects implicated in the various targets
#
OBJNET       = mns  mnscommon io   swis   configure netasm text inetfn debug route showrt
OBJNETI      = mnsi mnscommon io   swis   configure netasm text inetfn debug
OBJNETE      = mnsi mnscommon io_e swis_e configure netasm text inetfn debug
OBJNETG      = mnsg mnscommon io   swis   configure netasm text inetfn \
               showrt af if input output startup tables timer trace inet data

include CModule

#
# Custom rules
#
swis_e.o:
        ${CC} -DEDDS ${CFLAGS} -o $@ swis.c

io_e.o:
        ${CC} -DEDDS ${CFLAGS} -o $@ io.c

# Dynamic dependencies:
