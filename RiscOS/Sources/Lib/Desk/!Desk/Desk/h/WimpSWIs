#ifndef __Desk_WimpSWIs_h
#define __Desk_WimpSWIs_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_Error2_h
#include "Desk.Error2.h"
#endif
extern void Desk_Wimp_Initialise(const unsigned int *version,
const char *name,
Desk_task_handle *task,
const int *messages);
extern void Desk_Wimp_CloseDown(Desk_task_handle task);
extern void Desk_Wimp_StartTask(const char *command);
extern void Desk_Wimp_StartTask3(const char *command, Desk_task_handle *newtask);
extern void	Desk_Wimp_SlotSize(int *currentslot, int *nextslot, int *freepool);
extern void	Desk_Wimp_TransferBlock(Desk_task_handle  sourcetask,
                                    void         *sourcebuffer,
                                    Desk_task_handle  desttask,
                                    void         *destbuffer,
                                    unsigned int length);
extern void	Desk_Wimp_ReportError(const Desk_os_error *error, int flags, const char *name);
 
enum	{
	Desk_wimp_reporterror_button_NONE	= 0,
	Desk_wimp_reporterror_button_OK		= 1,
	Desk_wimp_reporterror_button_CANCEL	= 2
	};
extern int Desk_Wimp_ReportErrorR(const Desk_os_error *error, int flags, const char *name);
 
 
extern void	Desk_Wimp_SendMessage (Desk_event_type       eventtype,
                                   Desk_message_block    *message,
                                   Desk_message_destinee destinee,
                                   Desk_icon_handle      icon);
extern void	Desk_Wimp_OpenTemplate(const char *name);
extern void	Desk_Wimp_CloseTemplate(void);
extern void	Desk_Wimp_LoadTemplate(Desk_template_block *wtemplate);
extern void	Desk_Wimp_CreateWindow(const Desk_window_block *block, Desk_window_handle *window);
extern void	Desk_Wimp_OpenWindow(const Desk_window_openblock *block);
extern void	Desk_Wimp_CloseWindow(Desk_window_handle window);
extern void	Desk_Wimp_DeleteWindow(Desk_window_handle window);
extern void	Desk_Wimp_RedrawWindow(Desk_window_redrawblock *block, Desk_bool *more);
extern void	Desk_Wimp_UpdateWindow(Desk_window_redrawblock *block, Desk_bool *more);
extern void	Desk_Wimp_GetRectangle(Desk_window_redrawblock *block, Desk_bool *more);
extern void	Desk_Wimp_GetWindowState(Desk_window_handle window, Desk_window_state *state);
extern void	Desk_Wimp_GetWindowInfo(Desk_window_info *info);
extern void	Desk_Wimp_GetWindowInfoNoIcons(Desk_window_info *info);
extern void	Desk_Wimp_GetWindowOutline(Desk_window_outline *outline);
extern void	Desk_Wimp_SetExtent(Desk_window_handle window, Desk_wimp_box *newextent);
extern void	Desk_Wimp_ForceRedraw(const Desk_window_redrawblock *block);
extern void	Desk_Wimp_CreateIcon(const Desk_icon_createblock *block, Desk_icon_handle *icon);
extern void	Desk_Wimp_DeleteIcon(Desk_window_handle window, Desk_icon_handle icon);
extern void	Desk_Wimp_SetIconState(Desk_window_handle window,
                                   Desk_icon_handle   icon,
                                   unsigned int  value,
                                   unsigned int  mask);
extern void	Desk_Wimp_GetIconState(Desk_window_handle window,
                                   Desk_icon_handle   icon,
                                   Desk_icon_block    *iconinfo);
extern void	Desk_Wimp_WhichIcon(Desk_window_handle    window,
                                   Desk_icon_handle   *icons,
                                   unsigned int  mask,
                                   unsigned int  settings);
extern void	Desk_Wimp_PlotIcon(Desk_icon_block *fakeicon);
extern void Desk_Wimp_PlotIcon2( Desk_icon_block *fakeicon, int xorigin, int yorigin);
#define Desk_Wimp_Poll(mask, evt) Desk_Wimp_Poll3(mask, evt, 0)
#define Desk_Wimp_PollIdle(mask, evt, time) Desk_Wimp_PollIdle3(mask, evt, time, 0)
extern void Desk_Wimp_Poll3(Desk_event_pollmask mask, Desk_event_pollblock *event,
void *pollword);
extern void Desk_Wimp_PollIdle3(Desk_event_pollmask mask, Desk_event_pollblock *block,
int earliest, void *pollword);
#ifdef Desk__using_SDLS
extern Desk_event_type _dll_wimpPoll(
Desk_event_pollmask mask,
Desk_event_data *data,
int dummy,
void *pollword
);
extern Desk_event_type _dll_wimpPollIdle(
Desk_event_pollmask mask,
Desk_event_data *data,
int earliest,
void *pollword
);
extern void Desk_Wimp_Poll3_DLL( Desk_event_pollmask mask, Desk_event_pollblock *event,
void *pollword);
extern void Desk_Wimp_PollIdle3_DLL( Desk_event_pollmask mask, Desk_event_pollblock *block,
int earliest, void *pollword);
#define Desk_Wimp_Poll3 Desk_Wimp_Poll3_DLL
#define Desk_Wimp_PollIdle3 Desk_Wimp_PollIdle3_DLL
#endif
extern void Desk_Wimp_SaveFPStateOnPoll(void);
extern void Desk_Wimp_CorruptFPStateOnPoll(void);
extern void Desk_Wimp_GetPointerInfo(Desk_mouse_block *ptrinfo);
extern void Desk_Wimp_SetPointerShape(const Desk_pointer_shapeblock *shape);
extern void Desk_Wimp_DragBox(Desk_drag_block *draginfo);
extern void Desk_Wimp_SetCaretPosition(const Desk_caret_block *caret);
extern void Desk_Wimp_GetCaretPosition(const Desk_caret_block *caret);
extern void Desk_Wimp_CreateMenu(Desk_menu_ptr menu, int xpos, int ypos);
extern void Desk_Wimp_CreateSubMenu(Desk_menu_ptr menu, int xpos, int ypos);
extern void Desk_Wimp_DecodeMenu(Desk_menu_ptr menu,
const int *selections,
char *result);
extern void Desk_Wimp_ProcessKey(int character);
extern void Desk_Wimp_SetMode(int mode);
extern void Desk_Wimp_SetColour(int colour);
extern void Desk_Wimp_ReadPalette(Desk_palette_block *palette);
extern void Desk_Wimp_SetPalette(const Desk_palette_block *palette);
extern void Desk_Wimp_ReadPixTrans(int areaindex,
void *area,
void *sprite,
Desk_scale_block *scaleblock,
char *transblock);
extern void Desk_Wimp_SetFontColours(int foreground, int background);
extern void Desk_Wimp_SpriteOp( int r[10]);
extern void Desk_Wimp_BaseOfSprites(void **Desk_rom_base, void **Desk_ram_base);
extern void Desk_Wimp_BlockCopy(Desk_window_handle window, const Desk_wimp_box *source,
int x, int y);
extern void Desk_Wimp_CommandWindow(int);
#ifdef __cplusplus
}
#endif
#endif
