#ifndef __Desk_Save_h
#define __Desk_Save_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdlib.h>
#ifndef __Desk_Event_h
#include "Desk.Event.h"
#endif
typedef Desk_bool (*Desk_save_filesaver)(char *f, void *ref);
typedef int (*Desk_save_ramsaver)(
Desk_task_handle sourcetask, 
void *ref,
Desk_task_handle desttask,
void *destbuffer,
unsigned int buffersize,
int progress 
);
typedef enum
{
  Desk_save_SAVEOK    = 0,
  Desk_save_RECEIVERFAILED,
  Desk_save_FILESAVERFAILED,
  Desk_save_RAMSAVERFAILED
} Desk_save_result;
typedef void (*Desk_save_resulthandler)(Desk_save_result result, void *ref);
typedef struct
{
  Desk_window_handle    window;        
  union
  {
    unsigned int  value;
    struct
    {
      unsigned int  Desk_is_menu         : 1;  
      unsigned int  Desk_is_save_window  : 1;  
      unsigned int  Desk_we_are_dragging : 1;  
      unsigned int  Desk_quit_after_save : 1;  
      unsigned int  Desk_release_after   : 1;  
                                          
      unsigned int  padding         : 27;
    } data;
  } flags;
  Desk_icon_handle         dragsprite;
  Desk_icon_handle         okbutton;
  Desk_icon_handle         cancelbutton;
  Desk_icon_handle         filenameicon;
  Desk_save_filesaver      filesaver;
  Desk_save_ramsaver       ramsaver;
  Desk_save_resulthandler  resulthandler;
  size_t              estimatedsize;
  int                 filetype;
  void                *ref;
  int                 Desk_ram_progress;          
  unsigned int        Desk_last_message_ref;      
                                             
} Desk_save_saveblock;
Desk_save_saveblock *Desk_Save_InitSaveWindowHandler(
Desk_window_handle window, 
Desk_bool Desk_is_menu, 
Desk_bool Desk_is_save_window, 
Desk_bool Desk_release_after, 
Desk_icon_handle dragsprite, 
Desk_icon_handle okbutton, 
Desk_icon_handle cancelbutton, 
Desk_icon_handle filenameicon, 
Desk_save_filesaver filesaver, 
Desk_save_ramsaver ramsaver, 
Desk_save_resulthandler resulthandler, 
size_t estimatedsize, 
int filetype,
void *ref 
);
void Desk_Save_ReleaseSaveHandlers(Desk_save_saveblock *saveblock);
void Desk_Save_SetFiletype(Desk_save_saveblock *saveblock, int filetype);
#ifdef __cplusplus
}
#endif
#endif
