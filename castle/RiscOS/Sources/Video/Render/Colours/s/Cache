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
; > Cache

;------------------------------------------------------------------------------
; 
; TryCache
;
; Look in the cache for the specified colour. 
;
; in    R0 physical colour
; out   V =1 => R0 -> error block
;       else,   R1 -> cache entry (EQ)
;

TryCache ROUT
                    
        Debug   xx,"Lookup in cache",R0

        MOV     R1,R0,LSR #9            ;7 bits red
        EOR     R1,R1,R0,LSR #19        ;5 bits green, bottom 2 bits blue
        EOR     R1,R1,R0,LSR #29        ;3 bits blue
        AND     R1,R1,#CacheEntries-1
                 
        MOV     R1,R1,LSL #5
        ASSERT  CacheEntrySize =32

        LDR     R10,[R1,WP]!    
        TEQ     R10,R0,LSR #8           ;Have we found the correct entry?

        MOV     PC,LR

;------------------------------------------------------------------------------
; 
; WriteCacheEntry
;
; Write a cache entry as required
;
; in    R0 colour number
;       R1 gcol
;       R2 physical colour
;
; out   V =1 => R0 -> error block
;       else,   R10 -> cache entry

WriteCacheEntry ROUT

        Debuga  xx,"Write cache entry for",R2
        Debuga  xx,", colour number",R0
        Debug   xx,", GCOL",R1

        MOV     R10,R2,LSR #9                   ;7 bits red
        EOR     R10,R10,R2,LSR #19              ;5 bits green, bottom 2 bits blue
        EOR     R10,R10,R2,LSR #29              ;3 bits blue
        AND     R10,R10,#CacheEntries -1

        MOV     R10,R10,LSL #5                  ;*32
        ASSERT  CacheEntrySize =32

        MOV     R11,R2,LSR #8                   ;Get &00BBGGRR and store as marker for entry
        STR     R11,[R10,WP]!           
        STR     R0,[R10,#CachedColour]
        STR     R1,[R10,#CachedGCOL]            ;Store colour number and GCOL

        MOV     R11,#-1
        STRB    R11,[R10,#CachedPatternValid]
        STRB    R11,[WP,#CacheEmpty]            ;Flag as the cache not being empty                 

        MOV     PC,LR         
                              
        END

