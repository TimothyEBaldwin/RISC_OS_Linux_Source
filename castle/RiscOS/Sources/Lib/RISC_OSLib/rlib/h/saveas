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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/

/* Title:   saveas.h
 * Purpose: export of data by dragging icon from dialogue box
 *
 */

#ifndef __saveas_h
#define __saveas_h

#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif

#ifndef __xfersend_h
#include "xfersend.h"
#endif

/* ----------------------------- saveas -------------------------------------
 * Description:   Displays a dialogue box, for the user to export application
 *                data.
 *
 * Parameters:    int filetype -- type of file to save to
 *                char *name -- suggested file name
 *                int estsize -- estimated size of the file
 *                xfersend_saveproc -- caller-supplied function for saving
 *                                     application data to a file
 *                xfersend_sendproc -- caller-supplied function for RAM
 *                                     data transfer (if application is able
 *                                     to do this)
 *                xfersend_printproc -- caller-supplied function for printing
 *                                      application data, if "save icon" is
 *                                      dragged onto printer application
 *                void *handle -- handle to be passed to handler functions
 * Returns:       TRUE if data exported successfully.
 * Other Info:    This function displays a dialogue box with the following
 *                fields:
 *                     i) a sprite icon appropriate to the given file type
 *                    ii) the suggested filename
 *                   iii) an OK button
 *                (Note: a template called "xfer_send" must be in the
 *                application's templates file to use this function, set up
 *                as in the !Edit, !Draw and !Paint applications)
 *                Xfersend deals with the complexities of message-passing
 *                protocols to achieve the data transfer. Refer to the
 *                typedefs in xfersend.h for an explanation of what the
 *                three caller-supplied functions should do.
 *                If you pass 0 as the xfersend_sendproc, then no in-core
 *                data transfer will be attempted
 *                If you pass 0 as the xfersend_printproc, then the file
 *                format for printing is assumed to be the same as for saving
 *                The estimated file size is not essential, but may improve
 *                performance.
 *
 */
  
BOOL saveas(int filetype, char *name, int estsize,
            xfersend_saveproc, xfersend_sendproc, xfersend_printproc,
            void *handle);


/* ----------------------- saveas_read_leafname_during_send -----------------
 * Description:   Gets the "leaf" of the file name in the "filename" field
 *                of the "xfer-send" dialogue box.
 *
 * Parameters:    char *name -- buffer to put file name in
 *                int length -- size in bytes of supplied buffer
 * Returns:       void.
 * Other Info:    none.
 *
 */

void saveas_read_leafname_during_send(char *name, int length);

#endif

/* end saveas.h */
