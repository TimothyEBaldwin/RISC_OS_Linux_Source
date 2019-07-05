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
/* >prgname.c
 * Copyright © 2009, RISC OS Open Ltd.
 * All rights reserved.
 */


#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include "prgname.h"


char *program_name(char *filename, char *buf, int bufsz)
{
  uint32_t len;
  char    *ptr;

  if (filename == NULL || bufsz < 1)
    return filename;

  /* Copy the filename into a buffer */
  len = strlen(filename);
  snprintf(buf, bufsz, "%s", filename);

  /* Remove any trailing '.exe' string */
  if (len > 3 && 0 == strcmp(buf + len - 4, ".exe"))
    buf[len - 4] = '\0';

  /* Skip over all instances of "\", "/", ":" or "." in the string */
  ptr = strrchr(buf, '\\');
  if (ptr)
    buf = ptr + 1;
  ptr = strrchr(buf, '/');
  if (ptr)
    buf = ptr + 1;
  ptr = strrchr(buf, ':');
  if (ptr)
    buf = ptr + 1;
  ptr = strrchr(buf, '.');

  return ptr ? ptr + 1 : buf;
}
