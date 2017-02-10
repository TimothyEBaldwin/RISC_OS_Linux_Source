/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "Licence").
 * You may not use this file except in compliance with the Licence.
 *
 * You can obtain a copy of the licence at
 * cddl/RiscOS/Sources/HWSupport/SD/SDIODriver/LICENCE.
 * See the Licence for the specific language governing permissions
 * and limitations under the Licence.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the Licence file. If applicable, add the
 * following below this CDDL HEADER, with the fields enclosed by
 * brackets "[]" replaced with your own identifying information:
 * Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 2012 Ben Avison.  All rights reserved.
 * Use is subject to license terms.
 */

/** \file message.c
 * Internationalisation.
 */

#include <string.h>
#include <stdarg.h>
#include "kernel.h"
#include "swis.h"

#include "globals.h"
#include "message.h"

static _kernel_oserror m_ErrorBuf;

_kernel_oserror *message_error_lookup(bool local, uint32_t number, const char *name, ...)
{
  const char *arg[4];
  va_list ap;
  va_start(ap, name);
  /* Yes, this technically reads off the end of the stack frame in most cases,
     but there will always be at least 4 words on the stack so this is safe */
  for (int i = 0; i < 4; i++)
    arg[i] = va_arg(ap, const char *);
  va_end(ap);
  
  /* Can't use MessageTrans_ErrorLookup because of the difficulty of allocating
     an input error block in C (at least without wasting most of 256 bytes) */
  m_ErrorBuf.errnum = number;
  _kernel_oserror *e = _swix(MessageTrans_Lookup, _INR(0,7), local ? &g_message_fd : 0, name, m_ErrorBuf.errmess, sizeof m_ErrorBuf.errmess, arg[0], arg[1], arg[2], arg[3]);
  if (e != NULL)
    strncpy(m_ErrorBuf.errmess, strchr(name, ':') + 1, sizeof m_ErrorBuf.errmess);
  return &m_ErrorBuf;
}

const char *message_lookup_direct(const char *token)
{
  const char *result;
  _kernel_oserror *e = _swix(MessageTrans_Lookup, _INR(0,2)|_OUT(2), &g_message_fd, token, 0, &result);
  if (!e)
    return result;
  else
    return e->errmess;
}
