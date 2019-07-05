#ifndef pci_H
#define pci_H

/* C header file for PCI
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:29 2007
 * Tom Hughes, tom@compton.nu, 21 Dec 2002
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
#undef  PCI_ReturnNumber
#define PCI_ReturnNumber                        0x50382
#undef  XPCI_ReturnNumber
#define XPCI_ReturnNumber                       0x70382
#undef  PCI_SpecialCycle
#define PCI_SpecialCycle                        0x5038C
#undef  XPCI_SpecialCycle
#define XPCI_SpecialCycle                       0x7038C
#undef  PCI_FindByLocation
#define PCI_FindByLocation                      0x5038D
#undef  XPCI_FindByLocation
#define XPCI_FindByLocation                     0x7038D
#undef  PCI_FindByID
#define PCI_FindByID                            0x5038E
#undef  XPCI_FindByID
#define XPCI_FindByID                           0x7038E
#undef  PCI_FindByClass
#define PCI_FindByClass                         0x5038F
#undef  XPCI_FindByClass
#define XPCI_FindByClass                        0x7038F
#undef  PCI_RAMAlloc
#define PCI_RAMAlloc                            0x50390
#undef  XPCI_RAMAlloc
#define XPCI_RAMAlloc                           0x70390
#undef  PCI_RAMFree
#define PCI_RAMFree                             0x50391
#undef  XPCI_RAMFree
#define XPCI_RAMFree                            0x70391
#undef  PCI_LogicalAddress
#define PCI_LogicalAddress                      0x50392
#undef  XPCI_LogicalAddress
#define XPCI_LogicalAddress                     0x70392
#undef  Service_PCILookupDescription
#define Service_PCILookupDescription            0x0
#undef  Service_PCILookupVendorDescription
#define Service_PCILookupVendorDescription      0x1

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct pci_access_size_                 *pci_access_size;
typedef struct pci_address_                     *pci_address;
typedef struct pci_configuration_address_       *pci_configuration_address;

/********************
 * Type definitions *
 ********************/
typedef bits pci_id;

typedef int pci_class;

typedef int pci_function;

typedef bits pci_memory_read_flags;

typedef bits pci_memory_write_flags;

typedef bits pci_read_info_flags;

typedef bits pci_hardware_address_input_flags;

typedef bits pci_hardware_address_output_flags;

typedef bits pci_logical_address_flags;

/************************
 * Constant definitions *
 ************************/
#define pci_VENDOR_ID                           ((pci_id) 0xFFFFu)
#define pci_VENDOR_ID_SHIFT                     0
#define pci_DEVICE_ID                           ((pci_id) 0xFFFF0000u)
#define pci_DEVICE_ID_SHIFT                     16
#define pci_ANY_ID                              ((pci_id) 0xFFFFFFFFu)
#define pci_BYTE_ACCESS                         ((pci_access_size) 0x1u)
#define pci_HALF_WORD_ACCESS                    ((pci_access_size) 0x2u)
#define pci_WORD_ACCESS                         ((pci_access_size) 0x4u)
#define pci_MEMORY_READ_PREFETCHABLE            ((pci_memory_read_flags) 0x8u)
#define pci_HARDWARE_ADDRESS_ACCESS_READ_WRITE  ((pci_hardware_address_input_flags) 0x0u)
#define pci_HARDWARE_ADDRESS_ACCESS_READ_ONLY   ((pci_hardware_address_input_flags) 0x1u)
#define pci_HARDWARE_ADDRESS_ACCESS_NONE        ((pci_hardware_address_input_flags) 0x2u)
#define pci_HARDWARE_ADDRESS_ACCESS             ((pci_hardware_address_input_flags) 0xFu)
#define pci_HARDWARE_ADDRESS_ACCESS_SHIFT       0
#define pci_HARDWARE_ADDRESS_BUFFERABLE         ((pci_hardware_address_input_flags) 0x10u)
#define pci_HARDWARE_ADDRESS_CACHEABLE          ((pci_hardware_address_input_flags) 0x20u)
#define pci_HARDWARE_ADDRESS_ACCESS_SET         ((pci_hardware_address_input_flags) 0x200u)
#define pci_HARDWARE_ADDRESS_QUERY_ONLY         ((pci_hardware_address_input_flags) 0x80000000u)
#define pci_HARDWARE_ADDRESS_IS_IO              ((pci_hardware_address_output_flags) 0x1u)
#define pci_HARDWARE_ADDRESS_PREFETCHABLE       ((pci_hardware_address_output_flags) 0x8u)
#define pci_READ_INFO_DEVICE_NUMBER             ((pci_read_info_flags) 0x1u)
#define pci_READ_INFO_FUNCTION_NUMBER           ((pci_read_info_flags) 0x1u)
#define pci_READ_INFO_BUS_NUMBER                ((pci_read_info_flags) 0x2u)
#define pci_READ_INFO_PARENT_BRIDGE_HANDLE      ((pci_read_info_flags) 0x4u)
#define pci_READ_INFO_SLOT_NUMBER               ((pci_read_info_flags) 0x8u)
#define pci_READ_INFO_ID                        ((pci_read_info_flags) 0x10u)
#define pci_READ_INFO_REVISION_ID               ((pci_read_info_flags) 0x20u)
#define pci_READ_INFO_SUBSYSTEM_ID              ((pci_read_info_flags) 0x40u)
#define pci_READ_INFO_CLASS                     ((pci_read_info_flags) 0x80u)
#define pci_READ_INFO_CMOS_ADDRESS              ((pci_read_info_flags) 0x100u)
#define pci_READ_INFO_CMOS_SIZE                 ((pci_read_info_flags) 0x200u)
#define pci_READ_INFO_DESCRIPTION               ((pci_read_info_flags) 0x400u)
#define pci_READ_INFO_DEVICE_VECTOR_NUMBER      ((pci_read_info_flags) 0x800u)
#define pci_READ_INFO_ETHERNET_ADDRESS_LOW      ((pci_read_info_flags) 0x1000u)
#define pci_READ_INFO_ETHERNET_ADDRESS_HIGH     ((pci_read_info_flags) 0x2000u)
#define pci_READ_INFO_LOGICAL_DMA_CHANNEL       ((pci_read_info_flags) 0x4000u)
#define pci_READ_INFO_VENDOR_DESCRIPTION        ((pci_read_info_flags) 0x8000u)
#define pci_LOGICAL_ADDRESS_BUFFERABLE          ((pci_logical_address_flags) 0x10u)
#define pci_LOGICAL_ADDRESS_IS_IO               ((pci_logical_address_flags) 0x40000000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      pci_read_id()
 *
 *
 * Input:         function - value of R3 on entry
 *
 * Output:        id - value of R0 on exit (X version only)
 *                subsystem_id - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 */

extern os_error *xpci_read_id (pci_function function,
      pci_id *id,
      pci_id *subsystem_id);
extern pci_id pci_read_id (pci_function function,
      pci_id *subsystem_id);

/* ------------------------------------------------------------------------
 * Function:      pci_read_header()
 *
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                function - value of R3 on entry
 */

extern os_error *xpci_read_header (byte *buffer,
      int size,
      pci_function function);
extern void pci_read_header (byte *buffer,
      int size,
      pci_function function);

/* ------------------------------------------------------------------------
 * Function:      pci_return_number()
 *
 * Description:   Returns the number of function handles that have been
 *                used
 *
 * Output:        used - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x50382.
 */

extern os_error *xpci_return_number (pci_function *used);
__swi (0x50382) pci_function pci_return_number (void);

/* ------------------------------------------------------------------------
 * Function:      pci_enumerate_functions()
 *
 *
 * Input:         previous_function - value of R3 on entry
 *
 * Output:        id - value of R0 on exit
 *                subsystem_id - value of R1 on exit
 *                pciclass - value of R2 on exit
 *                function - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 */

extern os_error *xpci_enumerate_functions (pci_function previous_function,
      pci_id *id,
      pci_id *subsystem_id,
      pci_class *pciclass,
      pci_function *function);
extern pci_function pci_enumerate_functions (pci_function previous_function,
      pci_id *id,
      pci_id *subsystem_id,
      pci_class *pciclass);

/* ------------------------------------------------------------------------
 * Function:      pci_io_read()
 *
 *
 * Input:         address - value of R0 on entry
 *                access_size - value of R2 on entry
 *
 * Output:        value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 */

extern os_error *xpci_io_read (pci_address address,
      pci_access_size access_size,
      int *value);
extern int pci_io_read (pci_address address,
      pci_access_size access_size);

/* ------------------------------------------------------------------------
 * Function:      pci_io_write()
 *
 *
 * Input:         address - value of R0 on entry
 *                value - value of R1 on entry
 *                access_size - value of R2 on entry
 */

extern os_error *xpci_io_write (pci_address address,
      int value,
      pci_access_size access_size);
__swi (0x50385) void pci_io_write (pci_address address,
      int value,
      pci_access_size access_size);

/* ------------------------------------------------------------------------
 * Function:      pci_memory_read()
 *
 *
 * Input:         address - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                flags - value of R4 on entry
 */

extern os_error *xpci_memory_read (pci_address address,
      int size,
      byte *buffer,
      pci_memory_read_flags flags);
extern void pci_memory_read (pci_address address,
      int size,
      byte *buffer,
      pci_memory_read_flags flags);

/* ------------------------------------------------------------------------
 * Function:      pci_memory_write()
 *
 *
 * Input:         address - value of R0 on entry
 *                size - value of R1 on entry
 *                buffer - value of R2 on entry
 *                flags - value of R4 on entry
 */

extern os_error *xpci_memory_write (pci_address address,
      int size,
      byte const *buffer,
      pci_memory_write_flags flags);
extern void pci_memory_write (pci_address address,
      int size,
      byte const *buffer,
      pci_memory_write_flags flags);

/* ------------------------------------------------------------------------
 * Function:      pci_configuration_read()
 *
 *
 * Input:         address - value of R0 on entry
 *                access_size - value of R2 on entry
 *                function - value of R3 on entry
 *
 * Output:        value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 */

extern os_error *xpci_configuration_read (pci_configuration_address address,
      pci_access_size access_size,
      pci_function function,
      int *value);
extern int pci_configuration_read (pci_configuration_address address,
      pci_access_size access_size,
      pci_function function);

/* ------------------------------------------------------------------------
 * Function:      pci_configuration_write()
 *
 *
 * Input:         address - value of R0 on entry
 *                value - value of R1 on entry
 *                access_size - value of R2 on entry
 *                function - value of R3 on entry
 */

extern os_error *xpci_configuration_write (pci_configuration_address address,
      int value,
      pci_access_size access_size,
      pci_function function);
__swi (0x50389) void pci_configuration_write (pci_configuration_address address,
      int value,
      pci_access_size access_size,
      pci_function function);

/* ------------------------------------------------------------------------
 * Function:      pci_hardware_address()
 *
 *
 * Input:         flags - value of R0 on entry
 *                address_index - value of R1 on entry
 *                function - value of R3 on entry
 *
 * Output:        flags_out - value of R0 on exit
 *                pci_address - value of R1 on exit (X version only)
 *                length - value of R2 on exit
 *                logical_address - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 */

extern os_error *xpci_hardware_address (pci_hardware_address_input_flags flags,
      int address_index,
      pci_function function,
      pci_hardware_address_output_flags *flags_out,
      pci_address *pci_address,
      int *length,
      byte **logical_address);
extern pci_address pci_hardware_address (pci_hardware_address_input_flags flags,
      int address_index,
      pci_function function,
      pci_hardware_address_output_flags *flags_out,
      int *length,
      byte **logical_address);

/* ------------------------------------------------------------------------
 * Function:      pci_read_info()
 *
 *
 * Input:         flags - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                function - value of R3 on entry
 *
 * Output:        length - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 */

extern os_error *xpci_read_info (pci_read_info_flags flags,
      byte *buffer,
      int size,
      pci_function function,
      int *length);
extern int pci_read_info (pci_read_info_flags flags,
      byte *buffer,
      int size,
      pci_function function);

/* ------------------------------------------------------------------------
 * Function:      pci_special_cycle()
 *
 * Description:   Issues a special cycle on the PCI bus
 *
 * Input:         bus - value of R0 on entry
 *                message - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x5038C.
 */

extern os_error *xpci_special_cycle (int bus,
      byte const *message);
__swi (0x5038C) void pci_special_cycle (int bus,
      byte const *message);

/* ------------------------------------------------------------------------
 * Function:      pci_find_by_location()
 *
 * Description:   Finds a function handle based on the specified topology
 *
 * Input:         bus - value of R0 on entry
 *                device_or_function - value of R1 on entry
 *
 * Output:        function - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5038D.
 */

extern os_error *xpci_find_by_location (int bus,
      int device_or_function,
      pci_function *function);
extern pci_function pci_find_by_location (int bus,
      int device_or_function);

/* ------------------------------------------------------------------------
 * Function:      pci_find_by_id()
 *
 * Description:   Finds a function handle based on the specified IDs
 *
 * Input:         vendor_id - value of R0 on entry
 *                device_id - value of R1 on entry
 *                subsystem_vendor_id - value of R2 on entry
 *                previous_function - value of R3 on entry
 *                subsystem_id - value of R4 on entry
 *
 * Output:        function - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5038E.
 */

extern os_error *xpci_find_by_id (pci_id vendor_id,
      pci_id device_id,
      pci_id subsystem_vendor_id,
      pci_function previous_function,
      pci_id subsystem_id,
      pci_function *function);
extern pci_function pci_find_by_id (pci_id vendor_id,
      pci_id device_id,
      pci_id subsystem_vendor_id,
      pci_function previous_function,
      pci_id subsystem_id);

/* ------------------------------------------------------------------------
 * Function:      pci_find_by_class()
 *
 * Description:   Finds a function handle hased on the specified class
 *
 * Input:         pciclass - value of R0 on entry
 *                class_mask - value of R1 on entry
 *                previous_function - value of R3 on entry
 *
 * Output:        function - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5038F.
 */

extern os_error *xpci_find_by_class (pci_class pciclass,
      pci_class class_mask,
      pci_function previous_function,
      pci_function *function);
extern pci_function pci_find_by_class (pci_class pciclass,
      pci_class class_mask,
      pci_function previous_function);

/* ------------------------------------------------------------------------
 * Function:      pci_ram_alloc()
 *
 * Description:   Allocates memory from a fixed, contiguous memory pool,
 *                suitable for use by other bus masters
 *
 * Input:         size - value of R0 on entry
 *                alignment - value of R1 on entry
 *                boundary_limitation - value of R2 on entry
 *
 * Output:        logical_address - value of R0 on exit
 *                pci_address - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x50390.
 */

extern os_error *xpci_ram_alloc (int size,
      int alignment,
      int boundary_limitation,
      byte **logical_address,
      pci_address *pci_address);
extern void pci_ram_alloc (int size,
      int alignment,
      int boundary_limitation,
      byte **logical_address,
      pci_address *pci_address);

/* ------------------------------------------------------------------------
 * Function:      pci_ram_free()
 *
 * Description:   Free memory allocated with PCI_RAMAlloc
 *
 * Input:         logical_address - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x50391.
 */

extern os_error *xpci_ram_free (byte *logical_address);
__swi (0x50391) void pci_ram_free (byte *logical_address);

/* ------------------------------------------------------------------------
 * Function:      pci_logical_address()
 *
 * Description:   Maps a given PCI address into the logical memory map
 *
 * Input:         flags - value of R0 on entry
 *                pci_address - value of R1 on entry
 *                length - value of R2 on entry
 *
 * Output:        logical_address - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x50392.
 */

extern os_error *xpci_logical_address (pci_logical_address_flags flags,
      pci_address pci_address,
      int length,
      byte **logical_address);
extern byte *pci_logical_address (pci_logical_address_flags flags,
      pci_address pci_address,
      int length);

/* ------------------------------------------------------------------------
 * Function:      service_pci_lookup_description()
 *
 * Description:   Lookup description
 *
 * Input:         function - value of R3 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                description - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xC3, R2 = 0x0.
 */

extern os_error *xservice_pci_lookup_description (pci_function function,
      osbool *unclaimed,
      char **description);
extern osbool service_pci_lookup_description (pci_function function,
      char **description);

/* ------------------------------------------------------------------------
 * Function:      service_pci_lookup_vendor_description()
 *
 * Description:   Lookup vendor description
 *
 * Input:         vendir - value of R0 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                description - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xC3, R2 = 0x1.
 */

extern os_error *xservice_pci_lookup_vendor_description (pci_id vendir,
      osbool *unclaimed,
      char **description);
extern osbool service_pci_lookup_vendor_description (pci_id vendir,
      char **description);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
