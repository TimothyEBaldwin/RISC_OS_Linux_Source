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

/*
 * Title:    msgs.h
 * Purpose:  provide support for messages resource file
 *           (Use this to make your applications "internationalisable!")
 *
 */

#ifndef __msgs_h
#define __msgs_h

#ifndef BOOL
  #define BOOL int
  #define TRUE 1
  #define FALSE 0
#endif

#define msgs_TAG_MAX  10 /*max length of a tag in characters*/
#define msgs_MSG_MAX 255 /*max length of a message*/
#define msgs_VARIANT_MAX 8 /*max no of tags for a single message*/

/* ------------------- msgs_main_control_block --------------------------
 * Description:   Provide access to the MessageTrans control block used
 *                to access the main message file.
 * 
 * Parameters:    void
 * Returns:       a pointer to the control block
 */

extern struct msgtrans_control_block *msgs_main_control_block (void);

/* ------------------- msgs_default_control_block --------------------------
 * Description:   Provide access to the MessageTrans control block used
 *                to access RISC_OSLib's messages file
 * 
 * Parameters:    void
 * Returns:       a pointer to the control block
 */

extern struct msgtrans_control_block *msgs_default_control_block (void);

/* ---------------------------- msgs_init ----------------------------------
 * Description:   Read in the messages file, and initialise msg system
 * 
 * Parameters:    void
 * Returns:       void.
 * Other Info:    the messages file is a resource of your application and
 *                should be named "Messages".  Each line of this file is a
 *                message with the following format:
 *                      <tags><colon><message text><newline>
 *                where <tags> is a series of alphanumeric identifiers for
 *                the message, separated by '/' characters. These are
 *                used to search for the message, when using msgs_lookup().
 */

void msgs_init(void);


/* ---------------------------- msgs_lookup --------------------------------
 * Description:   Find the text message associated with a given tag.
 *
 * Parameters:    char * tag_and_default -- the tag of the message, and
 *                                          an optional default message (to
 *                                          be used if tagged message not
 *                                          found).
 * Returns:       pointer to the message text (if all is well)
 * Other Info:    If the caller just supplies a tag, he will receive a 
 *                pointer to its associated message (if found). A default
 *                message can be given after the tag (separated by a colon)
 *                Typical use would be:
 *                      werr(1, msgs_lookup("error1"))
 *                or    werr(1, msgs_lookup("error1:Not enough memory").
 *
 */

char *msgs_lookup(char *tag_and_default);

/* ---------------------------- msgs_readfile ------------------------------
 * Description:   Read in the messages file, and initialise msg system
 * 
 * Parameters:    char *name -- the name of the messages file to be read.
 * Returns:       void.
 * Other Info:    the messages file is a resource of your application and
 *                should normally be named "Messages".  For non-standard
 *                applications this call has been provided to enable
 *                the messages file to be read from elsewhere.  Each line
 *                of this file is a message with the following format:
 *                      <tag><colon><message text><newline>
 *                The tag is an alphanumeric identifier for the message, 
 *                which will be used to search for the message, when using
 *                msgs_lookup().
 *
 */

#define msgs_readfile(s) msgs_init()

#endif

/* end msgs.h */

