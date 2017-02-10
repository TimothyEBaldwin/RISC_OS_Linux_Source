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
#ifndef _MACHINE_PARAM_H_
#define	_MACHINE_PARAM_H_

/*
 * Machine dependent constants for ARM.
 */
#define ALIGNBYTES	(sizeof(long) - 1)
#define ALIGN(p)	(((unsigned long)(p) + ALIGNBYTES) & ~ALIGNBYTES)

#define	KTLBASE		512		/* kernel text logical page base */
#define	PMLBASE		1024		/* physical memory logical page base */
#define	NBPG		32768		/* bytes/page */
#define	PGOFSET		(NBPG-1)	/* byte offset into page */
#define	PGSHIFT		15		/* LOG2(NBPG) */
#define	CLSIZE		1
#define	CLSIZELOG2	0
#define	SSIZE		1		/* initial stack size/NBPG */
#define	SINCR		1		/* increment of stack/NBPG */
#define	UPAGES		1		/* pages of u-area */

#define HZ 100

#define MAXPHYS ((256+2)*1024*1024)
#define PAGE_SIZE 4096

#endif /* !_MACHINE_PARAM_H_ */
