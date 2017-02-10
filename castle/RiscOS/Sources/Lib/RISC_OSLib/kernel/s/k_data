; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 
; -*- Mode: Assembler -*-
;* Shared library kernel for Arthur/Brazil: static data layout
;* Lastedit: 09 Apr 90 10:25:45 by Harry Meekings *
;
; Copyright (C) Acorn Computers Ltd., 1988.
;

StaticData
imageBase               Variable
rtsDataBase             Variable
rtsDataLimit            Variable

IIHandlerInData         Variable        4
PAHandlerInData         Variable        4
DAHandlerInData         Variable        4
AEHandlerInData         Variable        4

undStack                Variable
svcStack                Variable
unused4                 Variable        9

registerDump            Variable        17      ; PSR in 17th entry

; Handler values on entry, to be restored on exit
oldAbortHandlers        Variable        4

oldExitHandler          Variable        2       ; handler, r12
oldMemoryLimit          Variable

oldErrorHandler         Variable                ; handler, r0, buffer
oldErrorR0              Variable
oldErrorBuffer          Variable

oldCallBackHandler      Variable        3       ; handler, r12, buffer
oldEscapeHandler        Variable        2       ; handler, r12
oldEventHandler         Variable        2       ; handler, r12

oldUpCallHandler        Variable        2       ; handler, r12

; Stuff used for _kernel_system
languageEnvSave         Variable        3       ; (fp, sp, sl over _system)

hadEscape               VariableByte
;******************* beware : position of this byte is fixed ***************
;                             (used in stubs)
kallocExtendsWS         VariableByte
inTrapHandler           VariableByte
beingDebugged           VariableByte
fpPresent               VariableByte    ; zero if not
initialised             InitByte 1
callbackInactive        VariableByte
unused_byte_2           VariableByte

errorBuffer             Variable
errorNumber             Variable
errorString             Variable        63

; Fatal error needs an error buffer - just splat from here on
FatalErrorBuffer        Variable        0

eventCode               Variable
eventUserR13            Variable
eventRegisters          Variable        12      ; r0-r10 and r13

unused2                 Variable        11

heapTop                 Variable
heapLimit               Variable

allocProc               Variable
freeProc                Variable

returnCode              Variable

moduleDataWord          Variable

;********** beware : position of this byte relative to end is fixed ********
;                         (used in s.initmodule)
ClientFlags             VariableByte    ; formerly APCS_A_Client
escapeSeen              VariableByte
unwinding               VariableByte
underDesktop            VariableByte

heapBase                Variable

ArgString               Variable
heapExtender            Variable
knownSlotSize           Variable
initSlotSize            Variable

lk_RestoreOSHandlers    Variable
extendChunk             Variable
extendChunkNotInUse     Variable
_swp_available          ExportedVariable
rootStackChunk          Variable

; Tmp space for expanding PC value in fatal error handler
; 3 words overlaid with returnCodeLimit
pc_hex_buff             Variable        0
; Tmp space for reading RC Limit in _kernel_exit - Reuse.
returnCodeLimit         Variable        3

; Tmp space for expanding reg. dump address in fatal error handler - Reuse
reg_hex_buff            Variable        3

disable_stack_extension ExportedVariable 1

unused                  Variable        14

        END
