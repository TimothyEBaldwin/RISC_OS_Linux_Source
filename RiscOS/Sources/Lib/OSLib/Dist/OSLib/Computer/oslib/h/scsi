#ifndef scsi_H
#define scsi_H

/* C header file for SCSI
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 27 June 1995
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
#undef  SCSI_Version
#define SCSI_Version                            0x403C0
#undef  XSCSI_Version
#define XSCSI_Version                           0x603C0
#undef  SCSI_Initialise
#define SCSI_Initialise                         0x403C1
#undef  XSCSI_Initialise
#define XSCSI_Initialise                        0x603C1
#undef  SCSIInitialise_ResetBus
#define SCSIInitialise_ResetBus                 0x0
#undef  SCSIInitialise_ResetDevice
#define SCSIInitialise_ResetDevice              0x1
#undef  SCSIInitialise_DetermineDevice
#define SCSIInitialise_DetermineDevice          0x2
#undef  SCSIInitialise_EnumerateDevice
#define SCSIInitialise_EnumerateDevice          0x3
#undef  SCSI_Control
#define SCSI_Control                            0x403C2
#undef  XSCSI_Control
#define XSCSI_Control                           0x603C2
#undef  SCSIControl_AbortDevice
#define SCSIControl_AbortDevice                 0x0
#undef  SCSIControl_AbortOp
#define SCSIControl_AbortOp                     0x1
#undef  SCSIControl_SetTimeout
#define SCSIControl_SetTimeout                  0x3
#undef  SCSIControl_SetErrorResponse
#define SCSIControl_SetErrorResponse            0x4
#undef  SCSIControl_SetQueueBehaviour
#define SCSIControl_SetQueueBehaviour           0x5
#undef  SCSIControl_Disconnect
#define SCSIControl_Disconnect                  0x6
#undef  SCSI_Op
#define SCSI_Op                                 0x403C3
#undef  XSCSI_Op
#define XSCSI_Op                                0x603C3
#undef  SCSI_Status
#define SCSI_Status                             0x403C4
#undef  XSCSI_Status
#define XSCSI_Status                            0x603C4
#undef  SCSIStatus_CheckDevice
#define SCSIStatus_CheckDevice                  0x0
#undef  SCSI_Reserve
#define SCSI_Reserve                            0x403C7
#undef  XSCSI_Reserve
#define XSCSI_Reserve                           0x603C7
#undef  SCSIReserve_Claim
#define SCSIReserve_Claim                       0x0
#undef  SCSIReserve_ForceClaim
#define SCSIReserve_ForceClaim                  0x1
#undef  SCSIReserve_Release
#define SCSIReserve_Release                     0x2
#undef  SCSI_List
#define SCSI_List                               0x403C8
#undef  XSCSI_List
#define XSCSI_List                              0x603C8
#undef  SCSI_TargetControl
#define SCSI_TargetControl                      0x403C9
#undef  XSCSI_TargetControl
#define XSCSI_TargetControl                     0x603C9

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct scsi_device_description          scsi_device_description;
typedef struct scsi_op_block                    scsi_op_block;
typedef struct scsi_op_block_base               scsi_op_block_base;
typedef struct scsi_card_address_list           scsi_card_address_list;
typedef struct scsi_card_address_list_base      scsi_card_address_list_base;

/********************
 * Type definitions *
 ********************/
typedef bits scsi_software_features;

typedef bits scsi_hardware_features;

typedef byte scsi_device_type;

typedef byte scsi_device_flags;

typedef byte scsi_device_version;

struct scsi_device_description
   {  scsi_device_type type;
      scsi_device_flags flags;
      scsi_device_version version;
      byte reserved0;
      byte length;
      byte reserved1;
      byte reserved2;
      byte reserved3;
      int block_count;
      int block_size;
   };

typedef int scsi_error_response_level;

typedef int scsi_queue_behaviour;

typedef int scsi_disconnection;

struct scsi_op_block
   {  int o [UNKNOWN];
   };

#define scsi_OP_BLOCK(N) \
   struct \
      {  int o [N]; \
      }

#define scsi_SIZEOF_OP_BLOCK(N) \
   ((N)*sizeof ((scsi_op_block *) NULL)->o)

typedef int scsi_device_status;

struct scsi_card_address_list
   {  byte *addr [UNKNOWN];
   };

#define scsi_CARD_ADDRESS_LIST(N) \
   struct \
      {  byte *addr [N]; \
      }

#define scsi_SIZEOF_CARD_ADDRESS_LIST(N) \
   ((N)*sizeof ((scsi_card_address_list *) NULL)->addr)

/************************
 * Constant definitions *
 ************************/
#define scsi_CHECK_NO_CHANGE                    ((scsi_error_response_level) 0xFFFFFFFFu)
      /*No action, return previous setting*/
#define scsi_CHECK_ERROR                        ((scsi_error_response_level) 0x0u)
      /*If device returns check condition, return that as an error message. This is for badly-behaved devices with non-standard request-sense return blocks*/
#define scsi_CHECK_SENSE                        ((scsi_error_response_level) 0x1u)
      /*If device returns check condition, do the request sense automatically, report the error*/
#define scsi_CHECK_RETRY                        ((scsi_error_response_level) 0x2u)
      /*If device returns check condition, do a request sense automatically, if unit attention, ignore it and reissue the command, else report the error*/
#define scsi_BEHAVIOUR_NO_CHANGE                ((scsi_queue_behaviour_level) 0xFFFFFFFFu)
      /*No action, return previous setting*/
#define scsi_BEHAVIOUR_WAIT                     ((scsi_queue_behaviour_level) 0x0u)
      /*Queue the command, waiting until a slot becomes free if necessary*/
#define scsi_BEHAVIOUR_AWAIT_QUEUE              ((scsi_queue_behaviour_level) 0x1u)
      /*Queue the command if there is room in the queue*/
#define scsi_BEHAVIOUR_AWAIT_DEVICE             ((scsi_queue_behaviour_level) 0x2u)
      /*Perform the command if the device is ready*/
#define scsi_BEHAVIOUR_AWAIT_CARD               ((scsi_queue_behaviour_level) 0x3u)
      /*Perform the command if the card is ready*/
#define scsi_DISCONNECT_NO_CHANGE               ((scsi_disconnection) 0xFFFFFFFFu)
#define scsi_DISCONNECT_ALLOWED                 ((scsi_disconnection) 0x0u)
#define scsi_DISCONNECT_INHIBITED_BY_BLOCKING   ((scsi_disconnection) 0x1u)
#define scsi_DISCONNECT_INHIBITED               ((scsicontrol_disconnection) 0x2u)
#define scsi_DEVICE_STATUS_IDLE                 ((scsi_device_status) 0x1u)
#define scsi_DEVICE_STATUS_BUSY                 ((scsi_device_status) 0x2u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      scsi_version()
 *
 * Description:   Determines the version number of the drivers
 *
 * Output:        software_version - value of R0 on exit
 *                software_features - value of R1 on exit
 *                hardware_version - value of R2 on exit
 *                hardware_features - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x403C0.
 */

extern os_error *xscsi_version (bits *software_version,
      scsi_software_features *software_features,
      bits *hardware_version,
      scsi_hardware_features *hardware_features);
extern void scsi_version (bits *software_version,
      scsi_software_features *software_features,
      bits *hardware_version,
      scsi_hardware_features *hardware_features);

/* ------------------------------------------------------------------------
 * Function:      scsiinitialise_reset_bus()
 *
 * Description:   Resets all options set by SCSI_Control to their default
 *                states and removes device reservations
 *
 * Input:         host_id - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x403C1 with R0 = 0x0.
 */

extern os_error *xscsiinitialise_reset_bus (int host_id);
extern void scsiinitialise_reset_bus (int host_id);

/* ------------------------------------------------------------------------
 * Function:      scsiinitialise_reset_device()
 *
 * Description:   Initiates the reset operation for a device and returns
 *                immediately
 *
 * Input:         device_id - value of R1 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C1 with R0 = 0x1.
 */

extern os_error *xscsiinitialise_reset_device (int device_id,
      int access_key);
extern void scsiinitialise_reset_device (int device_id,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsiinitialise_determine_device()
 *
 * Description:   Sees what type the device is and then performs the
 *                appropriate read-capacity commands
 *
 * Input:         device_id - value of R1 on entry
 *                description - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x403C1 with R0 = 0x2.
 */

extern os_error *xscsiinitialise_determine_device (int device_id,
      scsi_device_description *description);
extern void scsiinitialise_determine_device (int device_id,
      scsi_device_description *description);

/* ------------------------------------------------------------------------
 * Function:      scsiinitialise_enumerate_device()
 *
 * Description:   Sees what type the device is and then performs the
 *                appropriate read-capacity commands, formatting the result
 *                as text
 *
 * Input:         device_id - value of R1 on entry
 *                description - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x403C1 with R0 = 0x3.
 */

extern os_error *xscsiinitialise_enumerate_device (int device_id,
      char *description,
      int size);
extern void scsiinitialise_enumerate_device (int device_id,
      char *description,
      int size);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_abort_device()
 *
 * Description:   Cancels any outstanding operation on a device
 *
 * Input:         device_id - value of R1 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x0.
 */

extern os_error *xscsicontrol_abort_device (int device_id,
      int access_key);
extern void scsicontrol_abort_device (int device_id,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_abort_op()
 *
 * Description:   Cancels a particular operation on a device
 *
 * Input:         device_id - value of R1 on entry
 *                op_id - value of R2 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x1.
 */

extern os_error *xscsicontrol_abort_op (int device_id,
      int op_id,
      int access_key);
extern void scsicontrol_abort_op (int device_id,
      int op_id,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_set_timeout()
 *
 * Description:   Sets the default timeout for a device
 *
 * Input:         device_id - value of R1 on entry
 *                timeout - value of R2 on entry
 *                access_key - value of R8 on entry
 *
 * Output:        old_timeout - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x3.
 */

extern os_error *xscsicontrol_set_timeout (int device_id,
      int timeout,
      int access_key,
      int *old_timeout);
extern int scsicontrol_set_timeout (int device_id,
      int timeout,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_set_error_response()
 *
 * Description:   Controls the behaviour of the device on receipt of a
 *                check condition status
 *
 * Input:         device_id - value of R1 on entry
 *                level - value of R2 on entry
 *                access_key - value of R8 on entry
 *
 * Output:        old_level - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x4.
 */

extern os_error *xscsicontrol_set_error_response (int device_id,
      scsi_error_response_level level,
      int access_key,
      int *old_level);
extern int scsicontrol_set_error_response (int device_id,
      scsi_error_response_level level,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_set_queue_behaviour()
 *
 * Description:   Sets queue behaviour
 *
 * Input:         device_id - value of R1 on entry
 *                behaviour - value of R2 on entry
 *                access_key - value of R8 on entry
 *
 * Output:        old_level - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x5.
 */

extern os_error *xscsicontrol_set_queue_behaviour (int device_id,
      scsi_queue_behaviour behaviour,
      int access_key,
      int *old_level);
extern int scsicontrol_set_queue_behaviour (int device_id,
      scsi_queue_behaviour behaviour,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsicontrol_disconnect()
 *
 * Description:   Allows/inhibits disconnection/reselection. Device must be
 *                idle
 *
 * Input:         device_id - value of R1 on entry
 *                disconnection - value of R2 on entry
 *
 * Output:        old_disconnection - value of R2 on exit (X version only)
 *                access_key - value of R8 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C2 with R0 = 0x6.
 */

extern os_error *xscsicontrol_disconnect (int device_id,
      scsi_disconnection disconnection,
      int *old_disconnection,
      int *access_key);
extern int scsicontrol_disconnect (int device_id,
      scsi_disconnection disconnection,
      int *access_key);

/* ------------------------------------------------------------------------
 * Function:      scsi_op()
 *
 * Description:   Issues a SCSI command to a device and can be called in
 *                the background
 *
 * Input:         op - value of R0 on entry
 *                block_size - value of R1 on entry
 *                block - value of R2 on entry
 *                start_addr - value of R3 on entry
 *                length - value of R4 on entry
 *                timeout - value of R5 on entry
 *                callback_code - value of R6 on entry
 *                workspace - value of R7 on entry
 *                access_key - value of R8 on entry
 *
 * Output:        op_id - value of R0 on exit
 *                next_addr - value of R3 on exit
 *                undone - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C3.
 */

extern os_error *xscsi_op (bits op,
      int block_size,
      scsi_op_block const *block,
      byte *start_addr,
      int length,
      int timeout,
      void const *callback_code,
      void *workspace,
      int access_key,
      int *op_id,
      byte **next_addr,
      int *undone);
extern int scsi_op (bits op,
      int block_size,
      scsi_op_block const *block,
      byte *start_addr,
      int length,
      int timeout,
      void const *callback_code,
      void *workspace,
      int access_key,
      int *op_id,
      byte **next_addr);

/* ------------------------------------------------------------------------
 * Function:      scsistatus_check_device()
 *
 * Description:   Returns the status of the selected device
 *
 * Input:         device_id - value of R1 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x403C4 with R0 = 0x0.
 */

extern os_error *xscsistatus_check_device (int device_id,
      scsi_device_status *status);
extern scsi_device_status scsistatus_check_device (int device_id);

/* ------------------------------------------------------------------------
 * Function:      scsireserve_claim()
 *
 * Description:   Claims exclusive use of a device
 *
 * Input:         device_id - value of R1 on entry
 *                release_code - value of R2 on entry
 *                workspace - value of R3 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C7 with R0 = 0x0.
 */

extern os_error *xscsireserve_claim (int device_id,
      void const *release_code,
      void *workspace,
      int access_key);
extern void scsireserve_claim (int device_id,
      void const *release_code,
      void *workspace,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsireserve_force_claim()
 *
 * Description:   Claims exclusive use of a device, and if the device is
 *                already claimed, calls the release code for the current
 *                claimant
 *
 * Input:         device_id - value of R1 on entry
 *                release_code - value of R2 on entry
 *                workspace - value of R3 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C7 with R0 = 0x1.
 */

extern os_error *xscsireserve_force_claim (int device_id,
      void const *release_code,
      void *workspace,
      int access_key);
extern void scsireserve_force_claim (int device_id,
      void const *release_code,
      void *workspace,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsireserve_release()
 *
 * Description:   Removes the claim to a device
 *
 * Input:         device_id - value of R1 on entry
 *                access_key - value of R8 on entry
 *
 * Other notes:   Calls SWI 0x403C7 with R0 = 0x2.
 */

extern os_error *xscsireserve_release (int device_id,
      int access_key);
extern void scsireserve_release (int device_id,
      int access_key);

/* ------------------------------------------------------------------------
 * Function:      scsi_list()
 *
 * Description:   Used by SCSILog as part of the multiple SCSI-card
 *                initialisation sequence
 *
 * Input:         list - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x403C8.
 */

extern os_error *xscsi_list (scsi_card_address_list const *list);
__swi (0x403C8) void scsi_list (scsi_card_address_list const *list);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
