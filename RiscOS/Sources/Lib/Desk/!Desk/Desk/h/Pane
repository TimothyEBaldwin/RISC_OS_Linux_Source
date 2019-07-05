#ifndef __Desk_Pane_h
#define __Desk_Pane_h
#ifdef __cplusplus
	extern "C" {
#endif
#ifndef __Desk_Wimp_h
	#include "Desk.Wimp.h"
#endif
#ifndef __Desk_Window_h
	#include "Desk.Window.h"
#endif
#ifndef __Desk_WimpSWIs_h
	#include "Desk.WimpSWIs.h"
#endif
typedef struct
{
  Desk_window_handle master;
  Desk_window_handle pane;
  Desk_wimp_point    offset;
  Desk_wimp_point    size;
  union
  {
    int value;
    struct
    {
      unsigned int isopen :1;  
      unsigned int fixed  :1;  
      unsigned int resize :1;  
      unsigned int horiz  :1;  
      unsigned int vert   :1;  
      unsigned int dummy  :27;
    } data;
  } flags;
} Desk_pane_data;
#define Desk_pane_OPEN   0x0001
#define Desk_pane_FIXED  0x0002
#define Desk_pane_RESIZE 0x0004
#define Desk_pane_HORIZ  0x0008
#define Desk_pane_VERT   0x0010
extern Desk_bool Desk_Pane_OpenEventHandler(Desk_event_pollblock *event, void *reference);
extern Desk_pane_data *Desk_Pane_GetSysHandle(Desk_window_handle master);
extern int Desk_Pane_SetFlags(Desk_window_handle master, int flags);
extern void Desk_Pane_Link(Desk_window_handle mast, Desk_window_handle pane,
                      Desk_wimp_point *offset, Desk_wimp_point *size, int flags);
extern Desk_window_handle Desk_Pane_CreateAndLink(char *mastname, char *panename,
                                        int mastmaxsize, int panemaxsize,
                                        Desk_wimp_point *offset, Desk_wimp_point *size, int flags);
extern void Desk_Pane_Show(Desk_window_handle window, Desk_window_openpos openpos);
extern void Desk_Pane_Delete(Desk_window_handle window);
extern void Desk_Pane_Hide(Desk_window_handle window);
#ifdef __cplusplus
}
#endif
#endif
