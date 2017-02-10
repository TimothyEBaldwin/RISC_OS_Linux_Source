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
#include "kernel.h"
#include "typedefs.h"

#define SCSIFS_DiscOp 0x40980
extern int discop_to_use;
extern _kernel_oserror *adfs_discop_read( void ** const destination, disc_record const * const discrec, direct_disc_address * const source_start, unsigned int * const source_len );
extern _kernel_oserror *adfs_discop_write( void ** const source, disc_record const * const discrec, direct_disc_address * const destination, unsigned int * const source_len );
