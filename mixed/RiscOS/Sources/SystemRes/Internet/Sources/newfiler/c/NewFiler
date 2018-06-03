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
/*
 * NewFiler 0.01 - reconstructed from binary by KJB
 */

#include <stdlib.h>
#include <string.h>

#include "kernel.h"
#include "swis.h"

#define Service_StartFiler 0x4B
#define Service_StartedFiler 0x4C

static const struct
{
    int errnum;
    char errmess[14];
}
outofmem_err = {0, "Out of memory"};

static const struct
{
    int errnum;
    char errmess[21];
}
nofiler_err = {0, "Filer task not found"};

char block[256];

const char *filer_taskname(void)
{
    int mfd[4];
    void *msgbuf;
    int size;

    size=_swi(MessageTrans_FileInfo, _IN(1)|_RETURN(2),
                                     "Resources:$.Resources.Filer.Messages");

    msgbuf=malloc(size);
    if (!msgbuf)
        _kernel_raise_error((_kernel_oserror *) &outofmem_err);

    _swi(MessageTrans_OpenFile, _INR(0,2),
                                mfd,
                                "Resources:$.Resources.Filer.Messages",
                                msgbuf);

    _swi(MessageTrans_Lookup, _INR(0,7),
                               mfd, "TskName",
                               block, sizeof block,
                               0, 0, 0, 0);

    _swi(MessageTrans_CloseFile, _IN(0), mfd);

    return block;
}

typedef struct
{
    int handle;
    char *name;
    int memory;
    int flags;
} TaskInfo;

int filer_task(void)
{
    static TaskInfo taskbuf[16];
    TaskInfo *ptr=taskbuf, *endptr;
    int count=0;
    const char *name=filer_taskname();

    while (count>=0)
    {
        count=_swi(TaskManager_EnumerateTasks, _INR(0,2)|_OUT(1)|_RETURN(0),
                                         count, taskbuf, sizeof taskbuf,
                                         &endptr);

        for (ptr=taskbuf; ptr < endptr; ptr++)
            if (strcmp(ptr->name, name)==0)
                return ptr->handle;
    }

    _kernel_raise_error((_kernel_oserror *) &nofiler_err);
    /* NOTREACHED */
}

void startfilers(void)
{
    int task=filer_task();
    int s;
    const char *cmd;

    for (;;)
    {
        cmd=(char *)_swi(OS_ServiceCall, _INR(0,1)|_OUT(1)|_RETURN(0),
                                          task, Service_StartFiler, &s);
        if (s != 0)
            break;

        _swi(Wimp_StartTask, _IN(0), cmd);
    }

    _swi(OS_ServiceCall, _IN(1), Service_StartedFiler);
}

int main(void)
{
    static int mlist[]={0};
    int event_code;
    int task;

    /* If not in desktop, return. */
    if (_swi(Wimp_ReadSysInfo, _IN(0)|_RETURN(0), 0) == 0)
        return 0;

    task=_swi(Wimp_Initialise, _INR(0,3)|_RETURN(1), 310, 0x4B534154, "Warm Start", mlist);

    do
    {
        event_code=_swi(Wimp_Poll, _INR(0,1), 0, block);
    }
    while (event_code!=0);

    startfilers();

    _swi(Wimp_CloseDown, _INR(0,1), task, 0x4B534154);

    return 0;
}
