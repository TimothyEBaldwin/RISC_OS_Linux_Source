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
#ifndef riscos_H
#define riscos_H

/*From OSLib*/
#ifndef os_H
   #include "os.h"
#endif

#ifndef territory_H
   #include "territory.h"
#endif

 /* Function to change the territory in use for |riscos_{scan/format}_fixed.
  */

extern os_error *riscos_territory (territory_t);

 /* Macro to provide an assertion facility using Wimp_ReportError.
  */

#define riscos_assert(c) \
   (!(c)? riscos__assert (__FILE__, __LINE__, #c): (void) SKIP)

 /* Function to be used by |riscos_assert()| - not for external use.
  */

extern void riscos__assert (char *file, int line, char *msg);

 /* Function to return an |os_error *| from an error token in the global
  * messages file.
  */

extern os_error *riscos_error_lookup (int errnum, char *token, ...);

 /* Trivial functions to do things "the RISC O S way" rather than "the C
  * way." This means treating strings as control-char terminated, rather
  * than 0-terminated. These can be printed using a format of
  * "%.*s" and passing in the length of the string, as calculated by
  * |riscos_strlen|, as a argument to the printing function. Note that
  * riscos_strncpy() is not like strncpy(): it always terminates its output.
  */

extern int riscos_strlen (char *s);

extern char *riscos_strcpy (char *s1, char *s);

extern int riscos_strcmp (char *s0, char *s1);

extern char *riscos_strncpy (char *s1, char *s, int n);

 /* Useful string processing functions, designed to allow safe in-line use
  * by taking a buffer argument, the pointer to which they return.
  */

extern char *riscos_format_dec (char *s, int i, int width, int prec);
      /*sprintf (s, "%*.*d", width, prec, i)*/

extern char *riscos_format_hex (char *s, int i, int width, int prec);
      /*sprintf (s, "%*.*X", width, prec, i)*/

extern char *riscos_format_char (char *s, char c);
      /*sprintf (s, "%c", c)*/

extern char *riscos_format_fixed (char *s, int mul, int div, int width,
      int prec); /*sprintf (s, "*.*f", width, prec, mul/div)*/

 /* Functions to read back the items above - these return the number of
  * characters successfully read, 0 for error.
  */

extern int riscos_scan_dec (char *s, int *i_out);
      /*sscanf (s, "%d", i)*/

extern int riscos_scan_hex (char *s, int *i_out);
      /*sscanf (s, "%x", i)*/

extern int riscos_scan_fixed (char *s, int *mul_out, int div);
      /*sscanf (s, "%lf", mul), mul *= div*/

#endif
