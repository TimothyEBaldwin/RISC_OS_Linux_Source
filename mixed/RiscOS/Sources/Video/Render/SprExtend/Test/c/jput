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
 * c.jput - plot a JPEG file on the screen
 */

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "kernel.h"
#include "swis.h"

/* Simple error handling */
#define _ ,
#define ERROR(message) {printf(message); printf("\n"); exit(1);}
#define CALL(expr) {_kernel_oserror *e_ = (expr); if (e_) ERROR("Error: %s\n" _ e_->errmess)}
#define SYSERROR ERROR("Error: %s.\n" _ _kernel_last_oserror()->errmess)

/* Register ranges for _swix: */
#define _R(nin,nout) ((_IN(nin)-1) | ((~(_OUT(nout)-1) & 0x7fffffff) << 1))
/* Note you can NOT provide 0s as missing output registers. */

static int filesize(char *filename)
/* The size of this file, or -1 if not found, or -2 if a directory. */
{
  int type, size;

  CALL(_swix(OS_File, _IN(0)|_IN(1)|_OUT(0)|_OUT(4), 5/*read file info*/, filename, &type, &size))
  return type == 0 ? -1 : type == 2 ? -2 : size;
}

int main(int argc, char **argv)
{
  char *buffer;
  char *filename;
  int size;
  int dud, iflags, iwidth, iheight;

  if (argc != 2) ERROR("Usage: jput <filename>")
  filename = argv[1];
  size = filesize(filename);
  if (size <= 0) ERROR("File '%s' not found" _ filename)
  if (0 == (buffer = malloc(size))) ERROR("Not enough space")
  CALL(_swix(OS_CLI, _IN(0), "RMEnsure SpriteExtend 2.00 Error 0 You need a newer SpriteExtend module to do JPEG calls"))
  {
    FILE *f = fopen(filename, "r");
    if (f == 0) SYSERROR
    if (size != fread(buffer, sizeof(char), size, f)) SYSERROR
    fclose(f);
  }
  CALL(_swix(OS_SpriteOp, _R(4,4), 65, buffer, size, 0, &dud, &iflags, &iwidth, &iheight))
  iflags &= 255;
  if (iflags != 1 && iflags != 3) ERROR("Not a JPEG file")
  printf("width=%i, height=%i, %s\n", iwidth, iheight, iflags==1?"greyscale":"colour");
  CALL(_swix(OS_SpriteOp, _R(6,0), 66, buffer, size, 0, 32, 0))
  return 0;
}
