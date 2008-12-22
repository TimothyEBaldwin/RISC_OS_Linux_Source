#ifndef __Desk_Window_h
#define __Desk_Window_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_WimpSWIs_h
#include "Desk.WimpSWIs.h"
#endif
#ifndef __Desk_Pointer_h
#include "Desk.Pointer.h"
#endif
#ifndef __Desk_Coord_h
#include "Desk.Coord.h"
#endif
typedef enum
{
Desk_open_WHEREVER, 
Desk_open_CENTERED, 
Desk_open_CENTEREDUNDERPOINTER, 
Desk_open_OVERCARET, 
Desk_open_UNDERPOINTER, 
Desk_open_NEARLAST 
} Desk_window_openpos;
extern Desk_window_handle Desk_Window_Create(const char *windowname, int maxtitlesize);
extern Desk_window_handle Desk_Window_CreateOrig(const char *windowname);
extern void Desk_Window_Show(Desk_window_handle window, Desk_window_openpos openpos);
extern Desk_window_handle Desk_Window_CreateAndShow(const char *windowname,
                                          int  maxtitlesize,
                                          Desk_window_openpos openpos);
#define Desk_Window_Hide(handle) Desk_Wimp_CloseWindow(handle)
extern void Desk_Window_Delete(Desk_window_handle window);
extern void Desk_Window_DeleteOrig(Desk_window_handle window);
extern void Desk_Window_GetInfo(Desk_window_handle window, Desk_window_info *result);
extern void	Desk_Window_GetInfo3(Desk_window_handle window, Desk_window_info *result);
extern void Desk_Window_ParentName(Desk_window_handle window, char *windowname);
extern Desk_bool Desk_Window_AutoHelp(Desk_window_handle window, Desk_icon_handle icon);
extern Desk_bool Desk_Window_HelpHandler(Desk_event_pollblock *event, void *reference);
extern void Desk_Window_ModeChange(void);
extern void Desk_Window_SetTitle(Desk_window_handle window, const char *title);
extern void Desk_Window_BringToFront(Desk_window_handle window);
#define Desk_Window_ConstrainMouse(WND) (Desk_Pointer_RestrictToWindow(WND))
extern void Desk_Window_SetExtent(Desk_window_handle wh, int x0, int y0, int x1, int y1);
extern void Desk_Window_ForceRedraw(Desk_window_handle wh,
                               int x0, int y0, int x1, int y1);
extern void Desk_Window_GetCoords(Desk_window_handle wh, Desk_convert_block *coords);
extern void	Desk_Window_GainCaret(Desk_window_handle window);
extern void	Desk_Window_ForceWholeRedraw(Desk_window_handle window);
extern Desk_bool Desk_Window_MoveWindow(Desk_event_pollblock *event, void *reference);
Desk_bool Desk_Window_IsOpen( Desk_window_handle window);
void	Desk_Window_ToggleShow( Desk_window_handle window, Desk_window_openpos openpos);
#ifdef __cplusplus
}
#endif
#endif
