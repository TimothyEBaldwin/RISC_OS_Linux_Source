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

; True if building shared library (ROM or softload), false if building static
; lib (e.g. ANSILib)
      [ :LNOT: :DEF: SHARED_C_LIBRARY
        GBLL    SHARED_C_LIBRARY
SHARED_C_LIBRARY SETL {FALSE}
      ]

; Macro for declaring the existence of architecture-specific variants of
; routines, to allow shared library clients to be linked directly to the most
; optimal routine
; N.B. stub 'Entry' macros must link to symbol |xxx$variant| in order for the
; variants to be detected
; N.B. currently only features which have a safe default of 0 can be tested for
; - features where the safe default is 1 (MUL Rd == Rn restriction, etc.) will
; need some modifications making to PickRoutineVariant.
;
; Variant symbols have a byte offset of 1, allowing the stub setup code to
; detect the presence of a variant entry just by looking at the alignment of the
; pointer (no need to update Entry's to reflect whether variants in use)
;
; Note that a suffix of '$variant' was chosen so that the '$' would prevent the
; symbol name being included in the embedded ROM debug symbols - This makes
; sure that (when variants aren't required) the original function name is the
; only one that makes it into the debug symbols.

        MACRO
        RoutineVariant $sym, $archflag, $featflag0, $featflag1, $featflag2
        ALIGN
   [ SHARED_C_LIBRARY
        LCLS    VariantName
VariantName SETS VBar :CC: "$sym" :CC: :CHR:36 :CC: "variant" :CC: VBar
        EXPORT  $VariantName
     [ No$archflag :LAND: Support$archflag
        DCB     CPUFeature_$featflag0
$VariantName
      [ "$featflag1" <> ""
        DCB     CPUFeature_$featflag1
      |
        DCB     255
      ]
      [ "$featflag2" <> ""
        DCB     CPUFeature_$featflag2
      |
        DCB     255
      ]
        DCB     255 ; PickRoutineVariant will need adjusting if fourth flag needed
        DCD     $sym._Support$archflag - .
        DCD     $sym._No$archflag - .
     |
$VariantName * $sym
     ]
   ]
        MEND

        END
