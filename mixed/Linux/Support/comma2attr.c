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

#define _GNU_SOURCE

#include <stdint.h>
#include <limits.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <errno.h>

#include <attr/xattr.h>
#include <attr/attributes.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <endian.h>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <getopt.h>

#define RENAME_NOREPLACE (1 << 0)
static inline int renameat2(int olddirfd, const char *oldpath, int newdirfd, const char *newpath, unsigned int flags) {
  return syscall(SYS_renameat2, olddirfd, oldpath, newdirfd, newpath, flags);
}

struct ro_attr {
  unsigned load, exec, attributes;
};

static char dest[PATH_MAX];
static char path[PATH_MAX * 100];
static int return_code = 0;
static bool strip = false;
static bool attribute_priority = false;
static bool write_suffix = false;
static bool recurse = false;
static bool write_symlink = false;

static inline bool is_suffix(const char *end) {
  if (end[-4] != ',') return false;
  for (int i = -1; i != -4; --i) {
    char c = end[i];
    if ((c < '0' || c > '9') && (c < 'a' || c > 'f')) return false;
  }
  return true;
}

static void process(int dirfd, const char *source, char *path_end) {
  int r;

  for(const char *i = source; *i && path_end < path + sizeof(path) - 2; ++i) {
    char c = *i;
    if (c == 127 || c < 32) c = '?';
    *path_end++ = c;
  }
  *path_end = 0;

  struct stat s;
  r = fstatat(dirfd, source, &s, 0);
  if (r) {
    fprintf(stderr, "Unable to read object metadata: %s: %s\n", path, strerror(errno));
    return_code |= 2;
    return;
  }

  if (recurse && S_ISDIR(s.st_mode)) {
    int fd = openat(dirfd, source, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC);
    if (fd >= 0) {
      DIR *dir = fdopendir(fd);
      struct dirent *e;
      *path_end = '/';
      while(errno= 0, e = readdir(dir)) {
        if (e->d_name[0] != '.' || (e->d_name[1] && (e->d_name[1] != '.' || e->d_name[2]))) {
          process(fd, e->d_name, path_end + 1);
        }
      }
      *path_end = 0;
      if (errno) {
        fprintf(stderr, "Unable to read directory entry from %s: %s\n", path, strerror(errno));
      }
      closedir(dir);
    } else if (errno != ENOTDIR) {
      fprintf(stderr, "Unable to open directory %s: %s\n", path, strerror(errno));
      return_code |= 64;
    }
  }

  fchdir(dirfd);

  if (strlen(source) > sizeof(dest)) {
    fprintf(stderr, "Name too long: %s\n", path);
    return_code |= 1;
    return;
  }

  char *end = stpcpy(dest, source);
  struct ro_attr attr = {};
  unsigned filetype = 0xFFFFFFFF;
  unsigned attr_filetype = 0xFFFFFFFF;
  unsigned suffix_filetype = 0xFFFFFFFF;

  int attr_len = getxattr(source, "user.RISC_OS.LoadExec", &attr, sizeof(attr));
  if (attr_len < 0  && errno != ENOATTR) {
    fprintf(stderr, "Unable to read attribute from %s: %s\n", path, strerror(errno));
    return_code |= 4;
    return;
  }

  if (attr_len >= 8 && (attr.load & htole32(0xFFF00000)) == htole32(0xFFF00000)) {
    filetype = attr_filetype = (le32toh(attr.load) >> 8) & 0xFFF;
  }

  bool suffixed = is_suffix(end);

  if (suffixed) {
    suffix_filetype = strtoul(end - 3, 0, 16);
    if (!attribute_priority || filetype == 0xFFFFFFFF) filetype = suffix_filetype;
  }

  if (filetype <= 0xFFF && filetype != attr_filetype) {
    uint64_t time = ((uint64_t)s.st_mtime + 25567ULL * 24 * 3600) * 100 + s.st_mtim.tv_nsec / 10000000;
    attr.load = htole32(0xFFF00000U | (time >> 32) | (filetype << 8));
    attr.exec = htole32((uint32_t)(time));
    if (attr_len < 8) attr_len = 8;
    r = lsetxattr(source, "user.RISC_OS.LoadExec", &attr, attr_len, 0);

    if (r) {
      if (errno != EPERM) {
        fprintf(stderr, "Unable to set attribute on %s: %s\n", path, strerror(errno));
        return_code |= 32;
      }
      if (filetype != attr_filetype && strip) {
        return_code |= 8;
        return;
      }
    }
  }

  if (write_suffix && filetype <= 0xFFF) {
    if (suffixed) end -= 4;
    if (!S_ISDIR(s.st_mode) && ((filetype != 0xFFF && filetype != 0xFE6) || filetype == suffix_filetype)) {
      end += sprintf(end, ",%03x" , filetype);
    }
  } else if ((strip || suffix_filetype != filetype ) && suffixed) {
    end -= 4;
  }

  *end = 0;
  if (strcmp(source, dest)) {
    r = renameat2(AT_FDCWD, source, AT_FDCWD, dest, RENAME_NOREPLACE);
    if (r && errno == ENOSYS) r = rename(source, dest);
    if (r) {
      fprintf(stderr, "Unable to rename %s to %s: %s\n", path, dest, strerror(errno));
      return_code |= 16;
      return;
    }
  }

}

int main(int argc, char **argv) {
  int opt;

  static const struct option opts[] = {
    {"attribute-priority", no_argument, NULL, 'a'},
    {"suffix-priority", no_argument, NULL, 'p'},
    {"recurse", no_argument, NULL, 'r'},
    {"write-suffix", no_argument, NULL, 'w'},
    {"write-attribute-via-symlink", no_argument, NULL, 'l'},
    {"strip", no_argument, NULL, 's'},
    {NULL, 0, NULL, 0}
  };

  while ((opt = getopt_long(argc, argv, "aprws", opts, NULL)) != -1) {
    switch (opt) {
      case 'a':
        attribute_priority = true;
        break;
      case 'p':
        attribute_priority = false;
        break;
      case 'r':
        recurse = true;
        break;
      case 'w':
        write_suffix = true;
        break;
      case 's':
        strip = true;
        break;
      case 'l':
        write_symlink = true;
        break;
      default:
        fprintf(stderr, "usage\n");
        return 1;
    }
  }

  int dirfd = open(".", O_RDONLY);
  if (dirfd < 0) {
    fprintf(stderr, "Unable to open CSD: %s\n", strerror(errno));
    return 1;
  }

  while(optind != argc) process(dirfd, argv[optind++], path);
  return return_code;
}
