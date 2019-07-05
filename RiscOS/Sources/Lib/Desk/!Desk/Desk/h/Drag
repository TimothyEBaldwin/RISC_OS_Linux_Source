#ifndef __Desk_Drag_h
#define __Desk_Drag_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Core.h"
#endif
extern void Desk_Drag_Initialise(Desk_bool attachNULLhandler);
typedef void (* Desk_drag_handler) (void *userdata);
extern Desk_drag_handler Desk_drag_currentupdate;
extern Desk_drag_handler Desk_drag_currentcomplete;
extern void *Desk_drag_currentuserdata;
extern void Desk_Drag_SetHandlers(Desk_drag_handler uproc, Desk_drag_handler cproc,
void *userdata);
#ifdef __cplusplus
}
#endif
#endif
