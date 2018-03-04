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
#ifndef ACCESSORS_H
#define ACCESSORS_H

#include <stdint.h>
#include <stdbool.h>
#include "kernel.h"

#include "DOSFS.h"
#include "ADFSshape.h"

/* Flags */
#define ACC_READ 0
#define ACC_WRITE 1
#define ACC_USE_CACHE 2

/* Struct used to abstract over accessing the underlying file */
typedef struct image_accessor {
  /* Function pointer for reading/writing data from the underlying file */
  _kernel_oserror *(*readwrite)(uint64_t addr,uint32_t len,void *buf,int flags,struct image_accessor *ctx);
} image_accessor_t;

#define image_readwrite(addr,len,buf,flags,ctx) (((ctx)->readwrite)(addr,len,buf,flags,ctx))

typedef struct {
  image_accessor_t a;
  int fshand;
  uint32_t size;
} image_accessor_file;

extern image_accessor_file new_image_accessor_file(int fshand);

typedef struct {
  image_accessor_t a;
  ADFS_drecord *dr;
  int sector_cache_handle;
  int filecore_pw;
} image_accessor_disc;

extern image_accessor_disc new_image_accessor_disc(ADFS_drecord *dr,int sector_cache_handle,int filecore_pw);
  

#endif
