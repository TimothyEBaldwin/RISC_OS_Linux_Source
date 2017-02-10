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
/* Title:   event.h
 * Purpose: system-independent central processing for window sytem events.
 *
 */

# ifndef __event_h
# define __event_h

# ifndef __menu_h
# include "menu.h"
# endif

# ifndef __wimp_h
# include "wimp.h"
# endif

#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif

/* ************************** Processing Events ************************* */

/* ---------------------------- event_process ------------------------------
 * Description:   Process one event.
 *
 * Parameters:    void.
 * Returns:       void.
 * Other Info:    If the number of current active windows is 0 then the
 *                program exits. One event is polled and processed (with
 *                the exception of some complex menu handling, this really
 *                means passing the event on to the "win" module).  Unless
 *                an application window is claiming idle events, this 
 *                function waits when processor is idle.
 *                Typically this should be called in a loop in the main
 *                function of the application.
 *
 */

void event_process(void);


/* ----------------------------- event_anywindows --------------------------
 * Description:   Informs caller if there are any windows active, that can
 *                process events.
 *
 * Parameters:    void.
 * Returns:       TRUE if there are any active windows.
 * Other Info:    None.
 *
 */

BOOL event_anywindows(void);



/* *************************** Attaching menus *************************** */

typedef int event_w;
typedef void (*event_menu_proc)(void *handle, char* hit);
typedef menu (*event_menu_maker)(void *handle);


/* -------------------------- event_attachmenu ----------------------------
 * Description:   Attach a menu, and its associated handler function, to the
 *                given window.
 *
 * Parameters:    event_w -- the window to which menu should be attached
 *                menu -- the menu structure
 *                event_menu_proc -- the handler for the menu
 *                void *handle -- caller-defined handle
 * Returns:       TRUE if able to attach menu.
 * Other Info:    The menu should have been created by a call to menu_new
 *                or something similar.  When user invokes a menu from the
 *                given window, this menu will be activated. The handler
 *                function will be called when the user selects a menu entry
 *                The handler's parameter "hit" is a string containing a 
 *                character for each level of nesting in a hierarchical menu
 *                structure, terminated by a 0 character. A call with 
 *                menu == 0 removes the attachment. NOTE: to catch menu 
 *                events on the iconbar attach a menu to win_ICONBAR
 *                (defined in the win module). 
 *                
 */
              
BOOL event_attachmenu(event_w, menu, event_menu_proc, void *handle);


/* ------------------------ event_attachmenumaker -------------------------
 * Description:   Attach to the given window, a function which makes a menu
 *                when the user invokes a menu
 *
 * Parameters:    event_w -- the window to which the menu maker should be
 *                           attached
 *                event_menu_maker -- the menu maker function
 *                event_menu_proc -- handler for the menu
 *                void *handle -- caller-defined handle
 * Returns:       TRUE if able to attach menu maker
 * Other Info:    This works similarly to event_attachmenu, except that it
 *                allows you to make any last minute changes to flags in the
 *                menu etc. (eg. ticks/fades), before displaying it. Call 
 *                with event_menu_maker==0 removes attachment
 *
 */

BOOL event_attachmenumaker(
      event_w, event_menu_maker, event_menu_proc, void *handle);


/* ----------------------- event_clear_current_menu ------------------------
 * Description:   Clears the current menu tree.
 *
 * Parameters:    void.
 * Returns:       void.
 * Other Info:    To be used when you are not sure that all menus have been
 *                cleared from the screen.
 *
 */

void event_clear_current_menu(void);



/* ------------------ event_is_menu_being_recreated ------------------------
 * Description:   Informs caller if a menu is being recreated.
 *
 * Parameters:    void.
 * Returns:       void.
 * Other Info:    Useful for when the RISC OS library is recreating a menu
 *                due to Adjust click (call it in your menu makers).
 *
 */

BOOL event_is_menu_being_recreated(void) ;


/* ***************************** masking off events ********************** */

/* ----------------------------- event_setmask -----------------------------
 * Description:   Sets the mask used by wimp_poll and wimpt_poll when polling
 *                the WIMP.
 *
 * Parameters:    wimp_emask mask - the desired mask.
 * Returns:       void
 * Other Info:    Bits of the mask are set if you want the corresponding
 *                events ignored (as in the wimp_poll SWI)
 *                eg. event_setmask(wimp_EMNULL | wimp_EMPTRENTER);
 *                will ignore nulls and pointer entering window events.
 *                NOTE: the default mask is to ignore null events only.
 *
 */

void event_setmask(wimp_emask mask);


/* --------------------------- event_getmask -------------------------------
 * Description:   Inform the caller of the current mask being used to poll
 *                the WIMP.
 *
 * Parameters:    void.
 * Returns:       The mask currently used.
 * Other Info:    none.
 *
 */

wimp_emask event_getmask(void);

#endif

/* end event.h */
