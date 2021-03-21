/*
 * Copyright (c) 2017, Timothy Baldwin
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

#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>

#include <attr/xattr.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <poll.h>
#include <sched.h>
#include <signal.h>
#include <sys/auxv.h>
#include <sys/epoll.h>
#include <sys/eventfd.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/ptrace.h>
#include <sys/socket.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <termios.h>
#include <time.h>
#include <unistd.h>

#include <asm/hwcap.h>
#include <linux/filter.h>
#include <linux/fs.h>
#include <linux/memfd.h>
#include <linux/ptrace.h>
#include <linux/seccomp.h>

#define SA_RESTORER  0x04000000

static FILE *ass, *c, *basic;

static void basic_line(const char *format, ...) {
  va_list ap;
  va_start(ap, format);
  char line[256];
  int len = vsnprintf(line + 4, sizeof(line) - 4, format, ap) + 4;
  va_end(ap);
  line[0] = 13;
  line[1] = 0;
  line[2] = 0;
  line[3] = len;
  fwrite(line, 1, len, basic);
}

static void define_hex(const char *name, unsigned value) {
  fprintf(ass, "%s * 0x%x\n", name, value);
  fprintf(c, "#define %s 0x%x\n", name, value);
  basic_line("%s%%=&%x", name, value);
}

static void define_decimal(const char *name, int value) {
  fprintf(ass, "%s * %i\n", name, value);
  fprintf(c, "#define %s %i\n", name, value);
  basic_line("%s%%=%i", name, value);
}

#define DEF(x) define_hex("ix_" #x, (unsigned)x);
#define SYSDEF(x) define_decimal(#x, x);
#define EDEF(x) define_decimal("ix_" #x, x);
#define SWI(name, n) \
  fputs("#undef " name "\n#undef X" name "\n", c); \
  define_hex(name, n); \
  define_hex("X" name, 0x20000 | n);

int main(void) {

  ass = fopen("LinuxSyscalls", "w");
  c = fopen("h/syscall_defs", "w");
  basic = fopen("LinuxLib,ffb", "w");
  basic_line("\xDD\xF2LinuxInit");

  EDEF(EPERM)
  EDEF(ENOENT)
  EDEF(ESRCH)
  EDEF(EINTR)
  EDEF(EIO)
  EDEF(ENXIO)
  EDEF(E2BIG)
  EDEF(ENOEXEC)
  EDEF(EBADF)
  EDEF(ECHILD)
  EDEF(EAGAIN)
  EDEF(ENOMEM)
  EDEF(EACCES)
  EDEF(EFAULT)
  EDEF(ENOTBLK)
  EDEF(EBUSY)
  EDEF(EEXIST)
  EDEF(EXDEV)
  EDEF(ENODEV)
  EDEF(ENOTDIR)
  EDEF(EISDIR)
  EDEF(EINVAL)
  EDEF(ENFILE)
  EDEF(EMFILE)
  EDEF(ENOTTY)
  EDEF(ETXTBSY)
  EDEF(EFBIG)
  EDEF(ENOSPC)
  EDEF(ESPIPE)
  EDEF(EROFS)
  EDEF(EMLINK)
  EDEF(EPIPE)
  EDEF(EDOM)
  EDEF(ERANGE)
  EDEF(EDEADLK)
  EDEF(ENAMETOOLONG)
  EDEF(ENOLCK)
  EDEF(ENOSYS)
  EDEF(ENOTEMPTY)
  EDEF(ELOOP)
  EDEF(EWOULDBLOCK)
  EDEF(ENOMSG)
  EDEF(EIDRM)
  EDEF(ECHRNG)
  EDEF(EL2NSYNC)
  EDEF(EL3HLT)
  EDEF(EL3RST)
  EDEF(ELNRNG)
  EDEF(EUNATCH)
  EDEF(ENOCSI)
  EDEF(EL2HLT)
  EDEF(EBADE)
  EDEF(EBADR)
  EDEF(EXFULL)
  EDEF(ENOANO)
  EDEF(EBADRQC)
  EDEF(EBADSLT)
  EDEF(EDEADLOCK)
  EDEF(EBFONT)
  EDEF(ENOSTR)
  EDEF(ENODATA)
  EDEF(ETIME)
  EDEF(ENOSR)
  EDEF(ENONET)
  EDEF(ENOPKG)
  EDEF(EREMOTE)
  EDEF(ENOLINK)
  EDEF(EADV)
  EDEF(ESRMNT)
  EDEF(ECOMM)
  EDEF(EPROTO)
  EDEF(EMULTIHOP)
  EDEF(EDOTDOT)
  EDEF(EBADMSG)
  EDEF(EOVERFLOW)
  EDEF(ENOTUNIQ)
  EDEF(EBADFD)
  EDEF(EREMCHG)
  EDEF(ELIBACC)
  EDEF(ELIBBAD)
  EDEF(ELIBSCN)
  EDEF(ELIBMAX)
  EDEF(ELIBEXEC)
  EDEF(EILSEQ)
  EDEF(ERESTART)
  EDEF(ESTRPIPE)
  EDEF(EUSERS)
  EDEF(ENOTSOCK)
  EDEF(EDESTADDRREQ)
  EDEF(EMSGSIZE)
  EDEF(EPROTOTYPE)
  EDEF(ENOPROTOOPT)
  EDEF(EPROTONOSUPPORT)
  EDEF(ESOCKTNOSUPPORT)
  EDEF(EOPNOTSUPP)
  EDEF(EPFNOSUPPORT)
  EDEF(EAFNOSUPPORT)
  EDEF(EADDRINUSE)
  EDEF(EADDRNOTAVAIL)
  EDEF(ENETDOWN)
  EDEF(ENETUNREACH)
  EDEF(ENETRESET)
  EDEF(ECONNABORTED)
  EDEF(ECONNRESET)
  EDEF(ENOBUFS)
  EDEF(EISCONN)
  EDEF(ENOTCONN)
  EDEF(ESHUTDOWN)
  EDEF(ETOOMANYREFS)
  EDEF(ETIMEDOUT)
  EDEF(ECONNREFUSED)
  EDEF(EHOSTDOWN)
  EDEF(EHOSTUNREACH)
  EDEF(EALREADY)
  EDEF(EINPROGRESS)
  EDEF(ESTALE)
  EDEF(EUCLEAN)
  EDEF(ENOTNAM)
  EDEF(ENAVAIL)
  EDEF(EISNAM)
  EDEF(EREMOTEIO)
  EDEF(EDQUOT)
  EDEF(ENOMEDIUM)
  EDEF(EMEDIUMTYPE)
  EDEF(ECANCELED)
  EDEF(ENOKEY)
  EDEF(EKEYEXPIRED)
  EDEF(EKEYREVOKED)
  EDEF(EKEYREJECTED)
  EDEF(EOWNERDEAD)
  EDEF(ENOTRECOVERABLE)
  EDEF(ERFKILL)
  EDEF(EHWPOISON)

  DEF(AT_FDCWD)
  DEF(AT_HWCAP)
  DEF(AT_HWCAP2)
  DEF(AT_REMOVEDIR)
  DEF(AT_SYMLINK_NOFOLLOW)
  DEF(BPF_ABS)
  DEF(BPF_JEQ)
  DEF(BPF_JGE)
  DEF(BPF_JMP)
  DEF(BPF_K)
  DEF(BPF_LD)
  DEF(BPF_RET)
  DEF(BPF_W)
  DEF(CLOCK_MONOTONIC)
  DEF(CLOCK_MONOTONIC_RAW)
  DEF(CLOCK_REALTIME)
  DEF(CLONE_FILES)
  DEF(CLONE_FS)
  DEF(CLONE_SIGHAND)
  DEF(CLONE_SYSVSEM)
  DEF(CLONE_THREAD)
  DEF(CLONE_VM)
  DEF(ECHO)
  DEF(EFD_CLOEXEC)
  DEF(EFD_NONBLOCK)
  DEF(EFD_SEMAPHORE)
  DEF(EPOLLERR)
  DEF(EPOLLET)
  DEF(EPOLLEXCLUSIVE)
  DEF(EPOLLHUP)
  DEF(EPOLLIN)
  DEF(EPOLLONESHOT)
  DEF(EPOLLOUT)
  DEF(EPOLLPRI)
  DEF(EPOLLRDHUP)
  DEF(EPOLLWAKEUP)
  DEF(EPOLL_CTL_ADD)
  DEF(EPOLL_CTL_DEL)
  DEF(EPOLL_CTL_MOD)
  DEF(FIONBIO)
  DEF(FIONREAD)
  DEF(F_GETFL)
  DEF(F_OFD_GETLK)
  DEF(F_OFD_SETLK)
  DEF(F_OFD_SETLKW)
  DEF(F_RDLCK)
  DEF(F_SETFL)
  DEF(F_SETOWN)
  DEF(F_SETSIG)
  DEF(F_UNLCK)
  DEF(F_WRLCK)
  DEF(HWCAP2_AES)
  DEF(HWCAP2_CRC32)
  DEF(HWCAP2_PMULL)
  DEF(HWCAP2_SHA1)
  DEF(HWCAP2_SHA2)
  DEF(HWCAP_26BIT)
  DEF(HWCAP_CRUNCH)
  DEF(HWCAP_EDSP)
  DEF(HWCAP_EVTSTRM)
  DEF(HWCAP_FAST_MULT)
  DEF(HWCAP_FPA)
  DEF(HWCAP_HALF)
  DEF(HWCAP_IDIV)
  DEF(HWCAP_IDIVA)
  DEF(HWCAP_IDIVT)
  DEF(HWCAP_IWMMXT)
  DEF(HWCAP_JAVA)
  DEF(HWCAP_LPAE)
  DEF(HWCAP_NEON)
  DEF(HWCAP_SWP)
  DEF(HWCAP_THUMB)
  DEF(HWCAP_THUMBEE)
  DEF(HWCAP_TLS)
  DEF(HWCAP_VFP)
  DEF(HWCAP_VFPD32)
  DEF(HWCAP_VFPv3)
  DEF(HWCAP_VFPv3D16)
  DEF(HWCAP_VFPv4)
  DEF(ICANON)
  DEF(IGNCR)
  DEF(INLCR)
  DEF(MAP_ANONYMOUS)
  DEF(MAP_FIXED)
  DEF(MAP_FIXED_NOREPLACE)
  DEF(MAP_NORESERVE)
  DEF(MAP_PRIVATE)
  DEF(MAP_SHARED)
  DEF(MFD_CLOEXEC)
  DEF(MINSIGSTKSZ)
  DEF(MSG_CMSG_CLOEXEC)
  DEF(MSG_CTRUNC)
  DEF(MSG_DONTROUTE)
  DEF(MSG_DONTWAIT)
  DEF(MSG_EOR)
  DEF(MSG_ERRQUEUE)
  DEF(MSG_OOB)
  DEF(MSG_PEEK)
  DEF(MSG_TRUNC)
  DEF(MSG_WAITALL)
  DEF(O_ASYNC)
  DEF(O_CLOEXEC)
  DEF(O_CREAT)
  DEF(O_DIRECTORY)
  DEF(O_DSYNC)
  DEF(O_EXCL)
  DEF(O_LARGEFILE)
  DEF(O_NOFOLLOW)
  DEF(O_NONBLOCK)
  DEF(O_PATH)
  DEF(O_RDONLY)
  DEF(O_RDWR)
  DEF(O_SYNC)
  DEF(O_TRUNC)
  DEF(PATH_MAX)
  DEF(POLLERR)
  DEF(POLLHUP)
  DEF(POLLIN)
  DEF(POLLMSG)
  DEF(POLLNVAL)
  DEF(POLLOUT)
  DEF(POLLPRI)
  DEF(POLLRDBAND)
  DEF(POLLRDHUP)
  DEF(POLLRDNORM)
  DEF(POLLREMOVE)
  DEF(POLLWRBAND)
  DEF(POLLWRNORM)
  DEF(PROT_EXEC)
  DEF(PROT_NONE)
  DEF(PROT_READ)
  DEF(PROT_WRITE)
  DEF(PR_SET_NO_NEW_PRIVS)
  DEF(PR_SET_PDEATHSIG)
  DEF(PR_SET_SECCOMP)
  DEF(PTRACE_CONT)
  DEF(PTRACE_GETREGS)
  DEF(PTRACE_O_TRACESYSGOOD)
  DEF(PTRACE_SETOPTIONS)
  DEF(PTRACE_SETREGS)
  DEF(PTRACE_SET_SYSCALL)
  DEF(PTRACE_SYSCALL)
  DEF(PTRACE_TRACEME)
  DEF(RENAME_EXCHANGE)
  DEF(RENAME_NOREPLACE)
  DEF(RENAME_WHITEOUT)
  DEF(SA_NODEFER)
  DEF(SA_ONSTACK)
  DEF(SA_RESTART)
  DEF(SA_RESTORER)
  DEF(SA_SIGINFO)
  DEF(SECCOMP_MODE_FILTER)
  DEF(SECCOMP_RET_ALLOW)
  DEF(SECCOMP_RET_TRAP)
  DEF(SEEK_CUR)
  DEF(SEEK_END)
  DEF(SEEK_SET)
  DEF(SIGABRT)
  DEF(SIGALRM)
  DEF(SIGBUS)
  DEF(SIGCHLD)
  DEF(SIGCONT)
  DEF(SIGEV_SIGNAL)
  DEF(SIGFPE)
  DEF(SIGHUP)
  DEF(SIGILL)
  DEF(SIGINT)
  DEF(SIGIO)
  DEF(SIGIOT)
  DEF(SIGKILL)
  DEF(SIGPIPE)
  DEF(SIGPROF)
  DEF(SIGPWR)
  DEF(SIGQUIT)
  DEF(SIGSEGV)
  DEF(SIGSTKFLT)
  DEF(SIGSTOP)
  DEF(SIGSYS)
  DEF(SIGTERM)
  DEF(SIGTRAP)
  DEF(SIGTSTP)
  DEF(SIGTTIN)
  DEF(SIGTTOU)
  DEF(SIGURG)
  DEF(SIGUSR1)
  DEF(SIGUSR2)
  DEF(SIGVTALRM)
  DEF(SIGWINCH)
  DEF(SIGXCPU)
  DEF(SIGXFSZ)
  DEF(SIG_BLOCK)
  DEF(SIG_DFL)
  DEF(SIG_IGN)
  DEF(SIG_SETMASK)
  DEF(SIG_UNBLOCK)
  DEF(SOCK_CLOEXEC)
  DEF(SOCK_NONBLOCK)
  DEF(SOCK_SEQPACKET)
  DEF(SOL_SOCKET)
  DEF(SO_BROADCAST)
  DEF(SO_BSDCOMPAT)
  DEF(SO_DEBUG)
  DEF(SO_DONTROUTE)
  DEF(SO_ERROR)
  DEF(SO_KEEPALIVE)
  DEF(SO_LINGER)
  DEF(SO_NO_CHECK)
  DEF(SO_OOBINLINE)
  DEF(SO_PASSCRED)
  DEF(SO_PEERCRED)
  DEF(SO_PRIORITY)
  DEF(SO_RCVBUF)
  DEF(SO_RCVBUFFORCE)
  DEF(SO_RCVLOWAT)
  DEF(SO_RCVTIMEO)
  DEF(SO_REUSEADDR)
  DEF(SO_REUSEPORT)
  DEF(SO_SNDBUF)
  DEF(SO_SNDBUFFORCE)
  DEF(SO_SNDLOWAT)
  DEF(SO_SNDTIMEO)
  DEF(SO_TYPE)
  DEF(S_IFBLK)
  DEF(S_IFCHR)
  DEF(S_IFDIR)
  DEF(S_IFIFO)
  DEF(S_IFLNK)
  DEF(S_IFMT)
  DEF(S_IFREG)
  DEF(S_IFSOCK)
  DEF(S_ISGID)
  DEF(S_ISUID)
  DEF(S_ISVTX)
  DEF(TCGETS)
  DEF(TCP_CORK)
  DEF(TCP_MAXSEG)
  DEF(TCP_NODELAY)
  DEF(TCSETS)
  DEF(TIMER_ABSTIME)
  DEF(TIOCGPTN)
  DEF(TIOCSPTLCK)
  DEF(UTIME_NOW)
  DEF(UTIME_OMIT)
  DEF(VMIN)
  DEF(VTIME)
  DEF(WCONTINUED)
  DEF(WEXITED)
  DEF(WNOHANG)
  DEF(WSTOPPED)
  DEF(WUNTRACED)
  DEF(XATTR_CREATE)
  DEF(__WALL)
  DEF(__WCLONE)
  DEF(__WNOTHREAD)

  define_hex("ix_struct_ucontext_mcontext", offsetof(struct ucontext_t, uc_mcontext));
  define_hex("ix_struct_ucontext_registers", offsetof(struct ucontext_t, uc_mcontext.arm_r0));

#include "syscall_list.h"

  SWI("IXSupport_LinuxSyscall", 0x59EC0)
  SWI("IXSupport_ConvertError", 0x59EC1)

  fputs("\n END\n", ass);
  basic_line("\xE1");
  fputs("\x0D\xFF", basic);

  return 0;
}
