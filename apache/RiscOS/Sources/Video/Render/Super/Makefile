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
# Makefile for SuperSample
#
# ***********************************
# ***    C h a n g e   L i s t    ***
# ***********************************
# Date       Name         Description
# ----       ----         -----------
# 23-Mar-01  SNB          Recreated.
#

COMPONENT  = SuperSample
TARGET     = Super
HEADER1    = Super
RESOURCES  = no

MATRIX1    = Matrix1.s
MATRIX2    = Matrix2.s

include StdTools
include AAsmModule

clean::
        @${RM} ${MATRIX1}
        @${RM} ${MATRIX2}
        ${RM} Matrix1
        ${RM} Matrix2
        @${RM} s.Matrix1
        @${RM} s.Matrix2

${ROM_OBJECT} ${SA_OBJECT} ${DBG_OBJECT}: ${MATRIX1} ${MATRIX2}

.SUFFIXES: .c .s

.c.s:
        ${MAKE} -f matrix/mk COMPONENT=$* THROWBACK=${THROWBACK}
        ${RUN}$* $@

# Dynamic dependencies:
