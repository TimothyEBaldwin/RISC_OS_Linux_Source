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

/* Title  : c.trace
 * Purpose: centralised control for trace/debug output
 * History: IDJ: 07-Feb-92: prepared for source release
 *
 * #define tubetracing allows you to direct vdu output to another
 *  machine, using the HostFS relocatable module and a Tube podule.
 */



#define BOOL int
#define TRUE 1
#define FALSE 0

#include <string.h>
#include <stdarg.h>
#include <stdio.h>
#include <ctype.h>

#include "os.h"
#include "bbc.h"
#include "wimp.h"
#include "wimpt.h"

/* EXPORTS - can't include this here because it redefines tracef0, ..., 4*/
extern void tracef(char *, ...);
extern void tracef0(char* );
extern void tracef1(char* , int);
extern void tracef2(char* , int , int );
extern void tracef3(char* , int , int , int );
extern void tracef4(char* , int , int, int, int );
extern int trace_is_on(void);
extern void trace_on(void);
extern void trace_off(void);

#if TRACE

static int trace__on = FALSE;

#ifdef tubetracing

#include <stdlib.h>

void tracef(char *format, ...)
{
 if (trace__on)
 {
  va_list args;
  int l;

  system("HostVdu");
  va_start(args, format);
  l = strlen(format);
  vprintf(format, args);
  va_end(args);
  system("TubeVdu");
 }
}

#else

static void vduqq(int a, ...)
{
  va_list ap;
  int i;
  int c;

  va_start(ap, a);
  for (i=a; i>0; i--) {c=va_arg(ap, int); bbc_vdu(c);}
  va_end(ap);
}

static void trace__setwindow(void)
{
  if (wimpt_mode() == 20) {
    vduqq(9,
          4, 28, 0, 63, 79, 48, /* set window */
          31, 0, 15);
  } else {
    vduqq(9,
          4, 28, 0, 28, 79, 16, /* set window */
          31, 0, 15);
  }
}

void tracef(char *format, ...)
{
  va_list args;
  int l;

  va_start(args, format);
  if (trace__on) {
    l = strlen(format);
    if (l > 0) {
      trace__setwindow();
      {
        /*char v[100];
        int i = 0;*/
        vprintf(format, args);
        /*vsprintf(v, format, args);
        while (v[i] != 0) {
          if (v[i] == '\n') {
            bbc_vdu(10);
            bbc_vdu(13);
          } else {
            if(!isprint(v[i])) bbc_vdu(7);
            bbc_vdu(v[i]);
          }
          i++;
        }*/
      }
    }
  }
  va_end(args);
}

#endif

void tracef0(char* a) {tracef(a);}
void tracef1(char* a, int a0) {tracef(a,a0);}
void tracef2(char* a, int a0, int a1) {tracef(a,a0,a1);}
void tracef3(char* a, int a0, int a1, int a2) {tracef(a,a0,a1,a2);}
void tracef4(char* a, int a0, int a1, int a2, int a3) {tracef(a,a0,a1,a2,a3);}

int trace_is_on(void)
{
  return trace__on != 0;
}

void trace_on(void)
{
  trace__on = 1;
}

void trace_off(void)
{
  trace__on = 0;
  wimpt_forceredraw();
}

#endif

/* end trace.c */
