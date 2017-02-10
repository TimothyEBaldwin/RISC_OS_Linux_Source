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
/*
     Declarations for error blocks for action window

Revision History:

0.00  07-Jun-89  JSR  Created.
*/

#ifndef __os_h
#include "os.h"
#endif
#ifndef __msgs_h
#include "msgs.h"
#endif
#ifndef __string_h
#include "string.h"
#endif

extern char *mb_slotsize_too_small;
extern char *mb_malloc_failed;
extern char *mb_unexpected_state;
extern char *mb_broken_templates;

#define ErrorNumber_CantOpenFile        0x0000d6
#define ErrorNumber_FSError46           0x000046
#define ErrorNumber_NotSameDisc         0x00009f
#define ErrorNumber_BadRename           0x0000b0
#define ErrorNumber_DirectoryNotEmpty   0x0000b4
#define ErrorNumber_Locked              0x0000c3
#define ErrorNumber_AlreadyExists       0x0000c4
#define ErrorNumber_DiscFull            0x0000c6
#define ErrorNumber_NotFound            0x0000d6
#define FileError_Mask                  0xfe00ff

extern os_error errbuf;

#define error(token)     ( strcpy(((char *)&errbuf)+4, msgs_lookup((token))), \
                           &errbuf \
                         )
