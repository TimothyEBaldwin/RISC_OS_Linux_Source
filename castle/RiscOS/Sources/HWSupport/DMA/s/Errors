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
; > Sources.Errors

;-----------------------------------------------------------------------------
;       Call/return the relevant error based on the international flag.
;
                MACRO
$label          DoError         $cc
              [ international
$label          B$cc    MsgTrans_ErrorLookup
              |
$label
                [ "$cc"<>"" :LAND: "$cc"<>"AL"
                DCI     &1A000001 :EOR: Cond_$cc ; branch over on opposite condition
                ]
                MSR     CPSR_f, #V_bit  ; pre-ARM6 compatibility not required
                MOV     pc, lr  ; NZC flags were corrupted on international builds anyway
              ]
                MEND

;-----------------------------------------------------------------------------
;       Define error messages based on the international flag.
;

      [ international
        ^ ErrorBase_DMA

        AddError DMA_BadSWI,            "BadSWI"
        AddError DMA_BadAddress,        "BadAddress"
        AddError DMA_BadChannel,        "E00"
        AddError DMA_AlreadyClaimed,    "E01"
        AddError DMA_BadHandle,         "E02"
        AddError DMA_BadTag,            "E03"
        AddError DMA_NotActive,         "E04"
        AddError DMA_Deregistered,      "E05"
        AddError DMA_BadCycleSpeed,     "E06"
        AddError DMA_BadTransferUnit,   "E07"
        AddError DMA_BadSize,           "E08"
        AddError DMA_NotSuspended,      "E09"
        AddError DMA_ZeroLength,        "E10"
        AddError DMA_Terminated,        "E11"
        AddError DMA_BadHard,           "E12"
        [ HAL
        AddError DMA_TransferTooLong,   "E13"
        AddError DMA_CtrlrInUse,        "E14"
        AddError DMA_ChanInUse,         "E15"
        AddError DMA_NotCircular,       "E16"
        AddError DMA_NotInfinite,       "E17"
        AddError DMA_TooComplex,        "E18"
        AddError DMA_MemoryError,       "E19"
        AddError DMA_DeviceError,       "E20"
        AddError DMA_PreReset,          "E21"
        ]
      |
        ^ ErrorBase_DMA

        AddError DMA_BadSWI,            "SWI value out of range for module DMA"
        AddError DMA_BadAddress,        "Bad address"
        AddError DMA_BadChannel,        "Invalid logical DMA channel number"
        AddError DMA_AlreadyClaimed,    "Logical DMA channel already claimed"
        AddError DMA_BadHandle,         "Invalid DMA channel handle"
        AddError DMA_BadTag,            "Invalid DMA tag"
        AddError DMA_NotActive,         "Not an active DMA transfer"
        AddError DMA_Deregistered,      "DMA channel deregistered"
        AddError DMA_BadCycleSpeed,     "Invalid DMA cycle speed"
        AddError DMA_BadTransferUnit,   "Invalid DMA transfer unit size"
        AddError DMA_BadSize,           "Not a multiple of the transfer unit size"
        AddError DMA_NotSuspended,      "Not a suspended DMA transfer"
        AddError DMA_ZeroLength,        "DMA manager cannot accept zero length or sync gap"
        AddError DMA_Terminated,        "DMA transfer terminated"
        AddError DMA_BadHard,           "Hardware does not support IO DMA"
        [ HAL
        AddError DMA_TransferTooLong,   "DMA transfer too long"
        AddError DMA_CtrlrInUse,        "DMA controller in use"
        AddError DMA_ChanInUse,         "DMA channel in use"
        AddError DMA_NotCircular,       "DMA channel does not support circular transfers"
        AddError DMA_NotInfinite,       "DMA channel does not support infinite transfers"
        AddError DMA_TooComplex,        "DMA transfer too complex"
        AddError DMA_MemoryError,       "Memory error"
        AddError DMA_DeviceError,       "Device error"
        AddError DMA_PreReset,          "DMA unavailable during pre-reset"
        ]
      ]

        END
