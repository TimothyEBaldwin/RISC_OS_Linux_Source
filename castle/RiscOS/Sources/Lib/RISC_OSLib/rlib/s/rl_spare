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
; This file defines the amount of static data left for future expansion
; in the shared RISCOS library module.  It must be kept up to date as the
; static data useage of the shared library modules changes, or a version
; of the shared library module will be produced which is incompatible
; with previous stubs.
;
; Copyright (C) Acorn Computers Ltd., 1988.
;
; WRS 09-Jan-90: reduced by 2*4 for static space used by h/c.help.
; JRC 15 Jan 90: reduced by 1*4 for static space used for msgs
; IDJ 24 Jan 90: reduced by 1*4 for static space used by c.txtregexp
; IDJ 5  feb 90: reduced by 1*4 for static space used by c.template
; RM  9  Feb 90: reduced by 1*4 for static space used by c.ctl
; IDJ 12 Feb 90: reduced by 4*4 for static space used by c.txtoptmenu
; IDJ 15 Feb 90: reduced by 2*4 for static space used by c.txtedit (open_handler)
; IDJ 21 Feb 90: reduced by 1*4 for static space used by c.txtopt
; IDJ 13 Mar 90: increased by 4*4 for saved space in baricon
; IDJ 31 May 90: reduced by 8*4 for new c.ctl
; PJC 15 Mar 91: reduced by 4*4 for static space used by c.txtedit
;                reduced by 3*4 for static space used by c.txtfile
; RM  16 Mar 91: reduced by 64*4 for static space used by c.fonts
; PJC 05 Apr 91: reduced by 3*4 for static space used by c.txtedit 
; JSR 17 Apr 91: increased by 9*4 for removal of ctl
; RM  08 May 91: increased by 118*4 for removal of draw modules.
; ECN 10 May 91: increased by 1*4 for removal of trace
; IDJ 24 Jul 91: increased by 1*4 for removal of version string
; ECN 03 Aug 91: increased by 10*4
; IDJ 01 Aug 91: reduced by 2*4 for extra dboxes in dboxquery.c
; ECN 19 Nov 91: increased by 8 * 4, reduced by 14 * 4 for new msgs
; ECN 26 Nov 91: reduced by 6 * 4 so it builds
; ECN 18 Feb 92: increased by 2 * 4
; ECN 23 Mar 92: Set to 0 since only used in ROM build
;                update rlib.s.rlibdata instead

        AREA    |C$$data|

        EXPORT  |RLib_data_end|
 [ 0 = 1
        %       247*4
 ]

|RLib_data_end|

        END
