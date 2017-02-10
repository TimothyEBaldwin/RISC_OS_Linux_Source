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
/* > msgfile.h
 *
 *      Message file header.
 */

#ifndef __msgfile_h
#define __msgfile_h

#ifndef __kernel_h
#include "kernel.h"
#endif


#define Service_MessageFileClosed	0x5E

typedef struct _msgtransblock {
        char *filename;
        int msgblock[4];
        int open;
} msgtransblock;

extern msgtransblock msgs;
extern msgtransblock tags;


extern _kernel_oserror *msgfile_open( msgtransblock *mb, char *buffer );
extern char *msgfile_lookup( msgtransblock *mb, char *token, char *buffer, int bufsz, ... );
extern _kernel_oserror *msgfile_error_lookup( msgtransblock *mb, _kernel_oserror *err, ... );
extern _kernel_oserror *msgfile_enumerate( msgtransblock *mb, char *token, char *buffer, int bufsz, int *index );
extern void msgfile_close( msgtransblock *mb );

#endif
