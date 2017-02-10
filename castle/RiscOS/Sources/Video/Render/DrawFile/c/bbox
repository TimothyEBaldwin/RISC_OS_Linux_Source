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
/*bbox.c - implementation file for drawfile_bbox*/

#include <stddef.h>
#include <string.h>

#include "drawfile.h"
#include "os.h"

#include "jc_trace.h"
#include "trfm.h"

#include "bbox.h"
#include "main.h"
#include "verify.h"

os_error *bbox (bits flags, drawfile_diagram *diagram, int size,
     os_trfm *trfm, os_box *bbox)

{  os_error *error = NULL;

   flags = flags, size = size;

   tracef ("bbox\n");
   tracef ("calling trfm_bbox\n");
   trfm_box (bbox, trfm, &diagram->bbox);

/*finish:*/
   return error;
}
