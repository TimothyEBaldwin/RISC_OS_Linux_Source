#ifndef portable_H
#define portable_H

/* C header file for Portable
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 9 Jun 1995
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
#undef  Portable_Speed
#define Portable_Speed                          0x42FC0
#undef  XPortable_Speed
#define XPortable_Speed                         0x62FC0
#undef  Portable_Control
#define Portable_Control                        0x42FC1
#undef  XPortable_Control
#define XPortable_Control                       0x62FC1
#undef  Portable_ReadBMUVariable
#define Portable_ReadBMUVariable                0x42FC2
#undef  XPortable_ReadBMUVariable
#define XPortable_ReadBMUVariable               0x62FC2
#undef  Portable_WriteBMUVariable
#define Portable_WriteBMUVariable               0x42FC3
#undef  XPortable_WriteBMUVariable
#define XPortable_WriteBMUVariable              0x62FC3
#undef  Portable_CommandBMU
#define Portable_CommandBMU                     0x42FC4
#undef  XPortable_CommandBMU
#define XPortable_CommandBMU                    0x62FC4
#undef  Portable_ReadFeatures
#define Portable_ReadFeatures                   0x42FC5
#undef  XPortable_ReadFeatures
#define XPortable_ReadFeatures                  0x62FC5
#undef  Portable_Idle
#define Portable_Idle                           0x42FC6
#undef  XPortable_Idle
#define XPortable_Idle                          0x62FC6
#undef  Portable_Stop
#define Portable_Stop                           0x42FC7
#undef  XPortable_Stop
#define XPortable_Stop                          0x62FC7
#undef  Portable_Status
#define Portable_Status                         0x42FC8
#undef  XPortable_Status
#define XPortable_Status                        0x62FC8
#undef  Service_Portable
#define Service_Portable                        0x8A
#undef  Event_PortableBMU
#define Event_PortableBMU                       0x1C

/********************
 * Type definitions *
 ********************/
typedef bits portable_processor_speed;

typedef bits portable_control_flags;

typedef int portable_bmu_variable;

typedef bits portable_bmu_flags;

typedef int portable_bmu_command;

typedef bits portable_features;

typedef int portable_restart_type;

typedef bits portable_status_flags;

typedef int portable_state;

/************************
 * Constant definitions *
 ************************/
#define portable_PORT_ECONET                    0x1u
#define portable_PORT_SERIAL                    0x8u
#define portable_PORT_FDC                       0x4000u
#define portable_CONTROL_ECONET_POWER_ENABLED   ((portable_control_flags) 0x1u)
#define portable_CONTROL_LCD_POWER_ENABLED      ((portable_control_flags) 0x2u)
#define portable_CONTROL_EXTERNAL_VIDEO_ENABLED ((portable_control_flags) 0x4u)
#define portable_CONTROL_SERIAL_ENABLED         ((portable_control_flags) 0x8u)
#define portable_CONTROL_DUAL_PANEL_ENABLED     ((portable_control_flags) 0x10u)
#define portable_CONTROL_VIDEO_CLOCK            ((portable_control_flags) 0x30u)
#define portable_CONTROL_VIDEO_CLOCK_SHIFT      5
#define portable_CONTROL_VIDEO_CLOCK_EXTERNAL   0
#define portable_CONTROL_VIDEO_CLOCK_DIVIDED_CRYSTAL 1
#define portable_CONTROL_VIDEO_CLOCK_CRYSTAL    2
#define portable_CONTROL_INVERT_VIDEO_CLOCK     ((portable_control_flags) 0x80u)
#define portable_CONTROL_BACK_LIGHT_ENABLED     ((portable_control_flags) 0x100u)
#define portable_CONTROL_EXTRA_DISPLAY_LINES    ((portable_control_flags) 0x200u)
#define portable_CONTROL_EXTRA_DUAL_PANEL_DRAM  ((portable_control_flags) 0x400u)
#define portable_CONTROL_SOUND_POWER_ENABLED    ((portable_control_flags) 0x800u)
#define portable_CONTROL_PCMCIA_ENABLED         ((portable_control_flags) 0x1000u)
#define portable_CONTROL_PARALLEL_ENABLED       ((portable_control_flags) 0x2000u)
#define portable_CONTROL_FDC_ENABLED            ((portable_control_flags) 0x4000u)
#define portable_CONTROL_IDE_ENABLED            ((portable_control_flags) 0x8000u)
#define portable_CONTROL_LCD_VIDEO_INVERTED     ((portable_control_flags) 0x10000u)
#define portable_CONTROL_TRACKERBALL_ENABLED    ((portable_control_flags) 0x20000u)
#define portable_CONTROL_MOUSE_ENABLED          ((portable_control_flags) 0x40000u)
#define portable_BMU_VARIABLE_VERSION           ((portable_bmu_variable) 0x0u)
#define portable_BMU_VARIABLE_NOMINAL_CHARGE    ((portable_bmu_variable) 0x1u)
#define portable_BMU_VARIABLE_MEASURED_CHARGE   ((portable_bmu_variable) 0x2u)
#define portable_BMU_VARIABLE_USED_CHARGE       ((portable_bmu_variable) 0x3u)
#define portable_BMU_VARIABLE_USABLE_CHARGE     ((portable_bmu_variable) 0x4u)
#define portable_BMU_VARIABLE_CHARGE_ESTIMATE   ((portable_bmu_variable) 0x6u)
#define portable_BMU_VARIABLE_INST_VOLTAGE      ((portable_bmu_variable) 0x7u)
#define portable_BMU_VARIABLE_INST_CURRENT      ((portable_bmu_variable) 0x8u)
#define portable_BMU_VARIABLE_INST_TEMPERATURE  ((portable_bmu_variable) 0x9u)
#define portable_BMU_VARIABLE_FLAGS             ((portable_bmu_variable) 0xAu)
#define portable_BMU_VARIABLE_CHARGE_RATE       ((portable_bmu_variable) 0xBu)
#define portable_BMU_AT_THRESHOLD3              ((portable_bmu_flags) 0x1u)
#define portable_BMU_BATTERY_CHANGED            ((portable_bmu_flags) 0x1u)
#define portable_BMU_LID_OPEN                   ((portable_bmu_flags) 0x2u)
#define portable_BMU_AT_THRESHOLD2              ((portable_bmu_flags) 0x4u)
#define portable_BMU_BATTERY_FLAT               ((portable_bmu_flags) 0x4u)
#define portable_BMU_AT_THRESHOLD1              ((portable_bmu_flags) 0x8u)
#define portable_BMU_BATTERY_LOW                ((portable_bmu_flags) 0x8u)
#define portable_BMU_CHARGING_FAULT             ((portable_bmu_flags) 0x10u)
#define portable_BMU_CHARGE_STATE_KNOWN         ((portable_bmu_flags) 0x20u)
#define portable_BMU_BATTERY_PRESENT            ((portable_bmu_flags) 0x40u)
#define portable_BMU_CHARGER_CONNECTED          ((portable_bmu_flags) 0x80u)
#define portable_SPEED_FAST                     ((portable_processor_speed) 0x0u)
#define portable_SPEED_SLOW                     ((portable_processor_speed) 0x1u)
#define portable_BMU_POWER_OFF                  ((portable_bmu_command) 0x0u)
#define portable_BMU_SET_AUTOSTART              ((portable_bmu_command) 0x4u)
#define portable_BMU_DISCONNECT_CHARGER         ((portable_bmu_command) 0x5u)
#define portable_BMU_CONNECT_CHARGER            ((portable_bmu_command) 0x6u)
#define portable_SUPPORTS_SPEED                 ((portable_features) 0x1u)
#define portable_SUPPORTS_IDLE                  ((portable_features) 0x10u)
#define portable_SUPPORTS_STOP                  ((portable_features) 0x20u)
#define portable_RESTART_KEYBOARD               ((portable_restart_type) 0x1u)
#define portable_RESTART_CLOCK                  ((portable_restart_type) 0x2u)
#define portable_STATUS_DOCK_STATION_PRESENT    ((portable_status_flags) 0x1u)
#define portable_STATUS_FLOPPY_CONNECTED        ((portable_status_flags) 0x2u)
#define portable_STATUS_TRACKERBALL_CONNECTED   ((portable_status_flags) 0x4u)
#define portable_STATUS_LCD_IN_USE              ((portable_status_flags) 0x8u)
#define portable_POWER_DOWN                     ((portable_state) 0x0u)
#define portable_POWER_UP                       ((portable_state) 0x1u)
#define portable_POWER_STOP                     ((portable_state) 0x2u)
#define portable_POWER_START                    ((portable_state) 0x3u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      portable_speed()
 *
 * Description:   Controls the processor speed
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_speed - value of R0 on exit
 *                new_speed - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x42FC0.
 */

extern os_error *xportable_speed (bits eor_mask,
      bits and_mask,
      portable_processor_speed *old_speed,
      portable_processor_speed *new_speed);
extern void portable_speed (bits eor_mask,
      bits and_mask,
      portable_processor_speed *old_speed,
      portable_processor_speed *new_speed);

/* ------------------------------------------------------------------------
 * Function:      portable_control()
 *
 * Description:   Controls various power control and miscellaneous bits
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_control - value of R0 on exit
 *                new_control - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x42FC1.
 */

extern os_error *xportable_control (bits eor_mask,
      bits and_mask,
      portable_control_flags *old_control,
      portable_control_flags *new_control);
extern void portable_control (bits eor_mask,
      bits and_mask,
      portable_control_flags *old_control,
      portable_control_flags *new_control);

/* ------------------------------------------------------------------------
 * Function:      portable_read_bmu_variable()
 *
 * Description:   Reads Battery Management Unit variables
 *
 * Input:         var - value of R0 on entry
 *
 * Output:        value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42FC2.
 */

extern os_error *xportable_read_bmu_variable (portable_bmu_variable var,
      int *value);
extern int portable_read_bmu_variable (portable_bmu_variable var);

/* ------------------------------------------------------------------------
 * Function:      portable_write_bmu_variable()
 *
 * Description:   Writes Battery Management Unit variables
 *
 * Input:         var - value of R0 on entry
 *                value - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x42FC3.
 */

extern os_error *xportable_write_bmu_variable (portable_bmu_variable var,
      int value);
__swi (0x42FC3) void portable_write_bmu_variable (portable_bmu_variable var,
      int value);

/* ------------------------------------------------------------------------
 * Function:      portable_read_features()
 *
 * Description:   Returns a bitmap of power save features
 *
 * Output:        features - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42FC5.
 */

extern os_error *xportable_read_features (portable_features *features);
extern portable_features portable_read_features (void);

/* ------------------------------------------------------------------------
 * Function:      portable_idle()
 *
 * Description:   Places the system into idle mode
 *
 * Other notes:   Calls SWI 0x42FC6.
 */

extern os_error *xportable_idle (void);
__swi (0x42FC6) void portable_idle (void);

/* ------------------------------------------------------------------------
 * Function:      portable_stop()
 *
 * Description:   Places the system into stop mode
 *
 * Output:        restart - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42FC7.
 */

extern os_error *xportable_stop (portable_restart_type *restart);
__swi (0x42FC7) portable_restart_type portable_stop (void);

/* ------------------------------------------------------------------------
 * Function:      portable_status()
 *
 * Description:   Reads the status of the portable module
 *
 * Output:        flags - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42FC8.
 */

extern os_error *xportable_status (portable_status_flags *flags);
__swi (0x42FC8) portable_status_flags portable_status (void);

/* ------------------------------------------------------------------------
 * Function:      service_portable()
 *
 * Description:   Power down or up
 *
 * Input:         state - value of R2 on entry
 *                ports - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                ports_to_change - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8A.
 */

extern os_error *xservice_portable (portable_state state,
      bits ports,
      osbool *unclaimed,
      bits *ports_to_change);
extern osbool service_portable (portable_state state,
      bits ports,
      bits *ports_to_change);

/* ------------------------------------------------------------------------
 * Function:      event_portable_bmu()
 *
 * Description:   Portable Battery Management Unit event
 *
 * Input:         flags - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x1C.
 */

extern os_error *xevent_portable_bmu (portable_bmu_flags flags);
extern void event_portable_bmu (portable_bmu_flags flags);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
