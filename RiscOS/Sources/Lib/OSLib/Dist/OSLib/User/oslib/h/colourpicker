#ifndef colourpicker_H
#define colourpicker_H

/* C header file for ColourPicker
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  ColourPicker_RegisterModel
#define ColourPicker_RegisterModel              0x47700
#undef  XColourPicker_RegisterModel
#define XColourPicker_RegisterModel             0x67700
#undef  ColourPicker_DeregisterModel
#define ColourPicker_DeregisterModel            0x47701
#undef  XColourPicker_DeregisterModel
#define XColourPicker_DeregisterModel           0x67701
#undef  ColourPicker_OpenDialogue
#define ColourPicker_OpenDialogue               0x47702
#undef  XColourPicker_OpenDialogue
#define XColourPicker_OpenDialogue              0x67702
#undef  ColourPicker_CloseDialogue
#define ColourPicker_CloseDialogue              0x47703
#undef  XColourPicker_CloseDialogue
#define XColourPicker_CloseDialogue             0x67703
#undef  ColourPicker_UpdateDialogue
#define ColourPicker_UpdateDialogue             0x47704
#undef  XColourPicker_UpdateDialogue
#define XColourPicker_UpdateDialogue            0x67704
#undef  ColourPicker_ReadDialogue
#define ColourPicker_ReadDialogue               0x47705
#undef  XColourPicker_ReadDialogue
#define XColourPicker_ReadDialogue              0x67705
#undef  ColourPicker_SetColour
#define ColourPicker_SetColour                  0x47706
#undef  XColourPicker_SetColour
#define XColourPicker_SetColour                 0x67706
#undef  ColourPicker_HelpReply
#define ColourPicker_HelpReply                  0x47707
#undef  XColourPicker_HelpReply
#define XColourPicker_HelpReply                 0x67707
#undef  ColourPicker_ModelSWI
#define ColourPicker_ModelSWI                   0x47708
#undef  XColourPicker_ModelSWI
#define XColourPicker_ModelSWI                  0x67708
#undef  ColourPickerModelSWI_ColourChanged
#define ColourPickerModelSWI_ColourChanged      0x0
#undef  ColourPickerModelSWI_ColourChangedByDragging
#define ColourPickerModelSWI_ColourChangedByDragging 0x1
#undef  ColourPickerModelSWI_ClaimEvent
#define ColourPickerModelSWI_ClaimEvent         0x2
#undef  ColourPickerModelSWI_ReleaseEvent
#define ColourPickerModelSWI_ReleaseEvent       0x3
#undef  ColourPickerModelSWI_ProcessKey
#define ColourPickerModelSWI_ProcessKey         0x4
#undef  Service_ColourPickerLoaded
#define Service_ColourPickerLoaded              0x93

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct colourpicker_d_                  *colourpicker_d;
typedef struct colourpicker_colour              colourpicker_colour;
typedef struct colourpicker_colour_base         colourpicker_colour_base;
typedef struct colourpicker_dialogue            colourpicker_dialogue;
typedef struct colourpicker_dialogue_base       colourpicker_dialogue_base;
typedef struct colourpicker_model               colourpicker_model;
typedef struct colourpicker_message_colour_choice colourpicker_message_colour_choice;
typedef struct colourpicker_message_colour_choice_base colourpicker_message_colour_choice_base;
typedef struct colourpicker_message_colour_changed colourpicker_message_colour_changed;
typedef struct colourpicker_message_colour_changed_base colourpicker_message_colour_changed_base;
typedef struct colourpicker_message_open_parent_request colourpicker_message_open_parent_request;
typedef struct colourpicker_message_close_dialogue_request colourpicker_message_close_dialogue_request;
typedef struct colourpicker_message_reset_colour_request colourpicker_message_reset_colour_request;
typedef struct colourpicker_full_message_colour_choice colourpicker_full_message_colour_choice;
typedef struct colourpicker_full_message_colour_choice_base colourpicker_full_message_colour_choice_base;
typedef struct colourpicker_full_message_colour_changed colourpicker_full_message_colour_changed;
typedef struct colourpicker_full_message_colour_changed_base colourpicker_full_message_colour_changed_base;
typedef struct colourpicker_full_message_open_parent_request colourpicker_full_message_open_parent_request;
typedef struct colourpicker_full_message_close_dialogue_request colourpicker_full_message_close_dialogue_request;
typedef struct colourpicker_full_message_reset_colour_request colourpicker_full_message_reset_colour_request;

/********************
 * Type definitions *
 ********************/
#define colourpicker_COLOUR_MEMBERS \
   os_colour colour; \
   int size;

/* Base colourpicker_colour structure without variable part */
struct colourpicker_colour_base
   {  colourpicker_COLOUR_MEMBERS
   };

/* legacy structure */
struct colourpicker_colour
   {  colourpicker_COLOUR_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_COLOUR(N) \
   struct \
      {  colourpicker_COLOUR_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_COLOUR(N) \
   (offsetof (colourpicker_colour, info) + \
         (N)*sizeof ((colourpicker_colour *) NULL)->info)

typedef bits colourpicker_dialogue_flags;

#define colourpicker_DIALOGUE_MEMBERS \
   colourpicker_dialogue_flags flags; \
   char *title; \
   os_box visible; \
   int xscroll; \
   int yscroll; \
   os_colour colour; \
   int size;

/* Base colourpicker_dialogue structure without variable part */
struct colourpicker_dialogue_base
   {  colourpicker_DIALOGUE_MEMBERS
   };

/* legacy structure */
struct colourpicker_dialogue
   {  colourpicker_DIALOGUE_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_DIALOGUE(N) \
   struct \
      {  colourpicker_DIALOGUE_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_DIALOGUE(N) \
   (offsetof (colourpicker_dialogue, info) + \
         (N)*sizeof ((colourpicker_dialogue *) NULL)->info)

typedef bits colourpicker_model_flags;

struct colourpicker_model
   {  colourpicker_model_flags flags;
      char *name;
      char *description;
      int info_size;
      os_coord pane_size;
      void *entries [8];
   };

typedef bits colourpicker_colour_flags;

#define colourpicker_MESSAGE_COLOUR_CHOICE_MEMBERS \
   colourpicker_d d; \
   colourpicker_colour_flags flags; \
   os_colour colour; \
   int size;

/* Base colourpicker_message_colour_choice structure without variable part */
struct colourpicker_message_colour_choice_base
   {  colourpicker_MESSAGE_COLOUR_CHOICE_MEMBERS
   };

/* legacy structure */
struct colourpicker_message_colour_choice
   {  colourpicker_MESSAGE_COLOUR_CHOICE_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_MESSAGE_COLOUR_CHOICE(N) \
   struct \
      {  colourpicker_MESSAGE_COLOUR_CHOICE_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_MESSAGE_COLOUR_CHOICE(N) \
   (offsetof (colourpicker_message_colour_choice, info) + \
         (N)*sizeof ((colourpicker_message_colour_choice *) NULL)->info)

#define colourpicker_MESSAGE_COLOUR_CHANGED_MEMBERS \
   colourpicker_d d; \
   colourpicker_colour_flags flags; \
   os_colour colour; \
   int size;

/* Base colourpicker_message_colour_changed structure without variable part */
struct colourpicker_message_colour_changed_base
   {  colourpicker_MESSAGE_COLOUR_CHANGED_MEMBERS
   };

/* legacy structure */
struct colourpicker_message_colour_changed
   {  colourpicker_MESSAGE_COLOUR_CHANGED_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_MESSAGE_COLOUR_CHANGED(N) \
   struct \
      {  colourpicker_MESSAGE_COLOUR_CHANGED_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_MESSAGE_COLOUR_CHANGED(N) \
   (offsetof (colourpicker_message_colour_changed, info) + \
         (N)*sizeof ((colourpicker_message_colour_changed *) NULL)->info)

struct colourpicker_message_open_parent_request
   {  colourpicker_d d;
   };

struct colourpicker_message_close_dialogue_request
   {  colourpicker_d d;
   };

struct colourpicker_message_reset_colour_request
   {  colourpicker_d d;
   };

#define colourpicker_FULL_MESSAGE_COLOUR_CHOICE_MEMBERS \
   wimp_MESSAGE_HEADER_MEMBERS \
   colourpicker_d d; \
   colourpicker_colour_flags flags; \
   os_colour colour; \
   int array_size;

/* Base colourpicker_full_message_colour_choice structure without variable part */
struct colourpicker_full_message_colour_choice_base
   {  colourpicker_FULL_MESSAGE_COLOUR_CHOICE_MEMBERS
   };

/* legacy structure */
struct colourpicker_full_message_colour_choice
   {  colourpicker_FULL_MESSAGE_COLOUR_CHOICE_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_FULL_MESSAGE_COLOUR_CHOICE(N) \
   struct \
      {  colourpicker_FULL_MESSAGE_COLOUR_CHOICE_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_FULL_MESSAGE_COLOUR_CHOICE(N) \
   (offsetof (colourpicker_full_message_colour_choice, info) + \
         (N)*sizeof ((colourpicker_full_message_colour_choice *) NULL)->info)

#define colourpicker_FULL_MESSAGE_COLOUR_CHANGED_MEMBERS \
   wimp_MESSAGE_HEADER_MEMBERS \
   colourpicker_d d; \
   colourpicker_colour_flags flags; \
   os_colour colour; \
   int array_size;

/* Base colourpicker_full_message_colour_changed structure without variable part */
struct colourpicker_full_message_colour_changed_base
   {  colourpicker_FULL_MESSAGE_COLOUR_CHANGED_MEMBERS
   };

/* legacy structure */
struct colourpicker_full_message_colour_changed
   {  colourpicker_FULL_MESSAGE_COLOUR_CHANGED_MEMBERS
      int info [UNKNOWN];
   };

#define colourpicker_FULL_MESSAGE_COLOUR_CHANGED(N) \
   struct \
      {  colourpicker_FULL_MESSAGE_COLOUR_CHANGED_MEMBERS \
         int info [N]; \
      }

#define colourpicker_SIZEOF_FULL_MESSAGE_COLOUR_CHANGED(N) \
   (offsetof (colourpicker_full_message_colour_changed, info) + \
         (N)*sizeof ((colourpicker_full_message_colour_changed *) NULL)->info)

struct colourpicker_full_message_open_parent_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      colourpicker_d d;
   };

struct colourpicker_full_message_close_dialogue_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      colourpicker_d d;
   };

struct colourpicker_full_message_reset_colour_request
   {  wimp_MESSAGE_HEADER_MEMBERS
      colourpicker_d d;
   };

typedef bits colourpicker_open_flags;

typedef bits colourpicker_close_flags;

typedef bits colourpicker_update_flags;

typedef bits colourpicker_read_flags;

typedef bits colourpicker_set_flags;

typedef bits colourpicker_help_flags;

/************************
 * Constant definitions *
 ************************/
#define error_COLOUR_PICKER_UNINIT              0x20D00u
#define error_COLOUR_PICKER_BAD_MODEL           0x20D01u
#define error_COLOUR_PICKER_BAD_HANDLE          0x20D02u
#define error_COLOUR_PICKER_BAD_FLAGS           0x20D03u
#define error_COLOUR_PICKER_IN_USE              0x20D04u
#define error_COLOUR_PICKER_MODEL_IN_USE        0x20D05u
#define error_COLOUR_PICKER_BAD_REASON          0x20D06u
#define colourpicker_ENTRY_DIALOGUE_STARTING    0
#define colourpicker_ENTRY_DIALOGUE_FINISHING   1
#define colourpicker_ENTRY_REDRAW_AREA          2
#define colourpicker_ENTRY_UPDATE_AREA          3
#define colourpicker_ENTRY_READ_VALUES          4
#define colourpicker_ENTRY_SET_VALUES           5
#define colourpicker_ENTRY_PROCESS_EVENT        6
#define colourpicker_ENTRY_SET_COLOUR           7
#define colourpicker_ENTRY_LIMIT                8
#define colourpicker_DIALOGUE_OFFERS_TRANSPARENT ((colourpicker_dialogue_flags) 0x1u)
#define colourpicker_DIALOGUE_TRANSPARENT       ((colourpicker_dialogue_flags) 0x2u)
#define colourpicker_DIALOGUE_TYPE              ((colourpicker_dialogue_flags) 0xCu)
#define colourpicker_DIALOGUE_TYPE_SHIFT        2
#define colourpicker_DIALOGUE_TYPE_NEVER        0x0u
#define colourpicker_DIALOGUE_TYPE_CLICK        0x1u
#define colourpicker_DIALOGUE_TYPE_CLICK_DRAG   0x2u
#define colourpicker_DIALOGUE_IGNORE_HELP       ((colourpicker_dialogue_flags) 0x10u)
#define colourpicker_DIALOGUE_IGNORE_KEY_PRESSED ((colourpicker_dialogue_flags) 0x20u)
#define colourpicker_MODEL_SIZE_RGB             16
#define colourpicker_MODEL_SIZE_CMYK            20
#define colourpicker_MODEL_SIZE_HSV             16
#define colourpicker_MODEL_RGB                  0
#define colourpicker_MODEL_CMYK                 1
#define colourpicker_MODEL_HSV                  2
#define message_COLOUR_PICKER_COLOUR_CHOICE     0x47700u
#define message_COLOUR_PICKER_COLOUR_CHANGED    0x47701u
#define message_COLOUR_PICKER_CLOSE_DIALOGUE_REQUEST 0x47702u
#define message_COLOUR_PICKER_OPEN_PARENT_REQUEST 0x47703u
#define message_COLOUR_PICKER_RESET_COLOUR_REQUEST 0x47704u
#define colourpicker_COLOUR_TRANSPARENT         ((colourpicker_colour_flags) 0x1u)
#define colourpicker_COLOUR_DRAGGING            ((colourpicker_colour_flags) 0x2u)
#define colourpicker_OPEN_TRANSIENT             ((colourpicker_open_flags) 0x1u)
#define colourpicker_OPEN_SUB_MENU              ((colourpicker_open_flags) 0x2u)
      /*If transient*/
#define colourpicker_OPEN_TOOLBOX               ((colourpicker_open_flags) 0x2u)
      /*If permanent*/
#define colourpicker_UPDATE_OFFERS_TRANSPARENT  ((colourpicker_update_flags) 0x1u)
#define colourpicker_UPDATE_TRANSPARENT         ((colourpicker_update_flags) 0x2u)
#define colourpicker_UPDATE_TYPE                ((colourpicker_update_flags) 0x4u)
#define colourpicker_UPDATE_VISIBLE             ((colourpicker_update_flags) 0x8u)
#define colourpicker_UPDATE_SCROLL              ((colourpicker_update_flags) 0x10u)
#define colourpicker_UPDATE_TITLE               ((colourpicker_update_flags) 0x20u)
#define colourpicker_UPDATE_COLOUR              ((colourpicker_update_flags) 0x40u)
#define colourpicker_UPDATE_MODEL               ((colourpicker_update_flags) 0x80u)
#define colourpicker_UPDATE_IGNORE_HELP         ((colourpicker_update_flags) 0x100u)
#define colourpicker_UPDATE_IGNORE_KEY_PRESSED  ((colourpicker_update_flags) 0x200u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      colourpicker_register_model()
 *
 * Description:   For internal use only
 *
 * Input:         model_no - value of R0 on entry
 *                model - value of R1 on entry
 *                workspace - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47700.
 */

extern os_error *xcolourpicker_register_model (int model_no,
      colourpicker_model const *model,
      void *workspace);
__swi (0x47700) void colourpicker_register_model (int model_no,
      colourpicker_model const *model,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_deregister_model()
 *
 * Description:   For internal use only
 *
 * Input:         model_no - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x47701.
 */

extern os_error *xcolourpicker_deregister_model (int model_no);
__swi (0x47701) void colourpicker_deregister_model (int model_no);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_open_dialogue()
 *
 * Description:   Creates and opens a colour picker dialogue
 *
 * Input:         flags - value of R0 on entry
 *                dialogue - value of R1 on entry
 *
 * Output:        d - value of R0 on exit (X version only)
 *                w - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x47702.
 */

extern os_error *xcolourpicker_open_dialogue (colourpicker_open_flags flags,
      colourpicker_dialogue const *dialogue,
      colourpicker_d *d,
      wimp_w *w);
extern colourpicker_d colourpicker_open_dialogue (colourpicker_open_flags flags,
      colourpicker_dialogue const *dialogue,
      wimp_w *w);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_close_dialogue()
 *
 * Description:   Closes a colour picker dialogue which is in progress
 *
 * Input:         flags - value of R0 on entry
 *                d - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47703.
 */

extern os_error *xcolourpicker_close_dialogue (colourpicker_close_flags flags,
      colourpicker_d d);
__swi (0x47703) void colourpicker_close_dialogue (colourpicker_close_flags flags,
      colourpicker_d d);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_update_dialogue()
 *
 * Description:   Updates some or all of the contents of a colour picker
 *                dialogue
 *
 * Input:         flags - value of R0 on entry
 *                d - value of R1 on entry
 *                dialogue - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47704.
 */

extern os_error *xcolourpicker_update_dialogue (colourpicker_update_flags flags,
      colourpicker_d d,
      colourpicker_dialogue const *dialogue);
__swi (0x47704) void colourpicker_update_dialogue (colourpicker_update_flags flags,
      colourpicker_d d,
      colourpicker_dialogue const *dialogue);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_read_dialogue()
 *
 * Description:   Reads the current state of a colour picker dialogue
 *                without changing it
 *
 * Input:         flags - value of R0 on entry
 *                d - value of R1 on entry
 *                dialogue - value of R2 on entry
 *
 * Output:        w - value of R1 on exit
 *                size - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x47705.
 */

extern os_error *xcolourpicker_read_dialogue (colourpicker_read_flags flags,
      colourpicker_d d,
      colourpicker_dialogue *dialogue,
      wimp_w *w,
      int *size);
extern void colourpicker_read_dialogue (colourpicker_read_flags flags,
      colourpicker_d d,
      colourpicker_dialogue *dialogue,
      wimp_w *w,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_set_colour()
 *
 * Description:   Reserved for future expansion
 *
 * Input:         flags - value of R0 on entry
 *                colour - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47706.
 */

extern os_error *xcolourpicker_set_colour (colourpicker_set_flags flags,
      colourpicker_colour const *colour);
__swi (0x47706) void colourpicker_set_colour (colourpicker_set_flags flags,
      colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourpicker_help_reply()
 *
 * Description:   Makes a colour picker respond to a Message_HelpRequest
 *                with its own help text
 *
 * Input:         flags - value of R0 on entry
 *                help_request - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47707.
 */

extern os_error *xcolourpicker_help_reply (colourpicker_help_flags flags,
      wimp_message const *help_request);
__swi (0x47707) void colourpicker_help_reply (colourpicker_help_flags flags,
      wimp_message const *help_request);

/* ------------------------------------------------------------------------
 * Function:      colourpickermodelswi_colour_changed()
 *
 * Description:   Informs the front end to send a message to the client, if
 *                required
 *
 * Input:         colour - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47708 with R0 = 0x0.
 */

extern os_error *xcolourpickermodelswi_colour_changed (colourpicker_colour const *colour);
extern void colourpickermodelswi_colour_changed (colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourpickermodelswi_colour_changed_by_dragging()
 *
 * Description:   Informs the front end to send a dragging message to the
 *                client, if required
 *
 * Input:         colour - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x47708 with R0 = 0x1.
 */

extern os_error *xcolourpickermodelswi_colour_changed_by_dragging (colourpicker_colour const *colour);
extern void colourpickermodelswi_colour_changed_by_dragging (colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourpickermodelswi_claim_event()
 *
 * Description:   Informs the front end that the back end wants an event
 *                type
 *
 * Input:         event - value of R1 on entry
 *                colour - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47708 with R0 = 0x2.
 */

extern os_error *xcolourpickermodelswi_claim_event (int event,
      colourpicker_colour const *colour);
extern void colourpickermodelswi_claim_event (int event,
      colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourpickermodelswi_release_event()
 *
 * Description:   Informs the front end that the back end no longer wants
 *                an event type
 *
 * Input:         event - value of R1 on entry
 *                colour - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47708 with R0 = 0x3.
 */

extern os_error *xcolourpickermodelswi_release_event (int event,
      colourpicker_colour const *colour);
extern void colourpickermodelswi_release_event (int event,
      colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      colourpickermodelswi_process_key()
 *
 * Description:   Passes an unhandled key press on to the front end
 *
 * Input:         c - value of R1 on entry
 *                colour - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47708 with R0 = 0x4.
 */

extern os_error *xcolourpickermodelswi_process_key (int c,
      colourpicker_colour const *colour);
extern void colourpickermodelswi_process_key (int c,
      colourpicker_colour const *colour);

/* ------------------------------------------------------------------------
 * Function:      service_colour_picker_loaded()
 *
 * Description:   For internal use only
 *
 * Input:         loaded_service - value of R2 on entry
 *                workspace - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x93.
 */

extern os_error *xservice_colour_picker_loaded (void const *loaded_service,
      void *workspace);
extern void service_colour_picker_loaded (void const *loaded_service,
      void *workspace);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
