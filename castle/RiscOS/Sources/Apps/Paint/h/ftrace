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
/* Title  : ftrace.h
 * Purpose: centralised control for trace/debug output to a file
 *
 */

#ifndef __ftrace_h
#define __ftrace_h

#ifndef TRACE
#define TRACE 0
#endif

/* This flag says if tracing is compiled in. It should be used in
conditional compilation statements around all tracing code. */

#if TRACE
   /* --------------------------- ftracef ----------------------------------
    * Description:   Outputs tracing info.
    *
    * Parameters:    char *-- printf-style format string
    *                ...   -- variable argument list
    * Returns:       void.
    * Other Info:    called by ftracef0,ftracef1 etc.
    *
    */

   extern void ftrace_paint (char *);

   extern void ftracef (char *file, int line, char *, ...);
   
   /*Supply function versions of these for obscure reasons ...*/
   extern void ftracef0 (char *);
   extern void ftracef1 (char *, ...);
   extern void ftracef2 (char *, ...);
   extern void ftracef3 (char *, ...);
   extern void ftracef4 (char *, ...);
   extern void ftracef5 (char *, ...);

   #define ftracef0(a) ftracef(__FILE__, __LINE__, a)
   #define ftracef1(a, b) ftracef(__FILE__, __LINE__, a, b)
   #define ftracef2(a, b, c) ftracef(__FILE__, __LINE__, a, b, c)
   #define ftracef3(a, b, c, d) ftracef(__FILE__, __LINE__, a, b, c, d)
   #define ftracef4(a, b, c, d, e) ftracef(__FILE__, __LINE__, a, b, c, d, e)
   #define ftracef5(a, b, c, d, e, f) ftracef(__FILE__, __LINE__, a, b, c, d, e, f)

   /* These forms can occur outside conditional compilation clauses:
   they will produce no code if TRACE is not set. */

   extern int ftrace_is_on (void);  /* returns true if tracing turned on */
   extern void ftrace_on (void);    /* turns tracing on */
   extern void ftrace_off (void);   /* turns tracing off */
#else
   /* No-trace versions */

   #define ftrace_paint(s) ((void) 0)

   /* ftracef itself cannot be done as a macro. */
   extern void ftracef (char *, int, char *, ...);

   #define ftracef0(a) ((void) 0)
   #define ftracef1(a,b) ((void) 0)
   #define ftracef2(a,b,c) ((void) 0)
   #define ftracef3(a,b,c,d) ((void) 0)
   #define ftracef4(a,b,c,d,e) ((void) 0)
   #define ftracef5(a,b,c,d,e,f) ((void) 0)

   #define ftrace_is_on() 0
   #define ftrace_on() ((void) 0)
   #define ftrace_off() ((void) 0)
#endif

#endif
