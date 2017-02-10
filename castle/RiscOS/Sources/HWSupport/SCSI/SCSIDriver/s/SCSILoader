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

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Podule
        GET     Hdr:PublicWS
        GET     Hdr:OSRSI6
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     hdr.SCSIErr
        
        AREA    |!!!Loader|,CODE,READONLY
SCSILoader
        B       ReadByte                ; Read via loader  }
        B       ReturnWriteError        ; Write via loader } Can corrupt R2-R3
        B       Reset                   ; Reset loader     } and R10 only
        MOV     PC,LR                   ; Call loader      }
        DCB     "32OK"                  ; Magic word

SemaPtr
        DCD     0

Reset
        MOV     R2,LR                   ; Push
        BL      CheckIRQSemaphore
        MOV     LR,R2                   ; Pull
        BNE     ReturnIRQError
        LDR     R10,=Podule_BaseAddressANDMask
        AND     R10,R11,R10
        ADD     R10,R10,#&3000          ; Bank address reg
        MOV     R2,#0
        STRB    R2,[R10]                ; Set bank
        RETURNVC

ReadByte
        MOV     R2,LR                   ; Push
        BL      CheckIRQSemaphore
        MOV     LR,R2                   ; Pull
        BNE     ReturnIRQError
        CMP     R1,#&1F800              ; Top of 128k EPROM, the biggest the PCB supports
        BCS     ReturnAddressError
        LDR     R10,=Podule_BaseAddressANDMask
        AND     R10,R11,R10
        ADD     R2,R1,#&800             ; Virtual -> physical
        MOV     R2,R2,ASR #11
        ADD     R0,R10,#&3000           ; Bank address reg
        PHPSEI  R3
        STRB    R2,[R0]                 ; Set bank
        BIC     R2,R1,#&3F800
        LDRB    R0,[R10,R2,LSL #2]      ; Byte within bank (word spacing)
        PLP     R3
        RETURNVC

CheckIRQSemaphore ROUT
        LDR     R10,SemaPtr
        TEQ     R10,#0                  ; Address not yet looked up
        BNE     %FT10
        Push    "R0-R2,LR"
        MOV     R0,#6
        MOV     R1,#0
        MOV     R2,#OSRSI6_IRQsema
        SWI     XOS_ReadSysInfo
        MOVVS   R2,#0
        CMP     R2,#0
        LDREQ   R2,=Legacy_IRQsema
        STR     R2,SemaPtr
        MOV     R10,R2
        Pull    "R0-R2,LR"
10
        LDR     R10,[R10]
        TEQ     R10,#0                  ; => Z=0 if in an IRQ
        MOV     PC,LR

ReturnWriteError
        ADR     R0,ErrorBlock_NotWriteable
        B       ReturnVSet
ReturnAddressError
        ADR     R0,ErrorBlock_AddressTooBig
        B       ReturnVSet
ReturnIRQError
        ADR     R0,ErrorBlock_SCSI_NotFromIRQ
ReturnVSet
        RETURNVS

        MakeErrorBlock NotWriteable
        MakeErrorBlock AddressTooBig
        MakeErrorBlock SCSI_NotFromIRQ

        DCB     "SCSICardLoader",9
        DCB     "1.06 (19 Aug 2013)", 0
        ALIGN

        LTORG
        ASSERT  (. - SCSILoader) < &800
        END
