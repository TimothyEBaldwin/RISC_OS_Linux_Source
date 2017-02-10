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
 * Title: dboxquery.c
 * Purpose: showing a query dialogue box and getting an answer.
 * History: 05-Feb-92: prepared for source release
 *
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>
#include "dbox.h"
#include "dboxquery.h"
#include "help.h"

/* The query dialog box: */

#define dboxquery_FYes 0  /* action */
#define dboxquery_FMsg 1  /* string output */
#define dboxquery_FNo  2  /* action */

static dbox q = 0;
static dbox q_close = 0;
static dbox q_quit = 0;

static dboxquery_REPLY dboxquery__box(char *question, char *dbox_name, char *help_tag,
                                      dbox *qq)
{
    dbox_field answer;

    if (*qq == 0 || question == 0) *qq = dbox_new(dbox_name);
    if (*qq == 0) return dboxquery_CANCEL; /* out of space - embarassing */
    if (question == 0 || question[0] == 0) return dboxquery_CANCEL;

    dbox_raw_eventhandler(*qq, help_dboxrawevents, help_tag);
    dbox_setfield(*qq, 1, question);
    dbox_show(*qq);
    answer = dbox_fillin(*qq);
    dbox_hide(*qq);

    switch (answer) {
        case dboxquery_FYes: return dboxquery_YES;
        case dboxquery_FNo : return dboxquery_NO;
        default            : return dboxquery_CANCEL;
    }
}


dboxquery_REPLY dboxquery(char *question)
{
   return dboxquery__box(question, "query", "QUERY", &q);
}


dboxquery_close_REPLY dboxquery_close(char *question)
{
   switch(dboxquery__box(question, "close", "CLOSE", &q_close))
   {
      case dboxquery_YES:
         return dboxquery_close_SAVE;

      case dboxquery_NO:
         return dboxquery_close_DISCARD;

      default:
         return dboxquery_close_CANCEL;
   }
}

dboxquery_quit_REPLY dboxquery_quit(char *question)
{
   switch(dboxquery__box(question, "quit", "QUIT", &q_quit))
   {
      case dboxquery_YES:
         return dboxquery_quit_DISCARD;

      default:
         return dboxquery_quit_CANCEL;
   }
}

/* end */
