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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/

/* Title  : trace.h
 * Purpose: centralised control for trace/debug output
 *
 */

#ifndef __trace_h
#define __trace_h

#ifndef TRACE
#define TRACE 0
#endif

/* This flag says if tracing is compiled in. It should be used in
conditional compilation statements around all tracing code. */

#if TRACE
   /* ------------------------------- tracef ----------------------------------
    * Description:   Outputs tracing info.
    *
    * Parameters:    char* -- printf-style format string
    *                ...   -- variable argument list
    * Returns:       void.
    * Other Info:    called by tracef0,tracef1 etc.
    *
    */

   extern void tracef (char *, ...);

   #define tracef0 tracef
   #define tracef1 tracef
   #define tracef2 tracef
   #define tracef3 tracef
   #define tracef4 tracef

   /* These forms can occur outside conditional compilation clauses:
   they will produce no code if TRACE is not set. */

   extern int trace_is_on (void);  /* returns true if tracing turned on */
   extern void trace_on (void);    /* turns tracing on */
   extern void trace_off (void);   /* turns tracing off */
#else
   /* No-trace versions */

   /* tracef itself cannot be done as a macro. */
   extern void tracef (char *, ...);

   #define tracef0(a) ((void) 0)
   #define tracef1(a,b) ((void) 0)
   #define tracef2(a,b,c) ((void) 0)
   #define tracef3(a,b,c,d) ((void) 0)
   #define tracef4(a,b,c,d,e) ((void) 0)

   #define trace_is_on() 0
   #define trace_on() ((void) 0)
   #define trace_off() ((void) 0)
#endif

#endif

/* end trace.h */
