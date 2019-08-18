/*
 * Copyright (c) 2018 Timothy Baldwin
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
  if (rc) error(1, -rc, "%s", message);
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
