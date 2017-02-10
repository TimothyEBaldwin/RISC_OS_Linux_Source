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
 * Title: fontlist.h
 * Purpose: Routines to enumerate the fonts on the system into a tree structure
 *
 */

#ifndef __fontlist_h
#define __fontlist_h

/* -------------------------------------------------- */
/* Structures required */
/* -------------------------------------------------- */
typedef struct fontlist_node
{
        char                    name[40];
        struct fontlist_node     *son;
        struct fontlist_node     *brother;
        int                     flag;
} fontlist_node;

/* As an example of a font tree structure, consider
        Corpus.Medium, Corpus.Bold, Selwyn,
        Trinity.Medium, Trinity.Bold, Trinity.Medium.Italic,
        Widget.Medium.Italic.Outline
 This will be stored in the following way: (#'s denote flags which are TRUE)
 --+-->   Corpus   --+--> # Medium
   |                 |
   |                 +--> # Bold
   |
   +--> # Selwyn
   |
   +-->   Trinity  --+--> # Medium   -----> # Italic
   |                 |
   |                 +--> # Bold
   |
   +-->   Widget   --+-->   Medium   -----> # Italic.Outline

[ Brothers are connected vertically downwards, sons to their parents
right-to-left ]
*/

/* -------------------------------------------------- */
/* Globals defined */
/* -------------------------------------------------- */
extern  fontlist_node *font__tree;



/* --------------------------- fontlist_list_all_fonts -----------------------------
 * Description:   Read in the font list into a font tree
 *
 * Parameters:    BOOL system -- TRUE if System font should be included in the list
 * Returns:       a pointer to the start of the font tree
 * Other Info:
 */
fontlist_node *fontlist_list_all_fonts( BOOL system );                                         



/* --------------------------- fontlist_free_font_tree -----------------------------
 * Description:   Free a font tree
 *
 * Parameters:    fontlist_node *font_tree -- the font tree to free
 * Returns:       
 * Other Info:
 */
void fontlist_free_font_tree( fontlist_node *font_tree );


#endif


/* end fontlist.h */
