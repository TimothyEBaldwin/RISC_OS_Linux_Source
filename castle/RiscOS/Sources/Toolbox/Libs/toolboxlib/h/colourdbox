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
 * Name        : colourdbox.h
 * Description : C veneers to the Methods provided by the colourdbox class
 */



#ifndef __colourdbox_h
#define __colourdbox_h


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
 * ColourDbox Templates                                                     *
 ****************************************************************************/
 
/*-- flags --*/

#define ColourDbox_GenerateShowEvent        0x00000001
#define ColourDbox_GenerateHideEvent        0x00000002
#define ColourDbox_IncludeNoneButton        0x00000004
#define ColourDbox_SelectNoneButton         0x00000008


/*-- templates --*/

typedef struct
{
  unsigned int  flags;
  char          *title;
  int           max_title;
  unsigned int  colour;
} ColourDboxTemplate;


/****************************************************************************
 * ColourDbox SWI calls                                                     *
 ****************************************************************************/


#define ColourDbox_SWIChunkBase    0x829c0
#define ColourDbox_ObjectClass     ColourDbox_SWIChunkBase
#define ColourDbox_ClassSWI        (ColourDbox_SWIChunkBase + 0)
#define ColourDbox_PostFilter      (ColourDbox_SWIChunkBase + 1)
#define ColourDbox_PreFilter       (ColourDbox_SWIChunkBase + 2)

/****************************************************************************
 * ColourDbox SWI and event flags                                           *
 ****************************************************************************/

#define ColourDbox_ColourNoneSelected           0x00000001

/****************************************************************************
 * ColourDbox Methods                                                       *
 ****************************************************************************/


#define ColourDbox_GetWimpHandle           0
#define ColourDbox_GetDialogueHandle       1
#define ColourDbox_SetColour               2
#define ColourDbox_GetColour               3
#define ColourDbox_SetColourModel          4
#define ColourDbox_GetColourModel          5
#define ColourDbox_SetNoneAvailable        6
#define ColourDbox_GetNoneAvailable        7


/****************************************************************************
 * ColourDbox Toolbox Events                                                *
 ****************************************************************************/

#define ColourDbox_AboutToBeShown     ColourDbox_SWIChunkBase
#define ColourDbox_DialogueCompleted  (ColourDbox_SWIChunkBase + 1)
#define ColourDbox_ColourSelected     (ColourDbox_SWIChunkBase + 2)

typedef struct
{
  ToolboxEventHeader  hdr;
  int                 show_type;
  union
  {
    TopLeft               pos;
    WindowShowObjectBlock full;
  } info;
} ColourDboxAboutToBeShownEvent;


typedef struct
{
  ToolboxEventHeader hdr;
} ColourDboxDialogueCompletedEvent;


typedef struct
{
  ToolboxEventHeader hdr;
  unsigned int       colour_block[(212/4)];
} ColourDboxColourSelectedEvent;


typedef struct
{
  ToolboxEventHeader hdr;
  unsigned int       colour_block[(212/4)];
} ColourDboxColourChangedEvent;






/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/


#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : colourdbox_get_none_available
 * Description : Gets whether the "none" option is available for the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 * Out         : int *out_flags
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_get_none_available ( unsigned int flags,
                                                        ObjectId colourdbox,
                                                        int *out_flags
                                                      );


/*
 * Name        : colourdbox_set_none_available
 * Description : Set whether a "none" option appears in the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 *               int none
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_set_none_available ( unsigned int flags,
                                                        ObjectId colourdbox,
                                                        int none
                                                      );


/*
 * Name        : colourdbox_get_colour_model
 * Description : Gets the current colour model for the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 *               int *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_get_colour_model ( unsigned int flags,
                                                      ObjectId colourdbox,
                                                      int *buffer,
                                                      int buff_size,
                                                      int *nbytes
                                                    );


/*
 * Name        : colourdbox_set_colour_model
 * Description : Set the colour model for the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 *               int *colour_model_block
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_set_colour_model ( unsigned int flags,
                                                      ObjectId colourdbox,
                                                      int *colour_model_block
                                                    );

/*
 * Name        : colourdbox_get_colour
 * Description : Gets the colour that is currently being shown in the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 *               int *buffer
 *               int buff_size
 * Out         : int *outflags
 *               int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_get_colour ( unsigned int flags,
                                                ObjectId colourdbox,
                                                int *buffer,
                                                int buff_size,
                                                int *outflags,
                                                int *nbytes
                                              );


/*
 * Name        : colourdbox_set_colour
 * Description : Set the colour to be displayed in the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 *               int *colour_block
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_set_colour ( unsigned int flags,
                                                ObjectId colourdbox,
                                                int *colour_block
                                              );


/*
 * Name        : colourdbox_get_dialogue_handle
 * Description : Gets the underlying dialogue handle for the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 * Out         : int *dialogue_handle
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_get_dialogue_handle ( unsigned int flags,
                                                         ObjectId colourdbox,
                                                         int *dialogue_handle
                                                       );


/*
 * Name        : colourdbox_get_wimp_handle
 * Description : Gets the underlying window handle for the specified ColourDbox 
 * In          : unsigned int flags
 *               ObjectId colourdbox
 * Out         : int *wimp_handle
 * Returns     : pointer to error block
 */

extern _kernel_oserror *colourdbox_get_wimp_handle ( unsigned int flags,
                                                     ObjectId colourdbox,
                                                     int *wimp_handle
                                                   );


#ifdef __cplusplus
  }
#endif


#endif
