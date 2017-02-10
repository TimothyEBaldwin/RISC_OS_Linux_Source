#ifndef __Desk_Event_h
#define __Desk_Event_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef Desk_bool (*Desk_event_handler) ( Desk_event_pollblock *Desk_poll_block, void *reference);
#ifdef Desk__using_SDLS
extern Desk_event_pollmask *Desk_Event__Ref_mask( void);
extern int *Desk_Event__Ref_taskhandle( void);
extern unsigned int *Desk_Event__Ref_wimpversion( void);
extern char *Desk_Event__Ref_taskname( void);
extern Desk_event_pollblock *Desk_Event__Ref_lastevent( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Event)
#define Desk_Event_mask (*Desk_Event__Ref_mask())
#define Desk_Event_taskhandle (*Desk_Event__Ref_taskhandle())
#define Desk_Event_wimpversion (*Desk_Event__Ref_wimpversion())
#define Desk_Event_taskname (Desk_Event__Ref_taskname())
#define Desk_Event_lastevent (*Desk_Event__Ref_lastevent())
#else
extern Desk_event_pollmask Desk_Event_mask; 
extern int Desk_Event_taskhandle; 
extern unsigned int Desk_Event_wimpversion; 
extern const char* Desk_Event_taskname; 
extern Desk_event_pollblock Desk_Event_lastevent; 
#endif
extern Desk_bool Desk_Event_Claim(Desk_event_type eventtype,
Desk_window_handle window, Desk_icon_handle icon,
Desk_event_handler handler, void *reference);
extern Desk_bool Desk_Event_Release(Desk_event_type event,
Desk_window_handle window, Desk_icon_handle icon,
Desk_event_handler handler, void *reference);
extern void Desk_Event_ReleaseWindow(Desk_window_handle window);
extern void Desk_Event_Process(Desk_event_pollblock *event);
extern void Desk_Event_Poll(void);
extern void Desk_Event_Initialise( const char *taskname);
extern void Desk_Event_Initialise3( const char *taskname, int version, const int *messages);
extern void Desk_Event_CloseDown(void);
typedef Desk_bool (*Desk_event_claimorreleasefn)(
Desk_event_type eventtype,
Desk_window_handle window,
Desk_icon_handle icon,
Desk_event_handler handler,
void *reference
);
void Desk_Event_MessagesClaim( Desk_event_handler handler, void* reference);
void Desk_Event_MessagesRelease( Desk_event_handler handler, void* reference);
void Desk_Event_PollIdle3( void* pollword);
#define Desk_Event_PollIdle() Desk_Event_PollIdle3( NULL)
void Desk_Event_ClaimNullIdle( Desk_event_handler handler, unsigned int earliest, void* reference);
void	Desk_Event_ClaimNullIdleInterval( Desk_event_handler handler, int interval, void* reference);
void	Desk_Event_ReleaseNullIdle( Desk_event_handler handler, void* reference);
#ifdef __cplusplus
}
#endif
#endif
