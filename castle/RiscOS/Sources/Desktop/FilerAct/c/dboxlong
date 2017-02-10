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
#include <limits.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <locale.h>

#include "dbox.h"

#include "Options.h"
#include "dboxlong.h"

#ifdef USE_COMMAS
static void cvtlong(char *out, uint64_t num)
{
    struct lconv *l = localeconv();
    char buffer[128];
    char buffer2[128];
    char *p = buffer2 + sizeof buffer2;
    char *p2;
    const char *sep = l->thousands_sep;
    const char *group = l->grouping;
    int seplen = strlen(sep);
    int n;

    n = sprintf(buffer, "%ju", num);
    p2 = buffer + n - 1;

    n = *group;
    *--p = '\0';

    while (p2 >= buffer)
    {
        if (n != CHAR_MAX) n--;
        if (n < 0)
        {
            memcpy(p-seplen, sep, seplen);
            p-=seplen;
            n = *++group;
            if (n == 0)
                n = *--group;
            if (n != CHAR_MAX) n--;
        }
        *--p = *p2--;
    }
    strcpy(out, p);
}
#else
#define cvtlong(buf, n) snprintf(buf, "%ju", n)
#endif

void dbox_setlongnumeric(dbox d, dbox_field f, uint64_t n)
{
    char buf[128];

    cvtlong(buf, n);

    dbox_setfield(d, f, buf);
}
