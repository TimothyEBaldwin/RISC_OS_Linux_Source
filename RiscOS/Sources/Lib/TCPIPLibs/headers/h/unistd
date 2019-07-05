/*-
 * Copyright (c) 1991, 1993, 1994
 *	The Regents of the University of California.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by the University of
 *	California, Berkeley and its contributors.
 * 4. Neither the name of the University nor the names of its contributors
 *    may be used to endorse or promote products derived from this software
 *    without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 *
 *	@(#)unistd.h	8.10 (Berkeley) 4/16/94
 */

#ifndef _UNISTD_H_
#define	_UNISTD_H_

#include <sys/cdefs.h>
#include <sys/types.h>
#include <sys/unistd.h>

#define	 STDIN_FILENO	0	/* standard input file descriptor */
#define	STDOUT_FILENO	1	/* standard output file descriptor */
#define	STDERR_FILENO	2	/* standard error file descriptor */

#ifndef NULL
#define	NULL		0	/* null pointer constant */
#endif

__BEGIN_DECLS
__dead void
	 _exit(int) __dead2;
int	 access(const char *, int);
unsigned int	 alarm(unsigned int);
int	 chdir(const char *);
int	 chown(const char *, uid_t, gid_t);
int	 close(int);
size_t	 confstr(int, char *, size_t);
int	 dup(int);
int	 dup2(int, int);
int	 execl(const char *, const char *, ...);
int	 execle(const char *, const char *, ...);
int	 execlp(const char *, const char *, ...);
int	 execv(const char *, char * const *);
int	 execve(const char *, char * const *, char * const *);
int	 execvp(const char *, char * const *);
pid_t	 fork(void);
long	 fpathconf(int, int);
char	*getcwd(char *, size_t);
gid_t	 getegid(void);
uid_t	 geteuid(void);
gid_t	 getgid(void);
int	 getgroups(int, gid_t []);
char	*getlogin(void);
pid_t	 getpgrp(void);
pid_t	 getpid(void);
pid_t	 getppid(void);
uid_t	 getuid(void);
int	 isatty(int);
int	 link(const char *, const char *);
off_t	 lseek(int, off_t, int);
long	 pathconf(const char *, int);
int	 pause(void);
int	 pipe(int *);
ssize_t	 read(int, void *, size_t);
int	 rmdir(const char *);
int	 setgid(gid_t);
int	 setpgid(pid_t, pid_t);
pid_t	 setsid(void);
int	 setuid(uid_t);
unsigned int	 sleep(unsigned int);
long	 sysconf(int);
pid_t	 tcgetpgrp(int);
int	 tcsetpgrp(int, pid_t);
char	*ttyname(int);
int	 unlink(const char *);
ssize_t	 write(int, const void *, size_t);

#ifndef	_POSIX_SOURCE
#ifdef	__STDC__
struct timeval;				/* select(2) */
#endif
int	 acct(const char *);
int	 async_daemon(void);
char	*brk(const char *);
int	 chroot(const char *);
char	*crypt(const char *, const char *);
int	 des_cipher(const char *, char *, long, int);
int	 des_setkey(const char *key);
int	 encrypt(char *, int);
void	 endusershell(void);
int	 exect(const char *, char * const *, char * const *);
int	 fchdir(int);
int	 fchown(int, uid_t, gid_t);
int	 fsync(int);
int	 ftruncate(int, off_t);
int	 getdomainname(char *, int);
int	 getdtablesize(void);
long	 gethostid(void);
int	 gethostname(char *, int);
mode_t	 getmode(const void *, mode_t);
__pure int
	 getpagesize(void);
char	*getpass(const char *);
char	*getusershell(void);
char	*getwd(char *);			/* obsoleted by getcwd() */
int	 initgroups(const char *, int);
int	 iruserok(unsigned long, int, const char *, const char *);
int	 mknod(const char *, mode_t, dev_t);
int	 mkstemp(char *);
char	*mktemp(char *);
int	 nfssvc(int, void *);
int	 nice(int);
void	 psignal(unsigned int, const char *);
extern const char *const sys_siglist[];
int	 profil(char *, int, int, int);
int	 rcmd(char **, int, const char *,
		const char *, const char *, int *);
char	*re_comp(const char *);
int	 re_exec(const char *);
int	 readlink(const char *, char *, int);
int	 reboot(int);
int	 revoke(const char *);
int	 rresvport(int *);
int	 ruserok(const char *, int, const char *, const char *);
char	*sbrk(int);
int	 select(int, fd_set *, fd_set *, fd_set *, struct timeval *);
int	 setdomainname(const char *, int);
int	 setegid(gid_t);
int	 seteuid(uid_t);
int	 setgroups(int, const gid_t *);
void	 sethostid(long);
int	 sethostname(const char *, int);
int	 setkey(const char *);
int	 setlogin(const char *);
void	*setmode(const char *);
int	 setpgrp(pid_t pid, pid_t pgrp);	/* obsoleted by setpgid() */
int	 setregid(gid_t, gid_t);
int	 setreuid(uid_t, uid_t);
int	 setrgid(gid_t);
int	 setruid(uid_t);
void	 setusershell(void);
int	 swapon(const char *);
int	 symlink(const char *, const char *);
void	 sync(void);
int	 syscall(int, ...);
int	 truncate(const char *, off_t);
int	 ttyslot(void);
unsigned int	 ualarm(unsigned int, unsigned int);
void	 usleep(unsigned int);
void	*valloc(size_t);			/* obsoleted by malloc() */
pid_t	 vfork(void);
#endif /* !_POSIX_SOURCE */
__END_DECLS

#endif /* !_UNISTD_H_ */
