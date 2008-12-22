#ifndef __Desk_Menu2_h
#define __Desk_Menu2_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Menu_h
#include "Desk.Menu.h"
#endif
typedef int Desk_menu2_handle;
typedef Desk_menu_ptr (*Desk_menu2_makefn)( void *reference);
typedef void (*Desk_menu2_closefn)( Desk_menu_ptr menu, void *reference);
typedef void (*Desk_menu2_flagsfn)( Desk_menu_ptr menu, void *reference);
typedef void (*Desk_menu2_selectfn)( int itemnum, void *reference);
typedef Desk_menu2_handle (*Desk_menu2_subfn)( int itemnum, Desk_event_pollblock *event, void *reference);
typedef void (*Desk_menu2_helpfn)( char* buffer, int buffsize, int itemnum, void *reference);
Desk_menu2_handle Desk_Menu2_Create(
const char *title,
const char *spec,
Desk_menu2_makefn makefn, 
Desk_menu2_flagsfn flagsfn, 
Desk_menu2_subfn subfn, 
Desk_menu2_selectfn selectfn, 
Desk_menu2_closefn closefn, 
void *reference 
);
Desk_menu2_handle Desk_Menu2_Create2(
	const char		*title,
	const char		*spec,
	Desk_menu2_makefn	makefn, 	
	Desk_menu2_flagsfn	flagsfn, 	
	Desk_menu2_subfn	subfn, 		
	Desk_menu2_selectfn	selectfn, 	
	Desk_menu2_closefn	closefn,	
	Desk_menu2_helpfn	helpfn,		
	void			*reference	
	);
Desk_menu2_handle	Desk_Menu2_CreateFromMsgs(
			const char		*titletag,
			const char		*spectag,
			Desk_menu2_makefn	makefn,
			Desk_menu2_flagsfn	flagsfn,
			Desk_menu2_subfn	subfn,
			Desk_menu2_selectfn	selectfn,
			Desk_menu2_closefn	closefn,
			Desk_menu2_helpfn	helpfn,
			void			*reference
			);
void	Desk_Menu2_Open( Desk_menu2_handle handle, int x, int y);
void	Desk_Menu2_AttachMenu(
	Desk_window_handle	window,
	Desk_icon_handle	icon,
	Desk_menu2_handle	menu,
	int			button
	);
void	Desk_Menu2_DetachMenu(
	Desk_window_handle	window,
	Desk_icon_handle	icon,
	Desk_menu2_handle	menu,
	int			button
	);
#ifdef Desk_DeskLib_DEBUG
	#ifdef Desk__making_Menu2
		#include "Debug.h"
		#define Desk_debug_level Desk_menu2_debuglevel
	#endif
	
	extern int	Desk_menu2_debuglevel;
#endif
#ifdef __cplusplus
}
#endif
#endif
