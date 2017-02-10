/*---------------------------------------------------------------------------*/
/* File:    module.c                                                         */
/* Purpose: Module code for ScrSaver module.                                 */
/* Author:  Original author unknown.                                         */
/*          Ursula changes - Richard Leggett                                 */
/* History: xx-xxx-97: xxx: Created.                                         */
/*          17-Nov-97: RML: Taken from NCOS sources for Ursula RISC OS.      */
/*                          Added code to check if in desktop and if         */
/*                          <ScrSaver$Dir> set, before claiming Service_     */
/*                          ScreenBlanking.                                  */
/*          26-Nov-97: RML: Added check if printer is in use.                */
/*          20-Mar-98: RML: Added check of ScrSaver$Running. If set, don't   */
/*                          claim Service_ScreenBlanking, but unset          */
/*                          ScrSaver$Running.                                */
/*          23-Mar-98: RML: If ScrSaver$Running is set, we ignore it if more */
/*                          than blanktime + error has elapsed since screen  */
/*                          was last restored.                               */
/*          24-Mar-98: RML: Added check of ScrSaver$MinMem before running.   */
/*                          Changed ScrSaver$Path to ScrSaver$Dir.           */
/*                                                                           */
/* Copyright © 1998 Acorn Computers Ltd., Cambridge, UK.                     */
/*---------------------------------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include "swis.h"
#include "kernel.h"
#include "module.h"

static int poll_word;
static int force_dpms;
static int restore_time = 0;
static int blanking_time;

/*---------------------------------------------------------------------------*
 * read_time                                                                 *
 *                                                                           *
 * Read the centisecond timer.                                               *
 *                                                                           *
 * In: Nothing.                                                              *
 *                                                                           *
 * Out: Returns timer value.                                                 *
 *---------------------------------------------------------------------------*/

static int read_time(void)
{
    _kernel_swi_regs r;

    _kernel_swi(OS_ReadMonotonicTime, &r, &r);

    return r.r[0];
}


/*---------------------------------------------------------------------------*
 * safe_to_claim_blanking                                                    *
 *                                                                           *
 * Decide if it's safe to claim Service_ScreenBlanking:                      *
 *                                                                           *
 * In: Nothing.                                                              *
 *                                                                           *
 * Out: 1 means safte to claim, 0 means don't claim.                         *
 *---------------------------------------------------------------------------*/

static int safe_to_claim_blanking(void)
{
    _kernel_swi_regs r;
    _kernel_oserror *e;
    char dir[] = "ScrSaver$Dir";
    char mem[] = "ScrSaver$MinMem";
    int buffer[4];

    /* Are we forcing the DPMS blanker? */
    if (force_dpms) return FALSE;
  
    /* Check if <ScrSaver$Dir> is set */
    r.r[0] = (int)dir;
    r.r[1] = 0;
    r.r[2] = -1;
    r.r[3] = 0;
    r.r[4] = 0;
    _kernel_swi(OS_ReadVarVal, &r, &r);
    if (r.r[2]==0) return FALSE;
  
    /* Check if we're in the desktop */
    r.r[0] = 3;
    _kernel_swi(Wimp_ReadSysInfo, &r, &r);
    if (r.r[0]==0) return FALSE;
  
    /* Check if there's a print job on */
    e = _kernel_swi(PDriver_CurrentJob, &r, &r);
    if ((!e) && (r.r[0]!=0)) return FALSE;
  
    /* Check we've got enough memory via ScrSaver$MinMem */
    r.r[0] = (int)mem;
    r.r[1] = (int)buffer;
    r.r[2] = -1;
    r.r[3] = 0;
    r.r[4] = 0;
    _kernel_swi(OS_ReadVarVal, &r, &r);
    
    if (r.r[4]==1)  /* If ScrSaver$MinMem exists */
    {
        /* Find value */
        r.r[0] = (int)mem;
        r.r[1] = (int)buffer;
        r.r[2] = 16;
        r.r[3] = 0;
        r.r[4] = 0;
        _kernel_swi(OS_ReadVarVal, &r, &r);
        
        /* Read free memory */
        r.r[0] = -1;
        r.r[1] = -1;
        _kernel_swi(Wimp_SlotSize, &r, &r);
        
        /* Check if enough memory to run screen saver */
        /* We check for MinMem + 16K */
        if ( (r.r[2] / 1024) < (buffer[0] + 16) ) return FALSE;
    }
  
    return TRUE;
}


/*---------------------------------------------------------------------------*
 * only_just_restored                                                        *
 *                                                                           *
 * Decide if the screen has only just been restored.                         *
 *---------------------------------------------------------------------------*/

static int only_just_restored(void)
{
    _kernel_swi_regs r;

    blanking_time = read_time();
    
    r.r[0] = 5;
    _kernel_swi(ScreenBlanker_Control, &r, &r);

    /* If the time now is < or = to the time we last restored the screen
       plus the blanktime, plus a half second error, then we have
       'only just restored' the screen. */
    if (blanking_time > (restore_time + r.r[1] + 50)) return FALSE;
    
    return TRUE;
}


/*---------------------------------------------------------------------------*
 * unset_saver_running                                                       *
 *                                                                           *
 * Unset system variable ScrSaver$Running.                                   *
 *---------------------------------------------------------------------------*/

static void unset_saver_running(void)
{
    _kernel_swi_regs r;
    char varname[] = "ScrSaver$Running";
  
    r.r[0] = (int)varname;
    r.r[1] = 0;
    r.r[2] = -1;
    r.r[3] = 0;
    r.r[4] = 0;
    _kernel_swi(OS_SetVarVal, &r, &r);
}


/*---------------------------------------------------------------------------*
 * check_saver_running                                                       *
 *                                                                           *
 * Check if system variable ScrSaver$Running exists.                         *
 *---------------------------------------------------------------------------*/

static int check_saver_running(void)
{
    _kernel_swi_regs r;
    char varname[] = "ScrSaver$Running";
  
    r.r[0] = (int)varname;
    r.r[1] = 0;
    r.r[2] = -1;
    r.r[3] = 0;
    r.r[4] = 0;
    _kernel_swi(OS_ReadVarVal, &r, &r);
  
    if (r.r[2]==0) return FALSE;
      
    return TRUE;
}


/*---------------------------------------------------------------------------*
 * blank_screen                                                              *
 *                                                                           *
 * Launch the blanker application.                                           *
 *---------------------------------------------------------------------------*/

static void blank_screen(void)
{
    _kernel_swi_regs r;
    char cmd[256];

    /* Set value of Poll Word to 0 */
    poll_word = 0;
    
    /* Run Basic App */
    sprintf(cmd, "Run <ScrSaver$Dir>.!Run %d", (int) &poll_word);
    r.r[0] = (int) cmd;
    r.r[1] = 0;
    _kernel_swi(TaskManager_StartTask, &r, &r);
}


/*---------------------------------------------------------------------------*
 * module_initialise                                                         *
 *                                                                           *
 * Module initialisation entry point.                                        *
 *---------------------------------------------------------------------------*/

_kernel_oserror *module_initialise( char *cmd_tail, int podule_base, void *pw )
{
    return 0;
  
    NOT_USED( cmd_tail );
    NOT_USED( podule_base );
    NOT_USED( pw );
}


/*---------------------------------------------------------------------------*
 * module_service                                                            *
 *                                                                           *
 * Module service call entry point.                                          *
 *---------------------------------------------------------------------------*/

void module_service( int service_no, _kernel_swi_regs *r, void *pw )
{
    force_dpms = 0;

    /* Deal with Service_ScreenBlanking */
    if ( service_no == Service_ScreenBlanking )
    {
        if (check_saver_running())
        {
            /* If ScrSaver$Running is set... */
            unset_saver_running();
            
            /* If ScrSaver$Running is set AND we've only recently restored
               the screen (ie. within blanktime + 0.5 secs), then we assume
               a WIMP error forced the screen to be restored last time, so
               force the DPMS saver this time. */
            if (only_just_restored()) force_dpms = 1;
            else force_dpms = 0;
        }
        
        if (safe_to_claim_blanking())
        {
            /* Claim the service call */
            blank_screen();
            r->r[1] = 0;
        }
    }
  
    /* Deal with Service_ScreenRestored */
    if ( service_no == Service_ScreenRestored )
    {
        restore_time = read_time();
        poll_word = 1;                 /* Set value of Poll Word to 1 */
    }
         
    NOT_USED( pw );
}
