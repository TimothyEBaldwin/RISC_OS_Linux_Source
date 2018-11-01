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
# Makefile for Messages module
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 02-Jun-94  AMcC         Created.
# 08-Dec-94  AMcC         Adjust rules and dependencies so that
#                         tokens don't need to be generated every time
#                         - remove data.Dictionary to regenerate tokens
# 05 Sep 1997 RWB       Corrected error on usage of WFLAGS

#
# Generic options:
#
include Makefiles:StdTools

#
# Program specific options:
#
SOURCE    = s.${TARGET}
BUILTDIR  = rm.${BUILD}.<Build$LocaleListNumeric>
BUILT     = ${BUILTDIR}.${TARGET}
RESDIR    = Resources.${BUILD}.<Build$LocaleListNumeric>
PROCESSDIR= Processed.${BUILD}.<Build$LocaleListNumeric>
UTILS     = Utils
DATA      = Data.${BUILD}.<Build$LocaleListNumeric>
# Note: RESDATA mustn't be in PROCESSDIR !!
RESDATA   = ${DATA}.Data
HELPTAGS  = ${DATA}.HelpTags
HELPMESS  = ${DATA}.HelpMess
HELPTOKENS= ${DATA}.HelpTokens
DICTTAGS  = ${DATA}.DictTags
DICTMESS  = ${DATA}.DictMess
DICTTOKENS= ${DATA}.DictTokens
DICTIONARY= ${DATA}.Dictionary
DIRS      = ${DATA}.Dirs

MINDICT   = Global.${LOCALE}.MinDict
MINDICTT  = Global.${LOCALE}.MinDictT

#
# Utility programs:
#
TAGEXT  = ${UTILS}.TagExtract
MSGEXT  = ${UTILS}.MsgExt
MSGTOK  = ${UTILS}.MsgTok
TOKGEN  = ${UTILS}.TokGen
MSGEXT2 = ${UTILS}.MsgExt2
MSGTOK2 = ${UTILS}.MsgTok2
TOKGEN2 = ${UTILS}.TokGen2
SCANRES = ${UTILS}.ScanRes
RESCOMM = ${UTILS}.ResCommon
LOCALECHK = ${UTILS}.LocaleChk

#
# Generic rules:
#
rom: ${BUILT}
        @echo ${COMPONENT}: rom module built for Build: ${BUILD}.<Build$LocaleListNumeric>

export: ${EXPORTS}
        @echo ${COMPONENT}: export complete

install_rom: ${BUILT}
        ${CP} ${BUILT} ${INSTDIR}.${TARGET} ${CPFLAGS}
        @echo ${COMPONENT}: rom module installed

#
# Clean: clean current build and locale, except dictionary and HelpTokens
# (note - called from srcbuild with TARGET and COMPONENT set only to "Messages"
# and no options - but must clean all targets).
#
clean:
        ${XWIPE} ${BUILTDIR}.* ${WFLAGS}
        ${RM} ${RESDATA}
        ${RM} ${DATA}.Tokenised
        ${RM} ${HELPTAGS}
        ${RM} ${DICTTAGS}
        ${XWIPE} ${RESDIR}.^.* ${WFLAGS}
        ${XWIPE} ${PROCESSDIR}.^.* ${WFLAGS}
        ${RM} s.LocaleList
        @echo ${COMPONENT}: cleaned (Dictionary & HelpTokens not removed)

#
# Clean_all: totally clean all builds and locales
#
clean_all:
        ${XWIPE} Data ${WFLAGS}
        ${XWIPE} o ${WFLAGS}
        ${XWIPE} rm ${WFLAGS}
        ${RM} s.LocaleList
        ${XWIPE} Resources.* ${WFLAGS}
        ${XWIPE} Processed.* ${WFLAGS}
        @echo ${COMPONENT}: all cleaned

resources:
        ${MKDIR} ${RESDIR}.<Locale>.Resources.Global
        SetMacro LocalGlobal$Path Global.<Locale>.,Global.UK.
        ${CP} LocalGlobal:Messages ${RESDIR}.<Locale>.Resources.Global.Messages ${CPFLAGS}
        Unset LocalGlobal$Path
        @echo ${COMPONENT}: resource files copied

${BUILTDIR}.Messages: s.LocaleList ${SOURCE} ${DATA}.Tokenised ${DIRS} force
        ${SCANRES} ${PROCESSDIR} ${RESDATA}
        ${AS} ${ASFLAGS} -o o.Messages ${SOURCE} -pd "ResData SETS \"${RESDATA}\""
        ${LD} ${LDFLAGS} -o $@ -rmf o.Messages

${BUILTDIR}.MessagesHI: s.LocaleList ${SOURCE} ${DIRS} force
        ${MKDIR} rm.${BUILD}.<Build$LocaleListNumeric>
        ${AS} ${ASFLAGS} -o o.MessagesHI ${SOURCE}
        ${LD} ${LDFLAGS} -o $@ -rmf o.MessagesHI

${BUILTDIR}.MessData: ${DATA}.Tokenised ${DIRS}
        ${SCANRES} ${PROCESSDIR} $@

force:; @|

s.LocaleList:; Utils.LocaleChk

#
# Binary Build Environment rules
#
BBETYPE = messages
bbe-messages: bbe-generic-resources-get-alias ${TAGEXT}
  ${MKDIR} ${BBEDIR}.Processed
  ${MKDIR} ${BBEDIR}.Resources
  ${MKDIR} ${BBEDIR}.${UTILS}
  BBE_Export_Dir Global.${LOCALE}
  BBE_Export_Dir s
  ${CP} ${BBEDIR}.s.BBEDefs ${BBEDIR}.s.Defs DF~C~V~R
  BBE_Export_File ${TAGEXT}
  BBE_Export_File ${MSGEXT}
  BBE_Export_File ${MSGTOK}
  BBE_Export_File ${TOKGEN}
  BBE_Export_File ${MSGEXT2}
  BBE_Export_File ${MSGTOK2}
  BBE_Export_File ${TOKGEN2}
  BBE_Export_File ${SCANRES}
  BBE_Export_File ${RESCOMM}
  BBE_Export_File ${LOCALECHK}
  BBE_Export_File ${UTILS}.RemoveEmpt
  BBE_Export_File ${UTILS}.HelpAppend
  BBE_Export_File VersionASM
  BBE_Export_File VersionNum
  BBE_Export_File Makefile
  ${TOUCH} ${BBEDIR}.${UTILS}.Makefile
  ${STRIPDEPEND} ${BBEDIR}.Makefile

#
# Tokenise the Messages file using Help and Dictionary Tokens
#
${DATA}.Tokenised: ${DICTIONARY} ${HELPTOKENS} ${HELPTAGS}
        ${PERL} Utils.HelpAppend ${PROCESSDIR} ${HELPTOKENS}
        ${MSGTOK} ${HELPTOKENS} ${HELPTAGS} 
        ${CP} ${DICTIONARY} ${PROCESSDIR}.Common.Resources.Kernel.Dictionary ${CPFLAGS}
        ${MSGTOK2} ${DICTTOKENS} ${DICTTAGS}
        ${TOUCH} ${DATA}.Tokenised; settype ${DATA}.Tokenised fff

#
# Copy Local Resources, then extract Help and Dictionary token tags
#
${HELPTAGS}: ${TAGEXT} ${DIRS}
        @echo Copying Resources to Processed directory for tokenising ...
        ${MKDIR} ${PROCESSDIR}
        ${RESCOMM} Resources.${BUILD}.<Build$LocaleListNumeric> ${PROCESSDIR}
        ${PERL} Utils.RemoveEmpt ${PROCESSDIR}
        Do ${TAGEXT} ${PROCESSDIR} ${DICTTAGS} ${HELPTAGS}

#
# Help tokens
#
${HELPTOKENS}:
        ${MSGEXT} ${HELPMESS} ${HELPTAGS}
        ${TOKGEN} ${HELPMESS} ${HELPTOKENS}

#
# Use minimum Dictionary tokens:
#
#${DICTIONARY}: ${MINDICT}
#        ${CP} ${MINDICT}  ${DICTIONARY} ${CPFLAGS}
#        ${CP} ${MINDICTT} ${DICTTOKENS} ${CPFLAGS}

#
# Use optimal Dictionary tokens:
#
${DICTIONARY}:
        ${MSGEXT2} ${DICTMESS} ${DICTTAGS}
        ${TOKGEN2} ${DICTMESS} ${DICTTOKENS} ${DICTIONARY}

${TAGEXT}:
        Dir ${UTILS}
        ${MAKE}
        Up

${DIRS}:
        ${MKDIR} Data.${LOCALE}
        ${MKDIR} ${DATA}
        ${MKDIR} o
        ${MKDIR} ${PROCESSDIR}
        ${MKDIR} rm.${BUILD}.<Build$LocaleListNumeric>
        ${TOUCH} ${DIRS}
        
# Dynamic dependencies:
