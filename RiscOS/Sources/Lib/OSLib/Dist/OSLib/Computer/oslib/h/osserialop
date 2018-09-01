#ifndef osserialop_H
#define osserialop_H

/* C header file for OSSerialOp
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:43:53 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 29 June 1995
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
#undef  OS_SerialOp
#define OS_SerialOp                             0x57
#undef  XOS_SerialOp
#define XOS_SerialOp                            0x20057
#undef  OSSerialOp_Status
#define OSSerialOp_Status                       0x0
#undef  OSSerialOp_DataFormat
#define OSSerialOp_DataFormat                   0x1
#undef  OSSerialOp_Break
#define OSSerialOp_Break                        0x2
#undef  OSSerialOp_BPut
#define OSSerialOp_BPut                         0x3
#undef  OSSerialOp_BGet
#define OSSerialOp_BGet                         0x4
#undef  OSSerialOp_RxBaudRate
#define OSSerialOp_RxBaudRate                   0x5
#undef  OSSerialOp_TxBaudRate
#define OSSerialOp_TxBaudRate                   0x6
#undef  OSSerialOp_RxThreshold
#define OSSerialOp_RxThreshold                  0x8
#undef  OSSerialOp_EnumerateBaudRates
#define OSSerialOp_EnumerateBaudRates           0x9
#undef  SerialV
#define SerialV                                 0x24
#undef  Event_RS423Error
#define Event_RS423Error                        0x7

/********************
 * Type definitions *
 ********************/
typedef bits osserialop_rs423_status;

typedef bits osserialop_format_flags;

typedef int osserialop_baud_rate;

/************************
 * Constant definitions *
 ************************/
#define osserialop_RS423_PARITY_ERROR           ((osserialop_rs423_status) 0x20u)
#define osserialop_RS423_OVERRUN_ERROR          ((osserialop_rs423_status) 0x10u)
#define osserialop_RS423_FRAMING_ERROR          ((osserialop_rs423_status) 0x8u)
#define osserialop_DATA_FORMAT_WORD_SIZE        ((osserialop_format_flags) 0x3u)
#define osserialop_DATA_FORMAT_WORD_SIZE_SHIFT  0
#define osserialop_DATA_FORMAT_WORD_SIZE8_BIT   0
#define osserialop_DATA_FORMAT_WORD_SIZE7_BIT   1
#define osserialop_DATA_FORMAT_WORD_SIZE6_BIT   3
#define osserialop_DATA_FORMAT_EXTRA_STOP_BITS  ((osserialop_format_flags) 0x4u)
#define osserialop_DATA_FORMAT_PARITY_ENABLE    ((osserialop_format_flags) 0x8u)
#define osserialop_DATA_FORMAT_PARITY           ((osserialop_format_flags) 0x30u)
#define osserialop_DATA_FORMAT_PARITY_SHIFT     4
#define osserialop_DATA_FORMAT_PARITY_ODD       0
#define osserialop_DATA_FORMAT_PARITY_EVEN      1
#define osserialop_DATA_FORMAT_PARITY1          2
#define osserialop_DATA_FORMAT_PARITY0          3
#define osserialop_BAUD_RATE9600                ((osserialop_baud_rate) 0x7u)
#define osserialop_BAUD_RATE75                  ((osserialop_baud_rate) 0x1u)
#define osserialop_BAUD_RATE150                 ((osserialop_baud_rate) 0x2u)
#define osserialop_BAUD_RATE300                 ((osserialop_baud_rate) 0x3u)
#define osserialop_BAUD_RATE1200                ((osserialop_baud_rate) 0x4u)
#define osserialop_BAUD_RATE2400                ((osserialop_baud_rate) 0x5u)
#define osserialop_BAUD_RATE4800                ((osserialop_baud_rate) 0x6u)
#define osserialop_BAUD_RATE19200               ((osserialop_baud_rate) 0x8u)
#define osserialop_BAUD_RATE50                  ((osserialop_baud_rate) 0x9u)
#define osserialop_BAUD_RATE110                 ((osserialop_baud_rate) 0xAu)
#define osserialop_BAUD_RATE134PT5              ((osserialop_baud_rate) 0xBu)
#define osserialop_BAUD_RATE600                 ((osserialop_baud_rate) 0xCu)
#define osserialop_BAUD_RATE1800                ((osserialop_baud_rate) 0xDu)
#define osserialop_BAUD_RATE3600                ((osserialop_baud_rate) 0xEu)
#define osserialop_BAUD_RATE7200                ((osserialop_baud_rate) 0xFu)
#define osserialop_BAUD_RATE38400               ((osserialop_baud_rate) 0x10u)
#define osserialop_BAUD_RATE57600               ((osserialop_baud_rate) 0x11u)
#define osserialop_BAUD_RATE115200              ((osserialop_baud_rate) 0x12u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      osserialop_status()
 *
 * Description:   Reads/writes the serial status
 *
 * Input:         eor_mask - value of R1 on entry
 *                and_mask - value of R2 on entry
 *
 * Output:        old_value - value of R1 on exit (X version only)
 *                new_value - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x0.
 */

extern os_error *xosserialop_status (bits eor_mask,
      bits and_mask,
      bits *old_value,
      bits *new_value);
extern bits osserialop_status (bits eor_mask,
      bits and_mask,
      bits *new_value);

/* ------------------------------------------------------------------------
 * Function:      osserialop_data_format()
 *
 * Description:   Reads/writes the data format
 *
 * Input:         data_format - value of R1 on entry
 *
 * Output:        old_value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x1.
 */

extern os_error *xosserialop_data_format (osserialop_format_flags data_format,
      osserialop_format_flags *old_value);
extern osserialop_format_flags osserialop_data_format (osserialop_format_flags data_format);

/* ------------------------------------------------------------------------
 * Function:      osserialop_break()
 *
 * Description:   Sends a break
 *
 * Input:         period - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x2.
 */

extern os_error *xosserialop_break (int period);
extern void osserialop_break (int period);

/* ------------------------------------------------------------------------
 * Function:      osserialop_bput()
 *
 * Description:   Sends a byte
 *
 * Input:         c - value of R1 on entry
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x3.
 */

extern os_error *xosserialop_bput (byte c,
      bits *psr);
extern bits osserialop_bput (byte c);

/* ------------------------------------------------------------------------
 * Function:      osserialop_bget()
 *
 * Description:   Gets a byte from the serial buffer
 *
 * Output:        c - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x4.
 */

extern os_error *xosserialop_bget (byte *c,
      bits *psr);
extern bits osserialop_bget (byte *c);

/* ------------------------------------------------------------------------
 * Function:      osserialop_rx_baud_rate()
 *
 * Description:   Reads/writes the receive baud rate
 *
 * Input:         rx_rate - value of R1 on entry
 *
 * Output:        old_rx_rate - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x5.
 */

extern os_error *xosserialop_rx_baud_rate (osserialop_baud_rate rx_rate,
      osserialop_baud_rate *old_rx_rate);
extern osserialop_baud_rate osserialop_rx_baud_rate (osserialop_baud_rate rx_rate);

/* ------------------------------------------------------------------------
 * Function:      osserialop_tx_baud_rate()
 *
 * Description:   Reads/writes the transmit baud rate
 *
 * Input:         tx_rate - value of R1 on entry
 *
 * Output:        old_tx_rate - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x6.
 */

extern os_error *xosserialop_tx_baud_rate (osserialop_baud_rate tx_rate,
      osserialop_baud_rate *old_tx_rate);
extern osserialop_baud_rate osserialop_tx_baud_rate (osserialop_baud_rate tx_rate);

/* ------------------------------------------------------------------------
 * Function:      osserialop_rx_threshold()
 *
 * Description:   Sets the receive threshold - RISC O S 3.5+
 *
 * Input:         rx_threshold - value of R1 on entry
 *
 * Output:        old_rx_threshold - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x8.
 */

extern os_error *xosserialop_rx_threshold (bits rx_threshold,
      bits *old_rx_threshold);
extern bits osserialop_rx_threshold (bits rx_threshold);

/* ------------------------------------------------------------------------
 * Function:      osserialop_enumerate_baud_rates()
 *
 * Description:   Enumerates the available serial port speeds - RISC O S
 *                3.5+
 *
 * Output:        table - value of R1 on exit
 *                table_size - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x57 with R0 = 0x9.
 */

extern os_error *xosserialop_enumerate_baud_rates (int **table,
      int *table_size);
extern void osserialop_enumerate_baud_rates (int **table,
      int *table_size);

/* ------------------------------------------------------------------------
 * Function:      event_rs423_error()
 *
 * Description:   Calls reason code 7 of SWI 0x22
 *
 * Input:         status - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Other notes:   Before entry, R0 = 0x7.
 */

extern os_error *xevent_rs423_error (osserialop_rs423_status status,
      byte b);
extern void event_rs423_error (osserialop_rs423_status status,
      byte b);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
