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
/* configure.h
 *
 * Author: Jem Davies (Cambridge Systems Design)
 *
 * Description
 * ===========
 * Header file for routines to discover environment in which running
 *
 * Environment
 * ===========
 * Acorn RISC OS 3.11 or later.
 *
 * Compiler
 * ========
 * Acorn Archimedes C release 5.06 or later.
 *
 * Change record
 * =============
 *
 * JPD  Jem Davies (Cambridge Systems Design)
 *
 *
 * 20-Dec-94  10:24  JPD  Version 1.00
 * Created.
 *
 * 27-Feb-95  15:23  JPD  Version 1.01
 * Added checking of machine type for peek machine type. Moved
 * check_present() here.
 *
 * 21-Mar-95  11:12  JPD  Version 1.02
 * Added ignore_driver().
 *
 *
 **End of change record*
 */


/******************************************************************************/

extern int ignore_driver(struct dib *d, int dci_version);

/* Decide whether to ignore a DCI driver. Will do this is if a
 * point-to-point driver, or if too old.
 *
 * Parameters:
 *    d           : pointer to a driver information block structure
 *    dci_version : the DCI version supported by the device driver
 *
 * Returns:
 *    !0 => Ignore the driver
 *     0 => do NOT ignore
 */

/******************************************************************************/

extern int read_device_info(char *buf, char *module, int *net, int *noclock,
                                                                  int *segsize);
/* This returns information on the first DCI driver found
 *
 * Parameters:
 *    buf     : pointer to where to return the device name and number e.g. "en0"
 *    module  : pointer to where to return the module name, e.g. "Ether2"
 *    net     : pointer to where to return the local net number, -1 if not found
 *    noclock : pointer to where to return the clock status
 *    segsize : pointer to where to return the seg size
 *
 * Returns:
 *    the local station number
 */

/******************************************************************************/

extern int read_eco_info(int *net, int *noclock);

/* This returns information on the state of Econet
 *
 * Parameters:
 *    net     : pointer to where to return the net number
 *    noclock : pointer to where to return the module name
 *
 * Returns:
 *    the local station number
 */

/******************************************************************************/

extern int check_present(void);

/*
 * Check that the necessary modules (DCI driver and Internet) are present
 * and OK.
 *
 * Parameters:
 *    None
 *
 * Returns:
 *    !0 => present
 *     0 => not present
 */

/******************************************************************************/

extern void check_machine_type(void);

/* Find the machine type upon which we are running
 *
 * Parameters:
 *    None
 *
 * Returns:
 *    None
 */

/******************************************************************************/

/* EOF configure.h */
