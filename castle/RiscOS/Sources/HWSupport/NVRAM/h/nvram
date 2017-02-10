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
/* > nvram.h */

/* NV-RAM specific header file. */

#ifndef __kernel_h
#include "kernel.h"
#endif


#define OSBYTE_READCMOS			161
#define OSBYTE_WRITECMOS		162

#define NVMEMORY_SIZE                   0
#define NVMEMORY_READBYTE               1
#define NVMEMORY_WRITEBYTE              2
#define NVMEMORY_READBLOCK              3
#define NVMEMORY_WRITEBLOCK             4

#define DEFAULT_NVRAM_SIZE              2048
#define TMPBUF_SIZE			128

#define NVRAM_FLAGS_WRITECACHE		(1<<0)
#define NVRAM_FLAGS_WRITETHROUGH	(1<<1)

/* The following locations are hardcoded into the module and it	*/
/* is assumed that they will never change.			*/
#define NVRAM_LASTRESET_BYTE		0xC3
#define NVRAM_LASTRESET_BIT		2
#define NVRAM_CHECKSUM_BYTE		0xEF

#define NVRAM_READ_TAGERR		(-1)
#define NVRAM_READ_BUFERR		(-4)

#define NVRAM_WRITE_TAGERR		(-1)
#define NVRAM_WRITE_LOCKERR		(-2)

#define LOCATION_FLAGS_PROTECTED	(1<<0)
#define LOCATION_FLAGS_LOCKED		(1<<1)
#define LOCATION_FLAGS_POINTER          (1<<2)

#define DEFAULT_START_BIT	0
#define DEFAULT_LENGTH		8
#define DEFAULT_VALUE		0
#define DEFAULT_FLAGS		0

/* including the 0 terminating byte */
#define DEFAULT_STRING_MAXLEN   256

#define SEPARATOR		','
#define INDIRECT_START		'<'
#define INDIRECT_END		'>'
#define STRING_START            '"'
#define STRING_END              '"'
#define STRING_ESCAPE           '/'

typedef struct _location {
	unsigned int location, start_bit, length;
	unsigned int value;
	unsigned int flags;
} location;

_kernel_oserror *nvram_initialise( void );
void nvram_finalise( void );
_kernel_oserror *nvram_read( char *tag, void *buffer, int bufferlen, int *retvalue );
_kernel_oserror *nvram_write( char *tag, void *buffer, int bufferlen, int *retvalue );
_kernel_oserror *nvram_lookup( char *ptag, unsigned int *startbyte, unsigned int *startbit, unsigned int *length, unsigned int *flagword );
_kernel_oserror *nvram_get( char *tag, void *buffer, int bufferlen, int *size );
_kernel_oserror *nvram_set( char *tag, void *buffer, int bufferlen );
_kernel_oserror *nvram_getbytes( char *tag, void *buffer, int bufferlen, int offset, int *size );
_kernel_oserror *nvram_setbytes( char *tag, void *buffer, int bufferlen, int offset );

extern int GetLocation( char *ptag, char *pdesc, location *ploc, int getDefault );
