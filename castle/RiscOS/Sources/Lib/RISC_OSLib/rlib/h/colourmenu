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
 * Title: colourmenu.h
 * Purpose: create a wimp colour setting menu
 *
 */

# ifndef __colourmenu_h
# define __colourmenu_h
# ifndef __menu_h
# include "menu.h"
# endif

# ifndef BOOL
# define BOOL int
# define TRUE 1
# define FALSE 0
# endif


/* --------------------------- colourmenu_make ----------------------------
 * Description:   Creates a menu containing the 16 Wimp colours, with
 *                an optional "None" entry. Text in colour is written in
 *                black or white, depending on background.
 *
 * Parameters:    char *title      -- null-terminated string for menu title
 *                BOOL includeNone -- whether to include "None" entry
 * Returns:       On successful completion, pointer to created menu structure
 *                otherwise null.
 * Other Info:    Hits on this menu start from 1 as for other menus
 *                see menu module for details.
 */

menu colourmenu_make(char *title, BOOL includeNone);

#endif

/* end colourmenu.h */
