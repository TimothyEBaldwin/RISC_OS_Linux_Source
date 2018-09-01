#ifndef __Desk_Dialog2_h
#define __Desk_Dialog2_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Wimp.h"
#endif
#ifndef __Desk_Window_h
#include "Window.h"
#endif
typedef enum {
Desk_dialog2_type_CLOSED = 0,
Desk_dialog2_type_MENULEAF,
Desk_dialog2_type_MENU,
Desk_dialog2_type_STATIC
}
Desk_dialog2_dialog2type;
typedef struct Desk_dialog2_block *Desk_dialog2_blockptr;
typedef void (*Desk_dialog2_openfn)( Desk_dialog2_blockptr);
typedef void (*Desk_dialog2_okfn)( Desk_dialog2_blockptr);
typedef struct Desk_dialog2_block {
void *reference; 
const char *templatename; 
Desk_window_handle window; 
Desk_dialog2_openfn openfn; 
Desk_dialog2_okfn okfn; 
	union	{
		int	value;
		struct	{
			unsigned int	type		:  2;	
			unsigned int	keepwindow	:  1;
			unsigned int	notifyclose	:  1;
			int		okbutton	:  9;
			int		cancelbutton	:  9;
			int		maxtitlesize	: 10;
			}
			data;
		}
		flags;
	}
	Desk_dialog2_block;
Desk_dialog2_block *Desk_Dialog2_CreateDialogBlock(
const char *templatename,
Desk_icon_handle okbutton,
Desk_icon_handle cancelbutton,
Desk_dialog2_openfn openfn,
Desk_dialog2_okfn okfn,
void *reference
);
void	Desk_Dialog2_OpenDialogMenuLeaf( Desk_event_pollblock *event, Desk_dialog2_block *dialog2);
void	Desk_Dialog2_OpenDialogMenu( Desk_dialog2_block *dialog2, Desk_window_openpos openpos);
void	Desk_Dialog2_OpenDialogStatic( Desk_dialog2_block *dialog2, Desk_window_openpos openpos);
void	Desk_Dialog2_CloseDialog( Desk_dialog2_block *dialog2);
void Desk_Dialog2_DeleteDialog( Desk_dialog2_block *dialog2);
#ifdef Desk__using_SDLS
  extern Desk_dialog2_block	**Desk_Dialog2__Ref_menublock( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Dialog2)
  #define Desk_dialog2_menublock (*Desk_Dialog2__Ref_menublock())
#else
  extern Desk_dialog2_block	*Desk_dialog2_menublock;
#endif
void	Desk_Dialog2_Window_GetWindowOpenPos(
		Desk_wimp_point *pos, Desk_window_openpos openpos, Desk_window_handle window
		);
void	Desk_Dialog2_EnsureWindowHandle( Desk_dialog2_block *dialog2);
#define Desk_Dialog2_ChangeCloseNotification( dialog2, x)	(dialog2)->flags.data.notifyclose = (x)
#define Desk_Dialog2_NotifyClose( dialog2)		Desk_Dialog2_ChangeCloseNotification( dialog2, 1)
#define Desk_Dialog2_DontNotifyClose( dialog2)	Desk_Dialog2_ChangeCloseNotification( dialog2, 0)
#define Desk_Dialog2_ChangeKeepWindow( dialog2, x)	(dialog2)->flags.data.keepwindow = (x)
#define Desk_Dialog2_KeepWindow( dialog2)		Desk_Dialog2_ChangeKeepWindow( dialog2, 1)
#define Desk_Dialog2_DontKeepWindow( dialog2)	Desk_Dialog2_ChangeKeepWindow( dialog2, 0)
#define Desk_Dialog2_ChangeTitleSize( dialog2, x) (dialog2)->flags.data.maxtitlesize = (x)
#ifdef __cplusplus
}
#endif
#endif
