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
/* timer.c
 *
 * Author: Keith Ruttle (Acorn)
 *
 * Description
 * ===========
 * timer routines
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.06 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 * 04-Oct-95  15:26  JPD  Version 1.00
 * First version with change record.
 *
 **End of change record*
 */

#ifdef OldCode
#include "defs.h"
#else
#include "mnsg.h"
#include "output.h"
#include "timer.h"
#endif

#define RT_DELAY 200          /* 2 seconds */
#define SUPPLY_DELAY 30000    /* 5 minutes */

/******************************************************************************/
#ifdef OldCode
rt_bcast()
{
    toall(supply);
#ifdef DO_SUPPLY_DELAY
    *timerp = SUPPLY_DELAY;
#endif
}
#else
void rt_bcast(void)
{
   toall(supply);
#ifdef DO_SUPPLY_DELAY
   *timerp = SUPPLY_DELAY;
#endif

   return;

} /* rt_bcast() */
#endif

/******************************************************************************/

#ifdef OldCode
setrtdelay()
{
    *timerp = RT_DELAY;
}
#else
void setrtdelay(void)
{
   *timerp = RT_DELAY;

   return;

} /* setrtdelay() */

#endif

/******************************************************************************/

/* EOF timer.c */
