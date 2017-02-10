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
 * Title:   dboxquery.h
 * Purpose: display a dialogue box to ask a question, and get reply.
 *
 */

#ifndef __dboxquery_h
#define __dboxquery_h

/* ----------------------------- dboxquery --------------------------------
 * Description:   Displays a dialogue box, with YES and NO buttons, and a 
 *                question, and gets reply.
 *
 * Parameters:    char *question -- the question to be asked
 * Returns:       reply by user.
 * Other Info:    Question can be up to 120 chars long, 3 lines of 40 chars
 *                RETURN will reply "yes"; ESCAPE or CLOSE event will
 *                reply "cancel". Note: a call of dbox_query(0), will
 *                reserve space for the dbox and return with no display
 *                This will mean that space is always available for
 *                important things like asking to quit!!
 *                The template for the dialogue box should have the following
 *                attributes:
 *                   window flags -- moveable, auto-redraw
 *                                   Also advisable to have a title icon
 *                                   containing the name of your program
 *                                   (or other suitable text)
 *                   icon #1 -- the message icon -- should have indirected
 *                                                  text flag set, with
 *                                                  buton type "never"
 *                   icon #0 -- the "YES" icon --   should be text icon
 *                                                  with text string set to
 *                                                  "YES"; button type should
 *                                                  be "menu icon"
 *                   icon #2 -- the "NO" icon  --   should be text icon
 *                                                  with text string set to
 *                                                  "NO"; button type should
 *                                                  be "menu icon"
 *
 *                See "query" dialogue box in !Edit for an example.
 *
 */  
  

/* return type for dboxquery */

typedef enum
{
    dboxquery_YES = 1, 
    dboxquery_NO = 2,
    dboxquery_CANCEL = 3
} dboxquery_REPLY;


dboxquery_REPLY dboxquery(char *question);



/* ----------------------------- dboxquery_close --------------------------
 * Description:   Displays a dialogue box, with SAVE, DISCARD and CANCEL 
 *                buttons, and a question, and gets reply.
 *
 * Parameters:    char *question -- the question to be asked
 * Returns:       reply by user.
 * Other Info:    Question can be up to 120 chars long, 3 lines of 40 chars
 *                RETURN will reply SAVE; ESCAPE or CLOSE event will
 *                reply CANCEL. Note: a call of dboxquery_close(0), will
 *                reserve space for the dbox and return with no display
 *                The template for the dialogue box should have the following
 *                attributes:
 *                   window flags -- moveable, auto-redraw
 *                                   Also advisable to have a title icon
 *                                   containing the name of your program
 *                                   (or other suitable text)
 *                   icon #1 -- the message icon -- should have indirected
 *                                                  text flag set, with
 *                                                  buton type "never"
 *                   icon #0 -- the SAVE icon --    should be text icon
 *                                                  with text string set to
 *                                                  "SAVE"; button type should
 *                                                  be "menu icon"
 *                   icon #2 -- the "DISCARD" icon  --   should be text icon
 *                                                  with text string set to
 *                                                  "DISCARD"; button type 
 *                                                  should be "menu icon"
 *                   icon #3 -- the "CANCEL" icon   -- should be text icon
 *                                                  with text string set to
 *                                                  "CANCEL"; button type should
 *                                                  be "menu icon"
 *
 *                See "close" dialogue box in !Edit for an example.
 *
 */ 


/* return type for dboxquery_close */

typedef enum
{
    dboxquery_close_SAVE = 1,
    dboxquery_close_DISCARD = 2,
    dboxquery_close_CANCEL = 3
} dboxquery_close_REPLY;

dboxquery_close_REPLY dboxquery_close(char *question);


/* ----------------------------- dboxquery_quit ---------------------------
 * Description:   Displays a dialogue box, with DISCARD and CANCEL buttons, 
 *                and a question, and gets reply.
 *
 * Parameters:    char *question -- the question to be asked
 * Returns:       reply by user.
 * Other Info:    Question can be up to 120 chars long, 3 lines of 40 chars
 *                RETURN will reply "discard"; ESCAPE or CLOSE event will
 *                reply "cancel". Note: a call of dbox_query(0), will
 *                reserve space for the dbox and return with no display
 *                The template for the dialogue box should have the following
 *                attributes:
 *                   window flags -- moveable, auto-redraw
 *                                   Also advisable to have a title icon
 *                                   containing the name of your program
 *                                   (or other suitable text)
 *                   icon #1 -- the message icon -- should have indirected
 *                                                  text flag set, with
 *                                                  buton type "never"
 *                   icon #0 -- the DISCARD icon --   should be text icon
 *                                                  with text string set to
 *                                                  "DISCARD"; button type 
 *                                                  should be "menu icon"
 *                   icon #2 -- the CANCEL icon  --   should be text icon
 *                                                  with text string set to
 *                                                  "CANCEL"; button type 
 *                                                  should be "menu icon"
 *
 *                See "quit" dialogue box in !Edit for an example.
 *
 */ 


/* return type for dboxquery_quit */

typedef enum
{
    dboxquery_quit_DISCARD = 1,
    dboxquery_quit_CANCEL = 2
} dboxquery_quit_REPLY;

dboxquery_quit_REPLY dboxquery_quit(char *question);

#endif

/* end dboxquery.h */
