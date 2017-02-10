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

/* Title: c.fileicon
 * Purpose: general display of a file icon in a dialog box.
 * History: IDJ: 06-Feb-92: prepared for source release
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>

#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "sprite.h"
#include "trace.h"
#include "fileicon.h"
#include "werr.h"

void fileicon(wimp_w w, wimp_i ii, int filetype)
{
  wimp_icreate i;
  wimp_i iii;

  /* Set up a sprite icon with the icon that represents the relevant file
  type. The user may now drag this icon away, if he so desires. */
  i.w = w;
  wimpt_complain(wimp_get_icon_info(i.w, ii, &i.i));
  wimpt_complain(wimp_delete_icon(w, ii));
  /* the icon must initially be an indirect text icon. */
  i.i.flags &= ~wimp_ITEXT;        /* set not text */
  i.i.flags |= wimp_ISPRITE + wimp_INDIRECT;       /* set sprite */

  if (filetype == 0x1000)
     sprintf(i.i.data.indirectsprite.name, "Directory");
  else if (filetype == 0x2000)
     sprintf(i.i.data.indirectsprite.name, "Application");
  else
     sprintf(i.i.data.indirectsprite.name, "file_%03x", filetype);

  /* now to check if the sprite exists. */
  /* do a sprite_select on the Wimp sprite pool */

  if (wimp_spriteop(24,i.i.data.indirectsprite.name) == 0)
  {
     /* the sprite exists: all is well */
  }
  else
  {
     /* the sprite does not exist: print general don't-know icon. */
     sprintf(i.i.data.indirectsprite.name, "file_xxx");
  }

  i.i.data.indirectsprite.spritearea = wimp_spritearea;
  tracef1("sprite name is %s.\n", (int) i.i.data.indirectsprite.name);
  wimp_create_icon(&i, &iii); /* will recreate with same number. */
#if TRACE
  if (iii != ii)
  {
    werr(FALSE, "INTERNAL: fi-1");
  }
#endif
  tracef2("new icon no %i (should be %i).\n", iii, ii);
}

/* end */
