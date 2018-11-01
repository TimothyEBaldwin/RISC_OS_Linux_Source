/* Copyright 2009 Castle Technology Ltd
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
/* >err.c
 * Copyright © 2009, RISC OS Open Ltd.
 * All rights reserved.
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdbool.h>
#include <string.h>
#include "err.h"


static char prog_name[256] = "";
static char *err_format = NULL;
static char *err_extra  = NULL;
static bool err_inited  = false;

void err_init(const char *prgname)
{
  snprintf(prog_name, sizeof(prog_name), "%s", prgname);
  err_inited = true;
}


void err_report(const char *format, ...)
{
  va_list va;

  fprintf(stderr, "%s: ", prog_name);
  va_start(va, format);
  vfprintf(stderr, format, va);
  va_end(va);
  fprintf(stderr, "\n");
}


void err_fail(const char *format, ...)
{
  va_list va;

  fprintf(stderr, "%s: ", prog_name);
  va_start(va, format);
  vfprintf(stderr, format, va);
  va_end(va);
  fprintf(stderr, "\n");

  exit(EXIT_FAILURE);
}


void err_lib_error(const char *format, const char *extra)
{
  if (err_format)
    free(err_format);
  if (err_extra)
    free(err_extra);

  err_format = malloc(1 + strlen(format));
  err_extra  = malloc(1 + strlen(extra));
  if (err_format)
    sprintf(err_format, "%s", format);
  if (err_extra)
    sprintf(err_extra, "%s", extra);
}


char *err_get_error_fmt(void)
{
  return err_inited ? err_format : NULL;
}


char *err_get_error_extra(void)
{
  return err_inited ? err_extra : NULL;
}
