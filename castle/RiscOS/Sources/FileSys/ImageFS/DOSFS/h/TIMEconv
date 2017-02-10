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
/*> h.TIMEconv <*/
/*-------------------------------------------------------------------------*/
/* RISC OS time conversion function             Copyright (c) 1989 JGSmith */
/*-------------------------------------------------------------------------*/

#ifndef __h_TIMEconv
#define __h_TIMEconv

/*-------------------------------------------------------------------------*/
/* build a picture of time */

#define tickssec      (100)             /* centi-seconds in a second */
#define ticksmin      (tickssec * 60)   /* seconds in a minute */
#define tickshour     (ticksmin * 60)   /* minutes in a hour */
#define ticksday      (tickshour * 24)  /* hours in a day */
#define ticksyear     (0xBBF81E00)      /* avoid cpp overflow */
/* This equates to 0xBBF81E00 if "cpp" can't do it. The month additions
 * work out as follows (number, month (days in month)):
 *      0x00000000 Jan (31)
 *      0x0FF6EA00 Feb (28)
 *      0x1E625200 Mar (31)
 *      0x2E593C00 Apr (30)
 *      0x3DCC5000 May (30)
 *      0x4DC33A00 Jun (31)
 *      0x5D364E00 Jul (31)
 *      0x6D2D3800 Aug (31)
 *      0x7D242200 Sep (30)
 *      0x8C973600 Oct (31)
 *      0x9C8E2000 Nov (30)
 *      0xAC013400 Dec (31)
 */

/*-------------------------------------------------------------------------*/
/* RISC OS and BBC centi-second time is stored in a 5byte structure */
typedef struct {
                word lo ;       /* lo 4 bytes of centi-second time */
                word hi ;       /* hi 1 byte  of centi-second time */
               } time5byte ;

/* Fully expanded time structure. This is to make it easier to convert to
 * different time encodings. The limit on the "year" field is defined by
 * the current RISC OS RTC system.
 */
typedef struct {
                int year ;              /* 1900..2079 */
                int month ;             /* 1..12 */
                int day ;               /* 1..31 */
                int hour ;              /* 0..23 */
                int minutes ;           /* 0..59 */
                int seconds ;           /* 0..59 */
                int centiseconds ;      /* 0..99 */
               } BCDtime ;

typedef struct {
                byte year ;             /* 0..99 */
                byte month ;            /* 1..12 */
                byte day ;              /* 1..31 */
                byte weekday ;          /* 1..7  */
                byte hour ;             /* 0..23 */
                byte minute ;           /* 0..59 */
                byte second ;           /* 0..59 */
               } ROBCDtime ;

/*-------------------------------------------------------------------------*/

time5byte *get_RISCOS_TIME(time5byte *time_buffer) ;
void       MSDOStoRISCOS(word DOStime,word DOSdate,time5byte *outtime) ;
char      *MSDOStoSTRING(word DOStime,word DOSdate) ;
word       RISCOStoTIME(time5byte *intime) ;
word       RISCOStoDATE(time5byte *intime) ;
int        longestTIMEstring(void) ;

/*-------------------------------------------------------------------------*/

#endif /* __h_TIMEconv */

/*-------------------------------------------------------------------------*/
/*> EOF h.TIMEconv <*/
