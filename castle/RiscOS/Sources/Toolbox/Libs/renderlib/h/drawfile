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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the toolbox library for writing desktop applications in C. It may be     *
 * used freely in the creation of programs for Archimedes or Risc PC. It    *
 * should be used with Acorn's C Compiler Release 5 or later.               *
 *                                                                          *
 *                                                                          *
 * Copyright © Acorn Computers Ltd, 1994                                    *
 *                                                                          *
 ***************************************************************************/



/*
 * Name        : drawfile.h
 * Description : C veneers to the drawfile swis
 */



#ifndef __drawfile_h
#define __drawfile_h

#ifndef __kernel_h
#include "kernel.h"
#endif

#ifndef __wimp_h

/* need BBox type */

#include "wimp.h"
#endif            

#define DrawFile_Render                         0x45540
#define XDrawFile_Render                        0x65540
#define DrawFile_BBox                           0x45541
#define XDrawFile_BBox                          0x65541
#define DrawFile_DeclareFonts                   0x45542
#define XDrawFile_DeclareFonts                  0x65542

typedef int Transform [3][2];

#define Drawfile_RenderBoundingBoxes            0x00000001
#define Drawfile_DoNotRenderObjects             0x00000002
#define Drawfile_RenderWithFlatness             0x00000004

#define Drawfile_DoNotDownloadFont              0x00000001

#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name         : drawfile_render
 * Description  : renders a drawfile from memory
 * In           : unsigned int flags
 *                void *data
 *                int size
 *                Transform *trfm
 *                BBox *clip
 *                int flatness
 * Out          : None
 * Returns      : pointer to error block
 */


extern _kernel_oserror *drawfile_render        (unsigned int flags, void *data, 
                                                int size, Transform *trfm,
                                                BBox *clip,int flatness);

/*
 * Name         : drawfile_bbox
 * Description  : get the bounding box of a drawfile 
 * In           : unsigned int flags
 *                void *data
 *                int size
 *                Transform *trfm
 *                BBox *box
 * Out          : None (fills in box)
 * Returns      : pointer to error block
 */

extern _kernel_oserror *drawfile_bbox           (unsigned int flags, void *data, 
                                                int size, Transform *trfm,
                                                BBox *box);


/*
 * Name         : drawfile_declare_fonts
 * Description  : declares the fonts for printing a drawfile
 * In           : unsigned int flags
 *                void *data
 *                int size
 * Out          : None
 * Returns      : pointer to error block
 */

extern _kernel_oserror *drawfile_declare_fonts  (unsigned int flags, void *data,
                                                int size);

#ifdef __cplusplus
  }
#endif


#endif
