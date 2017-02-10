/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
/*> h.MultiFS <*/
/*-------------------------------------------------------------------------*/
/* RISC OS MultiFS structures                   Copyright (c) 1991 JGSmith */
/*-------------------------------------------------------------------------*/

#ifndef __h_MultiFS
#define __h_MultiFS

/*-------------------------------------------------------------------------*/
/* disc format specification structure:
 *
 *  offset  length  description
 *  ---------------------------
 *    00      4     sector size
 *    04      4     gap 1 side 0
 *    08      4     gap 1 side 1
 *    0C      4     gap 3
 *    10      1     sectors per track
 *    11      1     density: 0=SD;1=DD;2=HD;3=ED
 *    12      1     options: bit0    - lay down index mark (1)
 *                           bit1    - single step (0); double step (1)
 *                           bits2-3 - alternate sides    (0)
 *                                     format side 1 only (1)
 *                                     format side 2 only (2)
 *                                     sequence the sides (3)
 *                           bits4-7 - reserved (should be 0)
 *    13      1     start sector number on track
 *    14      1     sector interleave
 *    15      1     side/side sector skew
 *    16      1     track/track sector skew
 *    17      1     sector fill value
 *    18      4     number of tracks to format
 *    1C      36    reserved (must be 0)
 */

/* density information */
typedef enum {Sdensity=1,Ddensity=2,Hdensity=4,Edensity=8} density ;

/* format options */
#define o_indexmark    (1 << 0)  /* lay down an index mark */
#define o_doublestep   (1 << 1)  /* double step (default is single step) */

#define sideinfoshift  (2)                   /* shift to side information */
#define o_alternate    (0 << sideinfoshift)  /* alternate sides */
#define o_side1only    (1 << sideinfoshift)  /* side 1 only */
#define o_side2only    (2 << sideinfoshift)  /* side 2 only */
#define o_sequence     (3 << sideinfoshift)  /* sequence sides */
#define sideinfomask   (3 << sideinfoshift)

typedef struct format_spec {
/* sector size in bytes */  word secsize ;
/* gap 1 side 0 */          word gap1side0 ;
/* gap 1 side 1 */          word gap1side1 ;
/* gap 3 */                 word gap3 ;
/* sectors per track */     byte secstrk ;
/* density (see below) */   byte density ;
/* options (see below) */   byte options ;
/* start sector on track */ byte startsec ;
/* sector interleave */     byte secileave ;
/* side-to-side skew */     byte sideskew ;
/* track-to-track skew */   byte trackskew ;
/* sector fill value */     byte fillvalue ;
/* number of tracks */      word tracks ;
/* reserved (NULL) */       word reserved0 ;
/* reserved (NULL) */       word reserved1 ;
/* reserved (NULL) */       word reserved2 ;
/* reserved (NULL) */       word reserved3 ;
/* reserved (NULL) */       word reserved4 ;
/* reserved (NULL) */       word reserved5 ;
/* reserved (NULL) */       word reserved6 ;
/* reserved (NULL) */       word reserved7 ;
/* reserved (NULL) */       word reserved8 ;
                           } format_spec ;

/*-------------------------------------------------------------------------*/
/* Supported formats description structure:
 *
 * offset size description
 * -----------------------
 *   00    4   link to next block (or NULL to terminate list)
 *   04    4   pointer to RMA block containing menu text
 *   08    4   pointer to RMA block containing help text
 *   0C    4   SWI number for "DOSFS_DiscFormat"
 *   10    4   r0 parameter to be used for "DOSFS_DiscFormat" SWI
 *   14    4   SWI number for "DOSFS_LayoutStructure"
 *   18    4   r0 parameter to be used for "DOSFS_LayoutStructure" SWI
 *   1C    4   flags
 */

typedef struct format_info {
/* next structure ptr */    struct format_info *link ;
/* RMA block of MENU text */void               *menu_text ;
/* RMA block of !HELP txt */void               *help_text ;
/* SWI number to Format */  word                format_SWI ;
/* r0 for Format SWI */     word                format_r0 ;
/* SWI number to Layout */  word                layout_SWI ;
/* r0 for Layout SWI */     word                layout_r0 ;
                            word                flags;
#define                                         EnumFormats_HasFormatParam      (1 << 1)
                            void               *format_desc;
                           } format_info ;

/*-------------------------------------------------------------------------*/

#endif /* __h_MultiFS */

/*-------------------------------------------------------------------------*/
/*> EOF h.MultiFS <*/
