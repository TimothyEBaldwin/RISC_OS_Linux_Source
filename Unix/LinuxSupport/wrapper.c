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

#define _GNU_SOURCE
#include <errno.h>
#include <error.h>
#include <fcntl.h>
#include <getopt.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <termios.h>
#include <unistd.h>

struct termios newTioIn;

struct terminal {
  struct termios tio;
  bool is_term;
} terminals[3];

volatile pid_t child;

static void restore_terminal(void) {
  for(int i = 0; i != 3; ++i)
    if (terminals[i].is_term)
      tcsetattr(i, TCSANOW, &terminals[i].tio);
}

static void stop_handler(int s) {
  restore_terminal();
  raise(SIGSTOP);
  if (terminals[0].is_term)
    tcsetattr(0, TCSANOW, &newTioIn);
}

static void fatal_handler(int s) {
  pid_t child2 = child;
  if (child2) kill(child2, s);
}

static void child_handler(int s) {
  child = 0;
}

static int seccomp_file = 9;

static void __attribute__((noreturn)) do_exec(char **argv) {
  if (seccomp_file >= 0) lseek(seccomp_file, SEEK_SET, 0);
  execvp(*argv, argv);
  _exit(116);
}

int main(int argc, char **argv) {

  bool socket_server = false;
  bool handle_reboots = false;

  static const struct option opts[] = {
    {"arg", required_argument, NULL, 'a'},
    {"network", no_argument, NULL, 'n'},
    {"handle-reboots", no_argument, NULL, 'r'},
    {"seccomp", no_argument, NULL, 's'},
    {NULL, 0, NULL, 0}
  };

  char *args[argc + 2];
  char **argp = args;

  int opt;
  while ((opt = getopt_long(argc, argv, "-nr", opts, NULL)) != -1) {
    switch (opt) {
      case 1:
      case 'a':
        *argp++ = optarg;
        break;
      case 'n':
        socket_server = true;
        break;
      case 'r':
        handle_reboots = true;
        break;
      case 's': {
        const char *file = getenv("RISC_OS__seccomp");
        if (!file)
          file = "Built/seccomp-";
        seccomp_file = open(file, O_RDONLY);
        if (seccomp_file < 0) error(1, errno, "Unable to open seccomp rule file '%s'", file);
        static char s[11];
        sprintf(s, "%i", seccomp_file);
        *argp++ = "--seccomp";
        *argp++ = s;
        break;
      }
      default:
        fprintf(stderr, "usage\n");
        return 1;
    }
  }

  while(optind != argc) *argp++ = argv[optind++];
  *argp = 0;

  // Die if parent dies
  prctl(PR_SET_PDEATHSIG, SIGTERM, 0, 0, 0);

  bool have_terminal = false;
  for(int i = 0; i != 3; ++i) {
    if (!tcgetattr(0, &terminals[i].tio)) {
      terminals[i].is_term = true;
      have_terminal = true;
    }
  }

  if (!have_terminal && !handle_reboots && !socket_server)
    do_exec(args);

  // Is standard input a terminal?
  if (terminals[0].is_term) {

    // Standard input is a terminal, so reopen to it avoid
    // other programs having to cope with non-blocking etc.
    int fd = open("/proc/self/fd/0", O_RDONLY);
    if (fd > 0) {
      dup2(fd, 0);
      close(fd);
    }

    // Disable terminal echo.
    newTioIn = terminals[0].tio;
    newTioIn.c_iflag &= ~IGNCR & ~INLCR;
    newTioIn.c_cc[VMIN] = 1;
    newTioIn.c_cc[VTIME] = 0;
    newTioIn.c_lflag &= ~ICANON & ~ECHO;
  }

  // Install cleanup signal handlers
  struct sigaction sigact = {};
  sigfillset(&sigact.sa_mask);
  sigact.sa_flags =  SA_RESTART | SA_NOCLDSTOP;
  sigact.sa_handler = &child_handler;
  sigaction(SIGCHLD, &sigact, 0);

  sigdelset(&sigact.sa_mask, SIGCHLD);
  sigact.sa_handler = &stop_handler;
  sigaction(SIGTSTP, &sigact, 0);
  sigaction(SIGTTIN, &sigact, 0);
  sigaction(SIGTTOU, &sigact, 0);

  sigact.sa_handler = &fatal_handler;
  sigaction(SIGINT,  &sigact, 0);
  sigaction(SIGHUP,  &sigact, 0);
  sigaction(SIGTERM, &sigact, 0);

  if (terminals[0].is_term) {
    // Set new termnal state
    tcsetattr(0, TCSANOW, &newTioIn);
  }

  int status = 0;

  do {
    int sockets[2];
    if (socket_server)
      socketpair(AF_UNIX, SOCK_SEQPACKET, 0, sockets);

    // Block signals
    sigset_t sigset;
    sigfillset(&sigset);
    sigprocmask(SIG_BLOCK, &sigset, 0);

    // Do the fork!
    pid_t self = getpid();
    pid_t pid = fork();
    if (pid < 0) {
      restore_terminal();
      return 109;
    }
    if (!pid) {
      prctl(PR_SET_PDEATHSIG, SIGTERM, 0, 0, 0);
      if (getppid() != self) _exit(110);

      if (socket_server) {
        close(sockets[0]);
        char s[48];
        sprintf(s, "RISC_OS_Internet_SocketServer=%i", sockets[1]);
        putenv(s);
      }

      sigprocmask(SIG_UNBLOCK, &sigset, 0);
      do_exec(args);
    }
    child = pid;
    sigprocmask(SIG_UNBLOCK, &sigset, 0);


    if (socket_server) {
      close(sockets[1]);

      while(true) {
        int32_t socket_args[3];
        int s = read(sockets[0], socket_args, sizeof(socket_args));
        if (s == 0) break;

        if (socket_args[0] == AF_INET) {
          s = socket(socket_args[0], socket_args[1], socket_args[2]);
        } else {
          s = -1;
          errno = EPERM;
        }

        if (s < 0) {
          int32_t e = -errno;
          write(sockets[0], &e, 4);
        } else {

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
      }

      close(sockets[0]);
    }

    int wstatus;
    waitpid(pid, &wstatus, 0);
    status = WEXITSTATUS(wstatus);

    // Write a new line to keep output tidy.
    if (isatty(1)) write(1, "\n", 1);

    argp[0] = "--isreboot";
    argp[1] = 0;

  } while(status == 100 && handle_reboots);

  // Restore terminal
  restore_terminal();
  return status;

}
