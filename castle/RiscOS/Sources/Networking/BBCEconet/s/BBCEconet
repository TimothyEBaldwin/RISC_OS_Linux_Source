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
        TTL     A veneer for Econet/NetFS/NetPrint to look like NFS/ANFS ==> Module

        GET     Hdr:ListOpts
        GET     Hdr:Macros
        GET     Hdr:System
        GET     Hdr:Debug
        GET     Hdr:ModHand
        GET     Hdr:FSNumbers
        GET     Hdr:NewErrors
        GET     Hdr:Services
        GET     Hdr:Econet
        GET     Hdr:MsgTrans
        GET     Hdr:Symbols
        GET     Hdr:CPU.Arch

        GET     VersionASM

        SUBT    Module header ==> Networking.BBCEconet.Module

        AREA    |Econet$$Code|, CODE, READONLY, PIC
Origin

        DCD     0 ; Start
        DCD     InitModule - Origin             ; Initialisation
        DCD     KillModule - Origin             ; Finalisation
        DCD     Service - Origin
        DCD     ModuleTitle - Origin
        DCD     HelpString - Origin
        DCD     0 ; UtilsCommands               ; Command Table
        DCD     0 ; MySWIChunkBase
        DCD     0 ; SVCEntry
        DCD     0 ; SWINameTable
        DCD     0
        [ No26bitCode
        DCD     0 ; No messages
        DCD     ModuleFlags - Origin
        ]

        GBLL    ReleaseVersion
ReleaseVersion  SETL True

        [       :LNOT: ReleaseVersion
        InsertDebugRoutines
        ]

MinRxHandle     * 3
MaxRxHandle     * 17

        ^       0, wp ; Store
        Word    TransmitHandle
        Word    LastTxStatus
        Word    RxHandles, MaxRxHandle - MinRxHandle + 1
        ; Compute back to 'begining' of table
ReceiveHandles * RxHandles - (MinRxHandle * 4)

TotalRAMRequired * @

        GBLL    Debug
Debug   SETL    (:LNOT:ReleaseVersion) :LAND: False

        SUBT    Module entry stuff
        OPT     OptPage
ModuleTitle
        DCB     "BBCEconet",0
        ALIGN

        [ No26bitCode
ModuleFlags
        DCD     ModuleFlag_32bit
        ]
        
HelpString
        DCB     "BBCEconet", 9, "$Module_HelpVersion"
        DCB     0
        ALIGN

        SUBT    Initialisation code
        OPT     OptPage

InitModule ROUT
        Push    "r0-r4, lr"
        LDR     r2, [ r12 ]
        TEQ     r2, #0
        BNE     StoreClaimed
        [       Debug
        DLINE   "BBCEconet - Init"
        ]
        MOV     r0, #0
        MOV     r1, #-1
        SWI     XEconet_SetProtection           ; Do a read to discover if Econet is there
        BVS     EconetError
        MOV     r0, #ModHandReason_Claim
        LDR     r3, =:INDEX: TotalRAMRequired
        SWI     XOS_Module
        BVS     ExitInitialisation
        STR     r2, [ r12 ]
StoreClaimed
        MOV     wp, r2
        [       Debug
        DLINE   "BBCEconet - Init"
        ]
        ; Now the stuff which just requires zeroing
        MOV     r0, #0
        MOV     r1, wp                          ; Start of variables
        ADR     r2, TotalRAMRequired
InitialisationLoop
        STR     r0, [ r1 ], #4                  ; It should be all words
        TEQ     r1, r2
        BNE     InitialisationLoop
ClaimVectors
        MOV     r0, #ByteV
        ADRL    r1, OsByte
        MOV     r2, wp
        SWI     XOS_Claim
        MOVVC   r0, #WordV
        ADRL    r1, OsWord
        MOV     r2, wp
        SWIVC   XOS_Claim
ExitInitialisation
        STRVS   r0, [ sp ]
        Pull    "r0-r4, pc"

EconetError
        LDR     r14, [ r0 ]
        LDR     r3, =ErrorNumber_NoSuchSWI
        TEQ     r14, r3
        ADREQ   r0, ErrorNoEconet
        MOVEQ   r1, #0
        MOVEQ   r2, #0
        SWIEQ   XMessageTrans_ErrorLookup
        B       ExitInitialisation

ErrorNoEconet
        DCD     ErrorNumber_NoEconet
        DCB     "NoEco", 0
        ALIGN

ServiceTable
        DCD     0
        DCD     ServiceDecoding - Origin
        DCD     Service_Reset
        DCD     0
        DCD     ServiceTable - Origin

Service         ROUT
        MOV     r0, r0                          ; I have a service call table
        TEQ     r1, #Service_Reset
        MOVNE   pc, lr
ServiceDecoding
        Push    "r0-r4, lr"
        LDR     wp, [ r12 ]
        MOV     r0, #253                        ; Now check reset was NOT hard
        MOV     r1, #0
        MOV     r2, #255
        SWI     XOS_Byte                        ; Read last reset type, only do reset when it was soft
        TEQ     r1, #0
        BEQ     ClaimVectors
        Pull    "r0-r4, pc"

KillModule      ROUT
        ; Totally ignore all errors in this section
        Push    "r0-r2, lr"
        LDR     wp, [ r12 ]
        [       Debug
        DLINE   "BBCEconet - Finalise"
        ]
        MOV     r0, #ByteV
        ADRL    r1, OsByte
        MOV     r2, wp
        SWI     XOS_Release
        [       Debug
        DLINE   "BBCEconet - OsByte released"
        ]
        MOV     r0, #WordV
        ADRL    r1, OsWord
        MOV     r2, wp
        SWI     XOS_Release
        [       Debug
        DLINE   "BBCEconet - OsWord released"
        ]
        LDR     r0, TransmitHandle
        [       Debug
        DREG    r0, "Abandon Tx &"
        ]
        SWI     XEconet_AbandonTransmit
        [       Debug
        DLINE   "BBCEconet - Transmit abandoned"
        ]
        ADR     r1, ReceiveHandles
        MOV     r2, #MinRxHandle
AbandonNextReceiveHandle
        LDR     r0, [ r1, r2, ASL #2 ]
        SWI     XEconet_AbandonReceive
        [       Debug
        DLINE   "BBCEconet - Receive abandoned"
        ]
        INC     r2
        CMP     r2, #MaxRxHandle + 1
        BLE     AbandonNextReceiveHandle
        [       Debug
        DLINE   "BBCEconet - Finalise finished"
        ]
        CLRV                           ; Note that this can't fail
        Pull    "r0-r2, pc"
        
        LTORG
        GET     Interface.s
        END
