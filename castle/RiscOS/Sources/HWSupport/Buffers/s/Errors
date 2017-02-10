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
; > Errors


                MACRO
$label          DoError         $cc
              [ international
$label          B$cc    MakeError
              |
$label          RETURNVS $cc
              ]
                MEND


              [ international
                ^ ErrorBase_BufferManager

                AddError BufferManager_BadSWI,            "BadSWI"
                AddError BufferManager_TooManyBuffers,    "E01"
                AddError BufferManager_BadBuffer,         "E02"
                AddError BufferManager_InUse,             "E03"
                AddError BufferManager_UnableToDetach,    "E04"
                AddError BufferManager_HandleAlreadyUsed, "E05"
                AddError BufferManager_BufferTooSmall,    "E06"
                AddError BufferManager_BufferNotAligned,  "E07"
                AddError BufferManager_BadParm,           "BadParm"
              |
                ^ ErrorBase_BufferManager

                AddError BufferManager_BadSWI,            "SWI not known"
                AddError BufferManager_TooManyBuffers,    "Too many buffers"
                AddError BufferManager_BadBuffer,         "Bad buffer handle"
                AddError BufferManager_InUse,             "Buffer manager in use"
                AddError BufferManager_UnableToDetach,    "Unable to detach current owner"
                AddError BufferManager_HandleAlreadyUsed, "Buffer handle already in use"
                AddError BufferManager_BufferTooSmall,    "Buffer too small"
                AddError BufferManager_BufferNotAligned,  "Buffer must be word aligned"
                AddError BufferManager_BadParm,           "Bad parameters"
              ]

                END

