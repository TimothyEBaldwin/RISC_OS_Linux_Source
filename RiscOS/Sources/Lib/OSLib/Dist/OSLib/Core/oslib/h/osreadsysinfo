#ifndef osreadsysinfo_H
#define osreadsysinfo_H

/* C header file for OSReadSysInfo
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 18 May 1995
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
#undef  OS_ReadSysInfo
#define OS_ReadSysInfo                          0x58
#undef  XOS_ReadSysInfo
#define XOS_ReadSysInfo                         0x20058
#undef  OSReadSysInfo_ScreenSize
#define OSReadSysInfo_ScreenSize                0x0
#undef  OSReadSysInfo_Mode
#define OSReadSysInfo_Mode                      0x1
#undef  OSReadSysInfo_MachineId
#define OSReadSysInfo_MachineId                 0x2
#undef  OSReadSysInfo_71XFeatures
#define OSReadSysInfo_71XFeatures               0x3
#undef  OSReadSysInfo_EthernetAddress
#define OSReadSysInfo_EthernetAddress           0x4
#undef  OSReadSysInfo_RawMachineId
#define OSReadSysInfo_RawMachineId              0x5
#undef  OSReadSysInfo_KernelValue
#define OSReadSysInfo_KernelValue               0x6
#undef  OSReadSysInfo_KernelValues
#define OSReadSysInfo_KernelValues              0x6
#undef  OSReadSysInfo_KernelValue_SVCSTK
#define OSReadSysInfo_KernelValue_SVCSTK        0x10
#undef  OSReadSysInfo_KernelValue_SWIDispatchTable
#define OSReadSysInfo_KernelValue_SWIDispatchTable 0x12
#undef  OSReadSysInfo_LastAbortInfo
#define OSReadSysInfo_LastAbortInfo             0x7
#undef  OSReadSysInfo_PlatformClass
#define OSReadSysInfo_PlatformClass             0x8
#undef  OSReadSysInfo_ROMInformation
#define OSReadSysInfo_ROMInformation            0x9

/********************
 * Type definitions *
 ********************/
typedef bits osreadsysinfo_flags0;

typedef bits osreadsysinfo_flags1;

typedef bits osreadsysinfo_flags2;

typedef int osreadsysinfo_platform;

typedef bits osreadsysinfo_platform_flags;

typedef int osreadsysinfo_rom_information_code;

/************************
 * Constant definitions *
 ************************/
#define osreadsysinfo_SPECIAL_FUNCTION          ((osreadsysinfo_flags0) 0xFFu)
#define osreadsysinfo_SPECIAL_FUNCTION_SHIFT    0
#define osreadsysinfo_SPECIAL_FUNCTION_NONE     ((osreadsysinfo_flags0) 0x0u)
#define osreadsysinfo_SPECIAL_FUNCTION_IOEB     ((osreadsysinfo_flags0) 0x1u)
#define osreadsysinfo_IO_CONTROL                ((osreadsysinfo_flags0) 0xFF00u)
#define osreadsysinfo_IO_CONTROL_SHIFT          8
#define osreadsysinfo_IO_CONTROL_IOC            ((osreadsysinfo_flags0) 0x0u)
#define osreadsysinfo_IO_CONTROL_IOMD           ((osreadsysinfo_flags0) 0x1u)
#define osreadsysinfo_MEMORY_CONTROL            ((osreadsysinfo_flags0) 0xFF0000u)
#define osreadsysinfo_MEMORY_CONTROL_SHIFT      16
#define osreadsysinfo_MEMORY_CONTROL_MEMC1      ((osreadsysinfo_flags0) 0x0u)
#define osreadsysinfo_MEMORY_CONTROL_IOMD       ((osreadsysinfo_flags0) 0x1u)
#define osreadsysinfo_VIDEO_CONTROL             ((osreadsysinfo_flags0) 0xFF000000u)
#define osreadsysinfo_VIDEO_CONTROL_SHIFT       24
#define osreadsysinfo_VIDEO_CONTROL_VIDC_1A     ((osreadsysinfo_flags0) 0x0u)
#define osreadsysinfo_VIDEO_CONTROL_VIDC20      ((osreadsysinfo_flags0) 0x1u)
#define osreadsysinfo_IO                        ((osreadsysinfo_flags1) 0xFFu)
#define osreadsysinfo_IO_SHIFT                  0
#define osreadsysinfo_IO_NONE                   ((osreadsysinfo_flags1) 0x0u)
#define osreadsysinfo_IO82C710                  ((osreadsysinfo_flags1) 0x1u)
#define osreadsysinfo_LCD_CONTROL               ((osreadsysinfo_flags2) 0xFFu)
#define osreadsysinfo_LCD_CONTROL_SHIFT         0
#define osreadsysinfo_LCD_CONTROL_NONE          ((osreadsysinfo_flags2) 0x0u)
#define osreadsysinfo_LCD_CONTROL_TYPE1         ((osreadsysinfo_flags2) 0x1u)
#define osreadsysinfo_PLATFORM_UNKNOWN          ((osreadsysinfo_platform) 0x0u)
#define osreadsysinfo_PLATFORM_RISC_PC          ((osreadsysinfo_platform) 0x1u)
#define osreadsysinfo_PLATFORM_A7000            ((osreadsysinfo_platform) 0x2u)
#define osreadsysinfo_PLATFORM_A7000_PLUS       ((osreadsysinfo_platform) 0x3u)
#define osreadsysinfo_PLATFORM_HAL              ((osreadsysinfo_platform) 0x5u)
#define osreadsysinfo_PLATFORM_SUPPORTS_PODULES ((osreadsysinfo_platform_flags) 0x1u)
#define osreadsysinfo_PLATFORM_SUPPORTS_PCI     ((osreadsysinfo_platform_flags) 0x2u)
#define osreadsysinfo_PLATFORM_SUPPORTS_MULTI_CPU ((osreadsysinfo_platform_flags) 0x4u)
#define osreadsysinfo_PLATFORM_HAS_SOFT_POWER_CONTROL ((osreadsysinfo_platform_flags) 0x8u)
#define osreadsysinfo_PLATFORM_RUNS_OS_FROM_RAM ((osreadsysinfo_platform_flags) 0x10u)
#define osreadsysinfo_OS_NAME                   ((osreadsysinfo_rom_information_code) 0x0u)
      /*OS name in form <OS name> <version> <comments>*/
#define osreadsysinfo_PART_NUMBER               ((osreadsysinfo_rom_information_code) 0x1u)
      /*Part number in form <part>[-<comments>]*/
#define osreadsysinfo_BUILD_TIME                ((osreadsysinfo_rom_information_code) 0x2u)
      /*Build time, eg Tue,18 Jan 2000.10:36:40*/
#define osreadsysinfo_DEALER_NAME               ((osreadsysinfo_rom_information_code) 0x3u)
      /*Dealer name - this is the supplier of the ROMs*/
#define osreadsysinfo_USER_NAME                 ((osreadsysinfo_rom_information_code) 0x4u)
      /*User name - this is the name of the owner of the ROMs*/
#define osreadsysinfo_USER_ADDRESS              ((osreadsysinfo_rom_information_code) 0x5u)
      /*User address - this is the address of the owner of the ROMs*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_screen_size()
 *
 * Description:   Reads the configured screen size
 *
 * Output:        screen_size - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x0.
 */

extern os_error *xosreadsysinfo_screen_size (int *screen_size);
extern int osreadsysinfo_screen_size (void);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_mode()
 *
 * Description:   Reads the configured Mode/WimpMode, MonitorType and Sync
 *
 * Output:        mode - value of R0 on exit (X version only)
 *                monitor_type - value of R1 on exit
 *                sync - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x1.
 */

extern os_error *xosreadsysinfo_mode (os_mode *mode,
      int *monitor_type,
      int *sync);
extern os_mode osreadsysinfo_mode (int *monitor_type,
      int *sync);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_machine_id()
 *
 * Description:   Reads the presence of various chips and unique machine id
 *
 * Output:        config0 - value of R0 on exit
 *                config1 - value of R1 on exit
 *                config2 - value of R2 on exit
 *                id_lo - value of R3 on exit
 *                id_hi - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x2.
 */

extern os_error *xosreadsysinfo_machine_id (osreadsysinfo_flags0 *config0,
      osreadsysinfo_flags1 *config1,
      osreadsysinfo_flags2 *config2,
      bits *id_lo,
      bits *id_hi);
extern void osreadsysinfo_machine_id (osreadsysinfo_flags0 *config0,
      osreadsysinfo_flags1 *config1,
      osreadsysinfo_flags2 *config2,
      bits *id_lo,
      bits *id_hi);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_71x_features()
 *
 * Description:   Reads features mask for 82C710 chip family
 *
 * Output:        features - value of R0 on exit
 *                features_extended0 - value of R1 on exit
 *                features_extended1 - value of R2 on exit
 *                features_extended2 - value of R3 on exit
 *                features_extended3 - value of R4 on exit
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x3.
 */

extern os_error *xosreadsysinfo_71x_features (bits *features,
      bits *features_extended0,
      bits *features_extended1,
      bits *features_extended2,
      bits *features_extended3);
extern void osreadsysinfo_71x_features (bits *features,
      bits *features_extended0,
      bits *features_extended1,
      bits *features_extended2,
      bits *features_extended3);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_ethernet_address()
 *
 * Description:   Reads the ethernet address - RISC O S 4+
 *
 * Output:        address_lo - value of R0 on exit
 *                address_hi - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x4.
 */

extern os_error *xosreadsysinfo_ethernet_address (bits *address_lo,
      bits *address_hi);
extern void osreadsysinfo_ethernet_address (bits *address_lo,
      bits *address_hi);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_raw_machine_id()
 *
 * Description:   Reads the raw unique machine id - RISC O S 4+
 *
 * Output:        id_lo - value of R0 on exit
 *                id_hi - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x5.
 */

extern os_error *xosreadsysinfo_raw_machine_id (bits *id_lo,
      bits *id_hi);
extern void osreadsysinfo_raw_machine_id (bits *id_lo,
      bits *id_hi);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_kernel_value()
 *
 * Description:   Reads a kernel data value - RISC O S 4+
 *
 * Input:         item - value of R2 on entry
 *
 * Output:        value - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x6, R1 = 0x0.
 */

extern os_error *xosreadsysinfo_kernel_value (int item,
      int *value);
extern int osreadsysinfo_kernel_value (int item);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_kernel_values()
 *
 * Description:   Reads a list of kernel data values - RISC O S 4+
 *
 * Input:         item_list - value of R1 on entry
 *                value_buffer - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x6.
 */

extern os_error *xosreadsysinfo_kernel_values (int const *item_list,
      int *value_buffer);
extern void osreadsysinfo_kernel_values (int const *item_list,
      int *value_buffer);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_kernel_value_svcstk()
 *
 * Description:   Reads the address of the top of the SVC stack - RISC O S
 *                4+
 *
 * Output:        stack_top - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x6, R1 = 0x0, R2 = 0x10.
 */

extern os_error *xosreadsysinfo_kernel_value_svcstk (byte **stack_top);
extern byte *osreadsysinfo_kernel_value_svcstk (void);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_kernel_value_swi_dispatch_table()
 *
 * Description:   Reads the address of the SWI dispatch table - RISC O S 5+
 *
 * Output:        dispatch_table - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x6, R1 = 0x0, R2 = 0x12.
 */

extern os_error *xosreadsysinfo_kernel_value_swi_dispatch_table (byte **dispatch_table);
extern byte *osreadsysinfo_kernel_value_swi_dispatch_table (void);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_last_abort_info()
 *
 * Description:   Read information for last unexpected abort (data or
 *                prefetch) - RISC O S 4+
 *
 * Output:        abort_pc - value of R1 on exit
 *                abort_psr - value of R2 on exit
 *                fault_address - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x7.
 */

extern os_error *xosreadsysinfo_last_abort_info (byte **abort_pc,
      byte **abort_psr,
      byte **fault_address);
extern byte *osreadsysinfo_last_abort_info (byte **abort_pc,
      byte **abort_psr);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_platform_class()
 *
 * Description:   Reads the platform class - RISC O S 4+
 *
 * Output:        platform_class - value of R0 on exit (X version only)
 *                flags - value of R1 on exit
 *                valid_flags - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x58 with R0 = 0x8.
 */

extern os_error *xosreadsysinfo_platform_class (osreadsysinfo_platform *platform_class,
      osreadsysinfo_platform_flags *flags,
      osreadsysinfo_platform_flags *valid_flags);
extern osreadsysinfo_platform osreadsysinfo_platform_class (osreadsysinfo_platform_flags *flags,
      osreadsysinfo_platform_flags *valid_flags);

/* ------------------------------------------------------------------------
 * Function:      osreadsysinfo_rom_information()
 *
 * Description:   Read information about the currently installed ROM - RISC
 *                O S 4+
 *
 * Input:         code - value of R1 on entry
 *
 * Output:        information - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0x9.
 */

extern os_error *xosreadsysinfo_rom_information (osreadsysinfo_rom_information_code code,
      char **information);
extern char *osreadsysinfo_rom_information (osreadsysinfo_rom_information_code code);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
