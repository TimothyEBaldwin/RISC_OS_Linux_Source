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
 * Name        : fontdbox.h
 * Description : C veneers to the Methods provided by the fontdbox class
 */



#ifndef __fontdbox_h
#define __fontdbox_h


#ifndef __kernel_h
#include "kernel.h"
#endif

#ifndef __toolbox_h
#include "toolbox.h"
#endif

#ifndef __window_h
#include "window.h"
#endif

/****************************************************************************
 * FontDbox Templates                                                       *
 ****************************************************************************/

/*-- flags --*/

#define FontDbox_GenerateShowEvent    0x00000001
#define FontDbox_GenerateHideEvent    0x00000002
#define FontDbox_IncludeSystemFont    0x00000004


/*-- templates --*/

typedef struct
{
  int           flags;
  char          *title;
  int           max_title;
  char          *initial_font;
  int           initial_height;
  int           initial_aspect;
  char          *try_string;
  char          *window;
} FontDboxTemplate;


/****************************************************************************
 * FontDbox SWI Calls                                                       *
 ****************************************************************************/

#define FontDbox_SWIChunkBase    0x82a00
#define FontDbox_ObjectClass     FontDbox_SWIChunkBase
#define FontDbox_ClassSWI        (FontDbox_SWIChunkBase + 0)
#define FontDbox_PostFilter      (FontDbox_SWIChunkBase + 1)
#define FontDbox_PreFilter       (FontDbox_SWIChunkBase + 2)


/****************************************************************************
 * FontDbox SWI Flags                                                       *
 ****************************************************************************/

#define FontDbox_SetSize_Height   1
#define FontDbox_SetSize_Aspect   2


/****************************************************************************
 * FontDbox Methods                                                         *
 ****************************************************************************/

#define FontDbox_GetWindowId           0
#define FontDbox_SetFont               1
#define FontDbox_GetFont               2
#define FontDbox_SetSize               3
#define FontDbox_GetSize               4
#define FontDbox_SetTryString          5
#define FontDbox_GetTryString          6
#define FontDbox_SetTitle              7
#define FontDbox_GetTitle              8


/****************************************************************************
 * FontDbox Toolbox Events                                                  *
 ****************************************************************************/

#define FontDbox_AboutToBeShown     FontDbox_SWIChunkBase
#define FontDbox_DialogueCompleted  (FontDbox_SWIChunkBase + 1)
#define FontDbox_ApplyFont          (FontDbox_SWIChunkBase + 2)

typedef struct
{
  ToolboxEventHeader hdr;
  int                show_type;
  union
  {
    TopLeft               pos;
    WindowShowObjectBlock full;
  } info;
} FontDboxAboutToBeShownEvent;

typedef struct
{
  ToolboxEventHeader hdr;
} FontDboxDialogueCompletedEvent;

typedef struct
{
  ToolboxEventHeader hdr;
  unsigned int       height;
  unsigned int       aspect;
  char               font[208];
} FontDboxApplyFontEvent;



/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/


#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : fontdbox_get_title
 * Description : Gets the title from the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_get_title ( unsigned int flags,
                                             ObjectId fontdbox,
                                             char *buffer,
                                             int buff_size,
                                             int *nbytes
                                           );


/*
 * Name        : fontdbox_set_title
 * Description : Sets the title for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *title
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_set_title ( unsigned int flags,
                                             ObjectId fontdbox,
                                             char *title
                                           );


/*
 * Name        : fontdbox_get_try_string
 * Description : Gets the string used in the "try" writable for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_get_try_string ( unsigned int flags,
                                                  ObjectId fontdbox,
                                                  char *buffer,
                                                  int buff_size,
                                                  int *nbytes
                                                );


/*
 * Name        : fontdbox_set_try_string
 * Description : Sets the string used in the "try" writable for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *try_string
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_set_try_string ( unsigned int flags,
                                                  ObjectId fontdbox,
                                                  char *try_string
                                                );


/*
 * Name        : fontdbox_get_size
 * Description : Gets the height and/or aspect ratio for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 * Out         : int *height
 *               int *aspect_ratio
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_get_size ( unsigned int flags,
                                            ObjectId fontdbox,
                                            int *height,
                                            int *aspect_ratio
                                          );


/*
 * Name        : fontdbox_set_size
 * Description : Sets the height and/or the aspect ratio for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               int height
 *               int aspect_ratio
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_set_size ( unsigned int flags,
                                            ObjectId fontdbox,
                                            int height,
                                            int aspect_ratio
                                          );


/*
 * Name        : fontdbox_get_font
 * Description : Gets the font id of the currently selected font for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_get_font ( unsigned int flags,
                                            ObjectId fontdbox,
                                            char *buffer,
                                            int buff_size,
                                            int *nbytes
                                          );


/*
 * Name        : fontdbox_set_font
 * Description : Sets the font for the specified font dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 *               char *font_id
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_set_font ( unsigned int flags,
                                            ObjectId fontdbox,
                                            char *font_id
                                          );


/*
 * Name        : fontdbox_get_window_id
 * Description : returns the Window Object Id for the given Font Dbox 
 * In          : unsigned int flags
 *               ObjectId fontdbox
 * Out         : ObjectId *window
 * Returns     : pointer to error block
 */

extern _kernel_oserror *fontdbox_get_window_id  ( unsigned int flags,
                                                  ObjectId fontdbox,
                                                  ObjectId *window
                                                );


#ifdef __cplusplus
  }
#endif




#endif
