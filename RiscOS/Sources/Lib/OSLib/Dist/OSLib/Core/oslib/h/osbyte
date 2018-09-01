#ifndef osbyte_H
#define osbyte_H

/* C header file for OSByte
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
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
#undef  OS_Byte
#define OS_Byte                                 0x6
#undef  XOS_Byte
#define XOS_Byte                                0x20006
#undef  ByteV
#define ByteV                                   0x6
#undef  OSByte
#define OSByte                                  0x6
#undef  XOSByte
#define XOSByte                                 0x20006
#undef  OSByte1
#define OSByte1                                 0x6
#undef  XOSByte1
#define XOSByte1                                0x20006
#undef  OSByte2
#define OSByte2                                 0x6
#undef  XOSByte2
#define XOSByte2                                0x20006
#undef  OSByte_Read
#define OSByte_Read                             0xFF
#undef  OSByte_Write
#define OSByte_Write                            0x0

/********************
 * Type definitions *
 ********************/
typedef byte osbyte_op;

typedef byte osbyte_var;

/************************
 * Constant definitions *
 ************************/
#define osbyte_VERSION                          ((osbyte_op) 0x0u)
#define osbyte_USER_FLAG                        ((osbyte_op) 0x1u)
      /*Has associated variable*/
#define osbyte_INPUT_STREAM                     ((osbyte_op) 0x2u)
      /*Has associated variable*/
#define osbyte_OUTPUT_STREAMS                   ((osbyte_op) 0x3u)
      /*Has associated variable*/
#define osbyte_INTERPRETATION_ARROWS            ((osbyte_op) 0x4u)
      /*Has associated variable*/
#define osbyte_PRINTER                          ((osbyte_op) 0x5u)
      /*Has associated variable*/
#define osbyte_IGNORE_CHAR                      ((osbyte_op) 0x6u)
      /*Has associated variable*/
#define osbyte_SERIAL_RECEIVE_RATE              ((osbyte_op) 0x7u)
      /*Has associated variable - prefer OS_SerialOp*/
#define osbyte_SERIAL_TRANSMIT_RATE             ((osbyte_op) 0x8u)
      /*Has associated variable - Prefer OS_SerialOp*/
#define osbyte_ON_DURATION                      ((osbyte_op) 0x9u)
      /*Has associated variable*/
#define osbyte_OFF_DURATION                     ((osbyte_op) 0xAu)
      /*Has associated variable*/
#define osbyte_KEYBOARD_DELAY                   ((osbyte_op) 0xBu)
      /*Has associated variable*/
#define osbyte_KEYBOARD_RATE                    ((osbyte_op) 0xCu)
      /*Has associated variable*/
#define osbyte_DISABLE_EVENT                    ((osbyte_op) 0xDu)
#define osbyte_ENABLE_EVENT                     ((osbyte_op) 0xEu)
#define osbyte_FLUSH_BUFFERS                    ((osbyte_op) 0xFu)
      /*Prefer Buffer*/
#define osbyte_CHANNEL_COUNT                    ((osbyte_op) 0x10u)
      /*Has associated variable*/
#define osbyte_CONVERT_CHANNEL                  ((osbyte_op) 0x11u)
#define osbyte_RESET_FUNCTION_KEYS              ((osbyte_op) 0x12u)
#define osbyte_AWAIT_VSYNC                      ((osbyte_op) 0x13u)
#define osbyte_RESET_SYSTEM_FONT                ((osbyte_op) 0x14u)
#define osbyte_FLUSH_BUFFER                     ((osbyte_op) 0x15u)
      /*Prefer Buffer*/
#define osbyte_INCREMENT_ROM_SEMAPHORE          ((osbyte_op) 0x16u)
      /*Obsolete */
#define osbyte_DECREMENT_ROM_SEMAPHORE          ((osbyte_op) 0x17u)
      /*Obsolete */
#define osbyte_RESET_SYSTEM_CHARS               ((osbyte_op) 0x19u)
#define osbyte_ECONET_POLL_TRANSMIT             ((osbyte_op) 0x32u)
      /*Obsolete */
#define osbyte_ECONET_POLL_RECEIVE              ((osbyte_op) 0x33u)
      /*Obsolete */
#define osbyte_ECONET_ABANDON_RECEIVE           ((osbyte_op) 0x34u)
      /*Obsolete */
#define osbyte_ECONET_ROFF                      ((osbyte_op) 0x35u)
      /*Obsolete */
#define osbyte_BANKED_RAM_PRESENCE              ((osbyte_op) 0x44u)
      /*Obsolete */
#define osbyte_BANKED_RAM_USE                   ((osbyte_op) 0x45u)
      /*Obsolete */
#define osbyte_COUNTRY_NUMBER                   ((osbyte_op) 0x46u)
      /*Has associated variable*/
#define osbyte_ALPHABET_NUMBER                  ((osbyte_op) 0x47u)
      /*Prefer Territory*/
#define osbyte_SELECT_POINTER                   ((osbyte_op) 0x6Au)
#define osbyte_WRITE_BUS_STATE                  ((osbyte_op) 0x6Bu)
      /*Obsolete */
#define osbyte_WRITE_SHADOW_STATE               ((osbyte_op) 0x6Cu)
      /*Obsolete */
#define osbyte_SELECT_TEMPORARY_FS              ((osbyte_op) 0x6Du)
      /*Obsolete */
#define osbyte_OUTPUT_SCREEN_BANK               ((osbyte_op) 0x70u)
      /*Has associated variable*/
#define osbyte_DISPLAY_SCREEN_BANK              ((osbyte_op) 0x71u)
      /*Has associated variable*/
#define osbyte_SHADOW_STATE                     ((osbyte_op) 0x72u)
#define osbyte_VDU_STATE                        ((osbyte_op) 0x75u)
#define osbyte_UPDATE_KEYBOARD                  ((osbyte_op) 0x76u)
#define osbyte_CLOSE_SPOOL_AND_EXEC             ((osbyte_op) 0x77u)
      /*Obsolete */
#define osbyte_LOCK_REPEAT                      ((osbyte_op) 0x78u)
#define osbyte_SCAN_KEYBOARD                    ((osbyte_op) 0x79u)
#define osbyte_SCAN_KEYBOARD_LIMITED            ((osbyte_op) 0x7Au)
#define osbyte_PRINTER_DORMANT                  ((osbyte_op) 0x7Bu)
      /*Obsolete */
#define osbyte_CLEAR_ESCAPE                     ((osbyte_op) 0x7Cu)
#define osbyte_SET_ESCAPE                       ((osbyte_op) 0x7Du)
#define osbyte_ACKNOWLEDGE_ESCAPE               ((osbyte_op) 0x7Eu)
#define osbyte_READ_EOF_STATUS                  ((osbyte_op) 0x7Fu)
      /*Prefer OSArgs_ReadEOFStatus*/
#define osbyte_BUFFER_OP                        ((osbyte_op) 0x80u)
#define osbyte_OP_JOYSTICK_STATE                0
#define osbyte_OP_CHANNEL_POSITION1             1
#define osbyte_OP_CHANNEL_POSITION2             2
#define osbyte_OP_CHANNEL_POSITION3             3
#define osbyte_OP_CHANNEL_POSITION4             4
#define osbyte_OP_POINTER_XPOSITION             7
      /*Prefer OS_Mouse*/
#define osbyte_OP_POINTER_YPOSITION             8
      /*Prefer OS_Mouse*/
#define osbyte_OP_MOUSE_BUFFER_USED             246
#define osbyte_OP_PRINTER_BUFFER_FREE           252
#define osbyte_OP_SERIAL_OUTPUT_BUFFER_FREE     253
#define osbyte_OP_SERIAL_INPUT_BUFFER_USED      254
#define osbyte_OP_KEYBOARD_BUFFER_USED          255
#define osbyte_IN_KEY                           ((osbyte_op) 0x81u)
#define osbyte_READ_HIGH_ORDER_ADDRESS          ((osbyte_op) 0x82u)
      /*Obsolete */
#define osbyte_READ_HWM                         ((osbyte_op) 0x83u)
      /*Obsolete */
#define osbyte_READ_TOP                         ((osbyte_op) 0x84u)
      /*Obsolete */
#define osbyte_READ_TOP_FOR_MODE                ((osbyte_op) 0x85u)
      /*Obsolete */
#define osbyte_TEXT_CURSOR_POSITION             ((osbyte_op) 0x86u)
#define osbyte_SCREEN_CHAR                      ((osbyte_op) 0x87u)
#define osbyte_RUN                              ((osbyte_op) 0x88u)
      /*Obsolete */
#define osbyte_CASSETTE_MOTOR                   ((osbyte_op) 0x89u)
      /*Obsolete */
#define osbyte_BUFFER_INSERT                    ((osbyte_op) 0x8Au)
      /*Prefer Buffer*/
#define osbyte_OPT                              ((osbyte_op) 0x8Bu)
      /*Prefer OSFSControl_WriteBootOption*/
#define osbyte_SELECT_CFS                       ((osbyte_op) 0x8Cu)
      /*Obsolete */
#define osbyte_SELECT_ROMFS                     ((osbyte_op) 0x8Du)
      /*Obsolete */
#define osbyte_ROM_ENTER                        ((osbyte_op) 0x8Eu)
      /*Obsolete */
#define osbyte_SERVICE_CALL                     ((osbyte_op) 0x8Fu)
      /*Prefer OS_ServiceCall*/
#define osbyte_TV                               ((osbyte_op) 0x90u)
#define osbyte_BUFFER_REMOVE                    ((osbyte_op) 0x91u)
      /*Prefer Buffer*/
#define osbyte_READ_FRED                        ((osbyte_op) 0x92u)
      /*Obsolete */
#define osbyte_WRITE_FRED                       ((osbyte_op) 0x93u)
      /*Obsolete */
#define osbyte_READ_JIM                         ((osbyte_op) 0x94u)
      /*Obsolete */
#define osbyte_WRITE_JIM                        ((osbyte_op) 0x95u)
      /*Obsolete */
#define osbyte_READ_SHEILA                      ((osbyte_op) 0x96u)
      /*Obsolete */
#define osbyte_WRITE_SHEILA                     ((osbyte_op) 0x97u)
      /*Obsolete */
#define osbyte_BUFFER_STATUS                    ((osbyte_op) 0x98u)
      /*Prefer Buffer*/
#define osbyte_TYPE_CHAR                        ((osbyte_op) 0x99u)
#define osbyte_WRITE_VDU_CONTROL                ((osbyte_op) 0x9Au)
      /*Obsolete */
#define osbyte_WRITE_VDU_PALETTE                ((osbyte_op) 0x9Bu)
      /*Obsolete */
#define osbyte_SERIAL_STATE                     ((osbyte_op) 0x9Cu)
      /*Has associated variable*/
#define osbyte_WRITE_TUBE                       ((osbyte_op) 0x9Du)
      /*Obsolete */
#define osbyte_READ_VDU_VARIABLE                ((osbyte_op) 0xA0u)
      /*Prefer OS_ReadVDUVariable*/
#define osbyte_READ_CMOS                        ((osbyte_op) 0xA1u)
#define osbyte_WRITE_CMOS                       ((osbyte_op) 0xA2u)
#define osbyte_GRAPHICS_INFO                    ((osbyte_op) 0xA3u)
#define osbyte_CPU_TYPE                         ((osbyte_op) 0xA4u)
      /*Obsolete */
#define osbyte_OUTPUT_CURSOR_POSITION           ((osbyte_op) 0xA5u)
#define osbyte_READ_VARIABLE_START              ((osbyte_op) 0xA6u)
      /*Obsolete */
#define osbyte_READ_ROM_POINTER_TABLE           ((osbyte_op) 0xA8u)
      /*Obsolete */
#define osbyte_READ_ROM_INFO_TABLE              ((osbyte_op) 0xAAu)
      /*Obsolete */
#define osbyte_READ_KEYBOARD_TABLE              ((osbyte_op) 0xACu)
      /*Obsolete */
#define osbyte_READ_VDU_VARIABLE_START          ((osbyte_op) 0xAEu)
      /*Obsolete */
#define osbyte_VAR_VSYNC_TIMER                  ((osbyte_var) 0xB0u)
#define osbyte_VAR_INPUT_STREAM                 ((osbyte_var) 0xB1u)
#define osbyte_VAR_KEYBOARD_SEMAPHORE           ((osbyte_var) 0xB2u)
#define osbyte_VAR_ROM_SEMAPHORE                ((osbyte_var) 0xB3u)
      /*Obsolete */
#define osbyte_VAR_HWM                          ((osbyte_var) 0xB4u)
      /*Obsolete */
#define osbyte_VAR_SERIAL_INTERPRETATION        ((osbyte_var) 0xB5u)
#define osbyte_VAR_IGNORE_STATE                 ((osbyte_var) 0xB6u)
#define osbyte_VAR_CASSETTE_ROM_SWITCH          ((osbyte_var) 0xB7u)
      /*Obsolete */
#define osbyte_VAR_VDU_CONTROL                  ((osbyte_var) 0xB8u)
      /*Obsolete */
#define osbyte_VAR_VDU_PALETTE                  ((osbyte_var) 0xB9u)
      /*Obsolete */
#define osbyte_VAR_ROM_LAST_RESET               ((osbyte_var) 0xBAu)
      /*Obsolete */
#define osbyte_VAR_ROM_BASIC                    ((osbyte_var) 0xBBu)
      /*Obsolete */
#define osbyte_VAR_CURRENT_CHANNEL              ((osbyte_var) 0xBCu)
#define osbyte_VAR_CHANNEL_COUNT                ((osbyte_var) 0xBDu)
#define osbyte_VAR_CONVERSION_RESOLUTION        ((osbyte_var) 0xBEu)
#define osbyte_VAR_SERIAL_BUSY                  ((osbyte_var) 0xBFu)
      /*Obsolete */
#define osbyte_VAR_SERIAL_STATE                 ((osbyte_var) 0xC0u)
#define osbyte_VAR_FLASH_COUNTER                ((osbyte_var) 0xC1u)
#define osbyte_VAR_OFF_DURATION                 ((osbyte_var) 0xC2u)
#define osbyte_VAR_ON_DURATION                  ((osbyte_var) 0xC3u)
#define osbyte_VAR_KEYBOARD_DELAY               ((osbyte_var) 0xC4u)
#define osbyte_VAR_KEYBOARD_RATE                ((osbyte_var) 0xC5u)
#define osbyte_VAR_EXEC_HANDLE                  ((osbyte_var) 0xC6u)
#define osbyte_VAR_SPOOL_HANDLE                 ((osbyte_var) 0xC7u)
#define osbyte_VAR_RESET_EFFECTS                ((osbyte_var) 0xC8u)
#define osbyte_VAR_KEYBOARD_DISABLE             ((osbyte_var) 0xC9u)
#define osbyte_VAR_KEYBOARD_STATE               ((osbyte_var) 0xCAu)
#define osbyte_VAR_SERIAL_THRESHOLD             ((osbyte_var) 0xCBu)
      /*Prefer OSSerialOp_RxThreshold*/
#define osbyte_VAR_SERIAL_BUFFER_STATE          ((osbyte_var) 0xCCu)
      /*Prefer Buffer*/
#define osbyte_VAR_SERIAL_DESTINATION           ((osbyte_var) 0xCDu)
      /*Obsolete */
#define osbyte_VAR_ECONET_OS_CALL_STATUS        ((osbyte_var) 0xCEu)
      /*Obsolete */
#define osbyte_VAR_ECONET_INPUT_STATUS          ((osbyte_var) 0xCFu)
      /*Obsolete */
#define osbyte_VAR_ECONET_OUTPUT_STATUS         ((osbyte_var) 0xD0u)
      /*Obsolete */
#define osbyte_VAR_SOUND_SUPPRESSION            ((osbyte_var) 0xD2u)
      /*Obsolete */
#define osbyte_VAR_BELL_CHANNEL                 ((osbyte_var) 0xD3u)
#define osbyte_VAR_BELL_VOLUME                  ((osbyte_var) 0xD4u)
#define osbyte_VAR_BELL_FREQUENCY               ((osbyte_var) 0xD5u)
#define osbyte_VAR_BELL_DURATION                ((osbyte_var) 0xD6u)
#define osbyte_VAR_BANNER_SUPPRESS              ((osbyte_var) 0xD7u)
      /*Obsolete */
#define osbyte_VAR_PENDING_KEY_LENGTH           ((osbyte_var) 0xD8u)
#define osbyte_VAR_PAGE_LENGTH                  ((osbyte_var) 0xD9u)
#define osbyte_VAR_VDU_QUEUE_LENGTH             ((osbyte_var) 0xDAu)
#define osbyte_VAR_TAB_CHAR                     ((osbyte_var) 0xDBu)
#define osbyte_VAR_ESCAPE_CHAR                  ((osbyte_var) 0xDCu)
#define osbyte_VAR_INTERPRETATION_GROUP4        ((osbyte_var) 0xDDu)
#define osbyte_VAR_INTERPRETATION_GROUP5        ((osbyte_var) 0xDEu)
#define osbyte_VAR_INTERPRETATION_GROUP6        ((osbyte_var) 0xDFu)
#define osbyte_VAR_INTERPRETATION_GROUP7        ((osbyte_var) 0xE0u)
#define osbyte_VAR_INTERPRETATION_GROUP0        ((osbyte_var) 0xE1u)
#define osbyte_VAR_INTERPRETATION_GROUP1        ((osbyte_var) 0xE2u)
#define osbyte_VAR_INTERPRETATION_GROUP2        ((osbyte_var) 0xE3u)
#define osbyte_VAR_INTERPRETATION_GROUP3        ((osbyte_var) 0xE4u)
#define osbyte_VAR_ESCAPE_STATE                 ((osbyte_var) 0xE5u)
#define osbyte_VAR_ESCAPE_EFFECTS               ((osbyte_var) 0xE6u)
#define osbyte_VAR_IRQ_MASK_USER                ((osbyte_var) 0xE7u)
      /*Obsolete */
#define osbyte_VAR_IRQ_MASK_SERIAL              ((osbyte_var) 0xE8u)
      /*Obsolete */
#define osbyte_VAR_IRQ_MASK_SYSTEM              ((osbyte_var) 0xE9u)
      /*Obsolete */
#define osbyte_VAR_TUBE                         ((osbyte_var) 0xEAu)
      /*Obsolete */
#define osbyte_VAR_OUTPUT_STREAMS               ((osbyte_var) 0xECu)
#define osbyte_VAR_INTERPRETATION_ARROWS        ((osbyte_var) 0xEDu)
#define osbyte_VAR_INTERPRETATION_KEYPAD        ((osbyte_var) 0xEEu)
#define osbyte_VAR_SHADOW_STATE                 ((osbyte_var) 0xEFu)
      /*Obsolete */
#define osbyte_VAR_COUNTRY_NUMBER               ((osbyte_var) 0xF0u)
#define osbyte_VAR_USER_FLAG                    ((osbyte_var) 0xF1u)
#define osbyte_VAR_SERIAL_RATE                  ((osbyte_var) 0xF2u)
#define osbyte_VAR_INTERVAL_TIMER_STATE         ((osbyte_var) 0xF3u)
#define osbyte_VAR_SOFT_KEY_STATE               ((osbyte_var) 0xF4u)
      /*Obsolete */
#define osbyte_VAR_PRINTER                      ((osbyte_var) 0xF5u)
#define osbyte_VAR_IGNORE_CHAR                  ((osbyte_var) 0xF6u)
#define osbyte_VAR_INTERPRETATION_BREAK         ((osbyte_var) 0xF7u)
#define osbyte_VAR_INTERPRETATION_BREAK1        ((osbyte_var) 0xF8u)
      /*Obsolete */
#define osbyte_VAR_INTERPRETATION_BREAK2        ((osbyte_var) 0xF9u)
      /*Obsolete */
#define osbyte_VAR_OUTPUT_SCREEN_BANK           ((osbyte_var) 0xFAu)
#define osbyte_VAR_DISPLAY_SCREEN_BANK          ((osbyte_var) 0xFBu)
#define osbyte_VAR_ROM_CURRENT                  ((osbyte_var) 0xFCu)
      /*Obsolete */
#define osbyte_VAR_LAST_RESET                   ((osbyte_var) 0xFDu)
#define osbyte_VAR_INTERPRETATION_SHIFTING      ((osbyte_var) 0xFEu)
#define osbyte_VAR_BOOT_OPTION                  ((osbyte_var) 0xFFu)
#define os_RESET_SOFT                           0
#define os_RESET_POWER_ON                       1
#define os_RESET_HARD                           2
#define osbyte_CONFIGURE_STATION                0
#define osbyte_CONFIGURE_FS_STATION             1
#define osbyte_CONFIGURE_FS_NET                 2
#define osbyte_CONFIGURE_FS_NAME0               2
      /*if FSStation = 0*/
#define osbyte_CONFIGURE_PS_STATION             3
#define osbyte_CONFIGURE_PS_NET                 4
#define osbyte_CONFIGURE_PS_NAME0               4
      /*if PSStation = 0*/
#define osbyte_CONFIGURE_FILE_SYSTEM            5
#define osbyte_CONFIGURE_UNPLUG0                6
#define osbyte_CONFIGURE_UNPLUG1                7
#define osbyte_CONFIGURE_UNPLUG8                9
      /*RO360 */
#define osbyte_CONFIGURE_MODE                   10
#define osbyte_CONFIGURE_MODE_SHIFT             0
#define osbyte_CONFIGURE_MODE_MASK              0xFu
#define osbyte_CONFIGURE_TV_INTERLACE           10
#define osbyte_CONFIGURE_TV_INTERLACE_MASK      0x10u
#define osbyte_CONFIGURE_TV_VERTICAL_ADJUST     10
#define osbyte_CONFIGURE_TV_VERTICAL_ADJUST_SHIFT 5
#define osbyte_CONFIGURE_TV_VERTICAL_ADJUST_MASK 0xE0u
#define osbyte_CONFIGURE_DRIVE                  11
#define osbyte_CONFIGURE_DRIVE_SHIFT            0
#define osbyte_CONFIGURE_DRIVE_MASK             0x7u
#define osbyte_CONFIGURE_CAPS                   11
#define osbyte_CONFIGURE_CAPS_SHIFT             3
#define osbyte_CONFIGURE_CAPS_MASK              0x38u
#define osbyte_CONFIGURE_DIR                    11
#define osbyte_CONFIGURE_DIR_MASK               0x40u
#define osbyte_CONFIGURE_DELAY                  12
#define osbyte_CONFIGURE_REPEAT                 13
#define osbyte_CONFIGURE_IGNORE                 14
#define osbyte_CONFIGURE_NO_IGNORE              15
#define osbyte_CONFIGURE_NO_IGNORE_MASK         0x2u
#define osbyte_CONFIGURE_BAUD                   15
#define osbyte_CONFIGURE_BAUD_SHIFT             2
#define osbyte_CONFIGURE_BAUD_MASK              0x1Cu
#define osbyte_CONFIGURE_PRINT                  15
#define osbyte_CONFIGURE_PRINT_SHIFT            5
#define osbyte_CONFIGURE_PRINT_MASK             0xE0u
#define osbyte_CONFIGURE_LOUD                   16
#define osbyte_CONFIGURE_LOUD_MASK              0x2u
#define osbyte_CONFIGURE_NO_SCROLL              16
#define osbyte_CONFIGURE_NO_SCROLL_MASK         0x8u
#define osbyte_CONFIGURE_BOOT                   16
#define osbyte_CONFIGURE_BOOT_MASK              0x10u
#define osbyte_CONFIGURE_DATA                   16
#define osbyte_CONFIGURE_DATA_SHIFT             5
#define osbyte_CONFIGURE_DATA_MASK              0xE0u
#define osbyte_CONFIGURE_NET_FILER_SORT         17
#define osbyte_CONFIGURE_NET_FILER_SORT_MASK    0x1u
#define osbyte_CONFIGURE_LIBRARY                17
#define osbyte_CONFIGURE_LIBRARY_MASK           0x2u
#define osbyte_CONFIGURE_NET_FILER_DISPLAY      17
#define osbyte_CONFIGURE_NET_FILER_DISPLAY_SHIFT 2
#define osbyte_CONFIGURE_NET_FILER_DISPLAY_MASK 0xCu
#define osbyte_CONFIGURE_UNPLUG2                18
#define osbyte_CONFIGURE_UNPLUG3                19
#define osbyte_CONFIGURE_UNPLUG_EXTENSION0      20
#define osbyte_CONFIGURE_UNPLUG_EXTENSION1      21
#define osbyte_CONFIGURE_WIMP_DOUBLE_CLICK_MOVE 22
#define osbyte_CONFIGURE_WIMP_AUTO_MENU_DELAY   23
#define osbyte_CONFIGURE_TERRITORY              24
#define osbyte_CONFIGURE_PRINTER_BUFFER_SIZE    25
      /*Prefer Buffer*/
#define osbyte_CONFIGURE_ADFS_SPINDOWN          26
#define osbyte_CONFIGURE_WIMP_MENU_DRAG_DELAY   27
#define osbyte_CONFIGURE_TRUNCATE               28
#define osbyte_CONFIGURE_TRUNCATE_MASK          0x1u
#define osbyte_CONFIGURE_DRAG_ASPRITE           28
#define osbyte_CONFIGURE_DRAG_ASPRITE_MASK      0x2u
#define osbyte_CONFIGURE_NO_FILER_ACTION        28
#define osbyte_CONFIGURE_NO_FILER_ACTION_MASK   0x4u
#define osbyte_CONFIGURE_DESKTOP_DITHER         28
#define osbyte_CONFIGURE_DESKTOP_DITHER_MASK    0x8u
#define osbyte_CONFIGURE_NO_OBSCURE_ICON_BAR    28
#define osbyte_CONFIGURE_NO_OBSCURE_ICON_BAR_MASK 0x10u
#define osbyte_CONFIGURE_SHUTDOWN_TYPE          28
#define osbyte_CONFIGURE_SHUTDOWN_TYPE_SHIFT    6
#define osbyte_CONFIGURE_SHUTDOWN_TYPE_MASK     0xC0u
#define osbyte_CONFIGURE_MOUSE_TYPE             29
#define osbyte_CONFIGURE_USER0                  30
      /*16 bytes*/
#define osbyte_CONFIGURE_THIRD_PARTY0           46
      /*14 bytes*/
#define osbyte_CONFIGURE_PODULE_EXTRA0          60
      /*20 bytes*/
#define osbyte_CONFIGURE_RISCIX                 80
      /*32 bytes*/
#define osbyte_CONFIGURE_SHARE_NET              80
#define osbyte_CONFIGURE_SHARE_MARKER           81
#define osbyte_CONFIGURE_SHARE_DISCS            82
      /*24 bytes*/
#define osbyte_CONFIGURE_SHARE_DRIVE4           106
#define osbyte_CONFIGURE_SHARE_DRIVE4_MASK      0x1u
#define osbyte_CONFIGURE_PROTECT_DRIVE4         106
#define osbyte_CONFIGURE_PROTECT_DRIVE4_MASK    0x2u
#define osbyte_CONFIGURE_SHARE_DRIVE5           106
#define osbyte_CONFIGURE_SHARE_DRIVE5_MASK      0x4u
#define osbyte_CONFIGURE_PROTECT_DRIVE5         106
#define osbyte_CONFIGURE_PROTECT_DRIVE5_MASK    0x8u
#define osbyte_CONFIGURE_SHARE_DRIVE6           106
#define osbyte_CONFIGURE_SHARE_DRIVE6_MASK      0x10u
#define osbyte_CONFIGURE_PROTECT_DRIVE6         106
#define osbyte_CONFIGURE_PROTECT_DRIVE6_MASK    0x20u
#define osbyte_CONFIGURE_SHARE_DRIVE7           106
#define osbyte_CONFIGURE_SHARE_DRIVE7_MASK      0x40u
#define osbyte_CONFIGURE_PROTECT_DRIVE7         106
#define osbyte_CONFIGURE_PROTECT_DRIVE7_MASK    0x80u
#define osbyte_CONFIGURE_SHARE_DISCS_LIMIT      24
#define osbyte_CONFIGURE_PODULE0                112
      /*4 bytes*/
#define osbyte_CONFIGURE_PODULE1                116
      /*4 bytes*/
#define osbyte_CONFIGURE_PODULE2                120
      /*4 bytes*/
#define osbyte_CONFIGURE_PODULE3                124
      /*4 bytes*/
#define osbyte_CONFIGURE_YEAR0                  128
#define osbyte_CONFIGURE_YEAR1                  129
#define osbyte_CONFIGURE_UNPLUG9                130
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_UNPLUG10               131
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_DUMP_FORMAT            132
#define osbyte_CONFIGURE_DUMP_FORMAT_SHIFT      0
#define osbyte_CONFIGURE_DUMP_FORMAT_MASK       0x1Fu
#define osbyte_CONFIGURE_TUBE                   132
#define osbyte_CONFIGURE_TUBE_MASK              0x20u
#define osbyte_CONFIGURE_HOST_PODULE            132
#define osbyte_CONFIGURE_HOST_PODULE_SHIFT      6
#define osbyte_CONFIGURE_HOST_PODULE_MASK       0xC0u
#define osbyte_CONFIGURE_SOUND                  132
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_SOUND_SHIFT            5
#define osbyte_CONFIGURE_SOUND_MASK             0x60u
#define osbyte_CONFIGURE_SOUND_QUALITY          132
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_SOUND_QUALITY_MASK     0x80u
#define osbyte_CONFIGURE_SYNC                   133
#define osbyte_CONFIGURE_SYNC_SHIFT             0
#define osbyte_CONFIGURE_SYNC_MASK              0x81u
#define osbyte_CONFIGURE_MODE_TOP_BIT           133
#define osbyte_CONFIGURE_MODE_TOP_BIT_MASK      0x2u
#define osbyte_CONFIGURE_MONITOR_NOT_CONFIGURED 133
#define osbyte_CONFIGURE_MONITOR_NOT_CONFIGURED_MASK 0x2u
#define osbyte_CONFIGURE_MONITOR_TYPE           133
#define osbyte_CONFIGURE_MONITOR_TYPE_SHIFT     2
#define osbyte_CONFIGURE_MONITOR_TYPE_MASK      0x7Cu
#define osbyte_CONFIGURE_FONT_SIZE              134
      /*Font cache/4K*/
#define osbyte_CONFIGURE_FLOPPIES               135
#define osbyte_CONFIGURE_FLOPPIES_SHIFT         0
#define osbyte_CONFIGURE_FLOPPIES_MASK          0x7u
#define osbyte_CONFIGURE_HARD_DISCS             135
#define osbyte_CONFIGURE_HARD_DISCS_SHIFT       3
#define osbyte_CONFIGURE_HARD_DISCS_MASK        0x38u
#define osbyte_CONFIGURE_IDE_DISCS              135
#define osbyte_CONFIGURE_IDE_DISCS_SHIFT        6
#define osbyte_CONFIGURE_IDE_DISCS_MASK         0xC0u
#define osbyte_CONFIGURE_STEP0                  136
#define osbyte_CONFIGURE_STEP0_SHIFT            0
#define osbyte_CONFIGURE_STEP0_MASK             0x3u
#define osbyte_CONFIGURE_STEP1                  136
#define osbyte_CONFIGURE_STEP1_SHIFT            2
#define osbyte_CONFIGURE_STEP1_MASK             0xCu
#define osbyte_CONFIGURE_STEP2                  136
#define osbyte_CONFIGURE_STEP2_SHIFT            4
#define osbyte_CONFIGURE_STEP2_MASK             0x30u
#define osbyte_CONFIGURE_STEP3                  136
#define osbyte_CONFIGURE_STEP3_SHIFT            6
#define osbyte_CONFIGURE_STEP3_MASK             0xC0u
#define osbyte_CONFIGURE_ADFS_BUFFERS           137
#define osbyte_CONFIGURE_CDFS_FLAGS             138
#define osbyte_CONFIGURE_TIME_ZONE              139
#define osbyte_CONFIGURE_NEW_LOOK               140
#define osbyte_CONFIGURE_NEW_LOOK_MASK          0x1u
#define osbyte_CONFIGURE_WIMP_FONT              140
#define osbyte_CONFIGURE_WIMP_FONT_SHIFT        1
#define osbyte_CONFIGURE_WIMP_FONT_MASK         0x1Eu
#define osbyte_CONFIGURE_NO_TILE                140
#define osbyte_CONFIGURE_NO_TILE_MASK           0x80u
#define osbyte_CONFIGURE_PRINTER                141
#define osbyte_CONFIGURE_UNPLUG11               141
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_TWIN_FLAGS             142
#define osbyte_CONFIGURE_UNPLUG12               142
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_SCREEN_SIZE            143
#define osbyte_CONFIGURE_RAMFS_SIZE             144
#define osbyte_CONFIGURE_SYSTEM_SIZE            145
#define osbyte_CONFIGURE_RMA_SIZE               146
#define osbyte_CONFIGURE_SPRITE_SIZE            147
#define osbyte_CONFIGURE_SOUND_DEFAULT          148
#define osbyte_CONFIGURE_SOUND_DEFAULT_SHIFT    0
#define osbyte_CONFIGURE_SOUND_DEFAULT_MASK     0xFu
#define osbyte_CONFIGURE_SOUND_LOUDNESS         148
#define osbyte_CONFIGURE_SOUND_LOUDNESS_SHIFT   4
#define osbyte_CONFIGURE_SOUND_LOUDNESS_MASK    0x70u
#define osbyte_CONFIGURE_SOUND_ON               148
#define osbyte_CONFIGURE_SOUND_ON_MASK          0x80u
#define osbyte_CONFIGURE_BASIC_EDITOR_FLAGS0    149
#define osbyte_CONFIGURE_BASIC_EDITOR_FLAGS1    150
#define osbyte_CONFIGURE_BASIC_EDITOR_FLAGS2    151
#define osbyte_CONFIGURE_BASIC_EDITOR_FLAGS3    152
#define osbyte_CONFIGURE_PS_NAME1               153
#define osbyte_CONFIGURE_PS_NAME2               154
#define osbyte_CONFIGURE_PS_NAME3               155
#define osbyte_CONFIGURE_PS_NAME4               156
#define osbyte_CONFIGURE_PS_NAME5               157
#define osbyte_CONFIGURE_PS_NAME_LIMIT          6
#define osbyte_CONFIGURE_FS_NAME1               158
#define osbyte_CONFIGURE_FS_NAME2               159
#define osbyte_CONFIGURE_FS_NAME3               160
#define osbyte_CONFIGURE_FS_NAME4               161
#define osbyte_CONFIGURE_FS_NAME5               162
#define osbyte_CONFIGURE_FS_NAME6               163
#define osbyte_CONFIGURE_FS_NAME7               164
#define osbyte_CONFIGURE_FS_NAME8               165
#define osbyte_CONFIGURE_FS_NAME9               166
#define osbyte_CONFIGURE_FS_NAME10              167
#define osbyte_CONFIGURE_FS_NAME11              168
#define osbyte_CONFIGURE_FS_NAME12              169
#define osbyte_CONFIGURE_FS_NAME13              170
#define osbyte_CONFIGURE_FS_NAME14              171
#define osbyte_CONFIGURE_FS_NAME15              172
#define osbyte_CONFIGURE_FS_NAME_LIMIT          16
#define osbyte_CONFIGURE_UNPLUG4                173
#define osbyte_CONFIGURE_UNPLUG5                174
#define osbyte_CONFIGURE_UNPLUG6                175
#define osbyte_CONFIGURE_UNPLUG7                176
#define osbyte_CONFIGURE_UNPLUG_EXPANSION_CARD0 177
#define osbyte_CONFIGURE_UNPLUG_EXPANSION_CARD1 178
#define osbyte_CONFIGURE_UNPLUG_EXPANSION_CARD2 179
#define osbyte_CONFIGURE_UNPLUG_EXPANSION_CARD3 180
#define osbyte_CONFIGURE_BASIC_EDITOR_WILD_CARD0 181
#define osbyte_CONFIGURE_BASIC_EDITOR_WILD_CARD1 182
#define osbyte_CONFIGURE_BASIC_EDITOR_WILD_CARD2 183
#define osbyte_CONFIGURE_BASIC_EDITOR_WILD_CARD3 184
#define osbyte_CONFIGURE_LANGUAGE               185
#define osbyte_CONFIGURE_COUNTRY                186
#define osbyte_CONFIGURE_VFS                    187
#define osbyte_CONFIGURE_ROMFS_OPT              188
#define osbyte_CONFIGURE_ROMFS_OPT_SHIFT        0
#define osbyte_CONFIGURE_ROMFS_OPT_MASK         0x3u
#define osbyte_CONFIGURE_ICON_CACHE             188
#define osbyte_CONFIGURE_ICON_CACHE_MASK        0x4u
#define osbyte_CONFIGURE_BLANK_TIME             188
#define osbyte_CONFIGURE_BLANK_TIME_SHIFT       3
#define osbyte_CONFIGURE_BLANK_TIME_MASK        0x38u
#define osbyte_CONFIGURE_UNBLANK_ON_WRITE       188
#define osbyte_CONFIGURE_UNBLANK_ON_WRITE_MASK  0x40u
#define osbyte_CONFIGURE_NO_LONG_TEST           188
#define osbyte_CONFIGURE_NO_LONG_TEST_MASK      0x80u
#define osbyte_CONFIGURE_ADFS_DISC_SIZE0        189
#define osbyte_CONFIGURE_ADFS_DISC_SIZE1        190
#define osbyte_CONFIGURE_ADFS_DISC_SIZE2        191
#define osbyte_CONFIGURE_ADFS_DISC_SIZE3        192
#define osbyte_CONFIGURE_PROTECTION_PEEK        193
#define osbyte_CONFIGURE_PROTECTION_PEEK_MASK   0x1u
#define osbyte_CONFIGURE_PROTECTION_POKE        193
#define osbyte_CONFIGURE_PROTECTION_POKE_MASK   0x2u
#define osbyte_CONFIGURE_PROTECTION_JSR         193
#define osbyte_CONFIGURE_PROTECTION_JSR_MASK    0x4u
#define osbyte_CONFIGURE_PROTECTION_USER_RPC    193
#define osbyte_CONFIGURE_PROTECTION_USER_RPC_MASK 0x8u
#define osbyte_CONFIGURE_PROTECTION_OS_PROC     193
#define osbyte_CONFIGURE_PROTECTION_OS_PROC_MASK 0x10u
#define osbyte_CONFIGURE_PROTECTION_HALT        193
#define osbyte_CONFIGURE_PROTECTION_HALT_MASK   0x20u
#define osbyte_CONFIGURE_PROTECTION_GET_REGS    193
#define osbyte_CONFIGURE_PROTECTION_GET_REGS_MASK 0x40u
#define osbyte_CONFIGURE_MOUSE_STEP             194
#define osbyte_CONFIGURE_BOOT_NET               195
#define osbyte_CONFIGURE_BOOT_NET_MASK          0x1u
#define osbyte_CONFIGURE_DYNAMIC_STATION        195
#define osbyte_CONFIGURE_DYNAMIC_STATION_MASK   0x2u
#define osbyte_CONFIGURE_CMOS_RESET             195
#define osbyte_CONFIGURE_CMOS_RESET_MASK        0x4u
#define osbyte_CONFIGURE_POWER_SAVE             195
#define osbyte_CONFIGURE_POWER_SAVE_MASK        0x8u
#define osbyte_CONFIGURE_AUTO_WIMP_MODE         195
#define osbyte_CONFIGURE_AUTO_WIMP_MODE_MASK    0x10u
#define osbyte_CONFIGURE_NO_CACHE               195
#define osbyte_CONFIGURE_NO_CACHE_MASK          0x20u
#define osbyte_CONFIGURE_BROADCAST_LOADER       195
#define osbyte_CONFIGURE_BROADCAST_LOADER_MASK  0x40u
#define osbyte_CONFIGURE_HOURGLASS_COLOUR       195
#define osbyte_CONFIGURE_HOURGLASS_COLOUR_MASK  0x80u
#define osbyte_CONFIGURE_WIMP_MODE              196
#define osbyte_CONFIGURE_WIMP_FLAGS             197
#define osbyte_CONFIGURE_FILER_DISPLAY          198
#define osbyte_CONFIGURE_FILER_DISPLAY_SHIFT    0
#define osbyte_CONFIGURE_FILER_DISPLAY_MASK     0x3u
#define osbyte_CONFIGURE_FILER_SORT             198
#define osbyte_CONFIGURE_FILER_SORT_SHIFT       2
#define osbyte_CONFIGURE_FILER_SORT_MASK        0xCu
#define osbyte_CONFIGURE_FILER_FORCE            198
#define osbyte_CONFIGURE_FILER_FORCE_MASK       0x10u
#define osbyte_CONFIGURE_FILER_CONFIRM          198
#define osbyte_CONFIGURE_FILER_CONFIRM_MASK     0x20u
#define osbyte_CONFIGURE_FILER_VERBOSE          198
#define osbyte_CONFIGURE_FILER_VERBOSE_MASK     0x40u
#define osbyte_CONFIGURE_FILER_NEWER            198
#define osbyte_CONFIGURE_FILER_NEWER_MASK       0x80u
#define osbyte_CONFIGURE_ADFS_DIR_CACHE         199
#define osbyte_CONFIGURE_FONT_MAX               200
#define osbyte_CONFIGURE_FONT_MAX1              201
#define osbyte_CONFIGURE_FONT_MAX2              202
#define osbyte_CONFIGURE_FONT_MAX3              203
#define osbyte_CONFIGURE_FONT_MAX4              204
#define osbyte_CONFIGURE_FONT_MAX5              205
#define osbyte_CONFIGURE_FONT_MAX6              206
#define osbyte_CONFIGURE_FONT_MAX7              207
#define osbyte_CONFIGURE_SCSIFS_DISCS           208
#define osbyte_CONFIGURE_SCSIFS_DISCS_SHIFT     0
#define osbyte_CONFIGURE_SCSIFS_DISCS_MASK      0x7u
#define osbyte_CONFIGURE_SCSIFS_DRIVE           208
#define osbyte_CONFIGURE_SCSIFS_DRIVE_SHIFT     3
#define osbyte_CONFIGURE_SCSIFS_DRIVE_MASK      0x38u
#define osbyte_CONFIGURE_SCSIFS_BUFFERS         209
#define osbyte_CONFIGURE_SCSIFS_DIR_CACHE       210
#define osbyte_CONFIGURE_SCSIFS_DISC_SIZE0      211
#define osbyte_CONFIGURE_SCSIFS_DISC_SIZE1      212
#define osbyte_CONFIGURE_SCSIFS_DISC_SIZE2      213
#define osbyte_CONFIGURE_SCSIFS_DISC_SIZE3      214
#define osbyte_CONFIGURE_ROM_ALARM              215
#define osbyte_CONFIGURE_ROM_ALARM_MASK         0x1u
#define osbyte_CONFIGURE_ROM_CALC               215
#define osbyte_CONFIGURE_ROM_CALC_MASK          0x2u
#define osbyte_CONFIGURE_ROM_CHARS              215
#define osbyte_CONFIGURE_ROM_CHARS_MASK         0x4u
#define osbyte_CONFIGURE_ROM_CONFIGURE          215
#define osbyte_CONFIGURE_ROM_CONFIGURE_MASK     0x8u
#define osbyte_CONFIGURE_ROM_DRAW               215
#define osbyte_CONFIGURE_ROM_DRAW_MASK          0x10u
#define osbyte_CONFIGURE_ROM_EDIT               215
#define osbyte_CONFIGURE_ROM_EDIT_MASK          0x20u
#define osbyte_CONFIGURE_ROM_HELP               215
#define osbyte_CONFIGURE_ROM_HELP_MASK          0x40u
#define osbyte_CONFIGURE_ROM_PAINT              215
#define osbyte_CONFIGURE_ROM_PAINT_MASK         0x80u
#define osbyte_CONFIGURE_ROM_BAT_MAN            216
#define osbyte_CONFIGURE_ROM_BAT_MAN_MASK       0x1u
#define osbyte_CONFIGURE_UNPLUG13               217
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_UNPLUG14               218
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_UNPLUG15               219
      /*RISC O S 3.60+*/
#define osbyte_CONFIGURE_ALARM_FORMAT           220
#define osbyte_CONFIGURE_ALARM_FORMAT_SHIFT     0
#define osbyte_CONFIGURE_ALARM_FORMAT_MASK      0x7u
#define osbyte_CONFIGURE_ALARM_CONFIRM          220
#define osbyte_CONFIGURE_ALARM_CONFIRM_MASK     0x8u
#define osbyte_CONFIGURE_ALARM_AUTO_SAVE        220
#define osbyte_CONFIGURE_ALARM_AUTO_SAVE_MASK   0x10u
#define osbyte_CONFIGURE_ALARM_WORKING_WEEK     220
#define osbyte_CONFIGURE_ALARM_WORKING_WEEK_MASK 0x20u
#define osbyte_CONFIGURE_ALARM_SILENT           220
#define osbyte_CONFIGURE_ALARM_SILENT_MASK      0x40u
#define osbyte_CONFIGURE_DST                    220
#define osbyte_CONFIGURE_DST_MASK               0x80u
#define osbyte_CONFIGURE_WIMP_DRAG_DELAY        221
#define osbyte_CONFIGURE_WIMP_DRAG_MOVE         222
#define osbyte_CONFIGURE_WIMP_DOUBLE_CLICK_DELAY 223
#define osbyte_CONFIGURE_RISCIX32               224
      /*For 7 bytes*/
#define osbyte_CONFIGURE_PRINTER_NAME           224
      /*For 6 bytes*/
#define osbyte_CONFIGURE_LCD                    230
#define osbyte_CONFIGURE_UNPLUG16               231
#define osbyte_CONFIGURE_FS_LOCK0               233
#define osbyte_CONFIGURE_FS_LOCK1               234
#define osbyte_CONFIGURE_FS_LOCK2               235
#define osbyte_CONFIGURE_FS_LOCK3               236
#define osbyte_CONFIGURE_FS_LOCK4               237
#define osbyte_CONFIGURE_FS_LOCK5               238
#define osbyte_CONFIGURE_CHECKSUM               239
#define osbyte_CAPS_SHIFT                       0x1u
#define osbyte_CAPS_NONE                        0x2u
#define osbyte_CAPS_LOCK                        0x4u
#define osbyte_SHUTDOWN_UNKNOWN                 0x0u
#define osbyte_SHUTDOWN_FAILED                  0x1u
#define osbyte_SHUTDOWN_POWER_LOST              0x2u
#define osbyte_SHUTDOWN_UNDEFINED               0x3u
#define osbyte_MOUSE_QUADRATURE                 0x0u
#define osbyte_MOUSE_MICROSOFT_SERIAL           0x1u
#define osbyte_MOUSE_MSC_SERIAL                 0x2u
#define osbyte_SYNC_VERTICAL                    0x0u
#define osbyte_SYNC_COMPOSITE                   0x1u
#define osbyte_SYNC_AUTO                        0x81u
#define osbyte_MONITOR_TYPE_AUTO                0x1Fu
#define osbyte_BLANK_OFF                        0x0u
#define osbyte_BLANK30S                         0x1u
#define osbyte_BLANK1MIN                        0x2u
#define osbyte_BLANK2MIN                        0x3u
#define osbyte_BLANK5MIN                        0x4u
#define osbyte_BLANK10MIN                       0x5u
#define osbyte_BLANK15MIN                       0x6u
#define osbyte_BLANK30MIN                       0x7u
#define osbyte_DISPLAY_LARGE_ICONS              0x0u
#define osbyte_DISPLAY_SMALL_ICONS              0x1u
#define osbyte_DISPLAY_FULL_INFO                0x2u
#define osbyte_SORT_BY_NAME                     0x0u
#define osbyte_SORT_BY_NUMBER                   0x1u
      /*NetFiler only*/
#define osbyte_SORT_BY_TYPE                     0x1u
      /*Filer only*/
#define osbyte_SORT_BY_SIZE                     0x2u
      /*Filer only*/
#define osbyte_SORT_BY_DATE                     0x3u
      /*Filer only*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      os_byte()
 *
 * Description:   General purpose call to alter status variables and
 *                perform other actions
 *
 * Input:         op - value of R0 on entry
 *                r1 - value of R1 on entry
 *                r2 - value of R2 on entry
 *
 * Output:        r1_out - value of R1 on exit
 *                r2_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x6.
 */

extern os_error *xos_byte (osbyte_op op,
      int r1,
      int r2,
      int *r1_out,
      int *r2_out);
extern void os_byte (osbyte_op op,
      int r1,
      int r2,
      int *r1_out,
      int *r2_out);

/* ------------------------------------------------------------------------
 * Function:      bytev()
 *
 * Description:   OS_Byte vector
 *
 * Input:         op - value of R0 on entry
 *                r1 - value of R1 on entry
 *                r2 - value of R2 on entry
 *
 * Output:        r1_out - value of R1 on exit
 *                r2_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x6.
 */

extern os_error *xbytev (osbyte_op op,
      int r1,
      int r2,
      int *r1_out,
      int *r2_out);
extern void bytev (osbyte_op op,
      int r1,
      int r2,
      int *r1_out,
      int *r2_out);

/* ------------------------------------------------------------------------
 * Function:      osbyte()
 *
 * Description:   Special case of call to perform OS_Byte actions with no
 *                result
 *
 * Input:         op - value of R0 on entry
 *                r1 - value of R1 on entry
 *                r2 - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x6.
 */

extern os_error *xosbyte (osbyte_op op,
      int r1,
      int r2);
__swi (0x6) void osbyte (osbyte_op op,
      int r1,
      int r2);

/* ------------------------------------------------------------------------
 * Function:      osbyte1()
 *
 * Description:   First special case of call to perform OS_Byte actions
 *                returning a result
 *
 * Input:         op - value of R0 on entry
 *                r1 - value of R1 on entry
 *                r2 - value of R2 on entry
 *
 * Output:        r1_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x6.
 */

extern os_error *xosbyte1 (osbyte_op op,
      int r1,
      int r2,
      int *r1_out);
extern int osbyte1 (osbyte_op op,
      int r1,
      int r2);

/* ------------------------------------------------------------------------
 * Function:      osbyte2()
 *
 * Description:   Second special case of call to perform OS_Byte actions
 *                returning a result
 *
 * Input:         op - value of R0 on entry
 *                r1 - value of R1 on entry
 *                r2 - value of R2 on entry
 *
 * Output:        r2_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x6.
 */

extern os_error *xosbyte2 (osbyte_op op,
      int r1,
      int r2,
      int *r2_out);
extern int osbyte2 (osbyte_op op,
      int r1,
      int r2);

/* ------------------------------------------------------------------------
 * Function:      osbyte_read()
 *
 * Description:   Reads an OS_Byte status variable
 *
 * Input:         var - value of R0 on entry
 *
 * Output:        value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x6 with R1 = 0x0, R2 = 0xFF.
 */

extern os_error *xosbyte_read (osbyte_var var,
      int *value);
extern int osbyte_read (osbyte_var var);

/* ------------------------------------------------------------------------
 * Function:      osbyte_write()
 *
 * Description:   Writes an OS_Byte status variable
 *
 * Input:         var - value of R0 on entry
 *                value - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x6 with R2 = 0x0.
 */

extern os_error *xosbyte_write (osbyte_var var,
      int value);
extern void osbyte_write (osbyte_var var,
      int value);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
