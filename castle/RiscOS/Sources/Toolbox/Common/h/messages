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
/* File:    messages.h
 * Purpose: accessing an Object modules messages file (inc error reporting)
 * Author:  Timothy Roddis
 * History: 24-Jan-94: IDJ: created from original TGR sources
 */

#include "kernel.h"

#ifndef __toolbox_h
#include "objects/toolbox.h"
#endif


/* ------------------------------------ raising errors ---------------------------------------- */


extern _kernel_oserror *make_error (int err_num, int num_args, ...);
   /*
    * Generate a RISC OS error block.
    */



extern _kernel_oserror *make_error_hex (int err_num, int num_args, ...);
   /*
    * Generate a RISC OS error block, with integer params printed in hex.
    */



extern void raise_toolbox_error (int err_num, ObjectID object_id, ComponentID component_id, int num_args, ...);
   /*
    * Raise a Toolbox_Error event
    */



extern void raise_toolbox_error_hex (int err_num, ObjectID object_id, ComponentID component_id, int num_args, ...);
   /*
    * Raise a Toolbox_Error event, with integer parameters printed in hex
    */



extern void raise_toolbox_oserror (_kernel_oserror *e, ObjectID object_id, ComponentID component_id);
   /*
    * Raise a Toolbox_Error event, given a RISC OS error block
    */



/* --------------------------------------- message file handling ------------------------------ */


extern _kernel_oserror *messages_file_open (char *messages_filename);
    /*
     * Open the module's messages file (and cache file descriptor)
     */



extern _kernel_oserror *messages_file_close (void);
    /*
     * Close the module's messages file
     */



extern _kernel_oserror *messages_file_lookup (char *token, char *buffer, int *buffer_size, int num_args, ...);
    /*
     * Lookup given token in message file.
     * Result is placed in buffer, unless buffer == NULL, in which case
     * the size of buffer required is returned in *buffer_size
     */
