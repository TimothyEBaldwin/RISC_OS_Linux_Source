#ifndef __Desk_Dialog_h
#define __Desk_Dialog_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Wimp.h"
#endif
#ifndef __Desk_Window_h
#include "Window.h"
#endif
typedef struct
{
Desk_window_handle window; 
Desk_icon_handle lastclicked; 
Desk_button_state button; 
struct
{
unsigned int stillopen : 1; 
unsigned int persist : 1; 
unsigned int isstatic : 1; 
} state;
} Desk_dialog_record;
#ifdef Desk_COMPATABILITY
typedef Desk_dialog_record *dialog; 
#endif
#define Desk_dialog_CLOSE    ((Desk_icon_handle) -1)
#define Desk_dialog_NOCHOICE ((Desk_icon_handle) -2)
extern Desk_dialog_record * Desk_Dialog_Create(char *Desk_template_name, int maxtitlesize);
extern void Desk_Dialog_Destroy(Desk_dialog_record * d);
extern void Desk_Dialog_Show(Desk_dialog_record * d);
extern void Desk_Dialog_ShowAt(Desk_dialog_record * d, int x, int y);
extern void Desk_Dialog_ShowStatic(Desk_dialog_record * d, Desk_window_openpos openpos);
extern void Desk_Dialog_Hide(Desk_dialog_record * d);
extern int Desk_Dialog_WaitForClick(Desk_dialog_record * d);
#define Desk_Dialog_WindowHandle(d) ((d)->window)
#define Desk_Dialog_Persist(D) ((D)->state.persist && (D)->lastclicked >= 0)
#define Desk_Dialog_LastClicked(D) ((D)->lastclicked)
#define Desk_Dialog_StillOpen(D) ((D)->state.stillopen)
#ifdef __cplusplus
}
#endif
#endif
