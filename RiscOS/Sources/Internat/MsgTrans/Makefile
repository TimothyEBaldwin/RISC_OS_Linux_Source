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
# Makefile for MsgTrans
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 25-May-94  AMcC         Created.
#

COMPONENT = MessageTrans
TARGET    = MsgTrans
HEADER1   = MsgTrans
HEADER2   = MsgMenus

ASDFLAGS  =\
 -PD "AltTitleAndSWI SETL {TRUE}" \
 -PD "standalone SETL {TRUE}" \
 -PD "MergedMsgs SETS \"${MERGEDMSGS}\""

include StdTools
include AAsmModule

# Dynamic dependencies:
