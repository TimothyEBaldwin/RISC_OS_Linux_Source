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
/* debug.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for debug routines
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.02 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 04-Jan-95  11:41  JPD  Version 1.00
 * Created.
 *
 * 08-Feb-95  09:46  JPD  Version 1.01
 * Added xDEBUG macros.
 *
 *
 **End of change record*
 */

/******************************************************************************/

#ifdef DEBUG

extern void hprintf(const char *format, ...);

#define DEBUGP1(a) hprintf(a)
#define DEBUGP2(a,b) hprintf(a,b)
#define DEBUGP3(a,b,c) hprintf(a,b,c)
#define DEBUGP4(a,b,c,d) hprintf(a,b,c,d)
#define DEBUGP5(a,b,c,d,e) hprintf(a,b,c,d,e)
#define DEBUGP6(a,b,c,d,e,f) hprintf(a,b,c,d,e,f)
#define DEBUGP7(a,b,c,d,e,f,g) hprintf(a,b,c,d,e,f,g)
#define DEBUGP8(a,b,c,d,e,f,g,h) hprintf(a,b,c,d,e,f,g,h)

#else

#define DEBUGP1(a)
#define DEBUGP2(a,b)
#define DEBUGP3(a,b,c)
#define DEBUGP4(a,b,c,d)
#define DEBUGP5(a,b,c,d,e)
#define DEBUGP6(a,b,c,d,e,f)
#define DEBUGP7(a,b,c,d,e,f,g)
#define DEBUGP8(a,b,c,d,e,f,g,h)
#endif

#define xDEBUGP1(a)
#define xDEBUGP2(a,b)
#define xDEBUGP3(a,b,c)
#define xDEBUGP4(a,b,c,d)
#define xDEBUGP5(a,b,c,d,e)
#define xDEBUGP6(a,b,c,d,e,f)
#define xDEBUGP7(a,b,c,d,e,f,g)
#define xDEBUGP8(a,b,c,d,e,f,g,h)

/******************************************************************************/

/* EOF debug.h */
