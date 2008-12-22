# Copyright 1996 Acorn Computers Ltd
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
# Makefile for Messages module utilities
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-Oct-94  SMC          Created.
#

#
# Generic options:
#
CC      = cc
LD      = link
RM      = remove
WIPE    = -wipe

CCFLAGS = -c -depend !Depend -IC:
WFLAGS  = ~cr~v

#
# Libraries
#
CLIB    = CLIB:o.stubs

#
# Program specific options:
#
TARGETS = TagExtract MsgExt TokGen MsgTok MsgExt2 TokGen2 MsgTok2 ScanRes ResCommon LocaleChk

#
# Rule patterns
#
.c.o:;  ${CC} ${CCFLAGS} -o $@ $<

#
# Generic rules:
#
all: ${TARGETS}

clean:
	${RM} TagExtract
	${RM} MsgExt
	${RM} TokGen
	${RM} MsgTok
	${RM} MsgExt2
	${RM} TokGen2
	${RM} MsgTok2
	${RM} ScanRes
	${RM} ResCommon
	${RM} LocaleChk
	${WIPE} o.* ${WFLAGS}

TagExtract: o.TagExtract
	${LD} -o $@ o.TagExtract ${CLIB}

MsgExt: o.MsgExt o.MsgCommon
	${LD} -o $@ o.MsgExt o.MsgCommon ${CLIB}

TokGen: o.TokGen
	${LD} -o $@ o.TokGen ${CLIB}

MsgTok: o.MsgTok
	${LD} -o $@ o.MsgTok ${CLIB}

MsgExt2: o.MsgExt2
	${LD} -o $@ o.MsgExt2 ${CLIB}

TokGen2: o.TokGen2
	${LD} -o $@ o.TokGen2 ${CLIB}

MsgTok2: o.MsgTok2
	${LD} -o $@ o.MsgTok2 ${CLIB}

ScanRes: o.ScanRes
	${LD} -o $@ o.ScanRes ${CLIB}

ResCommon: o.ResCommon
	${LD} -o $@ o.ResCommon ${CLIB}

LocaleChk: o.LocaleChk
	${LD} -o $@ o.LocaleChk ${CLIB}

# Dynamic dependencies:
