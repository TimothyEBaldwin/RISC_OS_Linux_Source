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
#ifndef __colourpicker_h
#define __colourpicker_h

/* C header file for ColourPicker
 * Copyright © Acorn Computers Ltd, 1993
 */

#ifndef __coords_h
   #include "coords.h"
#endif

#ifndef __os_h
   #include "os.h"
#endif

#ifndef __wimp_h
   #include "wimp.h"
#endif

/*Structure and union declarations*/
typedef struct colourpicker_colour colourpicker_colour;
typedef struct colourpicker_dialogue colourpicker_dialogue;
typedef struct colourpicker_model colourpicker_model;
typedef struct colourpicker_message_colour_choice colourpicker_message_colour_choice;
typedef struct colourpicker_message_colour_changed colourpicker_message_colour_changed;
typedef struct colourpicker_message_open_parent_request colourpicker_message_open_parent_request;
typedef struct colourpicker_message_close_dialogue_request colourpicker_message_close_dialogue_request;

/*Type definitions*/
typedef void *(colourpicker_d);

struct colourpicker_colour
   {  int colour;
      int size;
      int (info) [1];
   };

struct colourpicker_dialogue
   {  int flags;
      char *(title);
      wimp_box visible;
      int xscroll;
      int yscroll;
      int colour;
      int size;
      int (info) [1];
   };

struct colourpicker_model
   {  int flags;
      char *(name);
      char *(description);
      int info_size;
      coords_pointstr pane_size;
      void *((entries) [8]);
   };

struct colourpicker_message_colour_choice
   {  colourpicker_d d;
      int flags;
      int colour;
      int size;
      int (info) [1];
   };

struct colourpicker_message_colour_changed
   {  colourpicker_d d;
      int flags;
      int colour;
      int size;
      int (info) [1];
   };

struct colourpicker_message_open_parent_request
   {  colourpicker_d d;
   };

struct colourpicker_message_close_dialogue_request
   {  colourpicker_d d;
   };

/*Constant definitions*/
#define colourpicker_ERROR_UNINIT 134400
#define colourpicker_ERROR_BAD_MODEL 134401
#define colourpicker_ERROR_BAD_HANDLE 134402
#define colourpicker_ERROR_BAD_FLAGS 134403
#define colourpicker_ERROR_IN_USE 134404
#define colourpicker_ERROR_MODEL_IN_USE 134405
#define colourpicker_ERROR_BAD_REASON 134406
#define colourpicker_DIALOGUE_OFFERS_TRANSPARENT ((int) 0x1u)
#define colourpicker_DIALOGUE_TRANSPARENT ((int) 0x2u)
#define colourpicker_DIALOGUE_TYPE ((int) 0xCu)
#define colourpicker_DIALOGUE_TYPE_SHIFT 2
#define colourpicker_DIALOGUE_TYPE_ONCE 0
#define colourpicker_DIALOGUE_TYPE_CLICK 1
#define colourpicker_DIALOGUE_TYPE_CLICK_DRAG 2
#define colourpicker_DIALOGUE_IGNORE_HELP ((int) 0x10u)
#define colourpicker_OPEN_TRANSIENT ((int) 0x1u)
#define colourpicker_OPEN_SUB_MENU ((int) 0x2u)
#define colourpicker_OPEN_TOOLBOX ((int) 0x2u)
#define colourpicker_UPDATE_OFFERS_TRANSPARENT ((int) 0x1u)
#define colourpicker_UPDATE_TRANSPARENT ((int) 0x2u)
#define colourpicker_UPDATE_TYPE ((int) 0x4u)
#define colourpicker_UPDATE_VISIBLE ((int) 0x8u)
#define colourpicker_UPDATE_SCROLL ((int) 0x10u)
#define colourpicker_UPDATE_TITLE ((int) 0x20u)
#define colourpicker_UPDATE_COLOUR ((int) 0x40u)
#define colourpicker_UPDATE_MODEL ((int) 0x80u)
#define colourpicker_COLOUR_TRANSPARENT ((int) 0x1u)
#define colourpicker_COLOUR_DRAGGING ((int) 0x2u)
#define colourpicker_ENTRY_DIALOGUE_STARTING 0
#define colourpicker_ENTRY_DIALOGUE_FINISHING 1
#define colourpicker_ENTRY_REDRAW_AREA 2
#define colourpicker_ENTRY_UPDATE_AREA 3
#define colourpicker_ENTRY_READ_VALUES 4
#define colourpicker_ENTRY_SET_VALUES 5
#define colourpicker_ENTRY_PROCESS_EVENT 6
#define colourpicker_ENTRY_SET_COLOUR 7
#define colourpicker_ENTRY_LIMIT 8
#define colourpicker_MODEL_SIZE_RGB 16
#define colourpicker_MODEL_SIZE_CMYK 20
#define colourpicker_MODEL_SIZE_HSV 16
#define colourpicker_MODEL_RGB 0
#define colourpicker_MODEL_CMYK 1
#define colourpicker_MODEL_HSV 2
#define message_COLOUR_PICKER_COLOUR_CHOICE 292608
#define message_COLOUR_PICKER_COLOUR_CHANGED 292609
#define message_COLOUR_PICKER_CLOSE_DIALOGUE_REQUEST 292610
#define message_COLOUR_PICKER_OPEN_PARENT_REQUEST 292611

#endif
