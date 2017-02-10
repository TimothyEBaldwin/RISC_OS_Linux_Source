/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
#include <string.h>
#include <sys/types.h>
#include <kvm.h>

#include "unixlib.h"

kvm_t *
kvm_open(uf, mf, sf, flag, errout)
	const char *uf;
	const char *mf;
	const char *sf;
	int flag;
	const char *errout;
{
	/* Shut up compiler */
	uf = uf; mf = mf; sf = sf; flag = flag; errout = errout;

	return (kvm_t *)0xF0000000;
}

kvm_t *
kvm_openfiles(uf, mf, sf, flag, errout)
	const char *uf;
	const char *mf;
	const char *sf;
	int flag;
	char *errout;
{
	uf = uf; mf = mf; sf = sf; flag = flag; errout = errout;

        return kvm_open(uf, mf, sf, flag, (const char *) errout);
}

int
kvm_close(kd)
	kvm_t *kd;
{
	kd = kd;

	return (0);
}

ssize_t
kvm_read(kd, kva, buf, len)
	kvm_t *kd;
	register u_long kva;
	register void *buf;
	register size_t len;
{
	kd = kd;

	memcpy(buf, (void *) kva, len);

	return (len);
}

char *
kvm_geterr(kd)
	kvm_t *kd;
{
	kd = kd;

	return ("");
}
