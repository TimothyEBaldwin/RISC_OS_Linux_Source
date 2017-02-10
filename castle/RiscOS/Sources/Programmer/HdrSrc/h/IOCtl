/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
/************************************************************************/
/* 	        Copyright 1999 Pace Micro Technology PLC                */
/*									*/
/*  This material is the confidential trade secret and proprietary	*/
/*  information of Pace Micro Technology. It may not be reproduced,     */
/*  used sold, or transferred to any third party without the prior      */
/*  written consent of Pace Micro Technology. All rights reserved.	*/
/*									*/
/*  This file is exported from HdrSrc in Sources/Programer/HdrSrc	*/
/* 									*/
/************************************************************************/

#ifndef __ioctl_h
#define __ioctl_h


/*
 * IOCtl groups
 */
#define IOCTL_GROUP_SERIAL   (0)
#define IOCTL_GROUP_PARALLEL (1)
#define IOCTL_GROUP_GENERIC  (255)


/*
 * IOCtl reason codes
 */

/* Serial - Group 0 */
#define IOCTL_SERIAL_BAUD          (1)
#define IOCTL_SERIAL_FORMAT        (2)
#define IOCTL_SERIAL_HANDSHAKE     (3)
#define IOCTL_SERIAL_BUFFER_SIZE   (4)
#define IOCTL_SERIAL_BUFFER_THRES  (5)
#define IOCTL_SERIAL_CTRL_LINES    (6)
#define IOCTL_SERIAL_FIFO_TRIG     (7)
#define IOCTL_SERIAL_READ_BAUDS    (8)
#define IOCTL_SERIAL_READ_BAUD     (9)
#define IOCTL_SERIAL_FLUSH_STREAM  (10)
#define IOCTL_SERIAL_READ_IR       (11)
#define IOCTL_SERIAL_SET_IR_STATUS (12)

/* Parallel - Group 1 */
#define IOCTL_PARALLEL_DEVICEID_SIZE (1) /* returns the size as an integer in data */
#define IOCTL_PARALLEL_DEVICEID_DATA (2) /* returns the size as an int, then the device id data
 			(excluding the size) as bytes into the memory following data */
#define IOCTL_PARALLEL_STATUS_BYTE   (3) /* returns the current status word for the parallel
                        device this contains the status of the output lines */

/* Generic - Group 255 */
#define IOCTL_GENERIC_NON_BLOCKING (1)
#define IOCTL_GENERIC_BUFFER_THRES (2)
#define IOCTL_GENERIC_FLUSH_STREAM (3)
#define IOCTL_GENERIC_SLEEP        (4)
#define IOCTL_GENERIC_TIMEOUT      (5)

/*
 * Struct to contain data forming an IOCtl
 */
typedef struct {
	unsigned int reason   : 16; /* ioctl reason code */
	unsigned int group    : 8;  /* ioctl group code */
	unsigned int reserved : 6;  /* should be zero */
	unsigned int read     : 1;  /* read flag */
	unsigned int write    : 1;  /* write flag */
	unsigned int data;          /* actual data */
} ioctl_t;

#endif
