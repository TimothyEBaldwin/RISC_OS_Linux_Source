/* mdXhl.c * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <phk@FreeBSD.org> wrote this file.  As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
 * ----------------------------------------------------------------------------
 */

#include <sys/cdefs.h>
#ifndef RISCOS_TWEAK
__FBSDID("$FreeBSD$");
#endif

#include <sys/types.h>
#include <sys/stat.h>
#ifdef RISCOS_TWEAK
#include "sys/fcntl.h"
#include "sys/param.h" /* For MIN() */
#else
#include <fcntl.h>
#include <unistd.h>
#endif

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>

#include "mdX.h"

char *
MDXEnd(MDX_CTX *ctx, char *buf)
{
	int i;
	unsigned char digest[LENGTH];
	static const char hex[]="0123456789abcdef";

	if (!buf)
		buf = malloc(2*LENGTH + 1);
	if (!buf)
		return 0;
	MDXFinal(digest, ctx);
	for (i = 0; i < LENGTH; i++) {
		buf[i+i] = hex[digest[i] >> 4];
		buf[i+i+1] = hex[digest[i] & 0x0f];
	}
	buf[i+i] = '\0';
	return buf;
}

char *
MDXFile(const char *filename, char *buf)
{
	return (MDXFileChunk(filename, buf, 0, 0));
}

char *
MDXFileChunk(const char *filename, char *buf, off_t ofs, off_t len)
{
	unsigned char buffer[BUFSIZ];
	MDX_CTX ctx;
	struct stat stbuf;
	int f, i, e;
	off_t n;

#ifdef RISCOS_TWEAK
	FILE *handle;

	MDXInit(&ctx);
	handle = fopen(filename, "rb");
	if (handle == NULL)
		return NULL;
	if (fseek(handle, 0, SEEK_END) != 0) {
		i = -1;
		goto error;
	}
	stbuf.st_size = ftell(handle);
#else
	MDXInit(&ctx);
	f = open(filename, O_RDONLY);
	if (f < 0)
		return 0;
	if (fstat(f, &stbuf) < 0) {
		i = -1;
		goto error;
	}
#endif
	if (ofs > stbuf.st_size)
		ofs = stbuf.st_size;
	if ((len == 0) || (len > stbuf.st_size - ofs))
		len = stbuf.st_size - ofs;
#ifdef RISCOS_TWEAK
	if (fseek(handle, ofs, SEEK_SET) != 0) {
		i = -1;
		goto error;
	}
#else
	if (lseek(f, ofs, SEEK_SET) < 0) {
		i = -1;
		goto error;
	}
#endif
	n = len;
	i = 0;
	while (n > 0) {
#ifdef RISCOS_TWEAK
		i = MIN(n, sizeof(buffer));
		if (fread(buffer, sizeof(unsigned char), i, handle) != i) {
			i = -1;
			break;
		}
#else
		if (n > sizeof(buffer))
			i = read(f, buffer, sizeof(buffer));
		else
			i = read(f, buffer, n);
		if (i < 0) 
			break;
#endif
		MDXUpdate(&ctx, buffer, i);
		n -= i;
	} 
error:
	e = errno;
#ifdef RISCOS_TWEAK
	fclose(handle);
#else
	close(f);
#endif
	errno = e;
	if (i < 0)
		return 0;
	return (MDXEnd(&ctx, buf));
}

char *
MDXData (const void *data, unsigned int len, char *buf)
{
	MDX_CTX ctx;

	MDXInit(&ctx);
	MDXUpdate(&ctx,data,len);
	return (MDXEnd(&ctx, buf));
}
