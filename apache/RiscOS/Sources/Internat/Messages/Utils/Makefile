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

TARGETS = TagExtract MsgExt TokGen MsgTok MsgExt2 TokGen2 MsgTok2 ScanRes ResCommon LocaleChk
CUSTOMLINK = custom
COMPONENT = Messages utilities
TARGET = _dummy_

include CApp

all: ${TARGETS} ${DIRS}

_dummy_:: ${TARGETS} ${DIRS}
        ${NOP}

clean::
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

TagExtract: o.TagExtract ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.TagExtract ${CLIB}

MsgExt: o.MsgExt o.MsgCommon ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.MsgExt o.MsgCommon ${CLIB}

TokGen: o.TokGen ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.TokGen ${CLIB}

MsgTok: o.MsgTok ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.MsgTok ${CLIB}

MsgExt2: o.MsgExt2 ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.MsgExt2 ${CLIB}

TokGen2: o.TokGen2 ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.TokGen2 ${CLIB}

MsgTok2: o.MsgTok2 ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.MsgTok2 ${CLIB}

ScanRes: o.ScanRes ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.ScanRes ${CLIB}

ResCommon: o.ResCommon ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.ResCommon ${CLIB}

LocaleChk: o.LocaleChk ${DIRS}
        ${LD} ${LDFLAGS} -o $@ o.LocaleChk ${CLIB}

# Dynamic dependencies:
