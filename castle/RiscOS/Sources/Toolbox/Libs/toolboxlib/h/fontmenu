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
 * Name        : fontmenu.h
 * Description : C veneers to the Methods provided by the fontmenu class
 */



#ifndef __fontmenu_h
#define __fontmenu_h


#ifndef __kernel_h
#include "kernel.h"
#endif

#ifndef __toolbox_h
#include "toolbox.h"
#endif

/****************************************************************************
 * Font Menu Templates                                                      *
 ****************************************************************************/

#define FontMenu_GenerateShowEvent     0x00000001
#define FontMenu_GenerateHideEvent     0x00000002
#define FontMenu_SystemFont            0x00000004

typedef struct
{
  unsigned int flags;
  char        *ticked_font;
} FontMenuTemplate;


/****************************************************************************
 * Font Menu SWI Calls                                                      *
 ****************************************************************************/

#define FontMenu_SWIChunkBase    0x82a40
#define FontMenu_ObjectClass     FontMenu_SWIChunkBase
#define FontMenu_ClassSWI        (FontMenu_SWIChunkBase + 0)
#define FontMenu_PostFilter      (FontMenu_SWIChunkBase + 1)
#define FontMenu_PreFilter       (FontMenu_SWIChunkBase + 2)


/****************************************************************************
 * Font Menu Methods                                                        *
 ****************************************************************************/

#define FontMenu_SetFont 0
#define FontMenu_GetFont 1


/****************************************************************************
 * Font Menu Toolbox Events                                                 *
 ****************************************************************************/

#define FontMenu_AboutToBeShown     FontMenu_SWIChunkBase
#define FontMenu_HasBeenHidden      (FontMenu_SWIChunkBase + 1)
#define FontMenu_Selection          (FontMenu_SWIChunkBase + 2)

typedef struct
{
  ToolboxEventHeader hdr;
  int                show_type;
  TopLeft            pos;
} FontMenuAboutToBeShownEvent;

typedef struct
{
  ToolboxEventHeader hdr;
} FontMenuHasBeenHiddenEvent;

typedef struct
{
  ToolboxEventHeader hdr;
  char               font_id[216];
} FontMenuSelectionEvent;


/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/


#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : fontmenu_get_font
 * Description : Gets the currently selected (ticked) font id for the specified font menu 
 * In          : unsigned int flags
 *               ObjectId fontmenu
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontmenu_get_font ( unsigned int flags,
                                            ObjectId fontmenu,
                                            char *buffer,
                                            int buff_size,
                                            int *nbytes
                                          );


/*
 * Name        : fontmenu_set_font
 * Description : Set the font to be selected (ticked) in the specified font menu 
 * In          : unsigned int flags
 *               ObjectId fontmenu
 *               char *font_id
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontmenu_set_font ( unsigned int flags,
                                            ObjectId fontmenu,
                                            char *font_id
                                          );


#ifdef __cplusplus
  }
#endif






#endif
