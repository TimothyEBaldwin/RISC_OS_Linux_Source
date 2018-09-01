#ifndef podule_H
#define podule_H

/* C header file for Podule
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 21 Aug 1995
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
#undef  Podule_ReadID
#define Podule_ReadID                           0x40280
#undef  XPodule_ReadID
#define XPodule_ReadID                          0x60280
#undef  Podule_ReadHeader
#define Podule_ReadHeader                       0x40281
#undef  XPodule_ReadHeader
#define XPodule_ReadHeader                      0x60281
#undef  Podule_EnumerateChunks
#define Podule_EnumerateChunks                  0x40282
#undef  XPodule_EnumerateChunks
#define XPodule_EnumerateChunks                 0x60282
#undef  Podule_ReadChunk
#define Podule_ReadChunk                        0x40283
#undef  XPodule_ReadChunk
#define XPodule_ReadChunk                       0x60283
#undef  Podule_ReadBytes
#define Podule_ReadBytes                        0x40284
#undef  XPodule_ReadBytes
#define XPodule_ReadBytes                       0x60284
#undef  Podule_WriteBytes
#define Podule_WriteBytes                       0x40285
#undef  XPodule_WriteBytes
#define XPodule_WriteBytes                      0x60285
#undef  Podule_CallLoader
#define Podule_CallLoader                       0x40286
#undef  XPodule_CallLoader
#define XPodule_CallLoader                      0x60286
#undef  Podule_RawRead
#define Podule_RawRead                          0x40287
#undef  XPodule_RawRead
#define XPodule_RawRead                         0x60287
#undef  Podule_RawWrite
#define Podule_RawWrite                         0x40288
#undef  XPodule_RawWrite
#define XPodule_RawWrite                        0x60288
#undef  Podule_HardwareAddress
#define Podule_HardwareAddress                  0x40289
#undef  XPodule_HardwareAddress
#define XPodule_HardwareAddress                 0x60289
#undef  Podule_EnumerateChunksWithInfo
#define Podule_EnumerateChunksWithInfo          0x4028A
#undef  XPodule_EnumerateChunksWithInfo
#define XPodule_EnumerateChunksWithInfo         0x6028A
#undef  Podule_HardwareAddresses
#define Podule_HardwareAddresses                0x4028B
#undef  XPodule_HardwareAddresses
#define XPodule_HardwareAddresses               0x6028B
#undef  Podule_ReturnNumber
#define Podule_ReturnNumber                     0x4028C
#undef  XPodule_ReturnNumber
#define XPodule_ReturnNumber                    0x6028C
#undef  Podule_ReadInfo
#define Podule_ReadInfo                         0x4028D
#undef  XPodule_ReadInfo
#define XPodule_ReadInfo                        0x6028D
#undef  Podule_SetSpeed
#define Podule_SetSpeed                         0x4028E
#undef  XPodule_SetSpeed
#define XPodule_SetSpeed                        0x6028E
#undef  Service_PreReset
#define Service_PreReset                        0x45
#undef  Service_ADFSPodule
#define Service_ADFSPodule                      0x10800
#undef  Service_ADFSPoduleIDE
#define Service_ADFSPoduleIDE                   0x10801
#undef  Service_ADFSPoduleIDEDying
#define Service_ADFSPoduleIDEDying              0x10802

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct podule_header                    podule_header;

/********************
 * Type definitions *
 ********************/
typedef int podule_section;

struct podule_header
   {  byte b [16];
   };

/************************
 * Constant definitions *
 ************************/
#define podule_SECTION_SYSTEM_ROM               ((podule_section) 0xFFFFFFFFu)
#define podule_SECTION_EXPANSION_CARD0          ((podule_section) 0x0u)
#define podule_SECTION_EXPANSION_CARD1          ((podule_section) 0x1u)
#define podule_SECTION_EXPANSION_CARD2          ((podule_section) 0x2u)
#define podule_SECTION_EXPANSION_CARD3          ((podule_section) 0x3u)
#define podule_SECTION_EXTENSION_ROM1           ((podule_section) 0xFFFFFFFEu)
#define error_PODULE_BAD_POD                    0x500u
      /*Bad expansion card identifier*/
#define error_PODULE_BAD_SPEED                  0x501u
      /*Bad access speed*/
#define error_PODULE_NO_POD                     0x502u
      /*No installed expansion card*/
#define error_PODULE_NOT_EXT                    0x503u
      /*Expansion card identity is not extended*/
#define error_PODULE_NOT_ACRN                   0x504u
      /*Expansion card is not Acorn conformant*/
#define error_PODULE_NO_LDR                     0x505u
      /*No loader to call*/
#define error_PODULE_IN_LDR                     0x506u
      /*Unknown error in loader*/
#define error_PODULE_BAD_CHNK                   0x507u
      /*Bad chunk number*/
#define error_PODULE_BAD_DEVICE_NUMBER          0x508u
      /*Bad device number*/
#define error_PODULE_BAD_DEVICE_TYPE            0x509u
      /*Bad device type*/
#define error_PODULE_RAM_CONFIG_SYNTAX          0x50Au
      /*Syntax: *RAMConfig <expansion card number> [<device> [<type>]], ErrorNumber_Syntax*/
#define error_PODULE_WRONG_PODULE_TYPE          0x50Bu
      /*Wrong expansion card type*/
#define error_PODULE_ROM_BOARD_SYNTAX           0x50Cu
      /*Syntax: *Configure ROMBoard <expansion card> <device> [<type>], ErrorNumber_Syntax*/
#define error_PODULE_BAD_READ                   0x50Du
      /*Unknown bit set in ReadInfo*/
#define error_PODULE_BD_SPEED                   0x50Eu
      /*Unknown value for speed setting*/
#define error_PODULE_NOT_EASI                   0x50Fu
      /*This expansion card has no EASI space*/
#define error_PODULE_SPEED_NO                   0x510u
      /*Requested speed setting not available for this expansion card*/
#define error_PODULE_EC_NO_SPD                  0x511u
      /*This expansion card does not suport speed setting*/
#define error_PODULE_EC_NO_NET                  0x512u
      /*This expansion card may not use the Ethernet address*/
#define error_PODULE_NDALLAS                    0x513u
      /*This computer can't provide a valid Ethernet address*/
#define error_PODULE_NOT_WRITABLE               0x580u
      /*This expansion card doesn't support writable devices*/
#define error_PODULE_ADDRESS_RANGE              0x581u
      /*Address out of range for expansion card*/
#define error_PODULE_DEVICE_NOT_WRITABLE        0x582u
      /*This device not writable*/
#define error_PODULE_PODULE_READ_ONLY           0x583u
      /*Read only device*/
#define error_PODULE_ADDRESS_TOO_BIG            0x584u
      /*Address too big*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      podule_read_id()
 *
 * Description:   Reads an expansion card or extension ROM's identity byte
 *
 * Input:         section - value of R3 on entry
 *
 * Output:        ec_id - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40280.
 */

extern os_error *xpodule_read_id (podule_section section,
      int *ec_id);
extern int podule_read_id (podule_section section);

/* ------------------------------------------------------------------------
 * Function:      podule_read_header()
 *
 * Description:   Reads an expansion card or extension ROM's header
 *
 * Input:         header - value of R2 on entry
 *                section - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40281.
 */

extern os_error *xpodule_read_header (podule_header *header,
      podule_section section);
extern void podule_read_header (podule_header *header,
      podule_section section);

/* ------------------------------------------------------------------------
 * Function:      podule_enumerate_chunks()
 *
 * Description:   Reads information about a chunk from the chunk directory
 *
 * Input:         context - value of R0 on entry
 *                section - value of R3 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                size - value of R1 on exit
 *                os_id - value of R2 on exit
 *                module_name - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40282.
 */

extern os_error *xpodule_enumerate_chunks (int context,
      podule_section section,
      int *context_out,
      int *size,
      byte *os_id,
      char **module_name);
extern int podule_enumerate_chunks (int context,
      podule_section section,
      int *size,
      byte *os_id,
      char **module_name);

/* ------------------------------------------------------------------------
 * Function:      podule_read_chunk()
 *
 * Description:   Reads a chunk from an expansion card or extension ROM
 *
 * Input:         chunk_no - value of R0 on entry
 *                buffer - value of R2 on entry
 *                section - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40283.
 */

extern os_error *xpodule_read_chunk (int chunk_no,
      byte *buffer,
      podule_section section);
extern void podule_read_chunk (int chunk_no,
      byte *buffer,
      podule_section section);

/* ------------------------------------------------------------------------
 * Function:      podule_read_bytes()
 *
 * Description:   Reads bytes from within an expansion card's code space
 *
 * Input:         start_offset - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                slot_no - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40284.
 */

extern os_error *xpodule_read_bytes (int start_offset,
      int size,
      byte *buffer,
      int slot_no);
__swi (0x40284) void podule_read_bytes (int start_offset,
      int size,
      byte *buffer,
      int slot_no);

/* ------------------------------------------------------------------------
 * Function:      podule_write_bytes()
 *
 * Description:   Writes bytes to within an expansion card's code space
 *
 * Input:         start_offset - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                slot_no - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40285.
 */

extern os_error *xpodule_write_bytes (int start_offset,
      int size,
      byte const *buffer,
      int slot_no);
__swi (0x40285) void podule_write_bytes (int start_offset,
      int size,
      byte const *buffer,
      int slot_no);

/* ------------------------------------------------------------------------
 * Function:      podule_call_loader()
 *
 * Description:   Calls an expansion card's loader
 *
 * Input:         arg0 - value of R0 on entry
 *                arg1 - value of R1 on entry
 *                arg2 - value of R2 on entry
 *                slot_no - value of R3 on entry
 *
 * Output:        arg0_out - value of R0 on exit
 *                arg1_out - value of R1 on exit
 *                arg2_out - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40286.
 */

extern os_error *xpodule_call_loader (int arg0,
      int arg1,
      int arg2,
      int slot_no,
      int *arg0_out,
      int *arg1_out,
      int *arg2_out);
extern void podule_call_loader (int arg0,
      int arg1,
      int arg2,
      int slot_no,
      int *arg0_out,
      int *arg1_out,
      int *arg2_out);

/* ------------------------------------------------------------------------
 * Function:      podule_raw_read()
 *
 * Description:   Reads bytes directly within an expansion card or
 *                extension ROM's address space
 *
 * Input:         start_offset - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                slot_no - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40287.
 */

extern os_error *xpodule_raw_read (int start_offset,
      int size,
      byte *buffer,
      int slot_no);
__swi (0x40287) void podule_raw_read (int start_offset,
      int size,
      byte *buffer,
      int slot_no);

/* ------------------------------------------------------------------------
 * Function:      podule_raw_write()
 *
 * Description:   Writes bytes directly within an expansion card's
 *                workspace
 *
 * Input:         start_offset - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                slot_no - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x40288.
 */

extern os_error *xpodule_raw_write (int start_offset,
      int size,
      byte const *buffer,
      int slot_no);
__swi (0x40288) void podule_raw_write (int start_offset,
      int size,
      byte const *buffer,
      int slot_no);

/* ------------------------------------------------------------------------
 * Function:      podule_hardware_address()
 *
 * Description:   Returns an expansion card or extension ROM's base
 *                address, and the address of an expansion card's CMOS RAM
 *                - prefer Podule_ReadInfo
 *
 * Input:         section - value of R3 on entry
 *
 * Output:        combined_addr - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40289.
 */

extern os_error *xpodule_hardware_address (podule_section section,
      int **combined_addr);
extern int *podule_hardware_address (podule_section section);

/* ------------------------------------------------------------------------
 * Function:      podule_enumerate_chunks_with_info()
 *
 * Description:   Reads information about a chunk from the chunk directory
 *
 * Input:         context - value of R0 on entry
 *                section - value of R3 on entry
 *
 * Output:        context_out - value of R0 on exit (X version only)
 *                size - value of R1 on exit
 *                os_id - value of R2 on exit
 *                module_name - value of R4 on exit
 *                help_text - value of R5 on exit
 *                module_base - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4028A with R6 = 0x1.
 */

extern os_error *xpodule_enumerate_chunks_with_info (int context,
      podule_section section,
      int *context_out,
      int *size,
      byte *os_id,
      char **module_name,
      char **help_text,
      int **module_base);
extern int podule_enumerate_chunks_with_info (int context,
      podule_section section,
      int *size,
      byte *os_id,
      char **module_name,
      char **help_text,
      int **module_base);

/* ------------------------------------------------------------------------
 * Function:      podule_hardware_addresses()
 *
 * Description:   Returns an expansion card or extension ROM's base
 *                address, and the address of an expansion card's CMOS RAM
 *
 * Input:         section - value of R3 on entry
 *
 * Output:        base_addr - value of R0 on exit
 *                combined_addr - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x4028B.
 */

extern os_error *xpodule_hardware_addresses (podule_section section,
      int **base_addr,
      int **combined_addr);
extern void podule_hardware_addresses (podule_section section,
      int **base_addr,
      int **combined_addr);

/* ------------------------------------------------------------------------
 * Function:      podule_return_number()
 *
 * Description:   Returns the number of expansion card and extension ROM's
 *
 * Output:        expansion_card_count - value of R0 on exit
 *                extension_rom_count - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x4028C.
 */

extern os_error *xpodule_return_number (int *expansion_card_count,
      int *extension_rom_count);
extern void podule_return_number (int *expansion_card_count,
      int *extension_rom_count);

/* ------------------------------------------------------------------------
 * Function:      podule_read_info()
 *
 * Description:   Returns a selection of data specific to a given expansion
 *                card
 *
 * Input:         mask - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                section - value of R3 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4028D.
 */

extern os_error *xpodule_read_info (bits mask,
      byte *buffer,
      int size,
      podule_section section,
      int *used);
extern int podule_read_info (bits mask,
      byte *buffer,
      int size,
      podule_section section);

/* ------------------------------------------------------------------------
 * Function:      podule_set_speed()
 *
 * Description:   Changes the speed of access to expansion card hardware
 *
 * Input:         speed - value of R0 on entry
 *                section - value of R3 on entry
 *
 * Output:        old_speed - value of R0 on exit
 *
 * Other notes:   Calls SWI 0x4028E.
 */

extern os_error *xpodule_set_speed (int speed,
      podule_section section,
      int *old_speed);
extern void podule_set_speed (int speed,
      podule_section section,
      int *old_speed);

/* ------------------------------------------------------------------------
 * Function:      service_pre_reset()
 *
 * Description:   Pre-reset
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x45.
 */

extern os_error *xservice_pre_reset (void);
extern void service_pre_reset (void);

/* ------------------------------------------------------------------------
 * Function:      service_adfs_podule()
 *
 * Description:   Issued by ADFS to locate an ST506 expansion card
 *
 * Input:         controller - value of R2 on entry
 *                status_location - value of R3 on entry
 *                status_bits - value of R4 on entry
 *                irq_location - value of R5 on entry
 *                irq_bits - value of R6 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                controller_out - value of R2 on exit
 *                status_location_out - value of R3 on exit
 *                status_bits_out - value of R4 on exit
 *                irq_location_out - value of R5 on exit
 *                irq_bits_out - value of R6 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x10800.
 */

extern os_error *xservice_adfs_podule (byte *controller,
      int *status_location,
      bits status_bits,
      int *irq_location,
      bits irq_bits,
      osbool *unclaimed,
      byte **controller_out,
      int **status_location_out,
      bits *status_bits_out,
      int **irq_location_out,
      bits *irq_bits_out);
extern osbool service_adfs_podule (byte *controller,
      int *status_location,
      bits status_bits,
      int *irq_location,
      bits irq_bits,
      byte **controller_out,
      int **status_location_out,
      bits *status_bits_out,
      int **irq_location_out,
      bits *irq_bits_out);

/* ------------------------------------------------------------------------
 * Function:      service_adfs_podule_ide()
 *
 * Description:   Issued by ADFS to locate an IDE expansion card
 *
 * Input:         controller - value of R2 on entry
 *                status_location - value of R3 on entry
 *                status_bits - value of R4 on entry
 *                irq_location - value of R5 on entry
 *                irq_bits - value of R6 on entry
 *                read_code - value of R7 on entry
 *                write_code - value of R8 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                controller_out - value of R2 on exit
 *                status_location_out - value of R3 on exit
 *                status_bits_out - value of R4 on exit
 *                irq_location_out - value of R5 on exit
 *                irq_bits_out - value of R6 on exit
 *                read_code_out - value of R7 on exit
 *                write_code_out - value of R8 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x10801.
 */

extern os_error *xservice_adfs_podule_ide (byte *controller,
      int *status_location,
      bits status_bits,
      int *irq_location,
      bits irq_bits,
      void const *read_code,
      void const *write_code,
      osbool *unclaimed,
      byte **controller_out,
      int **status_location_out,
      bits *status_bits_out,
      int **irq_location_out,
      bits *irq_bits_out,
      void **read_code_out,
      void **write_code_out);
extern osbool service_adfs_podule_ide (byte *controller,
      int *status_location,
      bits status_bits,
      int *irq_location,
      bits irq_bits,
      void const *read_code,
      void const *write_code,
      byte **controller_out,
      int **status_location_out,
      bits *status_bits_out,
      int **irq_location_out,
      bits *irq_bits_out,
      void **read_code_out,
      void **write_code_out);

/* ------------------------------------------------------------------------
 * Function:      service_adfs_podule_ide_dying()
 *
 * Description:   IDE expansion card dying
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x10802.
 */

extern os_error *xservice_adfs_podule_ide_dying (void);
extern void service_adfs_podule_ide_dying (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
