# 
# Copyright (c) 2010, RISC OS Open Ltd
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met: 
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of RISC OS Open Ltd nor the names of its contributors
#       may be used to endorse or promote products derived from this software
#       without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Makefile for VFPSupport
#

# Use machine type to determine whether support code is needed
# Can also be overridden on command line by specifying SUPPORTCODE
# Assuming we're targeting a machine capable of VFP, Cortex-A8 is currently the
# only machine type which doesn't need any support code at all 
DEFSUPPORTCODE = TRUE
ifneq (,$(findstring ${MACHINE},CortexA8))
DEFSUPPORTCODE = FALSE
endif

SUPPORTCODE ?= ${DEFSUPPORTCODE}

COMPONENT  = VFPSupport
ASMHDRS    = VFPSupport
OBJS       = GetAll
HDRS       =
CMHGFILE   =
ASMDEFINES += -PD "SupportCode SETL {${SUPPORTCODE}}"
RAMASMDEFINES += -PD "standalone SETL {TRUE}" -PD "MergedMsgs SETS \"${MERGEDMSGS}\""

ifeq (${SUPPORTCODE},TRUE)
OBJS += softfloat classify
VPATH = softfloat
endif

include CModule

# We don't want to link to CLib
ROM_LIBS =
SA_LIBS  =
ROM_SYMS =

CFLAGS += -apcs /nofp

# Force -cpu 5 when building for 'all' to reduce assembler support code
# requirements. This shouldn't pose a problem since the C code will only get hit
# once we've verified VFP hardware is present (i.e. ARMv5+ CPU)
ifneq (,$(findstring ${MACHINE},All All32))
CFLAGS += -cpu 5
endif

# decgen rules
ACTIONS = actions/common \
          actions/ARMv7_VFP

ENCODINGS = Build:decgen.encodings.ARMv7 \
            Build:decgen.encodings.ARMv7_nASIMD \
            Build:decgen.encodings.ARMv7_VFP

DECGEN = <Tools$Dir>.Misc.decgen.decgen

classify.c: $(ACTIONS) head.c $(ENCODINGS)
	$(DECGEN) -bits=32 -e -DCDP= -DLDC_STC= -DMRC_MCR= -DVFP1=(cond:4) "-DVFP2={ne(cond,15)}" -DAS1(X)=1111001[X] -DAS2=11110100 $(ENCODINGS) -valid -a $(ACTIONS) -pre head.c -o classify.c -prefix=classify_ -name=classify -default=UNDEFINED -updatecache cache/classify -maxmaskbits=3

classify.o: classify.c shared.h
	${CC} ${CFLAGS} -o $@ classify.c

classify.oz: classify.c shared.h
	${CC} ${CFLAGS} ${C_MODULE} -o $@ classify.c

shared.h: hdr.shared
	${PERL} Build:Hdr2H hdr.shared $@

softfloat.o: shared.h

clean::
	${RM} c.classify
	${RM} h.shared

# Dynamic dependencies:
