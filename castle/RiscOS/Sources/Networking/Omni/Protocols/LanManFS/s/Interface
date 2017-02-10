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
; **************************************************
;
; !Lanman.s.interface
;
; All those horrible little assembler bits
;
; Original based on FSinC
; 20-10-94  IH  Add suicide callback bit
;               Add 'free' veneer
; **************************************************

        GET   Hdr:ListOpts
        GET   Hdr:Macros
        GET   Hdr:System
        GET   Hdr:APCS.<APCS>
        GET   Hdr:ModHand
        GET   Hdr:ResourceFS

        ; ---------------------------

SWIClass        SETS    "LanMan"

        ^       &49240
        AddSWI  OmniOp  ; &49240
        AddSWI  FreeOp  ; &49241

        ; -----------------------------

        IMPORT  |Image$$RO$$Base|
        IMPORT  |_Lib$Reloc$Off$DP|
        IMPORT  fsentry_open
        IMPORT  fsentry_getbytes
        IMPORT  fsentry_putbytes
        IMPORT  fsentry_args
        IMPORT  fsentry_close
        IMPORT  fsentry_file
        IMPORT  fsentry_func
        IMPORT  fsentry_gbpb

        EXPORT  veneer_fsentry_open
        EXPORT  veneer_fsentry_getbytes
        EXPORT  veneer_fsentry_putbytes
        EXPORT  veneer_fsentry_args
        EXPORT  veneer_fsentry_close
        EXPORT  veneer_fsentry_file
        EXPORT  veneer_fsentry_func
        EXPORT  veneer_fsentry_gbpb

        AREA    FSEntry_Interfaces,REL,CODE,READONLY

        LTORG

veneer_fsentry_open
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*0
        B       fsentry_common
veneer_fsentry_getbytes
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*1
        B       fsentry_common
veneer_fsentry_putbytes
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*2
        B       fsentry_common
veneer_fsentry_args
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*3
        B       fsentry_common
veneer_fsentry_close
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*4
        B       fsentry_common
veneer_fsentry_file
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*5
        B       fsentry_common
veneer_fsentry_func
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*6
        B       fsentry_common
veneer_fsentry_gbpb
        Push    "R8"
        MOV     R8, #fsentry_branchtable - %F10 + 4*7
        B       fsentry_common


fsentry_common  ; os_error *fsentry_common( Parameter_Block * )

        ; Store the input registers onto the stack
        Push    "R0-R7, SL, FP, IP, LR"

        MOV     sl, SP, LSR #20
        MOV     sl, sl, LSL #20         ; SP_LWM
        LDMIA   sl, {v1, v2}            ; save old reloc modifiers over fn call
        LDR     r12, [r12]              ; private word pointer
        LDMIB   r12, {fp, r12}          ; new relocation modifiers
        STMIA   sl,  {fp, r12}          ; set by module init
        MOV     fp, #0                  ; halt C backtrace here!

        ; This is equivalent of 'ADD r10, r10, #0' + |_Lib$Reloc$Off$DP|
        DCD     |_Lib$Reloc$Off$DP| + &E28AA000

        ; Pass a pointer to the structure on the stack
        MOV     a1, SP

        ; BL    fsentry_branchtable[R8]
        MOV     lr, pc
        ADD     pc, pc, R8

        ; This is equivalent of 'SUB r10, r10, #0' + |_Lib$Reloc$Off$DP|
        DCD     |_Lib$Reloc$Off$DP| + &E24AA000

10      ; This label must be the 2nd instruction past the above ADD pc, pc, R8

        STMIA   sl, {v1, v2}            ; restore old reloc modifiers

        ; Save the returned value in R8
        MOVS    R8, r0
        ; Get the stuff off the stack
        Pull    "r0-r7, sl, fp, ip, lr"
        ; If returned value indicates an error, then set the overflow and put it back in r0
        MOVNE   r0, R8

        ; Mess about with the flag bits in R8
        [ :LNOT: No32bitCode
        ; If we're allowed to use 32-bit code, it all falls out really nicely
        MOVNE   R8, #V_bit              ; R8 == 0 if Z, V set if !Z
        |
        MOV     R8, pc
        BIC     R8, R8, #C_bit + V_bit
        ORRNE   R8, R8, #V_bit          ; V = err != 0
        ]
        TST     r1, r1                  ; C = r1 == 0
        ORREQ   R8, R8, #C_bit

        ; Move the flag bits into psr
        [ :LNOT: No32bitCode
        MSR     CPSR_f, r8
        |
        TEQP    R8, #0
        NOP
        ]

        Pull    "R8"

        MOV     pc, lr

fsentry_branchtable
        B       fsentry_open
        B       fsentry_getbytes
        B       fsentry_putbytes
        B       fsentry_args
        B       fsentry_close
        B       fsentry_file
        B       fsentry_func
        B       fsentry_gbpb

        AREA    |C$$code|, CODE, READONLY

; Suicide callback --------------------------------------------------

; This is used when we get a service call to terminate the module.
; For some reason, we can't terminate there and then, so it has to
; be done on a callback.

        EXPORT   OmniS_Suicide

OmniS_Suicide ; (char *modulename)
        FunctionEntry
        MOV     r1, r0                  ; save module_title address (called as r12)
        ADR     r0, suicide_cb
        SWI     XOS_AddCallBack
        Return

suicide_cb
        Push    "r0-r1, r14"
        MOV     r0, #ModHandReason_Delete
        MOV     r1, r12
        SWI     XOS_Module
        Pull    "r0-r1, pc"

; Free routine -------------------------------------------

; This is the routine which is passed to Free_Register. It has
; a number of particularly poor characteristics like being called
; in user mode with little or no stack, and returning a value
; in the Z bit. For this reason the routine calls our 'FreeOp'
; SWI.

; Free module only worried about V and Z, doesn't mind C and N being
; corrupted.  Removed all the unnecessary flag todging and non-32-bit
; friendly code: V is already set correctly, the TEQ sets the Z as
; required.  Yes, the return value is already stacked. (sbrodie: 19/11/99)

        EXPORT   Free_ServiceRoutine

Free_ServiceRoutine ; On entry R0 = reason code 0-3
        Push   "R1, R4"
        SWI    XLanMan_FreeOp
        TEQ    R1,#0                    ; set Z if R1 was 0 on exit, preserve V
        Pull   "R1, R4, PC"             ; As it says in book

        DCB    "Nothing libellous or obscene", 0 ; Contractual obligation
        ALIGN

        END
        
