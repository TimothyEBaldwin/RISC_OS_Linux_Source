/*
 * Copyright (c) 2018 Timothy Baldwin
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

#define _POSIX_C_SOURCE 2
#include <errno.h>
#include <error.h>
#include <stdbool.h>
#include <sys/ioctl.h>
#include <sys/prctl.h>
#include <sys/socket.h>
#include <unistd.h>

#include <seccomp.h>

static scmp_filter_ctx ctx;

static void ban(int syscall, const char* message) {
  int rc = seccomp_rule_add(ctx, SCMP_ACT_ERRNO(EPERM), SCMP_SYS(syscall), 0);
  if (rc) error(1, -rc, message);
}

#define BAN(s) ban(SCMP_SYS(s), "Unable to create " #s " rule")

int main(int argc, char **argv) {

  int opt, rc;
  bool allow_unix_socket = false;
  bool allow_symlinks = false;
  bool allow_ptrace = false;

  while ((opt = getopt(argc, argv, "+usp")) != -1) switch (opt) {
    case 'u':
      allow_unix_socket = true;
      break;
    case 's':
      allow_symlinks = true;
      break;
    case 'p':
      allow_ptrace = true;
      break;
  }

  ctx = seccomp_init(SCMP_ACT_ALLOW);
  if (!ctx) error(1, errno, "Unable to create libseccomp context");

#ifdef __aarch64__
  rc = seccomp_arch_add(ctx, SCMP_ARCH_ARM);
  if (rc) error(0, -rc, "Unable to add ARM to libseccomp context");
#endif

  // Don't allow inserting into terminal input buffer
  rc = seccomp_rule_add(ctx, SCMP_ACT_ERRNO(EPERM), SCMP_SYS(ioctl), 1, SCMP_A1(SCMP_CMP_EQ, TIOCSTI));
  if (rc) error(1, -rc, "Unable to create rule to block inserting into terminal input buffer");

  if (!allow_symlinks) {
    BAN(symlink);
    BAN(symlinkat);
  }

  if (!allow_unix_socket) {
    rc = seccomp_rule_add(ctx, SCMP_ACT_ERRNO(EPERM), SCMP_SYS(socket), 1, SCMP_A0(SCMP_CMP_EQ, AF_UNIX));
    if (rc) error(1, -rc, "Unable to create UNIX socket rule");
  }

  if (!allow_ptrace) {
    BAN(ptrace);
  } else {
    BAN(seccomp);
    rc = seccomp_rule_add(ctx, SCMP_ACT_ERRNO(EPERM), SCMP_SYS(prctl), 1, SCMP_A0(SCMP_CMP_EQ, PR_SET_SECCOMP));
    if (rc) error(1, -rc, "Unable to prctl(PR_SET_SECCOMP...) rule");
  }

  BAN(keyctl);
  BAN(request_key);
  BAN(add_key);

  rc = seccomp_export_bpf(ctx, STDOUT_FILENO);
  if (rc) error(1, -rc, "Unable to load seccomp rules");

  return 0;
}
