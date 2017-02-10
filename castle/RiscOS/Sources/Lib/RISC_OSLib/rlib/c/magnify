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
/************************************************************************/
/* © Acorn Computers Ltd, 1992.                                         */
/*                                                                      */
/* This file forms part of an unsupported source release of RISC_OSLib. */
/*                                                                      */
/* It may be freely used to create executable images for saleable       */
/* products but cannot be sold in source form or as an object library   */
/* without the prior written consent of Acorn Computers Ltd.            */
/*                                                                      */
/* If this file is re-distributed (even if modified) it should retain   */
/* this copyright notice.                                               */
/*                                                                      */
/************************************************************************/

/* Title: c.Magnify
 * Purpose: display and respond to a magnifier box
 * History: IDJ: 06-Feb-92: prepared for source release
 *
 */


#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "dbox.h"
#include "magnify.h"
#include "help.h"

void magnify_select(int *mul, int *div, int maxmul, int maxdiv,
                      void (*proc)(void *), void *phandle)
{
 dbox d;
 int wot;

 d = dbox_new("magnifier");
 if (!d) return;
 dbox_raw_eventhandler(d, help_dboxrawevents, "MAGNIFIER");
 dbox_setnumeric(d, 0, *mul<1?1:*mul) ;
 dbox_setnumeric(d, 1, *div<1?1:*div) ;
 dbox_show(d) ;

 while ((wot = dbox_fillin_fixedcaret(d)) != dbox_CLOSE)
 {
  wimp_mousestr ratty ;
  wimpt_noerr(wimp_get_point_info(&ratty)) ;

  *mul = dbox_getnumeric(d, 0) ;
  *div = dbox_getnumeric(d, 1) ;

  if (ratty.bbits & 1) wot = wot^1 ;    /* adjust goes the other way */

  switch (wot)
  {
   case 2: ++*mul ; break ;
   case 3: --*mul ; break ;
   case 4: ++*div ; break ;
   case 5: --*div ; break ;
  }
  if (*mul > maxmul) *mul = maxmul ; if (*mul < 1) *mul = 1 ;
  if (*div > maxdiv) *div = maxdiv ; if (*div < 1) *div = 1 ;
  dbox_setnumeric(d, 0, *mul) ;
  dbox_setnumeric(d, 1, *div) ;

  if (proc) proc(phandle) ;
 }

 dbox_dispose(&d) ;
}

/* end */
