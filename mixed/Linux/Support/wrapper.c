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

#define _GNU_SOURCE
#include <errno.h>
#include <error.h>
#include <stdbool.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <sys/prctl.h>
#include <termios.h>
#include <unistd.h>
#include <signal.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>

struct termios oldTioIn, newTioIn;

static void stop_handler(int signal) {
  tcsetattr(0, TCSANOW, &oldTioIn);
  raise(SIGSTOP);
  tcsetattr(0, TCSANOW, &newTioIn);
}

int main(int argc, char **argv) {


  // Ignore fatal signals
  signal(SIGINT, SIG_IGN);
  signal(SIGTERM, SIG_IGN);

  // Get terminal status, if successful reopen terminal for input.
  if (!tcgetattr(0, &oldTioIn)) {
    int fd = open("/proc/self/fd/0", O_RDONLY);
    if (fd > 0) {
      dup2(fd, 0);
      close(fd);
    }

    // Disable terminal echo.
    newTioIn = oldTioIn;
    newTioIn.c_iflag &= ~IGNCR & ~INLCR;
    newTioIn.c_cc[VMIN] = 1;
    newTioIn.c_cc[VTIME] = 0;
    newTioIn.c_lflag &= ~ICANON & ~ECHO;
    signal(SIGTSTP, &stop_handler);
    signal(SIGTTIN, &stop_handler);
    signal(SIGTTOU, &stop_handler);

    tcsetattr(0, TCSANOW, &newTioIn);

  }

  int sockets[2];
  socketpair(AF_UNIX, SOCK_SEQPACKET | SOCK_CLOEXEC, 0, sockets);

  pid_t self = getpid();
  pid_t pid = fork();
  if (pid < 0) {
    return 109;
  }
  if (!pid) {
    // Don't Ignore fatal signals
    signal(SIGINT, SIG_DFL);
    signal(SIGTERM, SIG_DFL);

    prctl(PR_SET_PDEATHSIG, SIGTERM, 0, 0, 0);
    int socket = fcntl(sockets[1], F_DUPFD, 32);
    char s[48];
    sprintf(s, "RISC_OS_Internet_SocketServer=%i", socket);
    putenv(s);

    if (getppid() != self) _exit(110);
    execvp(argv[1], argv + 1);
    _exit(116);
  }
  close(sockets[1]);

  while(true) {
    int32_t socket_args[3];
    int s = read(sockets[0], socket_args, sizeof(socket_args));
    if (s == 0) break;

    s = -1;
    if (socket_args[0] == AF_INET) {
      s = socket(socket_args[0], socket_args[1], socket_args[2]);
    }

    union {
      char buf[CMSG_SPACE(sizeof(int))];
      struct cmsghdr align;
    } u;

    struct msghdr msg = {
      .msg_control = u.buf,
      .msg_controllen = sizeof(u.buf)
    };
    struct cmsghdr *cmsg;
    cmsg = CMSG_FIRSTHDR(&msg);
    cmsg->cmsg_level = SOL_SOCKET;
    cmsg->cmsg_type = SCM_RIGHTS;
    cmsg->cmsg_len = CMSG_LEN(sizeof(int));
    memcpy(CMSG_DATA(cmsg), &s, sizeof(s));

    sendmsg(sockets[0], &msg, 0);
    close(s);
  }

  // Write a new line to keep output tidy.
  if (isatty(1)) write(1, "\n", 1);

  // Restore terminal
  tcsetattr(0, TCSANOW, &oldTioIn);

  int wstatus;
  waitpid(pid, &wstatus, 0);
  return WEXITSTATUS(wstatus);
}
