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
