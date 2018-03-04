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
#include "Accessors.h"
#include "MsgTrans.h"

#include "Interface/HighFSI.h"
#include "swis.h"
#include "DebugLib/DebugLib.h"

static _kernel_oserror *readwrite_file(uint64_t addr,uint32_t len,void *buf,int flags,struct image_accessor *ctx)
{
  image_accessor_file *a = (image_accessor_file *) ctx;
  uint64_t end = addr + len;
  if (end > (uint64_t) a->size)
  {
    return global_error(err_outofrange);
  }
  return _swix(OS_GBPB,_INR(0,4),((flags & ACC_WRITE)?OSGBPB_WriteAtGiven:OSGBPB_ReadFromGiven),a->fshand,buf,len,(uint32_t)addr);
}

image_accessor_file new_image_accessor_file(int fshand)
{
  image_accessor_file a;
  a.a.readwrite = readwrite_file;
  a.fshand = fshand;
  a.size = 0; /* Treat as 0 bytes if error from SWI below */
  _kernel_oserror *e = _swix(OS_Args,_INR(0,1)|_OUT(2),OSArgs_ReadEXT,fshand,&a.size);
  if (e)
  {
    dprintf(("","extent error: %08x %s\n",e->errnum,e->errmess));
  }
  else
  {
    dprintf(("","image extent: %x\n",a.size));
  }
  return a;
}

static _kernel_oserror *readwrite_disc(uint64_t addr,uint32_t len,void *buf,int flags,struct image_accessor *ctx)
{
  image_accessor_disc *a = (image_accessor_disc *) ctx;
  _kernel_swi_regs urset;
  FS_discop64      opblock;

  urset.r[3] = (int) buf;
  urset.r[4] = len;
  urset.r[6] = a->sector_cache_handle;
  urset.r[8] = a->filecore_pw;
  int op = (flags & ACC_WRITE) ? 2 : ((flags & ACC_USE_CACHE) ? 9 : 1);
  op |= (4 << 4); /* Ignore escape */

  if (discopswi==FileCore_DiscOp)
  {
    uint64_t end = addr + len;
    if (end > 512<<20)
    {
      return global_error(err_outofrange);
    }
    urset.r[1] = (op | (((int)(a->dr) >> 2) << 8)) ;
    urset.r[2] = (a->dr->dr_rootSIN & 0xE0000000) + ((int)addr);      /* disc address */
  }
  else
  {
    opblock.drivenumber   = (a->dr->dr_rootSIN & 0xE0000000) >> 29;
    opblock.byteaddresslo = (word) addr;
    opblock.byteaddresshi = (word) (addr >> 32);
    urset.r[1] = op;
    urset.r[2] = (int)&opblock;
    urset.r[5] = (int)a->dr;
  }
  _kernel_oserror *e = _kernel_swi(discopswi,&urset,&urset);
  /* Update cache handle */
  a->sector_cache_handle = urset.r[6];
  return e;
}

image_accessor_disc new_image_accessor_disc(ADFS_drecord *dr,int sector_cache_handle,int filecore_pw)
{
  image_accessor_disc a;
  a.a.readwrite = readwrite_disc;
  a.dr = dr;
  a.sector_cache_handle = sector_cache_handle;
  a.filecore_pw = filecore_pw;
  return a;
}
