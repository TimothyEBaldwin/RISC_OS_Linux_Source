#ifndef netprint_H
#define netprint_H

/* C header file for NetPrint
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
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
#undef  NetPrint_ReadPSNumber
#define NetPrint_ReadPSNumber                   0x40200
#undef  XNetPrint_ReadPSNumber
#define XNetPrint_ReadPSNumber                  0x60200
#undef  NetPrint_SetPSNumber
#define NetPrint_SetPSNumber                    0x40201
#undef  XNetPrint_SetPSNumber
#define XNetPrint_SetPSNumber                   0x60201
#undef  NetPrint_ReadPSName
#define NetPrint_ReadPSName                     0x40202
#undef  XNetPrint_ReadPSName
#define XNetPrint_ReadPSName                    0x60202
#undef  NetPrint_SetPSName
#define NetPrint_SetPSName                      0x40203
#undef  XNetPrint_SetPSName
#define XNetPrint_SetPSName                     0x60203
#undef  NetPrint_ReadPSTimeouts
#define NetPrint_ReadPSTimeouts                 0x40204
#undef  XNetPrint_ReadPSTimeouts
#define XNetPrint_ReadPSTimeouts                0x60204
#undef  NetPrint_SetPSTimeouts
#define NetPrint_SetPSTimeouts                  0x40205
#undef  XNetPrint_SetPSTimeouts
#define XNetPrint_SetPSTimeouts                 0x60205
#undef  NetPrint_BindPSName
#define NetPrint_BindPSName                     0x40206
#undef  XNetPrint_BindPSName
#define XNetPrint_BindPSName                    0x60206
#undef  NetPrint_ListServers
#define NetPrint_ListServers                    0x40207
#undef  XNetPrint_ListServers
#define XNetPrint_ListServers                   0x60207
#undef  NetPrintListServers_Brief
#define NetPrintListServers_Brief               0x0
#undef  NetPrintListServers_Name
#define NetPrintListServers_Name                0x1
#undef  NetPrintListServers_Full
#define NetPrintListServers_Full                0x2
#undef  NetPrint_ConvertStatusToString
#define NetPrint_ConvertStatusToString          0x40208
#undef  XNetPrint_ConvertStatusToString
#define XNetPrint_ConvertStatusToString         0x60208
#undef  Service_NetPrintCheckD1
#define Service_NetPrintCheckD1                 0x40200

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct netprint_brief_entry             netprint_brief_entry;
typedef struct netprint_name_entry              netprint_name_entry;
typedef struct netprint_full_entry              netprint_full_entry;

/********************
 * Type definitions *
 ********************/
typedef byte netprint_status;

struct netprint_brief_entry
   {  byte station_no;
      byte net_no;
      char ps_name [256];
   };

struct netprint_name_entry
   {  char ps_name [256];
   };

struct netprint_full_entry
   {  byte station_no;
      byte net_no;
      netprint_status status;
      byte status_station_no;
      byte status_net_no;
      char ps_name [256];
   };

/************************
 * Constant definitions *
 ************************/
#define netprint_PS_NAME_LIMIT                  256
#define netprint_STATUS_READY                   ((netprint_status) 0x0u)
#define netprint_STATUS_BUSY                    ((netprint_status) 0x1u)
#define netprint_STATUS_JAMMED                  ((netprint_status) 0x2u)
#define netprint_STATUS_OFFLINE                 ((netprint_status) 0x6u)
#define netprint_STATUS_OPEN                    ((netprint_status) 0x7u)
#define error_NET_PRINT_NAME_TOO_LONG           0x10C00u
      /*Printer name too long*/
#define error_NET_PRINT_SINGLE_STREAM           0x10C01u
      /*Printer in use*/
#define error_NET_PRINT_ALL_PRINTERS_BUSY       0x10C02u
      /*No free printer of this type*/
#define error_NET_PRINT_OFF_LINE                0x10C09u
      /*Printer offline*/
#define error_NET_PRINT_NOT_FOUND               0x10C0Au
      /*Printer server not found*/
#define error_NET_PRINT_INTERNAL_ERROR          0x10C0Bu
      /*Fatal internal error*/

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      netprint_read_ps_number()
 *
 * Description:   Returns the full station number of your current printer
 *                server
 *
 * Output:        station_no - value of R0 on exit
 *                net_no - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x40200.
 */

extern os_error *xnetprint_read_ps_number (byte *station_no,
      byte *net_no);
extern void netprint_read_ps_number (byte *station_no,
      byte *net_no);

/* ------------------------------------------------------------------------
 * Function:      netprint_set_ps_number()
 *
 * Description:   Sets the full station number used as the current printer
 *                server
 *
 * Input:         station_no - value of R0 on entry
 *                net_no - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x40201.
 */

extern os_error *xnetprint_set_ps_number (byte station_no,
      byte net_no);
__swi (0x40201) void netprint_set_ps_number (byte station_no,
      byte net_no);

/* ------------------------------------------------------------------------
 * Function:      netprint_read_ps_name()
 *
 * Description:   Reads the name of your current printer server
 *
 * Input:         buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40202.
 */

extern os_error *xnetprint_read_ps_name (char *buffer,
      int size,
      char **end);
extern char *netprint_read_ps_name (char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      netprint_set_ps_name()
 *
 * Description:   Sets by name the printer server used as your current one
 *
 * Input:         ps_name - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x40203.
 */

extern os_error *xnetprint_set_ps_name (char const *ps_name);
__swi (0x40203) void netprint_set_ps_name (char const *ps_name);

/* ------------------------------------------------------------------------
 * Function:      netprint_read_ps_timeouts()
 *
 * Description:   Reads the current values for timeouts used by NetPrint
 *
 * Output:        transmit_count - value of R0 on exit
 *                transmit_delay - value of R1 on exit
 *                peek_count - value of R2 on exit
 *                peek_delay - value of R3 on exit
 *                receive_delay - value of R4 on exit
 *                broadcast_delay - value of R5 on exit
 *
 * Other notes:   Calls SWI 0x40204.
 */

extern os_error *xnetprint_read_ps_timeouts (int *transmit_count,
      int *transmit_delay,
      int *peek_count,
      int *peek_delay,
      int *receive_delay,
      int *broadcast_delay);
extern void netprint_read_ps_timeouts (int *transmit_count,
      int *transmit_delay,
      int *peek_count,
      int *peek_delay,
      int *receive_delay,
      int *broadcast_delay);

/* ------------------------------------------------------------------------
 * Function:      netprint_set_ps_timeouts()
 *
 * Description:   Sets the current values for timeouts used by NetPrint
 *
 * Input:         transmit_count - value of R0 on entry
 *                transmit_delay - value of R1 on entry
 *                peek_count - value of R2 on entry
 *                peek_delay - value of R3 on entry
 *                receive_delay - value of R4 on entry
 *                broadcast_delay - value of R5 on entry
 *
 * Other notes:   Calls SWI 0x40205.
 */

extern os_error *xnetprint_set_ps_timeouts (int transmit_count,
      int transmit_delay,
      int peek_count,
      int peek_delay,
      int receive_delay,
      int broadcast_delay);
extern void netprint_set_ps_timeouts (int transmit_count,
      int transmit_delay,
      int peek_count,
      int peek_delay,
      int receive_delay,
      int broadcast_delay);

/* ------------------------------------------------------------------------
 * Function:      netprint_bind_ps_name()
 *
 * Description:   Converts a printer server's name to its address,
 *                providing it is free
 *
 * Input:         ps_name - value of R0 on entry
 *
 * Output:        station_no - value of R0 on exit
 *                net_no - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x40206.
 */

extern os_error *xnetprint_bind_ps_name (char const *ps_name,
      byte *station_no,
      byte *net_no);
extern void netprint_bind_ps_name (char const *ps_name,
      byte *station_no,
      byte *net_no);

/* ------------------------------------------------------------------------
 * Function:      netprintlistservers_brief()
 *
 * Description:   Returns the names and numbers of all printer servers
 *
 * Input:         entries - value of R1 on entry
 *                size - value of R2 on entry
 *                timeout - value of R3 on entry
 *
 * Output:        entry_count - value of R0 on exit
 *                no_more - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40207 with R0 = 0x0.
 */

extern os_error *xnetprintlistservers_brief (netprint_brief_entry *entries,
      int size,
      int timeout,
      int *entry_count,
      osbool *no_more);
extern osbool netprintlistservers_brief (netprint_brief_entry *entries,
      int size,
      int timeout,
      int *entry_count);

/* ------------------------------------------------------------------------
 * Function:      netprintlistservers_name()
 *
 * Description:   Returns the names of all printer servers, sorted, with
 *                duplicates removed
 *
 * Input:         entries - value of R1 on entry
 *                size - value of R2 on entry
 *                timeout - value of R3 on entry
 *
 * Output:        entry_count - value of R0 on exit
 *                no_more - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40207 with R0 = 0x1.
 */

extern os_error *xnetprintlistservers_name (netprint_name_entry *entries,
      int size,
      int timeout,
      int *entry_count,
      osbool *no_more);
extern osbool netprintlistservers_name (netprint_name_entry *entries,
      int size,
      int timeout,
      int *entry_count);

/* ------------------------------------------------------------------------
 * Function:      netprintlistservers_full()
 *
 * Description:   Returns the names, numbers and status of all printer
 *                servers
 *
 * Input:         entries - value of R1 on entry
 *                size - value of R2 on entry
 *                timeout - value of R3 on entry
 *
 * Output:        entry_count - value of R0 on exit
 *                no_more - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40207 with R0 = 0x2.
 */

extern os_error *xnetprintlistservers_full (netprint_full_entry *entries,
      int size,
      int timeout,
      int *entry_count,
      osbool *no_more);
extern osbool netprintlistservers_full (netprint_full_entry *entries,
      int size,
      int timeout,
      int *entry_count);

/* ------------------------------------------------------------------------
 * Function:      netprint_convert_status_to_string()
 *
 * Description:   Translates a status value returned by
 *                NetPrint_ListServers into the local language
 *
 * Input:         status_station_net - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40208.
 */

extern os_error *xnetprint_convert_status_to_string (bits const *status_station_net,
      char *buffer,
      int size,
      char **end);
extern char *netprint_convert_status_to_string (bits const *status_station_net,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      service_net_print_check_d1()
 *
 * Description:   Issued by NetPrint to determine if there is a local
 *                printer running
 *
 * Output:        unclaimed - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x40200.
 */

extern os_error *xservice_net_print_check_d1 (osbool *unclaimed);
extern void service_net_print_check_d1 (osbool *unclaimed);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
