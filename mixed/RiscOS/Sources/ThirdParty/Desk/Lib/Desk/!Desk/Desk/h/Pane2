#ifndef __Desk_Pane2_h
#define __Desk_Pane2_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_WimpSWIs_h
#include "Desk.WimpSWIs.h"
#endif
#ifndef __Desk_Window_h
#include "Desk.Window.h"
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef union {
int value;
struct {
unsigned int panetop :1; 
unsigned int maintop :1; 
unsigned int fixed :1; 
unsigned int hresize :1; 
unsigned int hstretch :1; 
unsigned int vresize :1; 
unsigned int vstretch :1; 
unsigned int hscroll :1; 
unsigned int vscroll :1; 
unsigned int mainright :1; 
unsigned int dummy :22;
} data;
} Desk_pane2_flags;
#define Desk_pane2_PANETOP 0x0001
#define Desk_pane2_MAINTOP 0x0002
#define Desk_pane2_FIXED 0x0004
#define Desk_pane2_HRESIZE 0x0008
#define Desk_pane2_HSTRETCH 0x0010
#define Desk_pane2_VRESIZE 0x0020
#define Desk_pane2_VSTRETCH 0x0040
#define Desk_pane2_HSCROLL 0x0080
#define Desk_pane2_VSCROLL 0x0100
#define Desk_pane2_MAINRIGHT 0x0200
extern Desk_bool Desk_Pane2_AddMain(Desk_window_handle mainwindow);
extern Desk_window_handle Desk_Pane2_CreateAndAddMain(const char *windowname, int maxtitlesize);
extern Desk_bool Desk_Pane2_AddPane(Desk_window_handle mainwindow, Desk_window_handle panewindow,
const Desk_wimp_point *paneoffset, const Desk_wimp_point *panesize, int flags);
extern Desk_window_handle Desk_Pane2_CreateAndAddPane(const char *windowname, int maxtitlesize,
Desk_window_handle mainwindow,
const Desk_wimp_point *paneoffset,
const Desk_wimp_point *panesize,
int flags);
extern void Desk_Pane2_Show(Desk_window_handle mainwindow, Desk_window_openpos openpos);
 
extern void Desk_Pane2_Hide(Desk_window_handle mainwindow);
extern void Desk_Pane2_Delete(Desk_window_handle mainwindow);
 
extern void Desk_Pane2_ReadIcon(Desk_window_handle window, Desk_icon_handle icon, const char *panewindow,
                           Desk_wimp_point *paneoffset, Desk_wimp_point *panesize);
 
extern int Desk_Pane2_SetFlags(Desk_window_handle mainwindow, int panenumber, int flags);
 
extern Desk_window_handle Desk_Pane2_GetPaneHandle(Desk_window_handle mainwindow, int panenumber);
 
extern Desk_window_handle Desk_Pane2_GetMainHandle(Desk_window_handle panewindow);
 
extern int Desk_Pane2_GetPaneNumber(Desk_window_handle mainwindow, Desk_window_handle panewindow);
 
extern void Desk_Pane2_DeletePane(Desk_window_handle mainwindow, int panenumber);
 
extern Desk_bool Desk_Pane2_OpenWindow(Desk_window_handle mainwindow, const Desk_window_openblock *openblock);
 
extern Desk_bool Desk_Pane2_ReadVars(Desk_window_handle mainwindow, int panenumber,
                           Desk_wimp_point *paneoffset, Desk_wimp_point *panesize);
 
extern Desk_bool Desk_Pane2_SetVars(Desk_window_handle mainwindow, int panenumber,
                           const Desk_wimp_point *paneoffset, const Desk_wimp_point *panesize);
#ifdef __cplusplus
}
#endif
#endif
