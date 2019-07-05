#ifndef __Desk_Font2_h
#define __Desk_Font2_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Font_h
#include "Desk.Font.h"
#endif
typedef struct Desk_font2_block {
Desk_font_handle handle; 
Desk_font_info info; 
}
Desk_font2_block;
Desk_os_error *Desk_Font2_ClaimFont( Desk_font2_block **font2, const char *name, int sizex, int sizey);
Desk_os_error *Desk_Font2_ReclaimFont( Desk_font2_block **font2, const char *name, int xsize, int ysize);
void Desk_Font2_ReleaseFont( Desk_font2_block **font2);
void Desk_Font2_Initialise( void);
#ifdef Desk_DeskLib_DEBUG
#ifdef Desk__making_Font2
#include "Debug.h"
#define Desk_debug_level Desk_font2_debuglevel
#endif
extern int Desk_font2_debuglevel;
#endif
#ifdef __cplusplus
}
#endif
#endif
