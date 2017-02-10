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
#ifndef trfm_H
#define trfm_H

/*trfm.h - header file for transformations*/

#ifndef os_H
   #include "os.h"
#endif

extern void trfm_mul (os_trfm *, os_trfm *, os_trfm *);

extern void trfm_point (os_coord *, os_trfm *, os_coord *);

extern void trfm_dir (os_coord *, os_trfm *, os_coord *);

extern void trfm_inv (os_trfm *, os_trfm *);

extern int trfm_det (os_trfm *);

extern void trfm_box (os_box *, os_trfm *, os_box *);

#endif
