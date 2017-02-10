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
 * Name        : dcs.h
 * Description : C veneers to the Methods provided by the dcs class
 */



#ifndef __dcs_h
#define __dcs_h


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
 * DCS Templates                                                            *
 ****************************************************************************/

/*-- template --*/

typedef struct
{
  int   flags;
  char *title;
  int   max_title;
  char *message;
  int   max_message;
  char *window;
} DCSTemplate;

#define DCS_GenerateAboutToBeShown              0x00000001
#define DCS_GenerateDialogueCompleted           0x00000002


/****************************************************************************
 * DCS SWI Calls                                                            *
 ****************************************************************************/

#define DCS_SWIChunkBase    0x82a80
#define DCS_ObjectClass     DCS_SWIChunkBase
#define DCS_ClassSWI        (DCS_SWIChunkBase + 0)
#define DCS_PostFilter      (DCS_SWIChunkBase + 1)
#define DCS_PreFilter       (DCS_SWIChunkBase + 2)


/****************************************************************************
 * DCS Methods                                                              *
 ****************************************************************************/

#define DCS_GetWindowId         0
#define DCS_SetMessage          1
#define DCS_GetMessage          2
#define DCS_SetTitle            3
#define DCS_GetTitle            4



/****************************************************************************
 * DCS Toolbox Events                                                       *
 ****************************************************************************/


/*-- event codes --*/

#define DCS_AboutToBeShown      (DCS_SWIChunkBase+0)
#define DCS_Discard             (DCS_SWIChunkBase+1)
#define DCS_Save                (DCS_SWIChunkBase+2)
#define DCS_DialogueCompleted   (DCS_SWIChunkBase+3)
#define DCS_Cancel              (DCS_SWIChunkBase+4)


typedef struct
{
  ToolboxEventHeader hdr;
  int                show_type;
  union
  {
    TopLeft               pos;
    WindowShowObjectBlock full;
  } info;

} DCSAboutToBeShownEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} DCSDiscardEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} DCSSaveEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} DCSDialogueCompletedEvent;


typedef struct
{
  ToolboxEventHeader hdr;

} DCSCancelEvent;




/****************************************************************************
 * The following functions provide veneers to the methods that are          *
 * associated with this particular class.  Please read the User Interface   *
 * Toolbox manual for more detailed information on their functionality.     *
 ****************************************************************************/


#ifdef __cplusplus
  extern "C" {
#endif


/*
 * Name        : dcs_get_title
 * Description : Gets the title for the specified DCS object 
 * In          : unsigned int flags
 *               ObjectId dcs
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *dcs_get_title ( unsigned int flags,
                                        ObjectId dcs,
                                        char *buffer,
                                        int buff_size,
                                        int *nbytes
                                      );


/*
 * Name        : dcs_set_title
 * Description : Sets the title for the specified DCS object 
 * In          : unsigned int flags
 *               ObjectId dcs
 *               char *title
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *dcs_set_title ( unsigned int flags,
                                        ObjectId dcs,
                                        char *title
                                      );


/*
 * Name        : dcs_get_message
 * Description : Gets the message used in the DCS object 
 * In          : unsigned int flags
 *               ObjectId dcs
 *               char *buffer
 *               int buff_size
 * Out         : int *nbytes
 * Returns     : pointer to error block
 */

extern _kernel_oserror *dcs_get_message ( unsigned int flags,
                                          ObjectId dcs,
                                          char *buffer,
                                          int buff_size,
                                          int *nbytes
                                        );


/*
 * Name        : dcs_set_message
 * Description : Sets the message used in the DCS object 
 * In          : unsigned int flags
 *               ObjectId dcs
 *               char *message
 * Out         : None
 * Returns     : pointer to error block
 */

extern _kernel_oserror *dcs_set_message ( unsigned int flags,
                                          ObjectId dcs,
                                          char *message
                                        );


/*
 * Name        : dcs_get_window_id
 * Description : Get the id of the underlying window object for the DCS object 
 * In          : unsigned int flags
 *               ObjectId dcs
 * Out         : ObjectId *window
 * Returns     : pointer to error block
 */

extern _kernel_oserror *dcs_get_window_id ( unsigned int flags,
                                            ObjectId dcs,
                                            ObjectId *window
                                          );


#ifdef __cplusplus
  }
#endif



#endif
