#ifndef __Desk_Menu_h
#define __Desk_Menu_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_Event_h
#include "Desk.Event.h"
#endif
extern Desk_menu_ptr Desk_Menu_New( const char *title, const char *description);
extern Desk_menu_ptr Desk_Menu_Extend(Desk_menu_ptr menu, const char *description);
extern void Desk_Menu_Show(Desk_menu_ptr menu, int x, int y);
extern void Desk_Menu_ShowLast(void);
extern void Desk_Menu_PopUp(Desk_menu_ptr menu, Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Menu_PopUpAuto(Desk_menu_ptr menu);
  
extern void Desk_Menu_AddSubMenu(Desk_menu_ptr menu, int entry, Desk_menu_ptr submenu);
  
#define	Desk_Menu_AddSubWindow( menu, entry, window)	\
		Desk_Menu_AddSubMenu( menu, entry, (Desk_menu_ptr) window)
extern void Desk_Menu_MakeIndirected(Desk_menu_ptr menu, int entry,
                                const char *buffer, int size);
  
extern void Desk_Menu_MakeWritable(Desk_menu_ptr menu, int entry,
                               const char *buffer, int size, const char *valid);
  
extern void Desk_Menu_SetFlags(Desk_menu_ptr menu, int entry, int ticked, int shaded);
  
extern void Desk_Menu_GetFlags(Desk_menu_ptr menu, int entry, int *ticked, int *shaded);
  
extern void Desk_Menu_SetText(Desk_menu_ptr menu, int entry, const char *text);
  
extern char *Desk_Menu_GetText(Desk_menu_ptr menu, int entry);
  
extern int Desk_Menu_CalcHeight(Desk_menu_ptr menu);
  
#define Desk_Menu_SysHandle(menu) (menu)
  
#define Desk_Menu_SDispose(menu) free(menu)
  
extern void Desk_Menu_FullDispose(Desk_menu_ptr menu);
  
extern void Desk_Menu_RemoveItem(Desk_menu_ptr menu, int entry);
  
extern void Desk_Menu_Warn(Desk_menu_ptr menu, int entry, Desk_bool yesno,
                      Desk_event_handler handler, void *reference);
  
extern void Desk_Menu_ReviseWidth(Desk_menu_ptr menu);
#define Desk_Menu_FirstItem(menu) ((Desk_menu_item *) (((Desk_menu_ptr) (menu) + 1)))
#define Desk_Menu_SetNotify( menu, entry, notify)	\
	Desk_Menu_FirstItem(menu)[entry].menuflags.data.notifysub = (notify)
#define Desk_Menu_FontMenu_NOTICK      0             
#define Desk_Menu_FontMenu_TICKSYSFONT ((char *)1) 
extern Desk_menu_ptr Desk_Menu_FontMenu(Desk_bool sysfont, const char *tick);
extern Desk_menu_ptr Desk_Menu_FontMenu3(Desk_bool sysfont, const char *tick);
extern char *Desk_Menu_FontMenuDecode(const int *selection);
extern char *Desk_Menu_FontMenuDecode3(const int *selection);
#ifdef Desk__using_SDLS
extern Desk_menu_ptr *Desk_Menu__Ref_fontmenu( void);
extern Desk_wimp_point *Desk_Menu__Ref_currentpos( void);
extern Desk_menu_ptr *Desk_Menu__Ref_currentopen( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Menu)
#define Desk_menu_fontmenu (*Desk_Menu__Ref_fontmenu())
#define Desk_menu_currentpos (*Desk_Menu__Ref_currentpos())
#define Desk_menu_currentopen (*Desk_Menu__Ref_currentopen())
#else
extern Desk_menu_ptr Desk_menu_fontmenu;
  extern Desk_wimp_point Desk_menu_currentpos;
  extern Desk_menu_ptr   Desk_menu_currentopen;
#endif
#ifdef __cplusplus
}
#endif
#endif
