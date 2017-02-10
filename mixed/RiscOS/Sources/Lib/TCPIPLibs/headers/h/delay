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
/* -*-C-*-
 *
 * Copyright (c) 1988 Acorn Computers Ltd., Cambridge, England
 *
 * :RCS Log discontinued:
 * Revision 1.1  95/01/11  10:21:31  kwelton
 * Initial revision
 *
 * Revision 1.4  89/05/20  15:27:59  mark
 * Much simplified.
 *
 * Revision 1.3  88/06/17  20:06:58  beta
 * Acorn Unix initial beta version
 *
 */
/* delay.h
 *
 * The MICRODELAY macro provides a cpu-busy-wait to give a short timing
 * slug for nefarious purposes.  Note that it should have the effect
 * of waiting for AT LEAST the specified period:  depending on the
 * compiler, it may well hang about for a little longer...
 *
 * The effect of the MICRODELAY macro is now just to call the DELAY_
 * function (implemented in delay.s) with the desired delay in
 * microseconds as parameter.  The actual function takes care of
 * speed adjustments according to its operating environment.
 *
 */

extern void DELAY_(int);

#define  MICRODELAY(microseconds) DELAY_(microseconds)

/* EOF delay.h */
