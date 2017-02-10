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
/* > main.h

 * © SJ Middleton, 1995

 */

#ifndef __main_h
# define __main_h

/* From main.c */

extern os_error *toolaction_final (int fatal, int podule, void *pw);
extern os_error *toolaction_init(char *cmd_tail, int podule_base, void *pw);
extern os_error *toolaction_SWI_handler(int swi_no, os_register_block *r, void *pw);
extern os_error *toolaction_commands(char *arg_string, int argc, int cmd_no, void *pw);
extern void toolaction_services(int service_number, os_register_block *r, void *pw);

#endif

/* eof main.h */
