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
/* File:        cistrcmp.c 
 * Purpose:     case-insensitive string comparison
 * Author:      Ian Johnson
 * History:     5-Aug-93: IDJ: created
 */

#include "cistrcmp.h"

#include <ctype.h>

extern int cistrcmp(const char *s1, const char *s2)
{

   /* 
    * Function similar to strcmp, except case-insensitive
    *
    */

   int ch1, ch2;

    for (;;) 
    {
        ch1 = *s1++;  ch2 = *s2++;
        /* care here for portability... don't rely on ANSI spec */
        if (isupper(ch1)) ch1 = tolower(ch1);
        if (isupper(ch2)) ch2 = tolower(ch2);
        if (ch1 != ch2) return ch1-ch2;
        if (ch1 == 0) return 0;
    }
}
