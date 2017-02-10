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
 * Name        : quit.h
 * Description : C veneers to the Methods provided by the quit class
 */



#ifndef __quit_h
#define __quit_h


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
 * Quit Templates                                                           *
 ****************************************************************************/

/*-- template --*/

typedef struct
{
  unsigned int   flags;
  char           *title;
  int            max_title;
  char           *message;
  int            max_message;
  char           *window;
} QuitTemplate;

#define Quit_GenerateAboutToBeShown              0x00000001
#define Quit_GenerateDialogueCompleted           0x00000002


/****************************************************************************
 * Quit SWI Calls                                                           *
 ****************************************************************************/

#define Quit_SWIChunkBase    0x82a90
#define Quit_ObjectClass     Quit_SWIChunkBase
#define Quit_ClassSWI        (Quit_SWIChunkBase + 0)
#define Quit_PostFilter      (Quit_SWIChunkBase + 1 - 0x10)
#define Quit_PreFilter       (Quit_SWIChunkBase + 2 - 0x10)


/****************************************************************************
 * Quit Methods                                                             *
 ****************************************************************************/

#define Quit_GetWindowId         0
#define Quit_SetMessage          1
#define Quit_GetMessage          2
#define Quit_SetTitle            3
#define Quit_GetTitle            4



/****************************************************************************
 * Quit Toolbox Events                                                      *
 ****************************************************************************/


/*-- event codes --*/

#define Quit_AboutToBeShown      (Quit_SWIChunkBase+0)
#define Quit_Quit                (Quit_SWIChunkBase+1)
#define Quit_DialogueCompleted   (Quit_SWIChunkBase+2)
#define Quit_Cancel              (Quit_SWIChunkBase+3)


typedef struct
{
  ToolboxEventHeader hdr;
  int                show_type;
  union
  {
    TopLeft               pos;
    WindowShowObjectBlock full;
  } info;

} QuitAboutToBeShownEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} QuitQuitEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} QuitDialogueCompletedEvent;

typedef struct
{
  ToolboxEventHeader hdr;

} QuitCancelEvent;


/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/



#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : quit_get_window_id
 * Description : Get the id of the underlying window object for the quit object 
 * In          : unsigned int flags
 *               ObjectId quit
 * Out         : ObjectId *window
 * Returns     : pointer to error block
 */

extern _kernel_oserror *quit_get_window_id ( unsigned int flags,
                                             ObjectId quit,
                                             ObjectId *window
                                           );


/*
 * Name        : quit_set_message
 * Description : Sets the message used in the quit object 
 * In          : unsigned int flags
 *               ObjectId quit
 *               char *message
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *quit_set_message ( unsigned int flags,
                                           ObjectId quit,
                                           char *message
                                         );


/*
 * Name        : quit_get_message
 * Description : Gets the message used in the quit object 
 * In          : unsigned int flags
 *               ObjectId quit
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *quit_get_message ( unsigned int flags,
                                           ObjectId quit,
                                           char *buffer,
                                           int buff_size,
                                           int *nbytes
                                         );


/*
 * Name        : quit_set_title
 * Description : Sets the title for the specified quit object 
 * In          : unsigned int flags
 *               ObjectId quit
 *               char *title
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *quit_set_title ( unsigned int flags,
                                         ObjectId quit,
                                         char *title
                                       );


/*
 * Name        : quit_get_title
 * Description : Gets the title for the specified quit object 
 * In          : unsigned int flags
 *               ObjectId quit
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *quit_get_title ( unsigned int flags,
                                         ObjectId quit,
                                         char *buffer,
                                         int buff_size,
                                         int *nbytes
                                       );


#ifdef __cplusplus
  }
#endif



#endif
