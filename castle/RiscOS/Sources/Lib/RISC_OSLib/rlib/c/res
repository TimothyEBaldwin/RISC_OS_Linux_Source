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
 * Title:   c.res
 * Purpose: access to resources
 * History: IDJ: 06-Feb-92: prepared for source release
 *
 */


#define BOOL int
#define TRUE 1
#define FALSE 0

#include <stdio.h>
#include <string.h>

#include "os.h"
#include "trace.h"
#include "werr.h"

#include "res.h" /* Ensure consistent interface */

#define GetCountryNumber  240

static const char *programname = 0;

void res_init(const char *a) /* Started up with the program name */
{
  programname = a;
}


BOOL res_findname(const char *leafname, char *buf /*out*/)
{
  os_filestr str;
  os_error *e;
  const char *progname;

#ifndef UROM
  progname = "Obey";
  strcpy(buf, "<Obey$Dir>.");
  if (programname) {
#endif
      progname = programname;
      strcpy(buf, programname);
      strcat(buf, ":");
#ifndef UROM
  }
#endif
  strcat(buf, leafname);
  str.action = 5;
  str.name = buf;
  e = os_file(&str);
  if (e && e->errnum == 0xCC || !e && str.action == 0) {
    /* File name 'contents of buf' not recognised - could be illegal path,
     * or file not found, so try using $Dir instead.
     */
    sprintf(buf, "<%s$Dir>.%s", progname, leafname);
  }

  return TRUE;
}

BOOL res_prefixnamewithpath(const char *leafname, char *buf /*out*/)
{
#ifndef UROM
  if (programname == 0) {
    strcpy(buf, "<Obey$Dir>.");
    strcat(buf, leafname);
  }
  else
#endif
  {
    strcpy(buf, programname);
    strcat(buf, ":");
    strcat(buf, leafname);
  }
  return TRUE;
}

BOOL res_prefixnamewithdir(const char *leafname, char *buf /*out*/)
{
#ifndef UROM
  if (programname == 0) {
    strcpy(buf, "<Obey$Dir>.");
    strcat(buf, leafname);
  }
  else
#endif
  {
    sprintf(buf, "<%s$Dir>.%s", programname, leafname);
  }
  return TRUE;
}

#ifndef UROM
FILE *res_openfile(const char *leafname, const char *mode)

{ char defaultname [FILENAME_MAX];

  res_findname (leafname, defaultname);

  if (*mode == 'r') /*i e, "r" or "r+"*/
  { char countryname [FILENAME_MAX];
    int r2=255, countrynum=0;
    FILE *fp;

    os_byte(GetCountryNumber, &countrynum, &r2);
    sprintf(countryname, "%s%i", defaultname, countrynum);
    if ((fp = fopen(countryname, mode)) != NULL)
      return fp;
  }

  return fopen (defaultname, mode);
}
#endif


/* end of c.res */
