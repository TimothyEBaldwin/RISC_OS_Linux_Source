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
/* File:    resf.h
 * Purpose: Resource file processing
 * Author:  Ian Johnson
 * History: 20-July-93: IDJ:   created
 *
 */
              
#ifndef __resf_h
#define __resf_h

#ifndef __Toolbox_h
#include "objects.toolbox.h"
#endif

#include "kernel.h"


typedef struct resf_resourcefile
{
        struct resf_resourcefile *next;
        ResourceFileHeader       *hdr;
        int                       module_swi;
} resf_ResourceFile;

typedef struct resf_template
{
        struct resf_template *next;
        ObjectTemplateHeader *hdr;
        int                   module_swi;
} resf_Template;



/* --- loading a Resource File --- */

extern _kernel_oserror *resf_load_resource_file (_kernel_swi_regs *r);

/*
 *   Entry:
 *         R0  =  flags
 *         R1  -> resource filename

 *   Exit:
 *        R0 = Pointer to Sprite area used.
 *
 */

/* --- finding a named template --- */

extern ObjectTemplateHeader *resf_find_template (char *name);

/*
 * Returns a pointer to the template header for a given named template
 *
 */

extern _kernel_oserror *resf_template_lookup (_kernel_swi_regs *r);
    /*
     * Function to lookup a given template and return a pointer to its
     * object header (to the client) - just uses the function resf_find_template.
     *
     */


/* --- removing resources and templates lists from a task --- */

extern void resf_remove_list (void);


/* --- loading module resources --- */

extern void resf_module_resources(void);

/*
 * Indicates that the next call to resf_load_resource_file should
 * not load into a task's resource list, but into a "private" list
 * for modules.
 */

extern void resf_module_swi(int swi_no);

/*
 * Sets swi no of object module currently loading its res file
 */

extern void resf_remove_module_resources (int module_swi);
   
/* 
 * Removes templates and res files for this object module
 */

#endif
