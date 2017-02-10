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
/*tracef.h*/
#ifndef trace_H
#define trace_H

#ifndef TRACE
#define TRACE 0
#endif

#ifndef os_H
   #include "os.h"
#endif

#if TRACE
   #define tracef(args) trace_f (__FILE__, __LINE__, args)
   #define tracevdu(s, n) trace_vdu (s, n)
   #define tracewait(t) trace_wait (__FILE__, __LINE__, t)

   extern os_error *trace_initialise (char *var);
   extern os_error *trace_terminate (void);
   extern void trace_f (char *file, int line, char *, ...);
   extern void trace_vdu (char *, int);
   extern void trace_wait (char *file, int line, int t);
#else
   #define tracef(args) SKIP
   #define tracevdu(args) SKIP
   #define tracewait(args) SKIP

   #define trace_initialise(var) SKIP
   #define trace_terminate() SKIP
   #define trace_f(args) SKIP
   #define trace_vdu(s, n) SKIP
   #define trace_wait(t) SKIP
#endif
#endif
