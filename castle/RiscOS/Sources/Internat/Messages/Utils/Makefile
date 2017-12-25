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
