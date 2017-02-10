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
/*guard*/

/* Copyright (C) Acorn Computers Limited 1991
   Confidential - Do not distribute outside Acorn Computers Limited.
   Neither the whole nor any part of the information contained here
   may be adapted or reproduced in any material form except with the
   prior written approval of Acorn Computers Limited (Acorn).
*/

/* If this header is included in a file, malloc(), free() and realloc() are
   redefined to (a) trace their action with ftracef and (b) do lots of
   consistency checks.
*/

/* History:
 *   Jonathan Coxhead 10 July 1991 Written, based on nova_.
 */

#include <stdlib.h>

#ifndef TRACE
  #include "ftrace.h"
#endif

#if TRACE
   extern void guard_summary (void);

   extern void guard_check (void);

   extern void *guard_alloc (char *file, int line, size_t);

   extern void *guard_realloc (char *file, int line, void *, size_t);

   extern void guard_free (char *file, int line, void *, size_t);

   #define malloc(size) guard_alloc (__FILE__, __LINE__, size)

   #define realloc(ptr, size) guard_realloc (__FILE__, __LINE__, ptr, size)

   #define free(ptr) guard_free (__FILE__, __LINE__, ptr, 0)

   #define free_size(ptr, size) guard_free (__FILE__, __LINE__, ptr, size)
#else
   #define guard_summary()

   #define guard_check()

   #define free_size(ptr, size) free (ptr)
#endif
