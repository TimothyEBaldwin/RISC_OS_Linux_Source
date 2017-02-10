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
/* File:    filters.h
 * Purpose: handling Wimp filters installed by clients of the Toolbox
 * Author:  Ian Johnson
 * History: 13-Sep-93: IDJ:   created
 *
 */

#ifndef __filters_h
#define __filters_h

#ifndef __Toolbox_h
#include "objects.toolbox.h"
#endif

#include "kernel.h"


typedef struct filters_postfilter
{
        struct filters_postfilter   *next;
        int                          type;
        int                          code;
        int                          swi_to_call;
        void                        *R2;
        ObjectClass                  class_id;
} filters_PostFilter;

typedef struct filters_prefilter
{
        struct filters_prefilter    *next;
        struct filters_prefilter    *prev;
        void                        *R2;
        int                          swi_to_call;
} filters_PreFilter;



extern void filters_remove_list (void);

/*********************************** object module SWIs ********************************/

extern _kernel_oserror *filters_register_postfilter (_kernel_swi_regs *r);

    /*
     *   Entry:
     *         R0  =  flags
     *                 bit 0 set means no longer interested in being called
     *                       by post-filter.
     *         R1  =  SWI number to be called by filter
     *                (0 => no longer interested in being called by filter
     *                 for these events, messages or Toolbox Events).
     *         R2  =  one-word value to be passed to the postfilter SWI in
     *                R2
     *         R3  =  filter type
     *                   1 => Wimp Events
     *                   2 => Wimp Messages
     *                   3 => Toolbox Events
     *         R4  =  -> list of pairs of Object Class identifier and either
     *                   Wimp event codes, Wimp message numbers, or Toolbox
     *                   Event codes depending on the value of R3.
     *
     *    Exit:
     *         R1-R9 preserved
     *
     */


extern _kernel_oserror *filters_register_prefilter (_kernel_swi_regs *r);

    /*
     *   Entry:
     *         R0  =  flags
     *                 bit 0 set means no longer interested in being called
     *                       by pre-filter.
     *         R1  =  SWI number to be called by filter
     *         R2  =  one-word value to be passed to the SWI (in R2)
     *
     *   Exit:
     *         R1-R9 preserved
     *
     */


/*********************************** filter veneers *******************************************/

extern void prefilter_veneer (void);
extern int  postfilter_veneer (void);

#endif
