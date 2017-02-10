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
/* -> h.taskwin
 * Title: TaskWindow
 * Purpose: Message protocol definition for task
            communication in task windows.
 * History:
 *   16-May-88: JGT: history started.
 */

#ifndef taskwin_h
#define taskwin_h

#define TaskModuleSWI 0x808C0
typedef enum {
message_input   = TaskModuleSWI,     /* Parent has input for child */
message_output  = TaskModuleSWI + 1, /* Child has output for parent */
message_ego     = TaskModuleSWI + 2, /* Child tells parent its name */
message_morio   = TaskModuleSWI + 3, /* Child dies */
message_morite  = TaskModuleSWI + 4, /* Parent kills child */
message_newtask = TaskModuleSWI + 5, /* External agent requests task window */
message_suspend = TaskModuleSWI + 6, /* Parent halts child */
message_resume  = TaskModuleSWI + 7  /* Parent continues child */
} message_action;
/* This will appear in place of the wimp_msgaction in wimp_msghdr */

typedef struct
{
int    size;
char * data;
} message_data;
/* This will appear in the data field of wimp_msgstr */

extern os_error * message_taskinit(
char *   name,   /* The * comand to start the task, and its parameters */
wimp_t   me);    /* My task handle, passed to the task in STR$~ form */

extern void message_taskwindow(char * comname);

extern void killalltasks(void);

extern void message_init(void);

#endif

/* End taskwin.h */
