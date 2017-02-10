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
/* Title:   object.h
 * Purpose: object list handling for the SaveAs module
 * Author:  TGR
 * History: 17-Feb-94: TGR: created
 *
 */


#ifndef __object_h
#define __object_h

#ifndef __wimp_h
#include "twimp.h"
#endif

typedef struct _coords {
   int x,y;
} Coordinates;

typedef union _show_info {
   WindowShowObjectBlock  window_info;
   Coordinates            coords;
} ShowInfo;

typedef union { /* client-type specific information */
   struct {
      char                       *data;
      char                       *sel_data;
      int                         size;
      int                         sel_size;
      int                         bytes_copied;
   } type1;
   struct {
      int                         your_ref;
      int                         task_handle;
      struct {
         char                       *buffer;
         int                         buffer_size;
         int                         bytes_copied;
         int                         destination_task;
         char                       *destination_buffer;
      } type3;
   }type2n3;
} SaveAsInternal_TypeInfo;

typedef struct _save_as_internal
{
   struct _save_as_internal   *forward;
   struct _save_as_internal   *backward;
   int                         flags;
   char                       *pathname;
   int                         show_type;
   ShowInfo                   *show_info;
   ObjectID                    object_id, sub_object_id;
   int                         my_ref;
   int                         filetype;
   int                         approx_size;
   wimp_Message               *wimp_message;
   SaveAsInternal_TypeInfo     info;
} SaveAsInternal;



#define SaveAsInternal_GenerateShowEvent         0x00000001
#define SaveAsInternal_GenerateHideEvent         0x00000002
#define SaveAsInternal_IsShowing                 0x00000010
#define SaveAsInternal_MenuSemantics             0x00000100
#define SaveAsInternal_SubMenuSemantics          0x00000200
#define SaveAsInternal_FullInfoShow              0x00000400
#define SaveAsInternal_IncludeSelectionButton    0x00000800
#define SaveAsInternal_SelectionAvailable        0x00001000
#define SaveAsInternal_Selection                 0x00002000
#define SaveAsInternal_Safe                      0x00004000
#define SaveAsInternal_LastTransfer              0x00008000
#define SaveAsInternal_ClientType(A)            (0x00010000<<((A)-1)) /* Client types 1 to 3 */
#define SaveAsInternal_CloseWhenFinished         0x00080000

#endif
