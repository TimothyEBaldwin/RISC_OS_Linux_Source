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
        TTL     MACRO definitions required for DOSFS > s.MFSmacros
        ; -------------------------------------------------------------------
        ; Generate a suitable bit mask manifest.
        MACRO
$label  bit     $shift
$label  *       (1 :SHL: $shift)
        MEND

        ; -------------------------------------------------------------------
        ; Call the given C routine (returns with V set if (a1 == -1) return).
        ; r12 = private word pointer.
        ; a1,a2,a3,a4,av,v1,v2,v3 available as parameters.
        ; Requires the label "not_enough_stack" to be defined for the
        ; filing system.
        ; The location "sl_offset" should contain the label "_Lib$Reloc$Off".
        ; The location "_errptr" should contain the label "_syserr".
free_stack      *       &00000400       ; 1K minimum stack size
        MACRO
$label  Ccall   $address,$pushnumber,$pushstack
$label
        Push    "sl,fp,lr"              ; preserve entry state
        [ :LNOT: No32bitCode
        MRS     lr,CPSR
        Push    "lr"
        ]
        MOV     sl,sp,LSR #20           ; sl = MByte boundary below sp
        MOV     sl,sl,LSL #20           ; sl = real stack limit
        SUB     fp,sp,sl                ; fp = number of free bytes
        CMP     fp,#free_stack          ; minimum size of stack
        BCC     DOS_not_enough_stack    ; and complain to the user
        LDMIA   sl,{v4,v5}              ; stack-frame description
        LDR     r12,[r12]               ; load private word contents
        LDMIB   r12,{r11,r12}           ; load stack-frame description
        STMIA   sl,{r11,r12}            ; and store at stack-limit
        ADRL    lr,sl_offset
        LDR     lr,[lr,#&00]            ; size of stack overflow buffer
        ADD     sl,sl,lr                ; add on stack overflow buffer
        MOV     fp,#&00000000           ; no frame-pointer
        ; stack items if the user has requested so
        [       ("$pushnumber" <> "")
        [       ("$pushstack" <> "") :LAND: ($pushnumber <> 0)
        Push    "$pushstack"
        ]
        ]
        BL      $address
        ; junk stack items if the user pushed any
        [       ("$pushnumber" <> "")
        [       ("$pushstack" <> "") :LAND: ($pushnumber <> 0)
        ADD     sp,sp,#($pushnumber * 4)
        ]
        ]
        ADRL    lr,sl_offset
        LDR     lr,[lr,#&00]            ; stack overflow buffer
        CMP     r0,#&FFFFFFFF           ; (-1) == error state
        ADREQL  r0,|_errptr|
        LDREQ   r0,[r0,#&00]            ; offset in static data area
        SUBEQ   lr,sl,lr
        LDREQ   fp,[lr,#&04]            ; reference our static data
        ADDEQ   r0,fp,r0                ; reference the pointer
        LDREQ   r0,[r0,#&00]            ; and load the pointer
        ; this code must NOT affect the Z bit
        ADRL    lr,sl_offset
        LDR     lr,[lr,#&00]            ; stack overflow buffer
        SUB     sl,sl,lr                ; recover true stack-limit
        STMIA   sl,{v4,v5}              ; and restore stack-limit contents

        [ :LNOT: No32bitCode
        Pull    "lr"
        ORREQ   lr,lr,#V_bit
        MSR     CPSR_cxsf,lr
        Pull    "sl,fp,lr"              ; recover entry state
        |
        Pull    "sl,fp,lr"              ; recover entry state
        SETV    EQ
        CLRV    NE                      ; exit with V reflecting error state
        ]
        MEND

        ; -------------------------------------------------------------------
        ; Place in register $a the maximum or minimum value of register $a
        ; and register $b.

        MACRO
$label  max     $a,$b
$label
        CMP     $a,$b
        MOVLT   $a,$b
        MEND

        MACRO
$label  min     $a,$b
$label
        CMP     $a,$b
        MOVGT   $a,$b
        MEND

        ; -------------------------------------------------------------------
        ; Allocate a fixed amount of object space, and place the given text
        ; into it.

        MACRO
$label  FixDCB  $n,$string
        ASSERT  ((:LEN: "$string") < $n)        ; complain if string too long
$label  =       "$string"                       ; place string into memory
        %       ($n - (:LEN: "$string"))        ; and zero the remainder
        MEND

        END
