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
*
*  Transact.C  -- SMB Transact and Transact2 related support routines
*
*  08-12-98 sbrodie  Original
*
*/

/* Standard includes */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include "kernel.h"

/* Our includes */

#include "stdtypes.h"
#include "LanMan.h"
#include "SMB.h"
#include "Transact.h"

/*
 * These routines are provided for the benefit of SMB.c:SMB_Transact2()
 *
 */

void Transact_addword(struct TransactParms *TP, int value)
{
  BYTE *p = TP->parms_in + TP->parms_in_len;
  p[0] = (value & 0xFF);
  p[1] = (value >> 8 );
  TP->parms_in_len+=2;
}

/* ---------- */

void Transact_addlong(struct TransactParms *TP, long value)
{
  BYTE *p = TP->parms_in + TP->parms_in_len;
  p[0] = (BYTE) (value & 0xFF);
  p[1] = (BYTE) (value >> 8 );
  p[2] = (BYTE) (value >> 16 );
  p[3] = (BYTE) (value >> 24 );
  TP->parms_in_len+=4;
}

/* ---------- */

void Transact_addstring(struct TransactParms *TP, const char *str)
{
  BYTE *p = TP->parms_in + TP->parms_in_len;
  int l = strlen(str)+1;
  //*p++ = 4; /* ASCII string */
  memcpy ( p, str, l );
  TP->parms_in_len += l;// + 1;
}

WORD Transact_getword(BYTE *p)
{
  return ( p[0] + (p[1] << 8));
}

DWORD Transact_getlong(BYTE *p)
{
  return ( p[0] + (p[1] << 8) + (p[2] << 16)+ (p[3] << 24));
}

BYTE *Transact_getpointer(struct TransactParms *TP, BYTE *p)
{
  int ptrval;

  ptrval = Transact_getword(p) + TP->data_out_len - TP->data_out_maxlen;
  if ( ptrval <= 0 || ptrval >= TP->data_out_len )
    return NULL;

  return TP->data_out_buf + ptrval;
}


/* ---------- */

#ifdef LONGNAMES
void Transact_addsetupword(struct TransactParms *TP, int value)
{
  if (TP->setup_in_len < MAX_SETUPWORDS)
    TP->setup_in[TP->setup_in_len++] = value;
  else
    debug0("**** Transact_addsetupword = TOO MANY SETUP WORDS\n");
}

void Transact_addroutepath(struct TransactParms *TP, const char *path)
{
   int len = strlen(path), wds;
   if (len % 2) ++len;
   wds = len / 2;
   if ((wds + TP->setup_in_len) < MAX_SETUPWORDS) {
     /* NOTE - we do not put the terminator in if the string was an even
      * number of bytes long.  If it was an odd number of bytes long we
      * need to zero pad, hence we can just round len up to a multiple
      * of 2 and allow the source string terminator to be the destination
      * buffer pad byte.
      */
     memcpy(&TP->setup_in[TP->setup_in_len], path, len);
     TP->setup_in_len += wds;
   }
   else
     debug0("**** Transact_addroutepath => too long!!\n");
}
#endif

void Transact_init(struct TransactParms *TP, int ret_param_len)
{
        TP->parms_in = SMB_WorkBuf;
        TP->parms_in_len = 0;
        TP->data_in = NULL;
        TP->data_in_len = 0;
        TP->parms_out_buf = SMB_WorkBuf;
        TP->parms_out_maxlen = min(ret_param_len, SMBWORKBUF_SIZE);
        TP->data_out_maxlen = SMBWORKBUF_SIZE - TP->parms_out_maxlen;
        TP->data_out_buf = SMB_WorkBuf + TP->parms_out_maxlen;
#ifdef LONGNAMES
        TP->setup_out_maxlen = MAX_SETUPWORDS;
        TP->setup_in_len = 0;
#endif
}
