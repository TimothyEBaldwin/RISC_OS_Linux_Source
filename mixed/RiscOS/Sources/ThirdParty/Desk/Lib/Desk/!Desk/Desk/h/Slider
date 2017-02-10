#ifndef __Desk_Slider_h
#define __Desk_Slider_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_WimpSWIs_h
#include "Desk.WimpSWIs.h"
#endif
#ifndef __Desk_Sprite_h
#include "Desk.Sprite.h"
#endif
#define Desk_SLIDER_MAX 100000
typedef struct
{
Desk_window_handle window;
Desk_icon_handle icon;
int value;
struct
{ int min;
int max;
} limits;
struct
{ int foreground;
int background;
} colour;
struct
{ int x;
int y;
} border;
struct
{ Desk_sprite_areainfo *spritearea;
Desk_sprite_header *sprite;
} knob;
struct
{ int vertical :1;
int rgb :1;
int dragging :1;
int clickstop :1;
int reserved :28;
} flags;
int ( *update )( void *, void * );
int reference;
} Desk_slider_info;
extern void Desk_Slider_Redraw(Desk_slider_info *slider, Desk_wimp_rect *clipwindow);
extern int Desk_Slider_ReadValue( Desk_slider_info *slider );
extern void Desk_Slider_SetValue(Desk_slider_info *slider,
int value,
int *valueset,
void *ref );
extern void Desk_Slider_Drag(Desk_slider_info *slider,
int *closed,
int *value,
void *ref);
#ifdef __cplusplus
}
#endif
#endif
