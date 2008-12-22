#ifndef econet_H
#define econet_H

/* C header file for Econet
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:52 2007
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
#undef  Econet_CreateReceive
#define Econet_CreateReceive                    0x40000
#undef  XEconet_CreateReceive
#define XEconet_CreateReceive                   0x60000
#undef  Econet_ExamineReceive
#define Econet_ExamineReceive                   0x40001
#undef  XEconet_ExamineReceive
#define XEconet_ExamineReceive                  0x60001
#undef  Econet_ReadReceive
#define Econet_ReadReceive                      0x40002
#undef  XEconet_ReadReceive
#define XEconet_ReadReceive                     0x60002
#undef  Econet_AbandonReceive
#define Econet_AbandonReceive                   0x40003
#undef  XEconet_AbandonReceive
#define XEconet_AbandonReceive                  0x60003
#undef  Econet_WaitForReception
#define Econet_WaitForReception                 0x40004
#undef  XEconet_WaitForReception
#define XEconet_WaitForReception                0x60004
#undef  Econet_EnumerateReceive
#define Econet_EnumerateReceive                 0x40005
#undef  XEconet_EnumerateReceive
#define XEconet_EnumerateReceive                0x60005
#undef  Econet_StartTransmit
#define Econet_StartTransmit                    0x40006
#undef  XEconet_StartTransmit
#define XEconet_StartTransmit                   0x60006
#undef  Econet_PollTransmit
#define Econet_PollTransmit                     0x40007
#undef  XEconet_PollTransmit
#define XEconet_PollTransmit                    0x60007
#undef  Econet_AbandonTransmit
#define Econet_AbandonTransmit                  0x40008
#undef  XEconet_AbandonTransmit
#define XEconet_AbandonTransmit                 0x60008
#undef  Econet_DoTransmit
#define Econet_DoTransmit                       0x40009
#undef  XEconet_DoTransmit
#define XEconet_DoTransmit                      0x60009
#undef  Econet_ReadLocalStationAndNet
#define Econet_ReadLocalStationAndNet           0x4000A
#undef  XEconet_ReadLocalStationAndNet
#define XEconet_ReadLocalStationAndNet          0x6000A
#undef  Econet_ConvertStatusToString
#define Econet_ConvertStatusToString            0x4000B
#undef  XEconet_ConvertStatusToString
#define XEconet_ConvertStatusToString           0x6000B
#undef  Econet_ConvertStatusToError
#define Econet_ConvertStatusToError             0x4000C
#undef  XEconet_ConvertStatusToError
#define XEconet_ConvertStatusToError            0x6000C
#undef  Econet_ReadProtection
#define Econet_ReadProtection                   0x4000D
#undef  XEconet_ReadProtection
#define XEconet_ReadProtection                  0x6000D
#undef  Econet_SetProtection
#define Econet_SetProtection                    0x4000E
#undef  XEconet_SetProtection
#define XEconet_SetProtection                   0x6000E
#undef  Econet_ReadStationNumber
#define Econet_ReadStationNumber                0x4000F
#undef  XEconet_ReadStationNumber
#define XEconet_ReadStationNumber               0x6000F
#undef  Econet_PrintBanner
#define Econet_PrintBanner                      0x40010
#undef  XEconet_PrintBanner
#define XEconet_PrintBanner                     0x60010
#undef  Econet_ReadTransportType
#define Econet_ReadTransportType                0x40011
#undef  XEconet_ReadTransportType
#define XEconet_ReadTransportType               0x60011
#undef  Econet_ReleasePort
#define Econet_ReleasePort                      0x40012
#undef  XEconet_ReleasePort
#define XEconet_ReleasePort                     0x60012
#undef  Econet_AllocatePort
#define Econet_AllocatePort                     0x40013
#undef  XEconet_AllocatePort
#define XEconet_AllocatePort                    0x60013
#undef  Econet_DeAllocatePort
#define Econet_DeAllocatePort                   0x40014
#undef  XEconet_DeAllocatePort
#define XEconet_DeAllocatePort                  0x60014
#undef  Econet_ClaimPort
#define Econet_ClaimPort                        0x40015
#undef  XEconet_ClaimPort
#define XEconet_ClaimPort                       0x60015
#undef  Econet_StartImmediate
#define Econet_StartImmediate                   0x40016
#undef  XEconet_StartImmediate
#define XEconet_StartImmediate                  0x60016
#undef  Econet_DoImmediate
#define Econet_DoImmediate                      0x40017
#undef  XEconet_DoImmediate
#define XEconet_DoImmediate                     0x60017
#undef  Econet_AbandonAndReadReceive
#define Econet_AbandonAndReadReceive            0x40018
#undef  XEconet_AbandonAndReadReceive
#define XEconet_AbandonAndReadReceive           0x60018
#undef  Econet_Version
#define Econet_Version                          0x40019
#undef  XEconet_Version
#define XEconet_Version                         0x60019
#undef  Econet_NetworkState
#define Econet_NetworkState                     0x4001A
#undef  XEconet_NetworkState
#define XEconet_NetworkState                    0x6001A
#undef  Econet_PacketSize
#define Econet_PacketSize                       0x4001B
#undef  XEconet_PacketSize
#define XEconet_PacketSize                      0x6001B
#undef  Econet_ReadTransportName
#define Econet_ReadTransportName                0x4001C
#undef  XEconet_ReadTransportName
#define XEconet_ReadTransportName               0x6001C
#undef  Econet_InetRxDirect
#define Econet_InetRxDirect                     0x4001D
#undef  XEconet_InetRxDirect
#define XEconet_InetRxDirect                    0x6001D
#undef  Econet_EnumerateMap
#define Econet_EnumerateMap                     0x4001E
#undef  XEconet_EnumerateMap
#define XEconet_EnumerateMap                    0x6001E
#undef  Econet_EnumerateTransmit
#define Econet_EnumerateTransmit                0x4001F
#undef  XEconet_EnumerateTransmit
#define XEconet_EnumerateTransmit               0x6001F
#undef  Econet_HardwareAddresses
#define Econet_HardwareAddresses                0x40020
#undef  XEconet_HardwareAddresses
#define XEconet_HardwareAddresses               0x60020
#undef  Econet_NetworkParameters
#define Econet_NetworkParameters                0x40021
#undef  XEconet_NetworkParameters
#define XEconet_NetworkParameters               0x60021
#undef  EconetV
#define EconetV                                 0x21
#undef  Service_ReallocatePorts
#define Service_ReallocatePorts                 0x48
#undef  Service_EconetDying
#define Service_EconetDying                     0x56
#undef  Service_ProtocolDying
#define Service_ProtocolDying                   0x83
#undef  Service_FindNetworkDriver
#define Service_FindNetworkDriver               0x84
#undef  Service_NetworkDriverStatus
#define Service_NetworkDriverStatus             0x8B
#undef  Event_EconetUserRPC
#define Event_EconetUserRPC                     0x8
#undef  Event_EconetRx
#define Event_EconetRx                          0xE
#undef  Event_EconetTx
#define Event_EconetTx                          0xF
#undef  Event_EconetOSProc
#define Event_EconetOSProc                      0x10

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct econet_rx_cb_                    *econet_rx_cb;
typedef struct econet_tx_cb_                    *econet_tx_cb;

/********************
 * Type definitions *
 ********************/
typedef int econet_status;
      /*Completion statuses*/

typedef int econet_immediate_op;

typedef void *econet_immediate_os_procedure;

typedef bits econet_protection;

typedef int econet_transport_type;

typedef int econet_state;

typedef int econet_action;

typedef bits econet_map_flags;

/************************
 * Constant definitions *
 ************************/
#define econet_STATUS_TRANSMITTED               ((econet_status) 0x0u)
#define econet_STATUS_LINE_JAMMED               ((econet_status) 0x1u)
#define econet_STATUS_NET_ERROR                 ((econet_status) 0x2u)
#define econet_STATUS_NOT_LISTENING             ((econet_status) 0x3u)
#define econet_STATUS_NO_CLOCK                  ((econet_status) 0x4u)
#define econet_STATUS_TX_READY                  ((econet_status) 0x5u)
#define econet_STATUS_TRANSMITTING              ((econet_status) 0x6u)
#define econet_STATUS_RX_READY                  ((econet_status) 0x7u)
#define econet_STATUS_RECEIVING                 ((econet_status) 0x8u)
#define econet_STATUS_RECEIVED                  ((econet_status) 0x9u)
#define econet_STATUS_NO_REPLY                  ((econet_status) 0xAu)
#define econet_STATUS_ESCAPE                    ((econet_status) 0xBu)
#define econet_STATUS_NOT_PRESENT               ((econet_status) 0xCu)
#define error_ECONET_TX_READY                   0x300u
      /*Tx ready*/
#define error_ECONET_TRANSMITTING               0x301u
      /*Transmitting */
#define error_ECONET_RX_READY                   0x302u
      /*Receive block open*/
#define error_ECONET_RECEIVING                  0x303u
      /*Receiving */
#define error_ECONET_RECEIVED                   0x304u
      /*Received */
#define error_ECONET_TRANSMITTED                0x305u
      /*Transmitted OK*/
#define error_ECONET_BAD_STATION                0x306u
      /*Bad station number*/
#define error_ECONET_BAD_NETWORK                0x307u
      /*Bad network number*/
#define error_ECONET_UNABLE_TO_DEFAULT          0x308u
      /*Full net address required*/
#define error_ECONET_BAD_PORT                   0x309u
      /*Bad port number*/
#define error_ECONET_BAD_CONTROL                0x30Au
      /*Bad flag byte value*/
#define error_ECONET_BAD_BUFFER                 0x30Bu
      /*Bad buffer address*/
#define error_ECONET_BAD_SIZE                   0x30Cu
      /*Bad buffer size*/
#define error_ECONET_BAD_MASK                   0x30Du
      /*Bad mask*/
#define error_ECONET_BAD_COUNT                  0x30Eu
      /*Bad count*/
#define error_ECONET_BAD_DELAY                  0x30Fu
      /*Bad delay*/
#define error_ECONET_BAD_STATUS                 0x310u
      /*Bad status*/
#define error_ECONET_NO_HARDWARE                0x311u
      /*No Econet hardware*/
#define error_ECONET_NO_ECONET                  0x312u
      /*No 'Econet' installed*/
#define error_ECONET_NO_MORE_DOMAINS            0x313u
      /*No more domains*/
#define error_ECONET_BAD_DOMAIN                 0x314u
      /*Bad domain number*/
#define error_ECONET_UN_REGISTERED_DOMAIN       0x315u
      /*Unknown domain*/
#define error_ECONET_PORT_NOT_ALLOCATED         0x316u
      /*Port not already allocated*/
#define error_ECONET_PORT_ALLOCATED             0x317u
      /*Port not unallocated*/
#define error_ECONET_NO_MORE_PORTS              0x318u
      /*All ports allocated*/
#define econet_IMMEDIATE_PEEK                   ((econet_immediate_op) 0x1u)
#define econet_IMMEDIATE_POKE                   ((econet_immediate_op) 0x2u)
#define econet_IMMEDIATE_JSR                    ((econet_immediate_op) 0x3u)
#define econet_IMMEDIATE_USER_PROCEDURE_CALL    ((econet_immediate_op) 0x4u)
#define econet_IMMEDIATE_OS_PROCEDURE_CALL      ((econet_immediate_op) 0x5u)
#define econet_IMMEDIATE_HALT                   ((econet_immediate_op) 0x6u)
#define econet_IMMEDIATE_CONTINUE               ((econet_immediate_op) 0x7u)
#define econet_IMMEDIATE_MACHINE_PEEK           ((econet_immediate_op) 0x8u)
#define econet_IMMEDIATE_GET_REGISTERS          ((econet_immediate_op) 0x9u)
#define econet_OS_CHAR_FROM_NOTIFY              ((econet_immediate_os_procedure) 0x0u)
#define econet_OS_INITIALISE_REMOTE             ((econet_immediate_os_procedure) 0x1u)
#define econet_OS_GET_VIEW_PARAMETERS           ((econet_immediate_os_procedure) 0x2u)
#define econet_OS_CAUSE_FATAL_ERROR             ((econet_immediate_os_procedure) 0x3u)
#define econet_OS_CHAR_FROM_REMOTE              ((econet_immediate_os_procedure) 0x4u)
#define econet_PROTECTION_PEEK                  ((econet_protection) 0x1u)
#define econet_PROTECTION_POKE                  ((econet_protection) 0x2u)
#define econet_PROTECTION_JSR                   ((econet_protection) 0x4u)
#define econet_PROTECTION_USER_PROCEDURE_CALL   ((econet_protection) 0x8u)
#define econet_PROTECTION_OS_PROCEDURE_CALL     ((econet_protection) 0x10u)
#define econet_PROTECTION_HALT                  ((econet_protection) 0x20u)
#define econet_PROTECTION_CONTINUE              ((econet_protection) 0x40u)
#define econet_PROTECTION_MACHINE_PEEK          ((econet_protection) 0x80u)
#define econet_PROTECTION_GET_REGISTERS         ((econet_protection) 0x100u)
#define econet_PROTECTION_WRITE_CMOS            ((econet_protection) 0x80000000u)
#define econet_TRANSPORT_NOT_KNOWN              ((econet_transport_type) 0x0u)
#define econet_TRANSPORT_INTERNET               ((econet_transport_type) 0x1u)
#define econet_TRANSPORT_ECONET                 ((econet_transport_type) 0x2u)
#define econet_TRANSPORT_NEXUS                  ((econet_transport_type) 0x3u)
#define econet_STATE_OK                         ((econet_state) 0x0u)
#define econet_STATE_NO_CLOCK                   ((econet_state) 0x1u)
#define econet_NET_FS_START_LOAD                ((econet_action) 0x10u)
#define econet_NET_FS_PART_LOAD                 ((econet_action) 0x11u)
#define econet_NET_FS_FINISH_LOAD               ((econet_action) 0x12u)
#define econet_NET_FS_START_SAVE                ((econet_action) 0x20u)
#define econet_NET_FS_PART_SAVE                 ((econet_action) 0x21u)
#define econet_NET_FS_FINISH_SAVE               ((econet_action) 0x22u)
#define econet_NET_FS_START_CREATE              ((econet_action) 0x30u)
#define econet_NET_FS_PART_CREATE               ((econet_action) 0x31u)
#define econet_NET_FS_FINISH_CREATE             ((econet_action) 0x32u)
#define econet_NET_FS_START_GET_BYTES           ((econet_action) 0x40u)
#define econet_NET_FS_PART_GET_BYTES            ((econet_action) 0x41u)
#define econet_NET_FS_FINISH_GET_BYTES          ((econet_action) 0x42u)
#define econet_NET_FS_START_PUT_BYTES           ((econet_action) 0x50u)
#define econet_NET_FS_PART_PUT_BYTES            ((econet_action) 0x51u)
#define econet_NET_FS_FINISH_PUT_BYTES          ((econet_action) 0x52u)
#define econet_NET_FS_START_WAIT                ((econet_action) 0x60u)
#define econet_NET_FS_FINISH_WAIT               ((econet_action) 0x62u)
#define econet_NET_FS_START_BROADCAST_LOAD      ((econet_action) 0x70u)
#define econet_NET_FS_PART_BROADCAST_LOAD       ((econet_action) 0x71u)
#define econet_NET_FS_FINISH_BROADCAST_LOAD     ((econet_action) 0x72u)
#define econet_NET_FS_START_BROADCAST_SAVE      ((econet_action) 0x80u)
#define econet_NET_FS_PART_BROADCAST_SAVE       ((econet_action) 0x81u)
#define econet_NET_FS_FINISH_BROADCAST_SAVE     ((econet_action) 0x82u)
#define econet_ECONET_START_TRANSMISSION        ((econet_action) 0xC0u)
#define econet_ECONET_FINISH_TRANSMISSION       ((econet_action) 0xC2u)
#define econet_ECONET_START_RECEPTION           ((econet_action) 0xD0u)
#define econet_ECONET_FINISH_RECEPTION          ((econet_action) 0xD2u)
#define econet_SECOND                           4000000
      /*1s in Econet units*/
#define econet_KHZ                              1
      /*1kHz in Econet units*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      econet_create_receive()
 *
 * Description:   Creates a receive control block
 *
 * Input:         port - value of R0 on entry
 *                station - value of R1 on entry
 *                net - value of R2 on entry
 *                buffer - value of R3 on entry
 *                size - value of R4 on entry
 *
 * Output:        rx_cb - value of R0 on exit (X version only)
 *                nonlocal - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40000.
 */

extern os_error *xeconet_create_receive (byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      econet_rx_cb *rx_cb,
      osbool *nonlocal);
extern econet_rx_cb econet_create_receive (byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      osbool *nonlocal);

/* ------------------------------------------------------------------------
 * Function:      econet_examine_receive()
 *
 * Description:   Reads the status of a receive control block
 *
 * Input:         rx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40001.
 */

extern os_error *xeconet_examine_receive (econet_rx_cb rx_cb,
      econet_status *status);
__swi (0x40001) econet_status econet_examine_receive (econet_rx_cb rx_cb);

/* ------------------------------------------------------------------------
 * Function:      econet_read_receive()
 *
 * Description:   Reads information about a reception, including the size
 *                of data
 *
 * Input:         rx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                flag - value of R1 on exit
 *                port - value of R2 on exit
 *                station - value of R3 on exit
 *                net - value of R4 on exit
 *                buffer - value of R5 on exit
 *                size - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40002.
 */

extern os_error *xeconet_read_receive (econet_rx_cb rx_cb,
      econet_status *status,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);
extern econet_status econet_read_receive (econet_rx_cb rx_cb,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      econet_abandon_receive()
 *
 * Description:   Abandons a receive control block
 *
 * Input:         rx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40003.
 */

extern os_error *xeconet_abandon_receive (econet_rx_cb rx_cb,
      econet_status *status);
__swi (0x40003) econet_status econet_abandon_receive (econet_rx_cb rx_cb);

/* ------------------------------------------------------------------------
 * Function:      econet_wait_for_reception()
 *
 * Description:   Polls a receive control block, reads its status, and
 *                abandons it
 *
 * Input:         rx_cb - value of R0 on entry
 *                delay - value of R1 on entry
 *                abort_on_escape - value of R2 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                flag - value of R1 on exit
 *                port - value of R2 on exit
 *                station - value of R3 on exit
 *                net - value of R4 on exit
 *                buffer - value of R5 on exit
 *                size - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40004.
 */

extern os_error *xeconet_wait_for_reception (econet_rx_cb rx_cb,
      int delay,
      osbool abort_on_escape,
      econet_status *status,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);
extern econet_status econet_wait_for_reception (econet_rx_cb rx_cb,
      int delay,
      osbool abort_on_escape,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      econet_enumerate_receive()
 *
 * Description:   Returns the handles of open receive control blocks
 *
 * Input:         rx_cb_no - value of R0 on entry
 *
 * Output:        rx_cb - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40005.
 */

extern os_error *xeconet_enumerate_receive (int rx_cb_no,
      econet_rx_cb *rx_cb);
__swi (0x40005) econet_rx_cb econet_enumerate_receive (int rx_cb_no);

/* ------------------------------------------------------------------------
 * Function:      econet_start_transmit()
 *
 * Description:   Creates a transmit control block and starts a
 *                transmission
 *
 * Input:         flags - value of R0 on entry
 *                port - value of R1 on entry
 *                station - value of R2 on entry
 *                net - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *                count - value of R6 on entry
 *                delay - value of R7 on entry
 *
 * Output:        tx_cb - value of R0 on exit (X version only)
 *                nonlocal - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40006.
 */

extern os_error *xeconet_start_transmit (byte flags,
      byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      econet_tx_cb *tx_cb,
      osbool *nonlocal);
extern econet_tx_cb econet_start_transmit (byte flags,
      byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      osbool *nonlocal);

/* ------------------------------------------------------------------------
 * Function:      econet_poll_transmit()
 *
 * Description:   Reads the status of a transmit control block
 *
 * Input:         tx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40007.
 */

extern os_error *xeconet_poll_transmit (econet_tx_cb tx_cb,
      econet_status *status);
__swi (0x40007) econet_status econet_poll_transmit (econet_tx_cb tx_cb);

/* ------------------------------------------------------------------------
 * Function:      econet_abandon_transmit()
 *
 * Description:   Abandons a transmit control block
 *
 * Input:         tx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40008.
 */

extern os_error *xeconet_abandon_transmit (econet_tx_cb tx_cb,
      econet_status *status);
__swi (0x40008) econet_status econet_abandon_transmit (econet_tx_cb tx_cb);

/* ------------------------------------------------------------------------
 * Function:      econet_do_transmit()
 *
 * Description:   Creates a transmit control block, polls it, reads its
 *                status, and abandons it
 *
 * Input:         flags - value of R0 on entry
 *                port - value of R1 on entry
 *                station - value of R2 on entry
 *                net - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *                count - value of R6 on entry
 *                delay - value of R7 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                nonlocal - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40009.
 */

extern os_error *xeconet_do_transmit (byte flags,
      byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      econet_status *status,
      osbool *nonlocal);
extern econet_status econet_do_transmit (byte flags,
      byte port,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      osbool *nonlocal);

/* ------------------------------------------------------------------------
 * Function:      econet_read_local_station_and_net()
 *
 * Description:   Returns a computer's station number and net number
 *
 * Output:        station - value of R0 on exit
 *                net - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x4000A.
 */

extern os_error *xeconet_read_local_station_and_net (byte *station,
      byte *net);
extern void econet_read_local_station_and_net (byte *station,
      byte *net);

/* ------------------------------------------------------------------------
 * Function:      econet_convert_status_to_string()
 *
 * Description:   Converts a status to a string
 *
 * Input:         status - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                station - value of R3 on entry
 *                net - value of R4 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4000B.
 */

extern os_error *xeconet_convert_status_to_string (econet_status status,
      char *buffer,
      int size,
      byte station,
      byte net,
      char **end);
extern char *econet_convert_status_to_string (econet_status status,
      char *buffer,
      int size,
      byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_convert_status_to_error()
 *
 * Description:   Converts a status to a string, and then generates an
 *                error
 *
 * Input:         status - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                station - value of R3 on entry
 *                net - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4000C.
 */

extern os_error *xeconet_convert_status_to_error (econet_status status,
      os_error *buffer,
      int size,
      byte station,
      byte net);
extern void econet_convert_status_to_error (econet_status status,
      os_error *buffer,
      int size,
      byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_read_protection()
 *
 * Description:   Reads the current protection word for immediate
 *                operations
 *
 * Output:        protection - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4000D.
 */

extern os_error *xeconet_read_protection (econet_protection *protection);
__swi (0x4000D) econet_protection econet_read_protection (void);

/* ------------------------------------------------------------------------
 * Function:      econet_set_protection()
 *
 * Description:   Sets or reads the protection word for immediate
 *                operations
 *
 * Input:         eor_mask - value of R0 on entry
 *                and_mask - value of R1 on entry
 *
 * Output:        old_protection - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4000E.
 */

extern os_error *xeconet_set_protection (econet_protection eor_mask,
      econet_protection and_mask,
      econet_protection *old_protection);
__swi (0x4000E) econet_protection econet_set_protection (econet_protection eor_mask,
      econet_protection and_mask);

/* ------------------------------------------------------------------------
 * Function:      econet_read_station_number()
 *
 * Description:   Extracts a station and/or net number from a specified
 *                string
 *
 * Input:         s - value of R1 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *                station - Station number, or -1 (not specified)
 *                net - Net number, or -1 (not specified)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4000F.
 */

extern os_error *xeconet_read_station_number (char const *s,
      char **end,
      int *station,
      int *net);
extern char *econet_read_station_number (char const *s,
      int *station,
      int *net);

/* ------------------------------------------------------------------------
 * Function:      econet_print_banner()
 *
 * Description:   Prints an Econet message followed by a new line
 *
 * Other notes:   Calls SWI 0x40010.
 */

extern os_error *xeconet_print_banner (void);
__swi (0x40010) void econet_print_banner (void);

/* ------------------------------------------------------------------------
 * Function:      econet_read_transport_type()
 *
 * Description:   Returns the underlying transport type to a given station
 *
 * Input:         station - value of R0 on entry
 *                net - value of R1 on entry
 *
 * Output:        transport_type - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40011 with R2 = 0x2.
 */

extern os_error *xeconet_read_transport_type (byte station,
      byte net,
      econet_transport_type *transport_type);
extern econet_transport_type econet_read_transport_type (byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_release_port()
 *
 * Description:   Releases a port number that was previously claimed
 *
 * Input:         port - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40012.
 */

extern os_error *xeconet_release_port (byte port);
__swi (0x40012) void econet_release_port (byte port);

/* ------------------------------------------------------------------------
 * Function:      econet_allocate_port()
 *
 * Description:   Allocates a unique port number
 *
 * Output:        port - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40013.
 */

extern os_error *xeconet_allocate_port (byte *port);
__swi (0x40013) byte econet_allocate_port (void);

/* ------------------------------------------------------------------------
 * Function:      econet_de_allocate_port()
 *
 * Description:   Deallocates a port number that was previously allocated
 *
 * Input:         port - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40014.
 */

extern os_error *xeconet_de_allocate_port (byte port);
__swi (0x40014) void econet_de_allocate_port (byte port);

/* ------------------------------------------------------------------------
 * Function:      econet_claim_port()
 *
 * Description:   Claims a specific port number
 *
 * Input:         port - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40015.
 */

extern os_error *xeconet_claim_port (byte port);
__swi (0x40015) void econet_claim_port (byte port);

/* ------------------------------------------------------------------------
 * Function:      econet_start_immediate()
 *
 * Description:   Creates a transmit control block and starts an immediate
 *                operation
 *
 * Input:         op_type - value of R0 on entry
 *                procedure - value of R1 on entry
 *                station - value of R2 on entry
 *                net - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *                count - value of R6 on entry
 *                delay - value of R7 on entry
 *
 * Output:        tx_cb - value of R0 on exit (X version only)
 *                nonlocal - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40016.
 */

extern os_error *xeconet_start_immediate (econet_immediate_op op_type,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      econet_tx_cb *tx_cb,
      osbool *nonlocal);
extern econet_tx_cb econet_start_immediate (econet_immediate_op op_type,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      osbool *nonlocal);

/* ------------------------------------------------------------------------
 * Function:      econet_do_immediate()
 *
 * Description:   Creates a transmit control block for an immediate
 *                operation, polls it, reads its status, and abandons it
 *
 * Input:         op_type - value of R0 on entry
 *                procedure - value of R1 on entry
 *                station - value of R2 on entry
 *                net - value of R3 on entry
 *                buffer - value of R4 on entry
 *                size - value of R5 on entry
 *                count - value of R6 on entry
 *                delay - value of R7 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                nonlocal - value of R4 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40017.
 */

extern os_error *xeconet_do_immediate (econet_immediate_op op_type,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      econet_status *status,
      osbool *nonlocal);
extern econet_status econet_do_immediate (econet_immediate_op op_type,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net,
      byte *buffer,
      int size,
      int count,
      int delay,
      osbool *nonlocal);

/* ------------------------------------------------------------------------
 * Function:      econet_abandon_and_read_receive()
 *
 * Description:   Abandons a reception and returns information about it,
 *                including the size of data
 *
 * Input:         rx_cb - value of R0 on entry
 *
 * Output:        status - value of R0 on exit (X version only)
 *                flag - value of R1 on exit
 *                port - value of R2 on exit
 *                station - value of R3 on exit
 *                net - value of R4 on exit
 *                buffer - value of R5 on exit
 *                size - value of R6 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40018.
 */

extern os_error *xeconet_abandon_and_read_receive (econet_rx_cb rx_cb,
      econet_status *status,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);
extern econet_status econet_abandon_and_read_receive (econet_rx_cb rx_cb,
      byte *flag,
      byte *port,
      byte *station,
      byte *net,
      byte **buffer,
      int *size);

/* ------------------------------------------------------------------------
 * Function:      econet_version()
 *
 * Description:   Returns the version of software for the underlying
 *                transport to a given station
 *
 * Input:         station - value of R0 on entry
 *                net - value of R1 on entry
 *
 * Output:        version - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40019.
 */

extern os_error *xeconet_version (byte station,
      byte net,
      int *version);
extern int econet_version (byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_network_state()
 *
 * Description:   Returns the state of the underlying transport to a given
 *                station
 *
 * Input:         station - value of R0 on entry
 *                net - value of R1 on entry
 *
 * Output:        state - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4001A.
 */

extern os_error *xeconet_network_state (byte station,
      byte net,
      econet_state *state);
extern econet_state econet_network_state (byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_packet_size()
 *
 * Description:   Returns the maximum packet size recommended on the
 *                underlying transport to a given station
 *
 * Input:         station - value of R0 on entry
 *                net - value of R1 on entry
 *
 * Output:        packet_limit - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4001B.
 */

extern os_error *xeconet_packet_size (byte station,
      byte net,
      int *packet_limit);
extern int econet_packet_size (byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_read_transport_name()
 *
 * Description:   Returns the name of the underlying transport to a given
 *                station
 *
 * Input:         station - value of R0 on entry
 *                net - value of R1 on entry
 *
 * Output:        transport_name - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4001C.
 */

extern os_error *xeconet_read_transport_name (byte station,
      byte net,
      char **transport_name);
extern char *econet_read_transport_name (byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      econet_enumerate_map()
 *
 * Description:   Enumerates subnetwork addresses within an AUN site
 *                network - RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                context - value of R4 on entry
 *
 * Output:        net - value of R1 on exit
 *                net_name - value of R2 on exit
 *                ip_subnetwork_address - value of R3 on exit
 *                context_out - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4001E.
 */

extern os_error *xeconet_enumerate_map (econet_map_flags flags,
      int context,
      byte *net,
      char **net_name,
      int *ip_subnetwork_address,
      int *context_out);
extern int econet_enumerate_map (econet_map_flags flags,
      int context,
      byte *net,
      char **net_name,
      int *ip_subnetwork_address);

/* ------------------------------------------------------------------------
 * Function:      econet_enumerate_transmit()
 *
 * Description:   Returns the handles of open transmit blocks - RISC O S
 *                3.5+
 *
 * Input:         tx_cb_no - value of R0 on entry
 *
 * Output:        tx_cb - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4001F.
 */

extern os_error *xeconet_enumerate_transmit (int tx_cb_no,
      econet_tx_cb *tx_cb);
__swi (0x4001F) econet_tx_cb econet_enumerate_transmit (int tx_cb_no);

/* ------------------------------------------------------------------------
 * Function:      econet_hardware_addresses()
 *
 * Description:   Returns the address of the Econet hardware and interrupt
 *                control registers - RISC O S 3.5+
 *
 * Output:        hardware_address - value of R0 on exit
 *                register_address - value of R1 on exit
 *                register_mask - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x40020.
 */

extern os_error *xeconet_hardware_addresses (byte **hardware_address,
      byte **register_address,
      bits *register_mask);
extern void econet_hardware_addresses (byte **hardware_address,
      byte **register_address,
      bits *register_mask);

/* ------------------------------------------------------------------------
 * Function:      econet_network_parameters()
 *
 * Description:   Returns the Econet clock period and frequency - RISC O S
 *                3.5+
 *
 * Output:        period - value of R0 on exit
 *                frequency - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x40021.
 */

extern os_error *xeconet_network_parameters (int *period,
      int *frequency);
extern void econet_network_parameters (int *period,
      int *frequency);

/* ------------------------------------------------------------------------
 * Function:      econetv()
 *
 * Description:   Econet module vector
 *
 * Input:         action - value of R0 on entry
 *                count - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x21.
 */

extern os_error *xeconetv (econet_action action,
      int count);
extern void econetv (econet_action action,
      int count);

/* ------------------------------------------------------------------------
 * Function:      service_reallocate_ports()
 *
 * Description:   Econet restarting
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x48.
 */

extern os_error *xservice_reallocate_ports (void);
extern void service_reallocate_ports (void);

/* ------------------------------------------------------------------------
 * Function:      service_econet_dying()
 *
 * Description:   Econet is about to leave
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x56.
 */

extern os_error *xservice_econet_dying (void);
extern void service_econet_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_protocol_dying()
 *
 * Description:   Part of the AUN driver control interface
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x83.
 */

extern os_error *xservice_protocol_dying (void);
extern void service_protocol_dying (void);

/* ------------------------------------------------------------------------
 * Function:      service_find_network_driver()
 *
 * Description:   Part of the AUN driver control interface
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x84.
 */

extern os_error *xservice_find_network_driver (void);
extern void service_find_network_driver (void);

/* ------------------------------------------------------------------------
 * Function:      service_network_driver_status()
 *
 * Description:   Part of the AUN driver control interface
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8B.
 */

extern os_error *xservice_network_driver_status (void);
extern void service_network_driver_status (void);

/* ------------------------------------------------------------------------
 * Function:      event_econet_user_rpc()
 *
 * Description:   Econet user remote procedure event
 *
 * Input:         args - value of R1 on entry
 *                procedure - value of R2 on entry
 *                station - value of R3 on entry
 *                net - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x8.
 */

extern os_error *xevent_econet_user_rpc (byte const *args,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net);
extern void event_econet_user_rpc (byte const *args,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net);

/* ------------------------------------------------------------------------
 * Function:      event_econet_rx()
 *
 * Description:   Econet receive event
 *
 * Input:         rx_cb - value of R1 on entry
 *                status - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0xE.
 */

extern os_error *xevent_econet_rx (econet_rx_cb rx_cb,
      econet_status status);
extern void event_econet_rx (econet_rx_cb rx_cb,
      econet_status status);

/* ------------------------------------------------------------------------
 * Function:      event_econet_tx()
 *
 * Description:   Econet transmit event
 *
 * Input:         tx_cb - value of R1 on entry
 *                status - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0xF.
 */

extern os_error *xevent_econet_tx (econet_tx_cb tx_cb,
      econet_status status);
extern void event_econet_tx (econet_tx_cb tx_cb,
      econet_status status);

/* ------------------------------------------------------------------------
 * Function:      event_econet_os_proc()
 *
 * Description:   Econet OS remote procedure event
 *
 * Input:         args - value of R1 on entry
 *                procedure - value of R2 on entry
 *                station - value of R3 on entry
 *                net - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x10.
 */

extern os_error *xevent_econet_os_proc (byte const *args,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net);
extern void event_econet_os_proc (byte const *args,
      econet_immediate_os_procedure procedure,
      byte station,
      byte net);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
