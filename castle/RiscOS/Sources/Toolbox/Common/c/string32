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
/* File:     string32.c
 * Purpose:  strings terminated by char < 32
 * Author:   Timothy Roddis
 * History:  24-Jan-94: IDJ: created from original TGR sources
 */

#include "string32.h"


/* Strings passed to the toolbox might be terminated with any control character ... */

#define NULL 0

void string_copy (char *dst_txt, char *src_txt) 
{
   /*
    * copy a ctrl-terminated string to a buffer big enough to
    * hold the result (no length checking).
    */

   if (!src_txt) src_txt = "";

   while ((*(dst_txt++)=*(src_txt++))>=32);
   *(--dst_txt) = '\0';
}



char *string_copy_chk (char *dst_txt, char *src_txt, int max_len) 
{
   int i;

   /*
    * copy a ctrl-terminated string to a buffer checking it is big enough to
    * hold the result.  Return NULL and nul-terminate, if dst buffer not
    * big enough.
    */

   if (dst_txt == NULL || max_len == 0)
       return NULL;
   if (!src_txt) src_txt = "";

   for (i=1;(*dst_txt++=*src_txt++)>=32;i++)
      if (i>=max_len) {
         *(--dst_txt) = '\0';
         return NULL;
      }
   *(--dst_txt) = '\0';

   return dst_txt;
}


int string_length (char *txt) 
{
   int i=0;

   /*
    * return length of ctrl-terminated string
    */
   
   if (!txt) return 0;
   while (*txt++>=32) i++;
   return i;
}


void string_to_buffer (char *dst_txt, char *src_txt, int *max_len)
{
    /*
     * general purpose routine to fill in a user-supplied buffer (and report
     * number of bytes written), or just report size of buffer needed.
     * If buffer is supplied (dst_txt != 0), then *max_len gives size of supplied
     * buffer; if this is not large enough, don't return an error, but return
     * size of buffer required!
     */

    int src_len = string_length (src_txt) + 1;

    if (dst_txt == NULL)
        *max_len = src_len;
    else   /* user-supplied buffer */
    {
        if (*max_len >= src_len)
            string_copy (dst_txt, src_txt);
        else
            string_copy_chk (dst_txt, src_txt, *max_len);

        *max_len = string_length (dst_txt) + 1;
    }
}

