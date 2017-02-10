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
; > adfs::TimSource.!IIC.IICMod

; *********************************
; ***    C h a n g e   L i s t  ***
; *********************************

; Date          Description
; ----          -----------
; 11-Mar-88     Started
; 15-Mar-88     Disable IRQs around SetC1C0 (uses IOCControlSoftCopy)
; 15-Mar-88     Added code to check for clock syncronisation
; 23-Nov-89     Added 'GET <Hdr>.File' so it assembles again
;               - no change to object
; 08-Jul-91     Look up messages in messages file
; 23-Apr-92 0.11 LRust,SWI errors no longer corrupt R1
;                 * Fixes to IIC transations for BMU
; 28-Apr-92 0.12 LRust, RxByte disables interupts for BMU
; 18-May-92 0.13 TMD - put bodges in for BMU, so interrupt latency isn't awful

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:ModHand
        GET     Hdr:Services
        GET     Hdr:Proc
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:MsgTrans
        GET     Hdr:IIC
        GET     Hdr:PublicWS
        GET     Hdr:OSRSI6
        GET     VersionASM

                GBLL    ReentrancyCheck
ReentrancyCheck SETL    {TRUE} :LAND: :LNOT:HAL         ; Harmless if you don't need it

                GBLL    KernelDoesIIC
KernelDoesIIC   SETL    {TRUE} :LAND: ReentrancyCheck   ; Until the kernel's IIC support is farmed out

TAB     *       9
LF      *       10
FF      *       12
CR      *       13

IOCControlSoftCopy * &106       ; Address of soft copy of IOC control register
 [ KernelDoesIIC
KernelVersion_STB22             * &45200
KernelVersion_STB3              * &47100
KernelVersion_STB400            * &53000
KernelVersion_32bitIRQStack     * &48100 ; trunk versions: beware desktop OS builders!
 ]

; Module workspace allocation

        ^ 0, R12

MessageFile_Block # 16
MessageFile_Open  # 4
 [ ReentrancyCheck
IICSWIThreaded  # 4
   [ KernelDoesIIC
ptr_IRQsema     # 4   
KernelIICStart  # 4
KernelIICEnd    # 4
KernelIRQStackFlag # 4          ; negative if ARM2/3 style IRQ stack
   ]
 ]

IIC_WorkspaceSize * :INDEX: @

; **************** Module code starts here **********************

        AREA    |IIC$Code|, CODE, READONLY, PIC

Module_BaseAddr

        DCD     0
        DCD     IIC_Init         - Module_BaseAddr
        DCD     IIC_Die          - Module_BaseAddr
        DCD     IIC_Service      - Module_BaseAddr
        DCD     IIC_Title        - Module_BaseAddr
        DCD     IIC_HelpStr      - Module_BaseAddr
        DCD     IIC_HC_Table     - Module_BaseAddr
        DCD     IICSWI * Module_SWIChunkSize
        DCD     IIC_SWIHandler   - Module_BaseAddr
        DCD     IIC_SWINameTable - Module_BaseAddr
        DCD     0 ; Code to manually decode swi name (not needed)
        DCD     message_filename - Module_BaseAddr
        DCD     IIC_ModFlags-Module_BaseAddr

IIC_SWINameTable
IIC_Title
        =       "IIC", 0
        =       "Control", 0
        =       0

IIC_HelpStr =       "IIC",TAB, TAB,"$Module_MajorVersion ($Module_Date)"
      [ "$Module_MinorVersion" <> ""
        = " $Module_MinorVersion"
      ]
        = 0
        ALIGN

IIC_ModFlags
      [ No26bitCode
        &       ModuleFlag_32bit
      |
        &       0
      ]

; *****************************************************************************

IIC_HC_Table
        Command IICDevices, 1, 0, International_Help 
        &       0

IIC_Service * Module_BaseAddr

IIC_Init
        Push    "lr"

        LDR     r2, [r12]               ; Hard or soft init ?
        TEQ     r2, #0
        BNE     %FT00

; Hard init

        LDR     r3, =IIC_WorkspaceSize
        MOV     r0, #ModHandReason_Claim
        SWI     XOS_Module
        Pull    "pc", VS

        STR     r2, [r12]

00      MOV     r12, r2

        MOV     r14, #0
        STR     r14, MessageFile_Open

    [ ReentrancyCheck
        STR     r14, IICSWIThreaded
      [ KernelDoesIIC
        MOV     r0, #6
        MOV     r1, #0
        MOV     r2, #OSRSI6_IRQsema
        SWI     XOS_ReadSysInfo
        MOVVS   r2, #0
        CMP     r2, #0
        MOVEQ   r2, #Legacy_IRQsema
        STR     r2, ptr_IRQsema
        MOV     r0, #ModHandReason_LookupName
        ADR     r1, UtilityModuleString
        SWI     XOS_Module
        LDR     r0, [r3, #Module_HelpStr]
        ADD     r0, r0, r3
        BL      GetVerNoFromHelpString
        MOV     r2, #0          ; emergency defaults
        MOV     r3, #0          ; (lr=0 shouldn't appear on the IRQ stack)
        LDR     r0, =KernelVersion_STB22
        TEQ     r1, r0
        ADREQ   lr, KernelAddresses_STB22
        LDMEQIA lr, {r2, r3}
        LDR     r0, =KernelVersion_STB3
        TEQ     r1, r0
        ADREQ   lr, KernelAddresses_STB3
        LDMEQIA lr, {r2, r3}
        LDR     r0, =KernelVersion_STB400
        TEQ     r1, r0
        ADREQ   lr, KernelAddresses_STB400
        LDMEQIA lr, {r2, r3}
        ADR     lr, KernelIICStart
        ASSERT  :INDEX: KernelIICEnd = :INDEX: KernelIICStart + 4
        STMIA   lr, {r2, r3}
        LDR     r0, =KernelVersion_32bitIRQStack
        SUB     r0, r1, r0
        STR     r0, KernelIRQStackFlag
        CLRV
      ]
    ]
        Pull    "pc"

IIC_Die
        Push    "lr"
        LDR     r12, [r12]
        LDR     r0, MessageFile_Open
        CMP     r0, #0
        ADRNE   r0, MessageFile_Block
        SWINE   XMessageTrans_CloseFile
        CLRV
        Pull    "pc"

 [ KernelDoesIIC

UtilityModuleString
        =       "UtilityModule", 0
        ALIGN

KernelAddresses_STB22
        &       &03828A4C, &0382900C ; first (incl) and last (excl) addresses to trap
KernelAddresses_STB3
        &       &0382A808, &0382B334 ; first (incl) and last (excl) addresses to trap
KernelAddresses_STB400
        &       &0382C2FC, &0382CE68 ; first (incl) and last (excl) addresses to trap

        LTORG

; *************************************************************************
;
;       RMEGetVerNo - Read version number from a string
;
; in:   R0 -> string
;
; out:  R0, R4, R5, R12 corrupted
;       R1 = version number in BCD with the decimal point between bits 15 and 16
;            eg "2.34" => &00023400, "5.6789" => &00056789, "17" => &00170000
;            only the last 4 digits of the integer part, and the first 4 decimal places are stored
;

RMEGetVerNo Entry
        MOV     r1, #0
10
        LDRB    r12, [r0], #1
        CMP     r12, #" "
        BEQ     %BT10
11
        SUB     r12, r12, #"0"
        CMP     r12, #9
        ORRLS   r1, r12, r1, LSL #4             ; just keep nibbles - we only need the
        LDRLSB  r12, [r0], #1                   ; result to be ordered, not continous
        BLS     %BT11
        MOV     r5, #0
        CMP     r12, #"."-"0"
        BNE     %FT13
        MOV     r4, #16
12
        SUBS    r4, r4, #4
        BMI     %FT13
        LDRB    r12, [r0], #1
        SUB     r12, r12, #"0"
        CMP     r12, #9
        ORRLS   r5, r5, r12, LSL r4
        BLS     %BT12
13
        ORR     r1, r5, r1, LSL #16
        EXIT

; *************************************************************************
;
;       GetVerNoFromHelpString - Read version number from a module help string
;
; in:   R0 -> module help string
;
; out:  R1 = version number in BCD with the decimal point between bits 15 and 16
;            eg "2.34" => &00023400, "5.6789" => &00056789, "17" => &00170000
;            only the last 4 digits of the integer part, and the first 4 decimal places are stored
;       All other registers preserved
;

GetVerNoFromHelpString Entry "r0, r4, r5, r12"
        MOV     r5, #0                          ; char count
10
        LDRB    r1, [r0], #1
        CMP     r1, #0                          ; check character
        EXIT    EQ                              ; if end of string then no version number so return zero
        ADD     r5, r5, #1
        CMP     r1, #TAB
        ADDEQ   r5, r5, #7
        BICEQ   r5, r5, #7
        CMP     r5, #16                         ; hit verno col yet?
        BLT     %BT10
20
        LDRB    r1, [r0], #1
        CMP     r1, #TAB
        CMPNE   r1, #31                         ; if a control character (except TAB)
        MOVLT   r1, #0                          ; then no version number so return zero
        EXIT    LT
        SUB     r1, r1, #"0"
        CMP     r1, #9                          ; if not a digit
        BHI     %BT20                           ; then try next character
        SUB     r0, r0, #1                      ; was a digit so go back to it
        BL      RMEGetVerNo                     ; read version number from here
        EXIT

 ]

; *****************************************************************************
;
;       IICDevices command handler
;
; in:   R0 = command tail
;       R1 = number of parameters
;       R12 -> private word
;
; out:  R0-R6, R12 may be corrupted
IICDevices_Help   = "HIICD", 0
IICDevices_Syntax = "SIICD", 0
HeadrTok          = "Headr", 0
        ALIGN
IICDevices_Code
        Entry   "r7", 4
        LDR     r12, [r12]
        MOV     r7, #1                  ; no header line yet

        TEQ     r1, #0
        MOVEQ   r5, #0                  ; start at the bottom...
        MOVEQ   r2, #256                ; ...do all buses
        BEQ     %FT05

        MOV     r1, r0
        MOV     r0, #10 :OR: (1:SHL:30)
        SWI     XOS_ReadUnsigned
        MOVVC   r5, r2                  ; start at this bus...
        ADDVC   r2, r5, #1              ; ...and only do that one
        BVS     %FT95
05
        ; Range check bus
        MOV     r0, #14                 
        SWI     XOS_ReadSysInfo         ; read bus count
        MOVVS   r0, #1                  ; at least 1 then

        CMP     r5, r0
        BCS     %FT95                   ; started too high

        CMP     r2, r0
        MOVCS   r4, r0
        MOVCC   r4, r2                  ; MIN(buses, request)
10
        MOV     r6, #0                  ; address
20
        ; Try addressing each device on each bus
        MOVS    r0, r6, LSR #3
        TEQNE   r0, #2_1111
        BEQ     %FT50                   ; skip reserved 2_1111xxx and 2_0000xxx

        MOV     r0, #1
        ORR     r0, r0, r6, LSL #1
        MOV     r1, sp
        MOV     r2, #1                  ; 1 byte read transfer

        TEQ     r5, #0
        BNE     %FT30                   ; Use IIC_Control for pre 5.00 compatibility

        SWI     XIIC_Control
        B       %FT40
30
        Push    "r0-r2"                 ; descriptor
        MOV     r0, sp
        MOV     r1, #1              
        ORR     r1, r1, r5, LSL #24     ; 1 transfer on that bus
        SWI     XOS_IICOp
        ADD     sp, sp, #3*4
40
        BVC     %FT60                   ; no error => good

        LDR     r1, =ErrorNumber_IIC_NoAcknowledge
        LDR     r2, [r0]
        TEQ     r2, r1
        BEQ     %FT50                   ; no ack => goto next

        EXIT    VS                      ; some other error => bad
50
        ADD     r6, r6, #1
        TEQ     r6, #128
        BNE     %BT20                   ; next address

        ADD     r5, r5, #1
        TEQ     r5, r4
        BNE     %BT10                   ; next bus

        CLRV
        EXIT
60
        ; Print heading line out
        SUBS    r7, r7, #1
        SUB     sp, sp, #64             ; space for lookups
        BNE     %FT70

        ADR     r1, HeadrTok
        MOV     r2, sp
        MOV     r3, #64
        BL      CopyMessage

        MOVVC   r0, sp
        SWIVC   XOS_Write0
        SWIVC   XOS_NewLine
        BVS     %FT90
70
        ; Print device detail out
        MOV     r0, r5
        BL      PrintF_3iSpc
        MOVVC   r0, r6, LSL #1
        BLVC    PrintF_3iSpc
        BVS     %FT90

        ; Ask around if any drivers have a definitive result
        LDR     r1, =IICService
        MOV     r2, #Service_IIC_LookupDescription
        MOV     r3, r5, LSL #24
        ORR     r3, r3, r6, LSL #1
        SWI     XOS_ServiceCall
        TEQ     r1, #Service_Serviced
        BEQ     %FT80

        ; Try our device table then
        MOV     r0, r6, LSL #1
        MOV     r2, #'D'
        MOV     r1, sp
        STRB    r2, [r1], #1
        MOV     r2, #3
        SWI     XOS_ConvertHex2

        MOVVC   r1, sp                  ; token 'Dxx'
        ADDVC   r2, sp, #4              ; buffer
        MOVVC   r3, #64 - 4
        BLVC    CopyMessage
        BVS     %FT90
80
        MOV     r0, r2
        SWI     XOS_Write0
        TEQ     r1, #Service_Serviced
        SWINE   XOS_WriteI+'?'          ; guessed by me
        SWIVC   XOS_NewLine
90
        ADD     sp, sp, #64             ; junk space from lookup
        BVC     %BT50
        EXIT    VS
95
        ADR     R0, ErrorBlock_IIC_BadBus
        MOV     R11, #0
        BL      CopyError               ; sets V
        EXIT    VS

PrintF_3iSpc ROUT
        LDR     r1, =&20202020
        Push    "r1-r2, lr"
        ADD     r1, sp, #2              ; might need 2 leading spaces
        MOV     r2, #6
        SWI     XOS_ConvertCardinal1
        RSBVC   r2, r2, #5              ; 5/4/3 -> 0/1/2
        ADDVC   r0, sp, r2
        SWIVC   XOS_Write0
        SWIVC   XOS_WriteI+' '
        ADD     sp, sp, #8
        Pull    "pc"

; *****************************************************************************
;
;       IIC_SWIHandler - Handler for my SWIs
;
; in:   R11 = SWINumber MOD 64 (only 0 is recognised)
;       R0 = device address (bit 0 set => read, clear => write)
;       R1 -> data block
;       R2 = length of data block
;
; out:  R10-R12 may be corrupted

IIC_SWIHandler ROUT
        LDR     r12, [r12]
        MOV     R10, LR
        TEQ     R11, #0                 ; we only have one SWI
        BNE     ReturnNoSuchSWIError

        Push    "R0-R1"
        Push    "R0-R2"                 ; parameters for OS_IICOp
        MOV     R0, R13
        MOV     R1, #1
        SWI     XOS_IICOp
        ADD     R13, R13, #12           ; balance stack
        BVS     %FT10
        Pull    "R0-R1"
        TEQ     PC, PC
        MOVEQ   PC, R10                 ; 32-bit exit: NZC corrupted
        MOVNES  PC, R10                 ; 26-bit exit: NZC preserved
10
    [ :LNOT:HAL
        LDR     R14, [R0]
        SUB     R14, R14, #ErrorNumber_NoSuchSWI :AND: &FF00
        TEQ     R14, #ErrorNumber_NoSuchSWI :AND: &FF
        Pull    "R0-R1",EQ
        BEQ     %FT20                   ; OS_IICOp not known, bitbash IOC ourselves
    ]
        ADD     R13, R13, #4
        Pull    "R1"
        TEQ     PC, PC
        MOVEQ   PC, R10                 ; 32-bit exit: NZC corrupted
        MOVNES  PC, R10                 ; 26-bit exit: NZC preserved

  [ :LNOT:HAL
20
    [ ReentrancyCheck
      [ KernelDoesIIC
        Push    "R0-R2,R14"
        ADR     R14, KernelIICStart
        ASSERT  :INDEX: KernelIICEnd = :INDEX: KernelIICStart + 4
        LDMIA   R14, {R0, R1}
        PHPSEI  R2, R14                 ; disable IRQs while we navigate the IRQ stack
        LDR     R11, ptr_IRQsema
inspect_IRQ_stack
        LDR     R11, [R11]
        CMP     R11, #0
        BEQ     iis_end
        LDR     R14, KernelIRQStackFlag
        TEQ     R14, #0
        LDRMI   R14, [R11, #4*7]        ; get return lr from stack (pushed on ARM2/3, else 26-bit PSR
        BICMI   R14, R14, #ARM_CC_Mask  ; is mangled in by the kernel, and which we have to strip away)
        LDRPL   R14, [R11, #4*8]        ; get pushed lr from stack (no flag bits to worry about)
        CMP     R14, R0
        CMPGE   R1, R14
        BLT     inspect_IRQ_stack       ; try the next IRQ out, in case of IRQ re-entrancy

        ; Kernel IIC code is threaded!
        ; Can't easily do a OS_Heap type trick, so just report an error instead
        PLP     R2
        Pull    "R0-R2,R14"
        B       ReturnIICInUseError

iis_end
        PLP     R2
        Pull    "R0-R2,R14"
      ]
        LDR     R11, IICSWIThreaded
        TEQ     R11, #0
        BNE     ReturnIICInUseError
        MOV     R11, #1
        STR     R11, IICSWIThreaded
    ]
        Push    R10

        BL      Start
        BL      TXCheckAck              ; transmit device address

        MOV     R11, R1
        MOVS    R10, R2
        BEQ     %FT30

        TST     R0, #1                  ; Z => write, NZ => read
        BNE     %FT20
10
        LDRB    R0, [R11], #1           ; read byte from data block
        BL      TXCheckAck              ; transmit, checking for ack
        SUBS    R10, R10, #1            ; decrement byte count
        BNE     %BT10                   ; loop until finished
        BEQ     %FT30                   ; then stop

20
        BL      RXByte                  ; read byte from bus
        STRB    R0, [R11], #1           ; store in data block
        SUBS    R10, R10, #1            ; is it last byte ?
        MOVNE   R0, #0                  ; no, then acknowledge with 0 bit
        MOVEQ   R0, #1                  ; yes, then don't acknowledge
        BL      ClockData               ; but always send ack clock pulse
        BNE     %BT20
30
        BL      Stop
      [ ReentrancyCheck
        MOV     R11, #0
        STR     R11, IICSWIThreaded
      ]
        Pull    R10
        CMP     PC, PC                  ; also clears V in 32-bit modes
        MOVEQ   PC, R10                 ; 32-bit exit: NZC corrupted
        BICS    PC, R10, #V_bit         ; 26-bit exit: NZC preserved

TXCheckAck ROUT
        Push    R14
        BL      TXByte
        BL      Acknowledge
        Pull    R14
        MOVVC   PC, R14                 ; acknowledged ok, so return

        BL      Stop                    ; error, so tidy up
        ADR     R0, ErrorBlock_IIC_NoAcknowledge
        MOV     R11, #0
        BL      CopyError               ; sets V
      [ ReentrancyCheck
;       MOV     R11, #0
        STR     R11, IICSWIThreaded
      ]
        Pull    R14                     ; pull real return address
        TEQ     PC, PC
        MOVEQ   PC, R14                 ; 32-bit exit: NZC corrupted
        ORRS    PC, R14, #V_bit         ; 26-bit exit: NZC preserved
  ] ; :LNOT:HAL

ReturnNoSuchSWIError
        ADR     R0, ErrorBlock_NoSuchSWI
        ADRL    R11, IIC_Title
        BL      CopyError               ; sets V
        TEQ     PC, PC
        MOVEQ   PC, R10                 ; 32-bit exit: NZC corrupted
        ORRS    PC, R10, #V_bit         ; 26-bit exit: NZC preserved

      [ ReentrancyCheck
ReturnIICInUseError
        ADR     R0, ErrorBlock_IIC_Busy
        MOV     R11, #0
        BL      CopyError               ; sets V
        TEQ     PC, PC
        MOVEQ   PC, R10                 ; 32-bit exit: NZC corrupted
        ORRS    PC, R10, #V_bit         ; 26-bit exit: NZC preserved
      ]

        MakeInternatErrorBlock NoSuchSWI,,BadSWI
        MakeInternatErrorBlock IIC_NoAcknowledge,,NoAck
      [ ReentrancyCheck
        MakeInternatErrorBlock IIC_Busy,,InUse
      ]
        MakeInternatErrorBlock IIC_BadBus,,BdBus

  [ :LNOT:HAL
; *****************************************************************************
;
;       SetC1C0 - Set clock and data lines to values in R1 and R0 respectively
;                 optionally waiting for clock to be high
;
; out:  All registers preserved
;

SetC1C0 ROUT
        Push    "R0-R3,R14"
        PHPSEI  R3, R14                         ; disable interrupts round access to IOCControlSoftCopy
        TEQ     PC, #0                          ; set NE to indicate not checking clock
        B       SetOrCheck

SetC1C0CheckClock
        Push    "R0-R3,R14"
        PHPSEI  R3, R14                         ; disable interrupts round access to IOCControlSoftCopy
        TEQ     R0, R0                          ; set EQ to indicate checking clock

SetOrCheck
        ADD     R0, R0, R1, LSL #1              ; R0 := C0 + C1*2

        MOV     R2, #0                          ; prepare to index soft copy
        LDRB    R1, [R2, #IOCControlSoftCopy]   ; read soft copy
        BIC     R1, R1, #&03                    ; clear clock and data
        ORR     R1, R1, R0                      ; put in new clock and data
        ORR     R1, R1, #&C0                    ; make sure two test bits are
                                                ; always set to 1 !
        STRB    R1, [R2, #IOCControlSoftCopy]   ; store back to soft copy

        MOV     R2, #IOC
        STRB    R1, [R2, #IOCControl]
10
        LDREQB  R1, [R2, #IOCControl]           ; if EQ, then wait for clock
        TSTEQ   R1, #i2c_clock_bit              ; to read high
        BNE     %FT30                           ; if not checking, or it went high straight away, skip

20
        LDRB    R1, [R2, #IOCControl]           ; now wait for clock to go high
        TST     R1, #i2c_clock_bit
        BEQ     %BT20

30
        MOV     R0, #10                         ; delay for >= 10/2 microsecs
        BL      DoMicroDelay

        PLP     R3
        Pull    "R0-R3,PC"

; *****************************************************************************
;
;       DoMicroDelay - Delay for >= R0/2 microseconds
;
; in:   R0 = time delay in 1/2 microsecond units
;       R2 -> IOC
;
; out:  R0,R1 corrupted
;

DoMicroDelay ROUT
        Push    R14
        STRB    R0, [R2, #Timer0LR]     ; copy counter into output latch
        LDRB    R1, [R2, #Timer0CL]     ; R1 := low output latch
10
        STRB    R0, [R2, #Timer0LR]     ; copy counter into output latch
        LDRB    R14, [R2, #Timer0CL]    ; R14 := low output latch
        TEQ     R14, R1                 ; unchanged ?
        MOVNE   R1, R14                 ; copy anyway
        BEQ     %BT10                   ; then loop
        SUBS    R0, R0, #1              ; decrement count
        BNE     %BT10                   ; loop if not finished
        Pull    PC

; *****************************************************************************
;
;       ClockData - Clock a bit of data down the IIC bus
;
; in:   R0 = data bit
;
; out:  All registers preserved, including PSR
;

ClockData ROUT
        Push    "R1,R2,R14"

        MOV     R1, #0                  ; clock LO
        BL      SetC1C0

; Disable interrupts if not talking to BMU to ensure clock hi with data hi is only transient
; This allows BMU to detect idle condition by polling

        PHPSEI  R2, R14

        MOV     R1, #1                  ; clock HI
        BL      SetC1C0CheckClock

; Delay here must be >= 4.0 microsecs

        MOV     R1, #0                  ; clock LO
        BL      SetC1C0

        PLP     R2
        
        Pull    "R1-R2, PC"

; *****************************************************************************
;
;       Start - Send the Start signal
;
; out:  All registers preserved
;

Start   ROUT
        Push    "R0-R2,R14"

        MOV     R0, #1                  ; clock HI, data HI
        MOV     R1, #1
        BL      SetC1C0

; Delay here must be >= 4.0 microsecs

        MOV     R0, #0                  ; clock HI, data LO
        MOV     R1, #1
        BL      SetC1C0

; Hold start condition for BMU

        MOV     R2, #IOC
        MOV     R0,#10
        BL      DoMicroDelay

; Delay here must be >= 4.7 microsecs

        MOV     R0, #0                  ; clock LO, data LO
        MOV     R1, #0
        BL      SetC1C0

        Pull    "R0-R2,PC"

; *****************************************************************************
;
;       Acknowledge - Check acknowledge after transmitting a byte
;
; out:  All registers preserved
;       V=0 => acknowledge received
;       V=1 => no acknowledge received
;

Acknowledge ROUT
        Push    "R0-R2,R14"

        MOV     R0, #1                  ; clock LO, data HI
        MOV     R1, #0
        BL      SetC1C0

; Disable interrupts if not talking to BMU to ensure clock hi with data hi is only transient
; This allows BMU to detect idle condition by polling

        PHPSEI  R1, R14
        Push    "R1"

        MOV     R0, #1                  ; clock HI, data HI
        MOV     R1, #1
        BL      SetC1C0CheckClock

; Delay here must be >= 4.0 microsecs

        MOV     R2, #IOC
        LDRB    R2, [R2, #IOCControl]   ; get the data from IOC

        MOV     R0, #0                  ; clock LO, data LO
        MOV     R1, #0
        BL      SetC1C0

        Pull    "R1"
        PLP     R1

        CLRV
        TST     R2, #1                  ; should be LO for correct acknowledge
        SETV    NE                      ; set V if no acknowledge

        Pull    "R0-R2,PC"

; *****************************************************************************
;
;       Stop - Send the Stop signal
;
; out:  All registers preserved
;

Stop    ROUT
        Push    "R0,R1,R14"

        MOV     R0, #0                  ; clock HI, data LO
        MOV     R1, #1
        BL      SetC1C0

; Delay here must be >= 4.0 microsecs

        MOV     R0, #1                  ; clock HI, data HI
        MOV     R1, #1
        BL      SetC1C0

        Pull    "R0,R1,PC"

; *****************************************************************************
;
;       TXByte - Transmit a byte
;
; in:   R0 = byte to be transmitted
;
; out:  All registers preserved
;

TXByte  ROUT
        Push    "R0-R2,R14"

        MOV     R2, R0                  ; byte goes into R2
        MOV     R1, #&80                ; 2^7   the bit mask
10
        ANDS    R0, R2, R1              ; zero if bit is zero
        MOVNE   R0, #1
        BL      ClockData               ; send the bit
        MOVS    R1, R1, LSR #1
        BNE     %BT10

        Pull    "R0-R2,PC"

; *****************************************************************************
;
;       RXByte - Receive a byte
;
; out:  R0 = byte received
;       All other registers preserved, including PSR
;

RXByte  ROUT
        Push    "R1-R4, R14"

        MOV     R3, #0                  ; byte:=0
        MOV     R2, #IOC
        MOV     R4, #7

        MOV     R0, #1                  ; clock LO, data HI
        MOV     R1, #0
        BL      SetC1C0
10
        PHPSEI  R1, LR
        Push    "R1"                    ; Disable ints if not talking to BMU

        MOV     R0, #1                  ; pulse clock HI
        MOV     R1, #1
        BL      SetC1C0CheckClock

        LDRB    R1, [R2, #IOCControl]   ; get the data from IOC
        AND     R1, R1, #1
        ADD     R3, R1, R3, LSL #1      ; byte:=byte*2+(IOC?0)AND1

        MOV     R0, #1                  ; return clock LO
        MOV     R1, #0
        BL      SetC1C0

        Pull    "R1"
        PLP     R1                      ; restore interrupt state

        SUBS    R4, R4, #1
        BCS     %BT10

        MOV     R0, R3                  ; return the result in R0

        Pull    "R1-R4, PC"
  ] ; :LNOT:HAL

; *****************************************************************************
;
;       Internationalisation
;
CopyError Entry r1-r7
        BL      open_messagefile
        EXIT    VS
        MOV     R4,R11                  ; (parameter) -> R4
CopyError0
        ADR     R1, MessageFile_Block
        MOV     R2, #0
        MOV     R5, #0
        MOV     R6, #0
        MOV     R7, #0
        SWI     XMessageTrans_ErrorLookup
        EXIT

CopyMessage Entry "r1,r3-r7"
        BL      open_messagefile
        EXIT    VS
CopyMessage0
        ADR     R0, MessageFile_Block   ; R1 -> token, R2 -> buffer, R3 = buffer size
        MOV     R4, #0
        MOV     R5, #0
        MOV     R6, #0
        MOV     R7, #0
        SWI     XMessageTrans_Lookup
        EXIT

message_filename
        DCB     "Resources:$.Resources.IIC.Messages", 0

        ALIGN

open_messagefile Entry r0-r2
        LDR     r0, MessageFile_Open
        CMP     r0, #0
        EXIT    NE
        ADR     R0, MessageFile_Block
        ADR     R1, message_filename
        MOV     r2, #0
        SWI     XMessageTrans_OpenFile
        STRVS   r0, [sp]
        EXIT    VS
        MOV     r0, #1
        STR     r0, MessageFile_Open
        EXIT

        END
