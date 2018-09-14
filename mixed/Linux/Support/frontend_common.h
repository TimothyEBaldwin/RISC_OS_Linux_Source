/*
 * Copyright (c) 2016-2018, Timothy Baldwin
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

#include <sys/types.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/signal.h>
#include <sys/signalfd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

#include <bitset>

#include "SocketKVM_Protocol.h"
#include "Keyboard.h"


int sig_fd, sockets[2];
pid_t pid;
const size_t screen_size = 1024*1024*100;
int screen_fd = -1;
void *pixels = mmap(0, screen_size, PROT_READ, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
std::bitset<max_keycode + 1> key_state;
bool swapmouse;


inline off_t get_file_size(int fd) {
  struct stat s;
  s.st_size = 0;
  fstat(fd, &s);
  return s.st_size;
}

void run_RISC_OS(char **args) {

  sigset_t sigset;
  sigemptyset(&sigset);
  sigaddset(&sigset, SIGCHLD);
  sigprocmask(SIG_BLOCK, &sigset, nullptr);
  sig_fd = signalfd(-1, &sigset, SFD_CLOEXEC | SFD_NONBLOCK);

  socketpair(AF_UNIX, SOCK_SEQPACKET | SOCK_CLOEXEC, 0, sockets);

  pid_t self = getpid();
  pid = fork();
  if (!pid) {
    prctl(PR_SET_PDEATHSIG, SIGTERM, 0, 0, 0);
    int socket = fcntl(sockets[1], F_DUPFD, 31);
    char s[40];
    sprintf(s, "RISC_OS_SocketKVM_Socket=%i", socket);
    putenv(s);

    sigset_t sigset;
    sigemptyset(&sigset);
    sigprocmask(SIG_SETMASK, &sigset, nullptr);

    if (getppid() == self) execvp(*args, args);
    _exit(1);
  }
  close(sockets[1]);
}

void exit_poll() {
  struct signalfd_siginfo s;
  while(read(sig_fd, &s, sizeof(s)) > 0);

  int status;
  if (waitpid(pid, &status, WNOHANG) == pid) exit(WEXITSTATUS(status));
}

int read_msg(command &c) {

  char buf[CMSG_SPACE(sizeof(int)) * 2];

  struct iovec iov = {
    .iov_base = &c,
    .iov_len = sizeof(c),
  };

  struct msghdr msg = {
    msg.msg_control = buf,
    msg.msg_controllen = sizeof(buf),
    msg.msg_iov = &iov,
    msg.msg_iovlen = 1,
  };

  int s = recvmsg(sockets[0], &msg, MSG_DONTWAIT);

  if (s >= 0) for (struct cmsghdr *i = CMSG_FIRSTHDR(&msg); i != NULL; i = CMSG_NXTHDR(&msg, i)) {
    if (i->cmsg_level == SOL_SOCKET && i->cmsg_type == SCM_RIGHTS) {
      close(screen_fd);
      screen_fd = *(int *)CMSG_DATA(i);
      mmap(pixels, screen_size, PROT_READ, MAP_FIXED | MAP_SHARED, screen_fd, 0);
    }
  }

  return s;
}

void send_report(const report &r) {
  write(sockets[0], &r, sizeof(r));
}

void report_key(int keycode, bool down) {

  if (swapmouse && (keycode == KeyNo_CentreMouse || keycode == KeyNo_RightMouse)) {
    keycode ^= KeyNo_CentreMouse ^ KeyNo_RightMouse;
  }

  report r;
  r.reason = down ? report::ev_keydown : report::ev_keyup;
  r.key.code = keycode;
  key_state[keycode] = down;
  send_report(r);
}

void resend_keys() {
  report r;
  for(int i = 0; i != key_state.size(); ++i) {
    if (key_state[i]) {
      r.reason = report::ev_keydown;
      r.key.code = i;
      send_report(r);
    }
  }
}
