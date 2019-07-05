#ifndef __Desk_TaskWindow_h
#define __Desk_TaskWindow_h
#include <stddef.h>
typedef int Desk_taskwindow_id;
typedef void (*Desk_taskwindow_displayfn)( void* data, size_t datasize, Desk_taskwindow_id childid, void* reference);
typedef void (*Desk_taskwindow_egofn)( Desk_task_handle task, Desk_taskwindow_id childid, void* reference);
Desk_taskwindow_id
Desk_TaskWindow_CreateChild(
Desk_taskwindow_displayfn displayfn,
Desk_taskwindow_egofn egofn, 
const char* command, 
void* reference 
);
void Desk_TaskWindow_SendData(
Desk_taskwindow_id childid,
void* data,
size_t datasize
);
void Desk_TaskWindow_SendDataSmall(
Desk_taskwindow_id childid,
void* data,
size_t datasize
);
Desk_task_handle
Desk_TaskWindow_GetTaskHandle( Desk_taskwindow_id childid);
void Desk_TaskWindow_KillChild( Desk_taskwindow_id childid);
void Desk_TaskWindow_SuspendChild( Desk_taskwindow_id childid);
void Desk_TaskWindow_ResumeChild( Desk_taskwindow_id childid);
#endif
