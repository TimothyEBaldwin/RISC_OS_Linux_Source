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
 * Name        : colourmenu.h
 * Description : C veneers to the Methods provided by the colourmenu class
 */



#ifndef __colourmenu_h
#define __colourmenu_h


#ifndef __kernel_h
#include "kernel.h"
#endif

#ifndef __toolbox_h
#include "toolbox.h"
#endif


/****************************************************************************
 * Colour Menu Templates                                                    *
 ****************************************************************************/

typedef struct
{
  int           flags;
  char          *title;
  int           max_title;
  int           colour;
} ColourMenuTemplate;

#define ColourMenu_GenerateAboutToBeShownEvent    0x00000001
#define ColourMenu_GenerateHasBeenHiddenEvent     0x00000002
#define ColourMenu_NoneEntry                      0x00000004

/****************************************************************************
 * Colour Menu SWI Calls                                                    *
 ****************************************************************************/

#define ColourMenu_SWIChunkBase         0x82980
#define ColourMenu_ObjectClass          ColourMenu_SWIChunkBase
#define ColourMenu_ClassSWI             (ColourMenu_SWIChunkBase + 0)
#define ColourMenu_PostFilter           (ColourMenu_SWIChunkBase + 1)
#define ColourMenu_PreFilter            (ColourMenu_SWIChunkBase + 2)

/****************************************************************************
 * ColourMenu SWI and event flags                                           *
 ****************************************************************************/

#define ColourMenu_ColourNone           16

/****************************************************************************
 * Colour Menu Methods                                                      *
 ****************************************************************************/


#define ColourMenu_SetColour            0
#define ColourMenu_GetColour            1
#define ColourMenu_SetNoneAvailable     2
#define ColourMenu_GetNoneAvailable     3
#define ColourMenu_SetTitle             4
#define ColourMenu_GetTitle             5


/****************************************************************************
 * Colour Menu Toolbox Events                                               *
 ****************************************************************************/

#define ColourMenu_AboutToBeShown       ColourMenu_SWIChunkBase
#define ColourMenu_HasBeenHidden        (ColourMenu_SWIChunkBase + 1)
#define ColourMenu_Selection            (ColourMenu_SWIChunkBase + 2)

typedef struct
{
  ToolboxEventHeader hdr;
  int                show_type;
  TopLeft            pos;
} ColourMenuAboutToBeShownEvent;

typedef struct
{
  ToolboxEventHeader hdr;
  int                colour;
} ColourMenuSelectionEvent;

typedef struct
{
  ToolboxEventHeader hdr;
} ColourMenuHasBeenHiddenEvent;



/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/

#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : colourmenu_get_title
 * Description : Gets the title for the specified colour menu 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_get_title ( unsigned int flags,
                                               ObjectId colourmenu,
                                               char *buffer,
                                               int buff_size,
                                               int *nbytes
                                             );


/*
 * Name        : colourmenu_set_title
 * Description : Sets the title of the specified colour menu 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 *               char *title
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_set_title ( unsigned int flags,
                                               ObjectId colourmenu,
                                               char *title
                                             );


/*
 * Name        : colourmenu_get_none_available
 * Description : Gets whether the specified colour menu has a "none" entry 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 * Out         : int *none
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_get_none_available ( unsigned int flags,
                                                        ObjectId colourmenu,
                                                        int *none
                                                      );


/*
 * Name        : colourmenu_set_none_available
 * Description : Set whether there is a "none" entry for the specified colour menu 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 *               int none
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_set_none_available ( unsigned int flags,
                                                        ObjectId colourmenu,
                                                        int none
                                                      );


/*
 * Name        : colourmenu_get_colour
 * Description : Gets the currently selected colour for the specified colour menu 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 * Out         : int *wimp_colour
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_get_colour ( unsigned int flags,
                                                ObjectId colourmenu,
                                                int *wimp_colour
                                              );


/*
 * Name        : colourmenu_set_colour
 * Description : Sets the currently selected colour (ticks it) for the specified colour menu 
 * In          : unsigned int flags
 *               ObjectId colourmenu
 *               int wimp_colour
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourmenu_set_colour ( unsigned int flags,
                                                ObjectId colourmenu,
                                                int wimp_colour
                                              );


#ifdef __cplusplus
  }
#endif




#endif
