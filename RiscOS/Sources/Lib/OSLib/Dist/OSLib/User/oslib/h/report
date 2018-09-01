#ifndef report_H
#define report_H

/* C header file for Report
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:58:43 2007
 * Philip Ludlam, philip@philipnet.com
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#ifndef os_H
#include "oslib/os.h"
#endif

#ifndef wimp_H
#include "oslib/wimp.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  Report_Text0
#define Report_Text0                            0x54C80
#undef  XReport_Text0
#define XReport_Text0                           0x74C80
#undef  Report_TextS
#define Report_TextS                            0x54C81
#undef  XReport_TextS
#define XReport_TextS                           0x74C81
#undef  Report_Regs
#define Report_Regs                             0x54C82
#undef  XReport_Regs
#define XReport_Regs                            0x74C82
#undef  Report_Registers
#define Report_Registers                        0x54C83
#undef  XReport_Registers
#define XReport_Registers                       0x74C83
#undef  Report_Where
#define Report_Where                            0x54C84
#undef  XReport_Where
#define XReport_Where                           0x74C84
#undef  Report_Poll
#define Report_Poll                             0x54C85
#undef  XReport_Poll
#define XReport_Poll                            0x74C85
#undef  Report_Dump
#define Report_Dump                             0x54C86
#undef  XReport_Dump
#define XReport_Dump                            0x74C86
#undef  Report_GetSwiRet
#define Report_GetSwiRet                        0x54C87
#undef  XReport_GetSwiRet
#define XReport_GetSwiRet                       0x74C87
#undef  Report_Quit
#define Report_Quit                             0x54C8A
#undef  XReport_Quit
#define XReport_Quit                            0x74C8A
#undef  Report_Clear
#define Report_Clear                            0x54C8B
#undef  XReport_Clear
#define XReport_Clear                           0x74C8B
#undef  Report_Open
#define Report_Open                             0x54C8C
#undef  XReport_Open
#define XReport_Open                            0x74C8C
#undef  Report_Close
#define Report_Close                            0x54C8D
#undef  XReport_Close
#define XReport_Close                           0x74C8D
#undef  Report_On
#define Report_On                               0x54C8E
#undef  XReport_On
#define XReport_On                              0x74C8E
#undef  Report_Off
#define Report_Off                              0x54C8F
#undef  XReport_Off
#define XReport_Off                             0x74C8F
#undef  Report_CmdOn
#define Report_CmdOn                            0x54C90
#undef  XReport_CmdOn
#define XReport_CmdOn                           0x74C90
#undef  Report_CmdOff
#define Report_CmdOff                           0x54C91
#undef  XReport_CmdOff
#define XReport_CmdOff                          0x74C91
#undef  Report_Hide
#define Report_Hide                             0x54C92
#undef  XReport_Hide
#define XReport_Hide                            0x74C92
#undef  Report_UnHide
#define Report_UnHide                           0x54C93
#undef  XReport_UnHide
#define XReport_UnHide                          0x74C93
#undef  Report_ErrOn
#define Report_ErrOn                            0x54C94
#undef  XReport_ErrOn
#define XReport_ErrOn                           0x74C94
#undef  Report_ErrOff
#define Report_ErrOff                           0x54C95
#undef  XReport_ErrOff
#define XReport_ErrOff                          0x74C95
#undef  Report_TaskOn
#define Report_TaskOn                           0x54C96
#undef  XReport_TaskOn
#define XReport_TaskOn                          0x74C96
#undef  Report_TaskOff
#define Report_TaskOff                          0x54C97
#undef  XReport_TaskOff
#define XReport_TaskOff                         0x74C97
#undef  Report_Vdu4On
#define Report_Vdu4On                           0x54C98
#undef  XReport_Vdu4On
#define XReport_Vdu4On                          0x74C98
#undef  Report_Vdu4Off
#define Report_Vdu4Off                          0x54C99
#undef  XReport_Vdu4Off
#define XReport_Vdu4Off                         0x74C99
#undef  Report_RmaOn
#define Report_RmaOn                            0x54C9A
#undef  XReport_RmaOn
#define XReport_RmaOn                           0x74C9A
#undef  Report_RmaOff
#define Report_RmaOff                           0x54C9B
#undef  XReport_RmaOff
#define XReport_RmaOff                          0x74C9B
#undef  Report_TimeOn
#define Report_TimeOn                           0x54C9C
#undef  XReport_TimeOn
#define XReport_TimeOn                          0x74C9C
#undef  Report_TimeOff
#define Report_TimeOff                          0x54C9D
#undef  XReport_TimeOff
#define XReport_TimeOff                         0x74C9D
#undef  Report_SrceOn
#define Report_SrceOn                           0x54C9E
#undef  XReport_SrceOn
#define XReport_SrceOn                          0x74C9E
#undef  Report_SrceOff
#define Report_SrceOff                          0x54C9F
#undef  XReport_SrceOff
#define XReport_SrceOff                         0x74C9F
#undef  Report_ObeyOn
#define Report_ObeyOn                           0x54CA0
#undef  XReport_ObeyOn
#define XReport_ObeyOn                          0x74CA0
#undef  Report_ObeyOff
#define Report_ObeyOff                          0x54CA1
#undef  XReport_ObeyOff
#define XReport_ObeyOff                         0x74CA1
#undef  Report_Push
#define Report_Push                             0x54CA2
#undef  XReport_Push
#define XReport_Push                            0x74CA2
#undef  Report_Pull
#define Report_Pull                             0x54CA3
#undef  XReport_Pull
#define XReport_Pull                            0x74CA3

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct report_registers_save_area       report_registers_save_area;

/********************
 * Type definitions *
 ********************/
struct report_registers_save_area
   {  int reg [16];
   };

typedef bits report_registers_flags;

/************************
 * Constant definitions *
 ************************/
#define report_REGISTERS_DISPLAY_R0             ((report_registers_flags) 0x1u)
#define report_REGISTERS_DISPLAY_R1             ((report_registers_flags) 0x2u)
#define report_REGISTERS_DISPLAY_R2             ((report_registers_flags) 0x4u)
#define report_REGISTERS_DISPLAY_R3             ((report_registers_flags) 0x8u)
#define report_REGISTERS_DISPLAY_R4             ((report_registers_flags) 0x10u)
#define report_REGISTERS_DISPLAY_R5             ((report_registers_flags) 0x20u)
#define report_REGISTERS_DISPLAY_R6             ((report_registers_flags) 0x40u)
#define report_REGISTERS_DISPLAY_R7             ((report_registers_flags) 0x80u)
#define report_REGISTERS_DISPLAY_R8             ((report_registers_flags) 0x100u)
#define report_REGISTERS_DISPLAY_R9             ((report_registers_flags) 0x200u)
#define report_REGISTERS_DISPLAY_R10            ((report_registers_flags) 0x400u)
#define report_REGISTERS_DISPLAY_R11            ((report_registers_flags) 0x800u)
#define report_REGISTERS_DISPLAY_R12            ((report_registers_flags) 0x1000u)
#define report_REGISTERS_DISPLAY_R13            ((report_registers_flags) 0x2000u)
#define report_REGISTERS_DISPLAY_R14            ((report_registers_flags) 0x4000u)
#define report_REGISTERS_DISPLAY_R15            ((report_registers_flags) 0x8000u)
#define report_REGISTERS_REGISTERS_ARE_STRINGS  ((report_registers_flags) 0x10000u)

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      report_text0()
 *
 * Description:   Displays the null terminated text
 *
 * Input:         text - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x54C80.
 */

extern os_error *xreport_text0 (char const *text);
__swi (0x54C80) void report_text0 (char const *text);

/* ------------------------------------------------------------------------
 * Function:      report_regs()
 *
 * Description:   Displays registers 0-8
 *
 * Other notes:   Calls SWI 0x54C82.
 */

extern os_error *xreport_regs (void);
__swi (0x54C82) void report_regs (void);

/* ------------------------------------------------------------------------
 * Function:      report_registers()
 *
 * Description:   Displays some or all of the registers
 *
 * Input:         heading - value of R0 on entry
 *                registers - value of R1 on entry
 *                flags - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x54C83.
 */

extern os_error *xreport_registers (char const *heading,
      report_registers_save_area const *registers,
      report_registers_flags flags);
__swi (0x54C83) void report_registers (char const *heading,
      report_registers_save_area const *registers,
      report_registers_flags flags);

/* ------------------------------------------------------------------------
 * Function:      report_where()
 *
 * Description:   Display processor Abort information
 *
 * Other notes:   Calls SWI 0x54C84.
 */

extern os_error *xreport_where (void);
__swi (0x54C84) void report_where (void);

/* ------------------------------------------------------------------------
 * Function:      report_poll()
 *
 * Description:   Display Wimp event number
 *
 * Input:         event - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x54C85.
 */

extern os_error *xreport_poll (wimp_event_no event);
__swi (0x54C85) void report_poll (wimp_event_no event);

/* ------------------------------------------------------------------------
 * Function:      report_dump()
 *
 * Description:   Display memory dump
 *
 * Input:         address - value of R0 on entry
 *                length - value of R1 on entry
 *                width - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x54C86.
 */

extern os_error *xreport_dump (byte const *address,
      int length,
      int width);
__swi (0x54C86) void report_dump (byte const *address,
      int length,
      int width);

/* ------------------------------------------------------------------------
 * Function:      report_quit()
 *
 * Description:   Quit Reporter
 *
 * Other notes:   Calls SWI 0x54C8A.
 */

extern os_error *xreport_quit (void);
__swi (0x54C8A) void report_quit (void);

/* ------------------------------------------------------------------------
 * Function:      report_clear()
 *
 * Description:   Clear Reporter's window
 *
 * Other notes:   Calls SWI 0x54C8B.
 */

extern os_error *xreport_clear (void);
__swi (0x54C8B) void report_clear (void);

/* ------------------------------------------------------------------------
 * Function:      report_open()
 *
 * Description:   Opens the Reporter window after it has been closed by
 *                Report_Close but not Report_Hide
 *
 * Other notes:   Calls SWI 0x54C8C.
 */

extern os_error *xreport_open (void);
__swi (0x54C8C) void report_open (void);

/* ------------------------------------------------------------------------
 * Function:      report_close()
 *
 * Description:   Closes Reporter's window
 *
 * Other notes:   Calls SWI 0x54C8D.
 */

extern os_error *xreport_close (void);
__swi (0x54C8D) void report_close (void);

/* ------------------------------------------------------------------------
 * Function:      report_on()
 *
 * Description:   Turn general reporting on
 *
 * Other notes:   Calls SWI 0x54C8E.
 */

extern os_error *xreport_on (void);
__swi (0x54C8E) void report_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_off()
 *
 * Description:   Turn general reporting off
 *
 * Other notes:   Calls SWI 0x54C8F.
 */

extern os_error *xreport_off (void);
__swi (0x54C8F) void report_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_cmd_on()
 *
 * Description:   Turn reporting of *commands on
 *
 * Other notes:   Calls SWI 0x54C90.
 */

extern os_error *xreport_cmd_on (void);
__swi (0x54C90) void report_cmd_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_cmd_off()
 *
 * Description:   Turn reporting of *commands off
 *
 * Other notes:   Calls SWI 0x54C91.
 */

extern os_error *xreport_cmd_off (void);
__swi (0x54C91) void report_cmd_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_hide()
 *
 * Description:   Closes Reporter's window more permanently than
 *                Report_Close
 *
 * Other notes:   Calls SWI 0x54C92.
 */

extern os_error *xreport_hide (void);
__swi (0x54C92) void report_hide (void);

/* ------------------------------------------------------------------------
 * Function:      report_un_hide()
 *
 * Description:   Opens Reporter's window after Report_Hide
 *
 * Other notes:   Calls SWI 0x54C93.
 */

extern os_error *xreport_un_hide (void);
__swi (0x54C93) void report_un_hide (void);

/* ------------------------------------------------------------------------
 * Function:      report_err_on()
 *
 * Description:   Turn reporting of errors on
 *
 * Other notes:   Calls SWI 0x54C94.
 */

extern os_error *xreport_err_on (void);
__swi (0x54C94) void report_err_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_err_off()
 *
 * Description:   Turn reporting of errors off
 *
 * Other notes:   Calls SWI 0x54C95.
 */

extern os_error *xreport_err_off (void);
__swi (0x54C95) void report_err_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_task_on()
 *
 * Description:   Turn reporting of task init/close on
 *
 * Other notes:   Calls SWI 0x54C96.
 */

extern os_error *xreport_task_on (void);
__swi (0x54C96) void report_task_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_task_off()
 *
 * Description:   Turn reporting of task init/close off
 *
 * Other notes:   Calls SWI 0x54C97.
 */

extern os_error *xreport_task_off (void);
__swi (0x54C97) void report_task_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_vdu4_on()
 *
 * Description:   Turn reporting of VDU4 output on
 *
 * Other notes:   Calls SWI 0x54C98.
 */

extern os_error *xreport_vdu4_on (void);
__swi (0x54C98) void report_vdu4_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_vdu4_off()
 *
 * Description:   Turn reporting of VDU4 output off
 *
 * Other notes:   Calls SWI 0x54C99.
 */

extern os_error *xreport_vdu4_off (void);
__swi (0x54C99) void report_vdu4_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_rma_on()
 *
 * Description:   Turn reporting of RMA storage on
 *
 * Other notes:   Calls SWI 0x54C9A.
 */

extern os_error *xreport_rma_on (void);
__swi (0x54C9A) void report_rma_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_rma_off()
 *
 * Description:   Turn reporting of RMA storage off
 *
 * Other notes:   Calls SWI 0x54C9B.
 */

extern os_error *xreport_rma_off (void);
__swi (0x54C9B) void report_rma_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_time_on()
 *
 * Description:   Add Timestamp to Reported Commands
 *
 * Other notes:   Calls SWI 0x54C9C.
 */

extern os_error *xreport_time_on (void);
__swi (0x54C9C) void report_time_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_time_off()
 *
 * Description:   Remove Timestamp from Reported Commands
 *
 * Other notes:   Calls SWI 0x54C9D.
 */

extern os_error *xreport_time_off (void);
__swi (0x54C9D) void report_time_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_srce_on()
 *
 * Description:   Add Source to Reported Commands
 *
 * Other notes:   Calls SWI 0x54C9E.
 */

extern os_error *xreport_srce_on (void);
__swi (0x54C9E) void report_srce_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_srce_off()
 *
 * Description:   Remove Source from Reported Commands
 *
 * Other notes:   Calls SWI 0x54C9F.
 */

extern os_error *xreport_srce_off (void);
__swi (0x54C9F) void report_srce_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_obey_on()
 *
 * Description:   Report only Obey commands
 *
 * Other notes:   Calls SWI 0x54CA0.
 */

extern os_error *xreport_obey_on (void);
__swi (0x54CA0) void report_obey_on (void);

/* ------------------------------------------------------------------------
 * Function:      report_obey_off()
 *
 * Description:   Report all Commands
 *
 * Other notes:   Calls SWI 0x54CA1.
 */

extern os_error *xreport_obey_off (void);
__swi (0x54CA1) void report_obey_off (void);

/* ------------------------------------------------------------------------
 * Function:      report_push()
 *
 * Description:   Store Reporter Status
 *
 * Other notes:   Calls SWI 0x54CA2.
 */

extern os_error *xreport_push (void);
__swi (0x54CA2) void report_push (void);

/* ------------------------------------------------------------------------
 * Function:      report_pull()
 *
 * Description:   Restore Reporter Status
 *
 * Other notes:   Calls SWI 0x54CA3.
 */

extern os_error *xreport_pull (void);
__swi (0x54CA3) void report_pull (void);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#endif
