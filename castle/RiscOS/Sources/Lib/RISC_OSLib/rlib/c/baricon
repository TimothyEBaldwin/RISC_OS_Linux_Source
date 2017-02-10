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

/*
 * Title: baricon.c
 * Purpose: Support placing of an icon on the icon bar.
 * History: IDJ: 05-Feb-92: prepared for source release
 *
 */

#include <string.h>
#include <stdlib.h>

#include "os.h"
#include "wimp.h"
#include "wimpt.h"
#include "trace.h"
#include "bbc.h"
#include "sprite.h"

#include "win.h"
#include "menu.h"
#include "event.h"

#include "baricon.h"

#include "swis.h"


static baricon_clickproc baricon__leftclickproc;

static void baricon__win_event_handler(wimp_eventstr *e, void *handle)
{

  handle = handle;
  tracef1("icon bar event %i.\n", e->e);
  if (e->e == wimp_EBUT)
  { /* key click */
    if ((e->data.but.m.bbits & wimp_BLEFT) != 0)
    {
      /* left click : call registered handler */
      tracef0("icon bar left click.\n");
      (*baricon__leftclickproc)(e->data.c.i);
    }
  }
}

static wimp_icreate baricon__i; /* icon structure */
static wimp_i baricon__result;

#define ONRIGHT  (-1)
#define ONLEFT   (-2)

static wimp_i do_baricon(
    char *spritename, int spritearea, baricon_clickproc proc, int L_or_R)
{

  sprite_info result;
  os_regset r;

  r.r[0] = 40;                              /* read sprite info */
  if (spritearea != 0 && spritearea != 1)   /* not system/wimp sprite pool */
     r.r[0] += 256;
  r.r[1] = spritearea;
  r.r[2] = (int)spritename;
  if (spritearea == 1)                      /* wimp pool */
      wimpt_noerr(wimp_spriteop_full(&r));
  else
      wimpt_noerr(os_swix(OS_SpriteOp, &r));
  result.width = r.r[3];
  result.height = r.r[4];
  result.mask = r.r[5];
  result.mode = r.r[6];

  baricon__i.w = (wimp_w) L_or_R; /* icon bar  - request L or R */
  baricon__i.i.box.x0 = 0;
  baricon__i.i.box.y0 = 0;
  baricon__i.i.box.x1 = result.width << bbc_modevar(result.mode, bbc_XEigFactor);
  baricon__i.i.box.y1 = result.height << bbc_modevar(result.mode, bbc_YEigFactor);
  baricon__i.i.flags =
    wimp_ISPRITE + wimp_INDIRECT + wimp_IHCENTRE + /* wimp_IVCENTRE + */
    (wimp_IBTYPE * wimp_BCLICKDEBOUNCE);

  if ((baricon__i.i.data.indirectsprite.name = malloc(13)) == 0)
     return 0;
  strncpy(baricon__i.i.data.indirectsprite.name, spritename, 12);
  baricon__i.i.data.indirectsprite.spritearea = (void*) spritearea;
  baricon__i.i.data.indirectsprite.nameisname = TRUE;
  wimp_create_icon(&baricon__i, &baricon__result);
  baricon__leftclickproc = proc;
  win_register_event_handler(win_ICONBAR, baricon__win_event_handler,
                             0);
  win_activeinc();
    /* >>>>This means that the application will stay loaded until explicitly
    unloaded. */
  return baricon__result;
}

wimp_i baricon(char *spritename, int spritearea, baricon_clickproc proc)
{
   return do_baricon(spritename, spritearea, proc, ONRIGHT);
}

#ifndef UROM
wimp_i baricon_left(char *spritename, int spritearea, baricon_clickproc proc)
{
   return do_baricon(spritename, spritearea, proc, ONLEFT);
}
#endif

#define baricon__max(a,b)  (a>b)?(a):(b)

#ifndef UROM
static wimp_i do_baricon_textandsprite(char *spritename, char *text,
                             int bufflen, int spritearea, baricon_clickproc proc, int L_or_R)
{

  sprite_info result;
  os_regset r;

  wimpt_checkmode();
  r.r[0] = 40;                              /* read sprite info */
  if (spritearea != 0 && spritearea != 1)   /* not system/wimp sprite pool */
     r.r[0] += 256;
  r.r[1] = spritearea;
  r.r[2] = (int)spritename;
  if (spritearea == 1)                      /* wimp pool */
      wimpt_noerr(wimp_spriteop_full(&r));
  else
      wimpt_noerr(os_swix(OS_SpriteOp, &r));
  result.width = r.r[3];
  result.height = r.r[4];
  result.mask = r.r[5];
  result.mode = r.r[6];

  baricon__i.w = (wimp_w) L_or_R; /* icon bar  - request L or R */
  baricon__i.i.box.x0 = 0;
  baricon__i.i.box.y0 = -16;
  baricon__i.i.box.x1 = baricon__max(bufflen * (wimpt_dx() * bbc_vduvar(bbc_GCharSpaceX)),
                                     result.width << bbc_modevar(result.mode, bbc_XEigFactor));
  baricon__i.i.box.y1 = (result.height << bbc_modevar(result.mode, bbc_YEigFactor))
                        + (wimpt_dy() * bbc_vduvar(bbc_GCharSpaceY)) - 16;
  baricon__i.i.flags =
    wimp_ISPRITE + wimp_ITEXT + wimp_INDIRECT + wimp_IHCENTRE
                 + (wimp_IBTYPE * wimp_BCLICKDEBOUNCE)
                 + (wimp_IFORECOL * 7)   /* black */
                 + (wimp_IBACKCOL * 1);  /* v. light grey */

  if ((baricon__i.i.data.indirecttext.validstring = malloc(14)) == 0)
     return 0;
  strcpy(baricon__i.i.data.indirecttext.validstring, "s");
  strncat(baricon__i.i.data.indirecttext.validstring, spritename, 13);
  baricon__i.i.data.indirecttext.buffer = text;
  baricon__i.i.data.indirecttext.bufflen = bufflen;
  wimp_create_icon(&baricon__i, &baricon__result);
  baricon__leftclickproc = proc;
  win_register_event_handler(win_ICONBAR, baricon__win_event_handler,
                             0);
  win_activeinc();
    /* >>>>This means that the application will stay loaded until explicitly
    unloaded. */
  return baricon__result;
}
#endif

#ifndef UROM
wimp_i baricon_textandsprite(char *spritename, char *text,
                             int bufflen, int spritearea, baricon_clickproc proc)
{
   return do_baricon_textandsprite(spritename, text, bufflen, spritearea, proc, ONRIGHT);
}
#endif

#ifndef UROM
wimp_i baricon_textandsprite_left(char *spritename, char *text,
                             int bufflen, int spritearea, baricon_clickproc proc)
{
   return do_baricon_textandsprite(spritename, text, bufflen, spritearea, proc, ONLEFT);
}
#endif

#ifndef UROM
wimp_i baricon_newsprite(char *newsprite)
{
  strcpy(baricon__i.i.data.indirectsprite.name, newsprite);
  wimp_set_icon_state((wimp_w)-1, baricon__result, 0, 0);
  return baricon__result;
}
#endif

/* end */
