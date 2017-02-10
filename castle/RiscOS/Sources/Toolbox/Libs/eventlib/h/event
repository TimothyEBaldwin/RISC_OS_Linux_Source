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



#ifndef __event_h
#define __event_h

#ifndef __wimp_h
#include "wimp.h"
#endif

#ifndef __toolbox_h
#include "toolbox.h"
#endif

typedef int (WimpEventHandler) (int event_code,
                                 WimpPollBlock *event,
                                 IdBlock       *id_block,
                                 void          *handle);

typedef int (ToolboxEventHandler) (int event_code,
                                    ToolboxEvent  *event,
                                    IdBlock       *id_block,
                                    void          *handle);

typedef int (WimpMessageHandler) (WimpMessage *message,
                                   void *handle);



#ifdef __cplusplus
  extern "C" {
#endif


extern _kernel_oserror *event_poll (int *event_code, WimpPollBlock *poll_block, void *poll_word);


extern _kernel_oserror *event_poll_idle (int *event_code, WimpPollBlock *poll_block, unsigned int earliest, void *poll_word);


extern _kernel_oserror *event_dispatch (int event_code, WimpPollBlock *poll_block);


/* ------------------------------------- getting/setting poll mask -------------------------------- */

extern _kernel_oserror *event_set_mask (unsigned int mask);

extern _kernel_oserror *event_get_mask (unsigned int *mask);


/* ------------------------------------ event handler registering ------------------------------- */

_kernel_oserror *event_register_wimp_handler (ObjectId object_id, int event_code,
                                              WimpEventHandler *handler, void *handle);

_kernel_oserror *event_deregister_wimp_handler (ObjectId object_id, int event_code,
                                                WimpEventHandler *handler, void *handle);

_kernel_oserror *event_deregister_wimp_handlers_for_object (int object_id);


_kernel_oserror *event_register_toolbox_handler (ObjectId object_id, int event_code,
                                                 ToolboxEventHandler *handler, void *handle);

_kernel_oserror *event_deregister_toolbox_handler (ObjectId object_id, int event_code,
                                                   ToolboxEventHandler *handler, void *handle);

_kernel_oserror *event_deregister_toolbox_handlers_for_object (int object_id);

_kernel_oserror *event_register_message_handler (int msg_no, WimpMessageHandler *handler, void *handle);

_kernel_oserror *event_deregister_message_handler (int msg_no, WimpMessageHandler *handler, void *handle);



/* ------------------------------------ initialisation/finalisation ----------------------------- */


extern _kernel_oserror *event_initialise (IdBlock *b);

extern _kernel_oserror *event_finalise (void);


#ifdef __cplusplus
  }
#endif


#endif
