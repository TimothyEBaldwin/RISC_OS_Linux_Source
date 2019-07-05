#ifndef osword_H
#define osword_H

/* C header file for OSWord
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 7 Sept 1995
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

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_Word
#define OS_Word                                 0x7
#undef  XOS_Word
#define XOS_Word                                0x20007
#undef  OSWord_ReadLine
#define OSWord_ReadLine                         0x0
#undef  OSWord_ReadSystemClock
#define OSWord_ReadSystemClock                  0x1
#undef  OSWord_WriteSystemClock
#define OSWord_WriteSystemClock                 0x2
#undef  OSWord_ReadIntervalTimer
#define OSWord_ReadIntervalTimer                0x3
#undef  OSWord_WriteIntervalTimer
#define OSWord_WriteIntervalTimer               0x4
#undef  OSWord_ReadIOSpace
#define OSWord_ReadIOSpace                      0x5
#undef  OSWord_WriteIOSpace
#define OSWord_WriteIOSpace                     0x6
#undef  OSWord_Sound
#define OSWord_Sound                            0x7
#undef  OSWord_Envelope
#define OSWord_Envelope                         0x8
#undef  OSWord_ReadGCOL
#define OSWord_ReadGCOL                         0x9
#undef  OSWord_ReadCharDefinition
#define OSWord_ReadCharDefinition               0xA
#undef  OSWord_ReadPalette
#define OSWord_ReadPalette                      0xB
#undef  OSWord_WritePalette
#define OSWord_WritePalette                     0xC
#undef  OSWord_ReadCursorPosition
#define OSWord_ReadCursorPosition               0xD
#undef  OSWord_ReadClock
#define OSWord_ReadClock                        0xE
#undef  OSWordReadClock_LocalString
#define OSWordReadClock_LocalString             0xE
#undef  OSWordReadClock_LocalBCD
#define OSWordReadClock_LocalBCD                0xE
#undef  OSWordReadClock_ConvertBCDToString
#define OSWordReadClock_ConvertBCDToString      0xE
#undef  OSWordReadClock_UTC
#define OSWordReadClock_UTC                     0xE
#undef  OSWord_WriteClock
#define OSWord_WriteClock                       0xF
#undef  OSWordWriteClock_TimeLocalString
#define OSWordWriteClock_TimeLocalString        0xF
#undef  OSWordWriteClock_DateLocalString
#define OSWordWriteClock_DateLocalString        0xF
#undef  OSWordWriteClock_DateAndTimeLocalString
#define OSWordWriteClock_DateAndTimeLocalString 0xF
#undef  OSWord_EconetTransmit
#define OSWord_EconetTransmit                   0x10
#undef  OSWord_EconetReceive
#define OSWord_EconetReceive                    0x11
#undef  OSWord_EconetMiscOp
#define OSWord_EconetMiscOp                     0x12
#undef  OSWord_EconetImmediateOp
#define OSWord_EconetImmediateOp                0x13
#undef  OSWord_EconetFSOp
#define OSWord_EconetFSOp                       0x14
#undef  OSWord_Pointer
#define OSWord_Pointer                          0x15
#undef  OSWordPointer_Define
#define OSWordPointer_Define                    0x15
#undef  OSWordPointer_SetBBox
#define OSWordPointer_SetBBox                   0x15
#undef  OSWordPointer_Step
#define OSWordPointer_Step                      0x15
#undef  OSWordPointer_SetPosition
#define OSWordPointer_SetPosition               0x15
#undef  OSWordPointer_ReadPosition
#define OSWordPointer_ReadPosition              0x15
#undef  OSWordPointer_SetUnlinkedPosition
#define OSWordPointer_SetUnlinkedPosition       0x15
#undef  OSWordPointer_ReadUnlinkedPosition
#define OSWordPointer_ReadUnlinkedPosition      0x15
#undef  OSWord_WriteScreenBase
#define OSWord_WriteScreenBase                  0x16
#undef  WordV
#define WordV                                   0x7

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct osword_line_block                osword_line_block;
typedef struct osword_timer_block               osword_timer_block;
typedef struct osword_gcol_block                osword_gcol_block;
typedef struct osword_char_definition_block     osword_char_definition_block;
typedef struct osword_palette_block             osword_palette_block;
typedef struct osword_cursor_position_block     osword_cursor_position_block;
typedef union  oswordreadclock_local_string_block oswordreadclock_local_string_block;
typedef union  oswordreadclock_local_bcd_block  oswordreadclock_local_bcd_block;
typedef union  oswordreadclock_convert_bcd_to_string_block oswordreadclock_convert_bcd_to_string_block;
typedef union  oswordreadclock_utc_block        oswordreadclock_utc_block;
typedef struct oswordwriteclock_block           oswordwriteclock_block;
typedef struct oswordwriteclock_block_base      oswordwriteclock_block_base;
typedef struct oswordpointer_define_block       oswordpointer_define_block;
typedef struct oswordpointer_bbox_block         oswordpointer_bbox_block;
typedef struct oswordpointer_step_block         oswordpointer_step_block;
typedef struct oswordpointer_position_block     oswordpointer_position_block;
typedef struct osword_screen_base_block         osword_screen_base_block;
typedef union  osword_block                     osword_block;

/********************
 * Type definitions *
 ********************/
typedef byte oswordreadclock_op;

typedef byte oswordwriteclock_op;

typedef byte oswordpointer_op;

struct osword_line_block
   {  short line;
      byte size;
      byte min_char;
      byte max_char;
   };

struct osword_timer_block
   {  byte b [5];
   };

struct osword_gcol_block
   {  short x;
      short y;
      os_gcol gcol;
   };

struct osword_char_definition_block
   {  char c;
      byte definition [8];
   };

struct osword_palette_block
   {  os_gcol gcol;
      byte colour_number;
      byte r;
      byte g;
      byte b;
   };

struct osword_cursor_position_block
   {  short xprev;
      short yprev;
      short x;
      short y;
   };

union oswordreadclock_local_string_block
   {  oswordreadclock_op op;
      struct
      {  char c [UNKNOWN];
      }
      string;
   };

union oswordreadclock_local_bcd_block
   {  oswordreadclock_op op;
      os_bcd_date_and_time date_and_time;
   };

union oswordreadclock_convert_bcd_to_string_block
   {  struct
      {  oswordreadclock_op op;
         os_bcd_date_and_time date_and_time;
      }
      bcd;
      struct
      {  char c [UNKNOWN];
      }
      string;
   };

union oswordreadclock_utc_block
   {  oswordreadclock_op op;
      os_date_and_time utc;
   };

#define oswordwriteclock_BLOCK_MEMBERS \
   oswordwriteclock_op op;

/* Base oswordwriteclock_block structure without variable part */
struct oswordwriteclock_block_base
   {  oswordwriteclock_BLOCK_MEMBERS
   };

/* legacy structure */
struct oswordwriteclock_block
   {  oswordwriteclock_BLOCK_MEMBERS
      char string [UNKNOWN];
   };

#define oswordwriteclock_BLOCK(N) \
   struct \
      {  oswordwriteclock_BLOCK_MEMBERS \
         char string [N]; \
      }

#define oswordwriteclock_SIZEOF_BLOCK(N) \
   (offsetof (oswordwriteclock_block, string) + \
         (N)*sizeof ((oswordwriteclock_block *) NULL)->string)

struct oswordpointer_define_block
   {  byte reserved [2];
      oswordpointer_op op;
      byte shape_no;
      byte width;
      byte height;
      byte xactive;
      byte yactive;
      byte *data;
   };

struct oswordpointer_bbox_block
   {  byte reserved [3];
      oswordpointer_op op;
      short x0;
      short y0;
      short x1;
      short y1;
   };

struct oswordpointer_step_block
   {  oswordpointer_op op;
      byte xstep;
      byte ystep;
   };

struct oswordpointer_position_block
   {  byte reserved;
      oswordpointer_op op;
      short x;
      short y;
   };

struct osword_screen_base_block
   {  byte reserved [3];
      byte type;
      byte *base;
   };

union osword_block
   {  osword_line_block line;
      osword_timer_block timer;
      osword_gcol_block gcol;
      osword_char_definition_block char_definition;
      osword_palette_block palette;
      osword_cursor_position_block cursor_position;
      oswordreadclock_local_string_block string;
      oswordreadclock_local_bcd_block bcd;
      oswordreadclock_convert_bcd_to_string_block convert_bcd_to_string;
      oswordreadclock_utc_block utc;
      oswordwriteclock_block write_clock;
      oswordpointer_define_block pointer_define;
      oswordpointer_bbox_block pointer_bbox;
      oswordpointer_step_block pointer_step;
      oswordpointer_position_block pointer_position;
      osword_screen_base_block screen_base;
      char reserved [64];
   };

/************************
 * Constant definitions *
 ************************/
#define oswordreadclock_OP_LOCAL_STRING         ((oswordreadclock_op) 0x0u)
#define oswordreadclock_OP_LOCAL_BCD            ((oswordreadclock_op) 0x1u)
#define oswordreadclock_OP_CONVERT_BCD_TO_STRING ((oswordreadclock_op) 0x2u)
#define oswordreadclock_OP_UTC                  ((oswordreadclock_op) 0x3u)
#define oswordwriteclock_OP_TIME_LOCAL_STRING   ((oswordwriteclock_op) 0x8u)
#define oswordwriteclock_OP_DATE_LOCAL_STRING   ((oswordwriteclock_op) 0xFu)
#define oswordwriteclock_OP_LOCAL_STRING        ((oswordwriteclock_op) 0x18u)
#define oswordpointer_OP_DEFINE                 ((oswordpointer_op) 0x0u)
#define oswordpointer_OP_SET_BBOX               ((oswordpointer_op) 0x1u)
#define oswordpointer_OP_STEP                   ((oswordpointer_op) 0x2u)
#define oswordpointer_OP_SET_POSITION           ((oswordpointer_op) 0x3u)
#define oswordpointer_OP_READ_POSITION          ((oswordpointer_op) 0x4u)
#define oswordpointer_OP_SET_UNLINKED_POSITION  ((oswordpointer_op) 0x5u)
#define oswordpointer_OP_READ_UNLINKED_POSITION ((oswordpointer_op) 0x6u)
#define osword_CHAR_DEFINITION_ECF1             ((char) '\x02')
#define osword_CHAR_DEFINITION_ECF2             ((char) '\x03')
#define osword_CHAR_DEFINITION_ECF3             ((char) '\x04')
#define osword_CHAR_DEFINITION_ECF4             ((char) '\x05')
#define osword_CHAR_DEFINITION_DOT_DASH_PATTERN ((char) '\x06')

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osword_read_system_clock()
 *
 * Description:   Reads the system clock
 *
 * Input:         clock - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x1.
 */

extern os_error *xosword_read_system_clock (osword_timer_block *clock);
extern void osword_read_system_clock (osword_timer_block *clock);

/* ------------------------------------------------------------------------
 * Function:      osword_write_system_clock()
 *
 * Description:   Writes the system clock
 *
 * Input:         clock - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x2.
 */

extern os_error *xosword_write_system_clock (osword_timer_block const *clock);
extern void osword_write_system_clock (osword_timer_block const *clock);

/* ------------------------------------------------------------------------
 * Function:      osword_read_interval_timer()
 *
 * Description:   Reads the interval timer
 *
 * Input:         timer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x3.
 */

extern os_error *xosword_read_interval_timer (osword_timer_block *timer);
extern void osword_read_interval_timer (osword_timer_block *timer);

/* ------------------------------------------------------------------------
 * Function:      osword_write_interval_timer()
 *
 * Description:   Writes the interval timer
 *
 * Input:         timer - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x4.
 */

extern os_error *xosword_write_interval_timer (osword_timer_block const *timer);
extern void osword_write_interval_timer (osword_timer_block const *timer);

/* ------------------------------------------------------------------------
 * Function:      osword_read_char_definition()
 *
 * Description:   Reads a character definition - Client must partly
 *                initialise the parameter block
 *
 * Input:         definition - Partly filled in on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xA.
 */

extern os_error *xosword_read_char_definition (osword_char_definition_block *definition);
extern void osword_read_char_definition (osword_char_definition_block *definition);

/* ------------------------------------------------------------------------
 * Function:      osword_read_palette()
 *
 * Description:   Reads the palette - Client must partly initialise the
 *                parameter block - prefer ColourTrans_ReadPalette
 *
 * Input:         entry - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xB.
 */

extern os_error *xosword_read_palette (osword_palette_block *entry);
extern void osword_read_palette (osword_palette_block *entry);

/* ------------------------------------------------------------------------
 * Function:      osword_write_palette()
 *
 * Description:   Writes the palette - Client must initialise the parameter
 *                block - prefer ColourTrans_WritePalette
 *
 * Input:         entry - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xC.
 */

extern os_error *xosword_write_palette (osword_palette_block const *entry);
extern void osword_write_palette (osword_palette_block const *entry);

/* ------------------------------------------------------------------------
 * Function:      osword_read_cursor_position()
 *
 * Description:   Reads the current and previous graphics cursor positions
 *                - prefer OS_ReadVduVariables
 *
 * Input:         position - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xD.
 */

extern os_error *xosword_read_cursor_position (osword_cursor_position_block *position);
extern void osword_read_cursor_position (osword_cursor_position_block *position);

/* ------------------------------------------------------------------------
 * Function:      oswordreadclock_local_string()
 *
 * Description:   Reads the real-time clock as a string, converting to
 *                local time - Client must partly initialise the parameter
 *                block
 *
 * Input:         string - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xE.
 */

extern os_error *xoswordreadclock_local_string (oswordreadclock_local_string_block *string);
extern void oswordreadclock_local_string (oswordreadclock_local_string_block *string);

/* ------------------------------------------------------------------------
 * Function:      oswordreadclock_local_bcd()
 *
 * Description:   Reads the real-time clock in BCD format, converting to
 *                local time - Client must partly initialise the parameter
 *                block
 *
 * Input:         bcd - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xE.
 */

extern os_error *xoswordreadclock_local_bcd (oswordreadclock_local_bcd_block *bcd);
extern void oswordreadclock_local_bcd (oswordreadclock_local_bcd_block *bcd);

/* ------------------------------------------------------------------------
 * Function:      oswordreadclock_convert_bcd_to_string()
 *
 * Description:   Converts a BCD clock value into string format - Client
 *                must partly initialise the parameter block
 *
 * Input:         convert_bcd_to_String - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xE.
 */

extern os_error *xoswordreadclock_convert_bcd_to_string (oswordreadclock_convert_bcd_to_string_block *convert_bcd_to_String);
extern void oswordreadclock_convert_bcd_to_string (oswordreadclock_convert_bcd_to_string_block *convert_bcd_to_String);

/* ------------------------------------------------------------------------
 * Function:      oswordreadclock_utc()
 *
 * Description:   Reads the real-time clock in 5-byte format - Client must
 *                partly initialise the parameter block
 *
 * Input:         utc - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xE.
 */

extern os_error *xoswordreadclock_utc (oswordreadclock_utc_block *utc);
extern void oswordreadclock_utc (oswordreadclock_utc_block *utc);

/* ------------------------------------------------------------------------
 * Function:      oswordwriteclock_time_local_string()
 *
 * Description:   Writes the real-time clock with a time string, converting
 *                from local time - Client must partly initialise the
 *                parameter block
 *
 * Input:         time - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xF.
 */

extern os_error *xoswordwriteclock_time_local_string (oswordwriteclock_block *time);
extern void oswordwriteclock_time_local_string (oswordwriteclock_block *time);

/* ------------------------------------------------------------------------
 * Function:      oswordwriteclock_date_local_string()
 *
 * Description:   Writes the real-time clock with a date string, converting
 *                from local time - Client must partly initialise the
 *                parameter block
 *
 * Input:         date - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xF.
 */

extern os_error *xoswordwriteclock_date_local_string (oswordwriteclock_block *date);
extern void oswordwriteclock_date_local_string (oswordwriteclock_block *date);

/* ------------------------------------------------------------------------
 * Function:      oswordwriteclock_date_and_time_local_string()
 *
 * Description:   Writes the real-time clock with a time and date string,
 *                converting from local time - Client must partly
 *                initialise the parameter block
 *
 * Input:         date_and_time - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0xF.
 */

extern os_error *xoswordwriteclock_date_and_time_local_string (oswordwriteclock_block *date_and_time);
extern void oswordwriteclock_date_and_time_local_string (oswordwriteclock_block *date_and_time);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_define()
 *
 * Description:   Defines the pointer size, shape and active point - Client
 *                must partly initialise the parameter block - prefer
 *                OSSpriteOp_SetPointerShape
 *
 * Input:         define - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x2.
 */

extern os_error *xoswordpointer_define (oswordpointer_define_block *define);
extern void oswordpointer_define (oswordpointer_define_block *define);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_set_bbox()
 *
 * Description:   Defines the mouse coordinate bounding box - Client must
 *                partly initialise the parameter block
 *
 * Input:         bbox - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x3.
 */

extern os_error *xoswordpointer_set_bbox (oswordpointer_bbox_block *bbox);
extern void oswordpointer_set_bbox (oswordpointer_bbox_block *bbox);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_step()
 *
 * Description:   Defines the mouse multipliers. - Client must partly
 *                initialise the parameter block
 *
 * Input:         step - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15.
 */

extern os_error *xoswordpointer_step (oswordpointer_step_block const *step);
extern void oswordpointer_step (oswordpointer_step_block const *step);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_set_position()
 *
 * Description:   Sets the mouse position. - Client must partly initialise
 *                the parameter block
 *
 * Input:         pos - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x1.
 */

extern os_error *xoswordpointer_set_position (oswordpointer_position_block *pos);
extern void oswordpointer_set_position (oswordpointer_position_block *pos);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_read_position()
 *
 * Description:   Reads the unbuffered mouse position. - Client must partly
 *                initialise the parameter block
 *
 * Input:         pos - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x1.
 */

extern os_error *xoswordpointer_read_position (oswordpointer_position_block *pos);
extern void oswordpointer_read_position (oswordpointer_position_block *pos);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_set_unlinked_position()
 *
 * Description:   Sets the pointer position. - Client must partly
 *                initialise the parameter block
 *
 * Input:         pos - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x1.
 */

extern os_error *xoswordpointer_set_unlinked_position (oswordpointer_position_block *pos);
extern void oswordpointer_set_unlinked_position (oswordpointer_position_block *pos);

/* ------------------------------------------------------------------------
 * Function:      oswordpointer_read_unlinked_position()
 *
 * Description:   Reads the pointer position. - Client must partly
 *                initialise the parameter block
 *
 * Input:         pos - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x15, R1 += 0x1.
 */

extern os_error *xoswordpointer_read_unlinked_position (oswordpointer_position_block *pos);
extern void oswordpointer_read_unlinked_position (oswordpointer_position_block *pos);

/* ------------------------------------------------------------------------
 * Function:      osword_write_screen_base()
 *
 * Description:   Writes the screen base address. - Client must partly
 *                initialise the parameter block
 *
 * Input:         screen_base - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x7 with R0 = 0x16, R1 += 0x3.
 */

extern os_error *xosword_write_screen_base (osword_screen_base_block *screen_base);
extern void osword_write_screen_base (osword_screen_base_block *screen_base);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
