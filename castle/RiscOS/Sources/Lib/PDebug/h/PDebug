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
#ifndef __PDebug__h
#define __PDebug__h

#include <stdarg.h>
#include <stdio.h>

#ifndef __kernel_h
  #include "kernel.h"
#endif


#ifdef PDebug_DEBUG

  #ifdef __cplusplus
  extern "C" {
  #endif

  /*
    Raises Desk_Error2 exception if an error occurs. Don't use this when
    linking with the stand-alone version of PDebug.

    See PDebug_XInit for an error-returning version.
  */
  void PDebug_Init (void);

  /*
    Initialises the PDebug system.
  */
  _kernel_oserror *PDebug_XInit (void);


  /*
    Similar to printf().
  */
  int PDebug_Printf (const char *fmt, ...);

  /*
    Similar to vprintf().
  */
  int PDebug_VPrintf (const char *fmt, va_list va);

  /*
    Similar to fprintf(). 'dummy' is ignored - behaves exactly as
    PDebug_Printf().
  */
  int PDebug_FPrintf (FILE *dummy, const char *fmt, ...);

  /*
    Sends the specified data. Returns non-0 if failed
  */
  void PDebug_Print (const void *data, int datasize);

  /*
    Raises Desk_Error2 exception if an error occurs. Don't use this when
    linking with the stand-alone version of PDebug.

    See PDebug_XFinal for an error-returning version.
  */
  void PDebug_Final (void);

  /*
    Shuts down the PDebug system
  */
  _kernel_oserror *PDebug_XFinal (void);

  /*
    Returns the version of the library
  */
  const char *PDebug_Version (void);

  #ifdef __cplusplus
  }
  #endif

#else
  #define PDebug_Init()
  #define PDebug_XInit() 0
  #define PDebug_Printf(1) ? 0 : printf
  #define PDebug_VPrintf(1) ? 0 : vprintf
  #define PDebug_FPrintf(1) ? 0 : fprintf
  #define PDebug_Print(data, datasize)
  #define PDebug_Final()
  #define PDebug_XFinal() 0
  #define PDebug_Version()
#endif

#endif
