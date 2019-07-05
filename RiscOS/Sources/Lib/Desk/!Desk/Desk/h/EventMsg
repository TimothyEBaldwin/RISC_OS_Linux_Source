#ifndef __Desk_EventMsg_h
#define __Desk_EventMsg_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Event_h
#include "Desk.Event.h"
#endif
extern void Desk_EventMsg_Initialise(void);
extern Desk_bool Desk_EventMsg_Claim(Desk_message_action messagetype, Desk_window_handle window,
Desk_event_handler handler, void *reference);
extern int Desk_EventMsg_Release(Desk_message_action messagetype, Desk_window_handle window,
Desk_event_handler handler);
extern int Desk_EventMsg_ReleaseWindow(Desk_window_handle window);
extern Desk_bool Desk_EventMsg_ReleaseMessage(Desk_message_action messagetype);
#ifdef __cplusplus
}
#endif
#endif
