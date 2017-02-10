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
/* -> c.Slist
 * Title:       Slist - singly-linked lists
 * Author:      JGT (converted from MJJ)
 *              Copyright (C) 1988 Acorn Computers Limited
 */

#include <stdio.h>
#include "slist.h"

typedef struct listrec
{
  struct listrec *next;
} listrec_t;

#define next_(p) (((listrec_t *)(p))->next)

void * slist_add(void *listhead, void *newelement)
{
next_(newelement) = listhead;
return newelement;
} /* End procedure */

void * slist_addend(void *listhead, void *newelement)
{
  void * t,
       * tf;
  
  next_(newelement) = NULL;
  if (!listhead) return newelement;
  t = listhead;
  do
  {
    tf = next_(t);
    if (!tf) break;
    t = tf;
  } while (1);
  next_(t) = newelement;
  return listhead;
} /* End procedure */

void * slist_remove(void *listhead, void *element)
{
  void * t,
       * tf;
  
  if (!listhead) return NULL;
  if (listhead == element) return next_(listhead);
  t = listhead;
  do
  {
    tf = next_(t);
    if (!tf) return listhead;
    if (tf == element)
    {
      /* match - remove it */
      next_(t) = next_(tf);
      return listhead;
    }; /* End if */
    t = tf; /* onto next */
  } while (1);
} /* End procedure */

void * slist_joinend(void *listhead, void *newlist)
{
  void * t,
       * tf;
  
  if (!listhead) return newlist;
  t = listhead;
  do
  {
    tf = next_(t);
    if (!tf) break;
    t = tf;
  } while (1);
  next_(t) = newlist;
  return listhead;
} /* End procedure */

/* End slist.c */
