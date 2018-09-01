; Assembler source for FPA support code and emulator
; ==================================================
; Workspace layout definitions.
;
; Copyright (C) Advanced RISC Machines Limited, 1992-7 (now named ARM Limited).
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
;     * Redistributions of source code must retain the above copyright notice,
;       this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Advanced RISC Machines Limited nor ARM Limited nor
;       the names of its contributors may be used to endorse or promote
;       products derived from this software without specific prior written
;       permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.

; Sort out the undefined instruction handler convention.

                        GBLL    UndefHandStandAlone
UndefHandStandAlone     SETL    UndefHandlerConvention = "StandAlone"
                        GBLL    UndefHandBranchTable
UndefHandBranchTable    SETL    UndefHandlerConvention = "BranchTable"

        ASSERT  UndefHandStandAlone :LOR: UndefHandBranchTable

; First the definitions of the context workspace.

                GBLA    CurrentWSLen
CurrentWSLen    SETA    0

                ^       0,Rwp
        [ :LNOT: MultipleContexts
WorkspaceStart  #       0
        ]
ContextStart    #       0

        [ FPEWanted

; The following definitions apply to the FPE only.
;
; An area which holds the register values. If the FPE4WordsPerReg
; optimisation is off, each entry is three words. Otherwise each entry is
; four words, in order to speed up addressing; only the first three words
; are used, though. Note that we also speed up addressing by making this the
; first entry in the context workspace.

        [ FPE4WordsPerReg
FPE_Regs        #       4*4*8
        |
FPE_Regs        #       4*3*8
        ]

FPEContextEnd   #       0

FPEContextLen   EQU     FPEContextEnd - ContextStart

          [ FPEContextLen > CurrentWSLen
CurrentWSLen    SETA    FPEContextLen
          ]

        ]

        [ SCWanted

                ^       :INDEX:ContextStart,Rwp

; The following definitions apply to the FPASC only.
;
; An area to hold register values when the context is inactive. Each entry is
; three words. Note that we speed up addressing to some extent by making
; this the first entry in the context workspace.

SC_RegDump      #       4*3*8

SCContextEnd    #       0

SCContextLen    EQU     SCContextEnd - ContextStart

          [ SCContextLen > CurrentWSLen
CurrentWSLen    SETA    SCContextLen
          ]

        ]

; Now the common context variables.

                ^       CurrentWSLen,Rwp

; The next location is where the FPE always stores its FPSR, and where the
; FPASC stores the FPSR of a deactivated context. This is in a common
; location because its top bit is required in various places to distinguish
; between hardware and software contexts.

MemFPSR         #       4

; Next, a location where information about disabling, pending exceptions,
; etc., is stored. This is used in completely different fashions by the
; FPASC code and FPE code.

DisableInfo     #       4

                GET     $VeneerDir.ctxtws$FileExt

ContextEnd      #       0

ContextLength   EQU     ContextEnd - ContextStart

; Definitions of the global workspace follow on from those of the context
; workspace if MultipleContexts = {FALSE}, and are a separate set of
; definitions if MultipleContexts = {TRUE}. In the latter case, we start
; with a pointer to the current context.

        [ MultipleContexts
                ^       0,Rwp
WorkspaceStart  #       0
        ]

CurrentContext  #       4

; Next, we need indirect pointers to handlers for undefined instructions
; that this code decides are not for it. If we're using the "stand alone"
; undefined instruction linkage convention, we just need one of these; if
; we're using the "branch table" convention, we need one for coprocessor 1
; and one for coprocessor 2.

        [ UndefHandStandAlone
NextHandler     #       4
        ]

        [ UndefHandBranchTable
NextHandler1    #       4
NextHandler2    #       4
        ]

; SysID of the hardware that is present, or -1 if no hardware is present.

HardwareID      #       4

; Finally, the veneer-defined global workspace variables.

                GET     $VeneerDir.globalws$FileExt

WorkspaceEnd    #       0

WorkspaceLength EQU     WorkspaceEnd - WorkspaceStart

        END
