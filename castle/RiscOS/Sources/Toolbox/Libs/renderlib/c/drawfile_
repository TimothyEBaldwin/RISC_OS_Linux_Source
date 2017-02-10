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
/* used to help build s.drawfile */

#include "drawfile.h"         
#include "stdio.h"

   _kernel_swi_regs regs;
_kernel_oserror *p;

_kernel_oserror *drawfile_render(int flags, void *data, 
               int size, Transform *trfm,
               BBox *clip,int flatness)
{

   regs.r[0] = flags;
   regs.r[1] = (int) data;
   regs.r[2] = size;
   regs.r[3] = (int) trfm;
   regs.r[4] = (int) clip;
   regs.r[5] = flatness;
   p= _kernel_swi(DrawFile_Render,&regs,&regs);
   return NULL;
}

_kernel_oserror *drawfile_bbox(int flags, void *data, 
               int size, Transform *trfm,
               BBox *clip)
{

   regs.r[0] = flags;
   regs.r[1] = (int) data;
   regs.r[2] = size;
   regs.r[3] = (int) trfm;
   regs.r[4] = (int) clip;
   p= _kernel_swi(DrawFile_BBox,&regs,&regs);
   return NULL;
}

extern _kernel_oserror *drawfile_declare_fonts  (int flags, void *data,
                                                int size)
{
   regs.r[0] = flags;
   regs.r[1] = (int) data;
   regs.r[2] = size;
   p= _kernel_swi(DrawFile_DeclareFonts,&regs,&regs);
   return NULL;
}


