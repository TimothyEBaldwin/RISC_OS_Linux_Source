/*
 * Copyright (c) 2015, Timothy Baldwin
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of RISC OS Open Ltd nor the names of its contributors
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

#include <stdint.h>
#include <limits.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

#include <attr/xattr.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

struct ro_attr {
  unsigned load, exec, attributes;
};

static char dest[PATH_MAX];
static int return_code = 0;
static bool strip = false;
static bool suffix_priority = false;
static bool write_suffix = false;

static bool is_suffix(const char *end) {
  if (end[-4] != ',') return false;
  for (int i = -1; i != -4; --i) {
    char c = end[i];
    if ((c < '0' || c > '9') && (c < 'a' || c > 'f')) return false;
  }
  return true;
}

static void process(char *source) {
  int r;
  int filetype = -1;

  if (strlen(source) > sizeof(dest)) {
    fprintf(stderr, "Name too long: %s\n", source);
    return_code |= 1;
    return;
  }

  char *end = stpcpy(dest, source);

  struct stat s;
  r = stat(source, &s);
  if (r) {
    fprintf(stderr, "Unable to stat: %s\n", source);
    return_code |= 2;
    return;
  }

  struct ro_attr attr;
  int attr_len = getxattr(source, "user.RISC_OS.LoadExec", &attr, sizeof(attr));
  if (attr_len < 0  && errno != ENOATTR) {
    fprintf(stderr, "Unable to read attribute: %s\n", source);
    return_code |= 4;
    return;
  }

  bool suffixed = is_suffix(end);

  if (attr_len >= 8 && (attr.load & 0xFFF00000) == 0xFFF00000) {
    filetype = (attr.load >> 8) & 0xFFF;
  }

  if (suffixed && (filetype == -1 || suffix_priority)) {
      filetype = strtoul(end - 3, 0, 16);
  }

  if (strip) {
    if (suffixed) end -= 4;

    if (write_suffix && filetype <= 0xFFF && !((s.st_mode & 0111) && filetype == 0xFE6))
      end += sprintf(end, ",%03x" , filetype);

    *end = 0;
    if (strcmp(source, dest)) {
      r = rename(source, dest);
      if (r) {
        fprintf(stderr, "Unable to rename: %s\n", source);
        return_code |= 16;
        return;
      }
    }
  }

  if (filetype >= 0) {
    uint64_t time = ((uint64_t)s.st_mtime + 25567ULL * 24 * 3600) * 100;
    attr.load = 0xFFF00000U | (time >> 32) | (filetype << 8);
    attr.exec = (uint32_t)(time);
    r = setxattr(source, "user.RISC_OS.LoadExec", &attr, 8, 0);
    if (r && errno != ENODATA) {
      fprintf(stderr, "Unable to set attribute: %s\n", source);
      return_code |= 8;
      return;
    }
  }
}

int main(int argc, char **argv) {
  int opt;

  while ((opt = getopt(argc, argv, "pws")) != -1) {
    switch (opt) {
    case 'p':
      suffix_priority = true;
      break;
    case 'w':
      write_suffix = true;
      // Fall though
    case 's':
      strip = true;
      break;
    default:
      fprintf(stderr, "usage\n");
      return 1;
    }
  }

  int dirfd = open(".", O_RDONLY);
  if (dirfd < 0) {
    fprintf(stderr, "Unable to open CSD\n");
    return 1;
  }

  while(optind != argc) {
    int r = fchdir(dirfd);
    if (r) {
      fprintf(stderr, "Unable to set CSD\n");
      return 1;
    }
    process(argv[optind++]);
  }
  return return_code;
}
