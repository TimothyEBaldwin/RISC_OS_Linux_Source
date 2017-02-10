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

#ifndef __colpicker_h
#define __colpicker_h

/* SWIs */

#ifndef ColourPicker_RegisterModel
#define ColourPicker_RegisterModel     0x047700
#define ColourPicker_DeregisterModel   0x047701
#define ColourPicker_OpenDialogue      0x047702
#define ColourPicker_CloseDialogue     0x047703
#define ColourPicker_UpdateDialogue    0x047704
#define ColourPicker_ReadDialogue      0x047705
#define ColourPicker_SetColour         0x047706
#define ColourPicker_HelpReply         0x047707
#define ColourPicker_ModelSWI          0x047708
#endif

/* Various ColourPicker related structs (broken up into strange lumps for convenience ***********/

typedef struct {
   char          nought;  /* = 0 */
   char          blue;
   char          green;
   char          red;
   int           extension_size;
} ColourDescriptorHeader;

typedef struct {
   unsigned int            flags;
   char                   *title;
   int                     x;
   int                     reserved0; /* = 0x80000000 */
   int                     reserved1; /* = 0x7fffffff */
   int                     y;
   int                     reserved2; /* = 0 */
   int                     reserved3; /* = 0 */
   ColourDescriptorHeader  descriptor_hdr;
} ColourPickerHeader;

typedef struct {

   unsigned int      model; /* This extension caters fully for only three models */
   union {

      struct {
         int               red;                  /* % */
         int               green;                /* % */
         int               blue;                 /* % */
      } rgb;

      struct {
         int               cyan;                 /* % */
         int               magenta;              /* % */
         int               yellow;               /* % */
         int               key;                  /* % */
      } cmyk;

      struct {
         int               hue;                  /* angle (degrees) */
         int               saturation;           /* % */
         int               value;                /* % */
      } hsv;

      char bytes[16];
      int  words[4];
   } data;
} ColourModelData;

typedef struct {

   ColourPickerHeader      hdr;
   ColourModelData         ext;
} ColourPickerExtended;

typedef struct {

   ColourDescriptorHeader        hdr;
   ColourModelData               ext;

} ColourDescriptorBlock;

/* ColourPicker dialogue types *****************************************************************/

#define ColourPickerType_Normal                    0x00000000
#define ColourPickerType_Menu                      0x00000001
#define ColourPickerType_Toolbox                   0x00000002
#define ColourPickerType_SubMenu                   0x00000003

/* ColourPicker flags (OpenDialogue) ***********************************************************/

#define ColourPickerFlags_IncludeNoneButton        0x00000001
#define ColourPickerFlags_SelectNoneButton         0x00000002
#define ColourPickerFlags_ChangeInfoExceptDrag     0x00000004
#define ColourPickerFlags_AllChangeInfo            0x00000008
#define ColourPickerFlags_IgnoreHelpRequest        0x00000010

/* ColourPicker flags (UpdateDialogue) *********************************************************/

#define ColourPicker_Update_IncludeNoneButton      0x00000001
#define ColourPicker_Update_SelectNoneButton       0x00000002
#define ColourPicker_Update_WhenChangeInfo         0x00000004
#define ColourPicker_Update_VisibleSize            0x00000008
#define ColourPicker_Update_Reserved               0x00000010
#define ColourPicker_Update_WindowTitle            0x00000020
#define ColourPicker_Update_RGBSetting             0x00000040
#define ColourPicker_Update_ModelAndSetting        0x00000080

/* Messages ************************************************************************************/

#define colourpicker_MPICKERCHOICE                 0x00047700
#define colourpicker_MCOLOURCHANGED                0x00047701
#define colourpicker_MCLOSEDIALOGUEREQUEST         0x00047702
#define colourpicker_MOPENPARENTREQUEST            0x00047703

typedef struct {
   int            dialogue_handle;
   int            flags;
   struct {
      ColourDescriptorHeader        hdr;
      struct {
         unsigned int      model; /* This extension caters fully for only three models */
         union {

            struct {
               int               red;                  /* % */
               int               green;                /* % */
               int               blue;                 /* % */
            } rgb;

            struct {
               int               cyan;                 /* % */
               int               magenta;              /* % */
               int               yellow;               /* % */
               int               key;                  /* % */
            } cmyk;

            struct {
               int               hue;                  /* angle (degrees) */
               int               saturation;           /* % */
               int               value;                /* % */
            } hsv;

            char bytes[256-sizeof(wimp_MsgHdr)-sizeof(ColourDescriptorHeader)-sizeof(int)];
            int  words[(256-sizeof(wimp_MsgHdr)-sizeof(ColourDescriptorHeader)-sizeof(int))/4];
         } data;
      } colour_model;
   } colour_descriptor_block;
} colourpicker_PickerChoice, colourpicker_ColourChanged;

typedef struct {
   int dialogue_handle;
} colourpicker_CloseDialogueRequest, colourpicker_OpenParentRequest;


typedef struct {
   wimp_MsgHdr                  hdr;
   colourpicker_ColourChanged   message;
} ColourPicker_ColourChanged_Event;

typedef struct {
   wimp_MsgHdr                  hdr;
   colourpicker_PickerChoice    message;
} ColourPicker_PickerChoice_Event;

typedef struct {
   wimp_MsgHdr                         hdr;
   colourpicker_CloseDialogueRequest   message;
} ColourPicker_CloseDialogueRequest_Event;

typedef struct {
   wimp_MsgHdr                       hdr;
   colourpicker_OpenParentRequest    message;
} ColourPicker_OpenParentRequest_Event;

#endif
