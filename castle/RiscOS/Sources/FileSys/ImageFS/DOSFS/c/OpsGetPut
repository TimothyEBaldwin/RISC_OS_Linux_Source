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
/*> c.OpsGetPut <*/
/*-------------------------------------------------------------------------*/
/* DOSFS image FS 'GetBytes' and 'PutBytes'     Copyright (c) 1990 JGSmith */
/*-------------------------------------------------------------------------*/

#include <stdlib.h>
#include "kernel.h"
#include "DebugLib/DebugLib.h"

#include "DOSFS.h"
#include "Ops.h"
#include "DOSclusters.h"

/*!
 * \param  fhand Internal handle
 * \param  ma Destination memory
 * \param  bytes Number bytes to get
 * \param  foff File offset
 * \return 0 for success
 */
int DOSFS_get_bytes(FILEhand *fhand, char *ma, word bytes, word foff)
{
  return DOS_bytes_RW(Rdata, ma, bytes, foff, fhand);
}

/*!
 * \param  fhand Internal handle
 * \param  ma Source memory
 * \param  bytes Number bytes to write
 * \param  foff File offset
 * \return 0 for success
 */
int DOSFS_put_bytes(FILEhand *fhand, char *ma, word bytes, word foff)
{
  return DOS_bytes_RW(Wdata, ma, bytes, foff, fhand);
}
