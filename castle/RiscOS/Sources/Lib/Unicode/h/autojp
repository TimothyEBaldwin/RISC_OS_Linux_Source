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
/* > autojp.h */

/**************************************************************************/
/*                                                                        */
/* Copyright [1997-2003] All rights reserved.                             */
/*                                                                        */
/* This file may be included in profit making or non profit making        */
/* software on any system running any version of RISC OS, provided it was */
/* used along with a licensed binary of Unicode Lib                       */
/* It is supplied "as is" without warranty, express or implied, of        */
/* merchantability for any purpose.                                       */
/* No liability can be claimed for any direct or indirect loss            */
/**************************************************************************/

/*
 * Autodetect japanese encoding from EUC, JIS, ShiftJIS and ASCII
 */


#ifndef unicode_autojp_h
#define unicode_autojp_h

/* pass into *pstate in first call */

#define autojp_state_INIT	0

/* returned values */

#define autojp_ASCII		0	/* only ascii characters received so far - unambiguous */
#define autojp_THINKING		1	/* had something that may not be ascii but not sure */
#define autojp_UNDECIDED	2	/* could be EUC or SJIS, wait for more characters to decide */
#define autojp_DECIDED		3	/* decided what the format is (in *pencoding) */

/*

 * Initialise the state to 0 (use define above). The values returned
 * are of no interest but must be passed back in each time.
 *
 * Initialise the encoding to csAutodetectJP.
 *
 * Pass in characters as they arrive.
 *
 * If the function returns ASCII then the streams has only encountered
 * ASCII characters
 *
 * If the function returns THINKING thenit needs the next few
 * characters to decide whether to leave ASCII state or not
 *
 * If the function returns UNDECIDED then the encoding is still undecided and
 * the possible states of encoding are
 *
 *  - csAutodetectJP
 *  - csEUCorShiftJIS
 *
 * If the function returns DECIDED then the encoding has been determined and
 * will be one of
 *  - csISO2022JP
 *  - csEUCPkdFmtJapanese
 *  - csShiftJIS
 *
 * If the end of the file is reached and no encoding has been
 * determined then
 *  - if encoding is csAutodetectJP it can be considered to be
 *    US-ASCII
 *  - if encoding is csEUCorShiftJIS a default one of the two
 *    should be chosen */

extern int autojp_consume(int *pencoding, int *pstate, char c);


/*
 * Process a string in the same way as the above character based function.
 * The bytes value is updated as follows
 *
 * If the encoding is UNDECIDED then *pbytes holds the number of
 * characters that were still ASCII
 *
 * If the encoding is ASCII or DECIDED then *pbytes will be zero
 */

extern int autojp_consume_string(int *pencoding, int *pstate, const char *buffer, int *pbytes);

#endif

/* > autojp.h */
