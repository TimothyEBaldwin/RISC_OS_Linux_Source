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
 * Title:    template.h
 * Purpose:  template file management
 *
 */

/*
 * This file contains functions used for loading/manipulating templates
 * (typically set up using the template editor). The templates are assumed
 * to be held in a file "Templates" in the application's directory.
 * The dialogue box module of the "wimp" library, uses these templates when
 * creating dialogue boxes.
 *
 */

#ifndef __template_h
#define __template_h

#ifndef BOOL
#define BOOL int
#define TRUE 1
#define FALSE 0
#endif

typedef  struct template__str 
{
  struct template__str *next;
  char * workspace;
  int workspacesize;
  char *font;
  char name[12];
  wimp_wind window;
} template;


/* ----------------------------- template_copy -----------------------------
 * Description:   Create a copy of a template.
 *
 * Parameters:    template *from -- the original template
 * Returns:       a pointer to a copy of "from".
 * Other Info:    Copying also includes fixing up pointers into workspace for
 *                indirected icons/title.  Also includes allocation of this
 *                space.
 *
 */

template *template_copy (template *from);


/* -------------------------- template_readfile ----------------------------
 * Description:   Reads the template file into a linked list of templates.
 *
 * Parameters:    char *name -- name of template file
 * Other Info:    Note that a call is made to resspr_area(), in order to
 *                fix up a window's sprite pointers, so you must have 
 *                already called resspr_init.
 *
 */

#define template_readfile(s) template_init()


/* ----------------------------- template_find -----------------------------
 * Description:   Finds a named template in the template list.
 *
 * Parameters:    char *name -- the name of the template (as given in FormEd)
 * Returns:       a pointer to the found template.
 * Other Info:    none.
 *
 */
                
template *template_find(char *name);


/* ---------------------------- template_loaded ----------------------------
 * Description:   Sees if there is anything in the template list.
 *
 * Parameters:    void
 * Returns:       Non-zero if there is something in the template list.
 * Other Info:    none.
 *
 */

BOOL template_loaded(void);


/* ---------------------------- template_use_fancyfonts --------------------
 * Description:   Provides a font usage array for loading templates which
 *                use fonts other than 'system font'
 *
 * Parameters:    void.
 * Returns:       void.
 * Other Info:    This function should be called once BEFORE template_init.
 *                It allocates a font usage array, which it uses to 'lose'
 *                any fancy fonts used, when your program exits.
 *                It installs a C exit handler to do this.
 *                This function is useful if your dialogue boxes use fonts
 *                other than system font.
 *
 */

void template_use_fancyfonts(void);

 
/* ---------------------------- template_init ------------------------------
 * Description:   Initialise ready for use of templates.
 *
 * Parameters:                             
 * Returns:       void.
 * Other Info:    Should be called before any ops which use templates
 *                (eg dialogue box creation).
 *                The amount of space used is optimised to be the least
 *                possible.
 *
 */

void  template_init(void);


/* --------------------------- template_syshandle --------------------------
 * Description:   Get a pointer to the underlying window used to create a
 *                template.
 *
 * Parameters:    char *templatename.
 * Returns:       Pointer to template's underlying window (0 if template
 *                not found).
 * Other Info:    Any changes made to the wimp_wind structure will affect
 *                future windows generated using this template.
 *
 */

wimp_wind *template_syshandle(char *name);
 
#endif

/* end template.h */
