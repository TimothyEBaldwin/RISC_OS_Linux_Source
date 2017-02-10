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
/*
 * Title: txtscrap.c
 * Purpose: centralised management of the concept of a scrap or selection
 * Author: AFP
 * Status: system-independent
 * Requires:
 *   h.txt
 * History:
 *   16 July 87 -- started
 *   14 December 87: AFP: converted into C.
 */

#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "txt.h"
#include "txtscrap.h"

static txt owner = 0;

void txtscrap_setselect(txt t, txt_index from, txt_index to)

{

if (owner != (txt) NULL && !txt_selectset(owner))
  owner = (txt) NULL;

if (from == to || t == (txt) NULL)
  if (owner == (txt) NULL)
    owner = owner;
  else
    {
    txt_setselect(owner, 0, 0);
    txt_setcharoptions(owner, txt_CARET, txt_CARET);
    owner = (txt) NULL;
    }
else
  {
  if (owner != (txt) NULL && owner != t)
    txt_setselect(owner, 0, 0);
  txt_setselect(t, from, to);
  txt_setcharoptions(t, txt_CARET, from==to ? txt_CARET : 0);
  owner = t;
  }
}


txt txtscrap_selectowner(void)

{

if (owner != (txt) NULL && !txt_selectset(owner))
  owner = (txt) NULL;
return(owner);

}

/* end */
