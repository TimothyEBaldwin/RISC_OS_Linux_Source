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

/* Title: c.dboxfile
 * Purpose: display a file dbox and get input
 * History: IDJ: 05-Feb-92: prepared for source release
 *
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>
#include "dbox.h"
#include "dboxfile.h"
#include "trace.h"



/* fields for the DBox. */


#define dboxfile_FOK    0       /* OK action button. */
#define dboxfile_FMsg   1       /* message from sponsor */
#define dboxfile_FInput 2       /* input field. */



void dboxfile(char *message, unsigned filetype, char *a, int bufsize)
{
   dbox d = dbox_new("dboxfile_db");

   filetype = filetype ; /* supress compiler warning */
   if (d == 0) return;
   dbox_setfield(d, dboxfile_FMsg, message);
   dbox_setfield(d, dboxfile_FInput, a);
   dbox_show(d);
   if (dbox_fillin(d) == dboxfile_FOK)
     dbox_getfield(d, dboxfile_FInput, a, bufsize);
   else
     a[0] = 0;

   dbox_dispose(&d);
}

/* end */
