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
; Title:   s.filter_ven
; Purpose: post and prefilter veneers
; Author:  IDJ
; History: 16-Sep-93: IDJ: Created
;

        IMPORT  |filters_postfilter|
        IMPORT  |filters_prefilter|

        EXPORT  |postfilter_veneer|
        EXPORT  |prefilter_veneer|

        AREA    |Filters$$Code|, CODE, READONLY, PIC

postfilter_veneer

        ; Entry
        ; R0   = reason code
        ; R1  -> event block
        ; R2   = task handle
        ; R12  = "task descriptor"
        ; task paged in

        ; NOTE the returned R0 from filters_postfilter is passed back to the client
        ;

        STMFD   sp!,    {r1-r9, sl, fp, ip, lr}         ; stack everything in sight (except R0!)

        MOV     sl,     sp, LSR #20
        MOV     sl,     sl, LSL #20                     ; SP_LWM (base of SVC stack)

        LDMIA   sl,     {r4, r5}                        ; save old relocation modifiers

        MOV     r2,     r12                             ; task descriptor passed to filters_postfilter
                                                        ; in R2

        LDR     r12,    [r12, #8]                       ; this is the module's "real" private word
                                                        ; which C code needs to get at the
                                                        ; module's static data

        LDR     r12,    [r12]
        LDMIB   r12,    {fp, r12}                       ; new relocation modifiers
        STMIA   sl,     {fp, r12}

        ADD     sl,     sl, #540                        ; C stack limit stuff

        BL      filters_postfilter                      ; filters_postfilter (int event_code,
                                                        ;                     wimp_pollstr *p,
                                                        ;                     TaskDescriptor *t)
                                                        ; note returned R0 is passed back to
                                                        ; Wimp to indicate whether to pass event
                                                        ; to client

        SUB     sl,     sl, #540

        STMIA   sl,     {r4, r5}                        ; restore old relocation modifiers

        LDMFD sp!,      {r1-r9, sl, fp, ip, pc}         ; return from filter

prefilter_veneer

        ; Entry
        ; R0   = event mask
        ; R1  -> event block
        ; R2   = task handle
        ; R12  = "task descriptor"

        STMFD   sp!,    {r1-r9, sl, fp, ip, lr}         ; stack everything in sight (except R0!)

        MOV     sl,     sp, LSR #20
        MOV     sl,     sl, LSL #20                     ; SP_LWM (base of SVC stack)

        LDMIA   sl,     {r4, r5}                        ; save old relocation modifiers

        MOV     r2,     r12                             ; task descriptor passed to filters_postfilter
                                                        ; in R2

        LDR     r12,    [r12, #8]                       ; this is the module's "real" private word
                                                        ; which C code needs to get at the
                                                        ; module's static data

        LDR     r12,    [r12]
        LDMIB   r12,    {fp, r12}                       ; new relocation modifiers
        STMIA   sl,     {fp, r12}

        ADD     sl,     sl, #540                        ; C stack limit stuff

        BL      filters_prefilter                       ; filters_prefilter (int mask,
                                                        ;                    wimp_pollstr *p,
                                                        ;                    TaskDescriptor *t)
                                                        ; note that filters_prefilter returns us
                                                        ; the new mask to be used in R0

        SUB     sl,     sl, #540

        STMIA   sl,     {r4, r5}                        ; restore old relocation modifiers

        LDMFD   sp!,    {r1-r9, sl, fp, ip, pc}         ; return from filter



        END

