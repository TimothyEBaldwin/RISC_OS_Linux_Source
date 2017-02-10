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
/******	str.h *************************************************************\

Project:	Ursula (RISC OS for Risc PC II)
Component:	Modular Configure
Purpose:	String routines shared between multiple Configure plug-ins

History:
Date		Who	Change
----------------------------------------------------------------------------
08/12/1997	BJGA	Split from Common
			Renamed functions to str_foo convention
			Added these headers
29/04/1998	BJGA	str_cpy and str_ncpy can now cope with null source ptrs

\**************************************************************************/

#ifndef NULL
#define NULL 0
#endif
#include "str.h"

/******	str_cpy() *********************************************************\

Purpose:	Same as strcpy, but copes with control-termination
In:		Source and destination pointers
Out:		Result is null-terminated

\**************************************************************************/

char *str_cpy (char* s1, const char *s2)
{
  char *orig1;
  if (s1 == NULL) return NULL;
  
  orig1 = s1;
  
  if (s2 != NULL)
  {
    for ( ; *s2 > 31; *s1 = *s2, s1++, s2++);
  }
  
  *s1 = 0;
  
  return orig1;
}

/******	str_ncpy() ********************************************************\

Purpose:	A bit like strncpy, and copes with control-termination
In:		Source and destination pointers
		n:	the size of the buffer being copied into
Out:		Up to (n-1) characters are copied
		Result is null-terminated (even if filling the buffer)

\**************************************************************************/

char *str_ncpy (char* s1, const char *s2, int n)
{
  char *orig1;
  if (s1 == NULL) return s1;
  
  orig1 = s1;
  
  if (s2 != NULL)
  {
    for ( ; *s2 > 31 && s1 < orig1 + n - 1; *s1 = *s2, s1++, s2++);
  }
  
  *s1 = 0;
  
  return orig1;
}

/******	str_len() *********************************************************\

Purpose:	Same as strlen, but copes with control-termination
In:		String pointer
Out:		Length of string

\**************************************************************************/

int str_len (const char *s)  /*  */
{
  const char *orig;
  if (s == NULL) return 0;
  for (orig = s; (unsigned) *s > 31; s++);
  return s - orig;
}
