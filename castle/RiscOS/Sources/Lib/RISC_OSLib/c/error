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

/* error.c: ANSI draft (X3J11 May 86) code (various error routines) */
/* Copyright (C) A.C. Norman and A. Mycroft */
/* version 0.01b */

#include "hostsys.h"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <signal.h>
#include <assert.h>  /* for __assert() */
#include <string.h>  /* for strerror */
#include <errno.h>
#include "kernel.h"

extern int _fprintf_lf(FILE *fp, const char *fmt, ...);
extern int _sprintf_lf(char *buff, const char *fmt, ...);

void _sysdie(const char *s)
{
    char v[200];
    char *cs, *ct;

    cs = v;
    ct = _kernel_getmessage("*** fatal error in run time system: ", "C33");
    while ((*cs++ = *ct++) >= ' ');
    cs--;
    ct = (char *)s;
    while ((*cs++ = *ct++) >= ' ');
    _sys_msg(v);
    exit(1);
}

/* from <assert.h> */
void __assert(const char *expr, const char *file, int line)
{
    const char *s;
    s = _kernel_getmessage("*** assertion failed: %s, file %s, line %d", "C34");

    if (!_sys__assert(s, expr, NULL, file, line)) {
        _fprintf_lf(stderr, s, expr, file, line);
        fputc('\n', stderr);
    }
    abort();
}

void __assert2(const char *expr, const char *func, const char *file, int line)
{
    const char *s;
    s = _kernel_getmessage_def("*** assertion failed: %s, function %s, file %s, line %d", "C73");

    if (!_sys__assert(s, expr, func, file, line)) {
        _fprintf_lf(stderr, s, expr, func, file, line);
        fputc('\n', stderr);
    }
    abort();
}

extern _kernel_oserror *_kernel_peek_last_oserror(void);
extern char *_hostos_error_string(int no, char *buf) {
    buf = buf; /* unused */
    if (no == -1) {
        _kernel_oserror *e = _kernel_peek_last_oserror();
        return (e == NULL) ? _kernel_getmessage("unspecified error", "C69") : e->errmess;
    } else {
        return _kernel_getmessage("unknown error", "C70");
    }
}

/* end of error.c */
