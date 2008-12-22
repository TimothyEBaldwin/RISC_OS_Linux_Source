#ifndef __Desk_Filter_h
#define __Desk_Filter_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef int (*Desk_filter_handler)(int event, const Desk_event_pollblock *eventdata,
const int task);
extern void Desk_Filter_RegisterPreFilter(char *filtername,
Desk_filter_handler handler, int R12,
Desk_task_handle task);
extern void Desk_Filter_RegisterPostFilter(char *filtername,
Desk_filter_handler handler, int R12,
Desk_task_handle task, int eventmask);
extern void Desk_Filter_DeRegisterPreFilter(char *filtername,
Desk_filter_handler handler, int R12,
Desk_task_handle task);
extern void Desk_Filter_DeRegisterPostFilter(char *filtername,
Desk_filter_handler handler, int R12,
Desk_task_handle task, int eventmask);
#ifdef __cplusplus
}
#endif
#endif
