/* Copyright 1996 Acorn Computers Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
/*riscos.c - useful functions for windowing applications*/

/*From CLib*/
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

/*From OSLib*/
#include "messagetrans.h"
#include "macros.h"
#include "os.h"
#include "territory.h"
#include "wimp.h"

/*From Support*/
#include "m.h"
#include "riscos.h"
#include "trace.h"

#ifndef BOOTCMDS
static char *Decimal_Point = ".";
static int Decimal_Point_Len = 1;
#endif

#ifndef BOOTCMDS
static os_error *Error_Lookup (int errnum, char *token, va_list list)

{  char *p [4];
   int i;
   os_error error;

   tracef ("Error_Lookup (%d, %s)\n" _ errnum _ token);

   /*Assume that 4 args are always given.*/
   for (i = 0; i < 4; i++) p [i] = va_arg (list, char *);

   error.errnum = errnum;
   riscos_strcpy (error.errmess, token);

   return xmessagetrans_error_lookup (&error, NULL,
         NULL, 0, p [0], p [1], p [2], p [3]);
}
#endif
#ifndef BOOTCMDS
/*------------------------------------------------------------------------*/
os_error *riscos_territory (territory_t t)

{  os_error *error = NULL;

   /*Fix MED-3471: use "." if there is no territory yet. A correct
      application will call this function again if the territory changes.
      JRC 12th Dec 1994*/
   if (xterritory_read_string_symbols (t, territory_SYMBOL_DECIMAL_POINT,
         &Decimal_Point) != NULL)
      Decimal_Point = ".";

   Decimal_Point_Len = strlen (Decimal_Point);

/*finish:*/
   return error;
}
/*------------------------------------------------------------------------*/
os_error *riscos_error_lookup (int errnum, char *token, ...)

{  va_list list;
   os_error *error;

   tracef ("riscos_error_lookup (%d, %s)\n" _ errnum _ token);

   va_start (list, token);
   error = Error_Lookup (errnum, token, list);
   va_end (list);

   return error;
}
#endif
#if TRACE
/*------------------------------------------------------------------------*/
void riscos__assert (char *file, int line, char *msg)

{  os_error error;
   int len;

   tracef ("riscos__assert\n");

   error.errnum = 1;
   sprintf (error.errmess, "\"%.*s\", line %d: %n",
         sizeof error.errmess - 11 - UNSIGNED_WIDTH - 1, file, line, &len);
   riscos_strncpy (&error.errmess [len], msg, os_ERROR_LIMIT - len - 1);

   (void) xwimp_report_error (&error, wimp_ERROR_BOX_SHORT_TITLE,
         "Assertion failure", NULL);
}
#endif
/*------------------------------------------------------------------------*/
int riscos_strlen (char *s)

  /* Calculates the length of a string in the traditional RiSC O S way.
   */

{  int l = 0;

   while (s [l] >= ' ')
      l++;

   return l;
}
#ifndef BOOTCMDS
/*------------------------------------------------------------------------*/
char *riscos_strcpy (char *s1, char *s)

  /* Copy a string in the traditional RiSC O S way.
   */

{  int i = 0;

   while ((s1 [i] = s [i]) >= ' ')
      i++;
   s1 [i] = '\0';

   return s1;
}
#endif
#ifndef BOOTCMDS
/*------------------------------------------------------------------------*/
int riscos_strcmp (char *s0, char *s1)

  /* Compares 2 traditional RiSC O S strings.
   */

{  tracef ("riscos_strcmp (\"%.*s\", \"%.*s\")\n" _
         riscos_strlen (s0) _ s0 _ riscos_strlen (s1) _ s1);

   for (;;)
   {  char c0 = *s0++, c1 = *s1++;

      if (c0 < ' ')
         if (c1 < ' ')
            return (tracef ("-> 0\n"), 0);
         else
            return (tracef ("-> -1\n"), -1);
      else
         if (c1 < ' ')
            return (tracef ("-> 1\n"), 1);
         else
            if (c0 != c1) return (tracef ("-> %d\n" _ c0 - c1), c0 - c1);
   }
}
#endif
/*------------------------------------------------------------------------*/
char *riscos_strncpy (char *s1, char *s, int n)

 /* Copy a RISC O S string of limited length, like
  * sprintf (s1, "%.*s", MIN (n, riscos_strlen (s)), s);
  */

{  int i;

   /*Copy up to |n| characters of the string*/
   for (i = 0; s [i] >= ' ' && i < n; i++)
      s1 [i] = s [i];

   /*Append a terminator.*/
   s1 [i] = '\0';

   return s1;
}
#ifndef BOOTCMDS
/*------------------------------------------------------------------------*/
char *riscos_format_dec (char *s, int i, int width, int prec)

{  tracef ("riscos_format_dec (%d)\n" _ i);

   if (sprintf (s, "%*.*d", width, prec, i) < 1)
      CLEAR (s);

   return s;
}
#ifndef PICKER
/*------------------------------------------------------------------------*/
char *riscos_format_hex (char *s, int i, int width, int prec)

{  tracef ("riscos_format_hex (0x%X)\n" _ i);

   if (sprintf (s, "%*.*X", width, prec, i) < 1)
      CLEAR (s);

   return s;
}
#endif
/*------------------------------------------------------------------------*/
char *riscos_format_char (char *s, char c)

{  tracef ("riscos_format_char ('%c')\n" _ c);

   if (sprintf (s, "%c", c) < 1)
      CLEAR (s);

   return s;
}
/*------------------------------------------------------------------------*/
char *riscos_format_fixed (char *s, int mul, int div, int width, int prec)

   /*Like |sprintf (s, "*.*f", width, prec, mul/div)|, but using integers
      only. |Div| must be > 0.*/

{  int i, scale;

   tracef ("riscos_format_fixed (%d/%d)\n" _ mul _ div);

   scale = 1;
   for (i = 0; i < prec; i++) scale *= 10;

   i = SGN (mul)*((unsigned) ABS (mul)/div);

   if (prec > 0)
   {  int f = (scale*ABS (mul)/div)%scale;

      if (sprintf (s, "%*d%s%*.*d\n", MAX (width - prec - 1, 0), i,
            Decimal_Point, prec, prec, f) < 2)
         CLEAR (s);
   }
   else
   {  if (sprintf (s, "%*d\n", width, i) < 1)
         CLEAR (s);
   }

   return s;
}
/*------------------------------------------------------------------------*/
int riscos_scan_dec (char *s, int *i_out)

{  int i, width;

   tracef ("riscos_scan_dec\n");

   if (sscanf (s, "%d%n", &i, &width) < 1)
      return 0;

   if (i_out != NULL) *i_out = i;
   return width;
}
#endif
#ifndef BOOTCMDS
#ifndef PICKER
/*------------------------------------------------------------------------*/
int riscos_scan_hex (char *s, int *i_out)

{  int i, width;

   tracef ("riscos_scan_hex\n");

   if (sscanf (s, "%x%n", &i, &width) < 1)
      return 0;

   if (i_out != NULL) *i_out = i;
   return width;
}
#endif
#endif
#ifndef BOOTCMDS
/*------------------------------------------------------------------------*/
int riscos_scan_fixed (char *s, int *mul_out, int div)

{  int mul = 0, place, sgn = 1;
   char *cc = s;

   tracef ("riscos_scan_fixed (s \"%s\", div %d)\n" _ s _ div);

   /*Skip leading spaces.*/
   cc += strspn (s, " \t\xA0");
      /*Fix MED-4986: '\n' is a terminator! J R C 16th Mar 1995*/

   if (*cc == '-') sgn = -1, cc++;

   for (; ISDIGIT (*cc); cc++)
      mul = 10*mul + DIGIT (*cc);

   tracef ("SGN %d, INT %d\n" _ sgn _ mul);
   mul *= div;

   if (strncmp (cc, Decimal_Point, Decimal_Point_Len) == 0)
      cc += Decimal_Point_Len;

   /*Add in the fractional part too.*/
   for (place = 10; ISDIGIT (*cc); cc++, place *= 10)
      mul += div*DIGIT (*cc)/place;
   tracef ("MUL %d\n" _ mul);

   if (mul_out != NULL) *mul_out = sgn*mul;
   return cc - s;
}
#endif
