#ifndef __Desk_Template_h
#define __Desk_Template_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Sprite_h
#include "Desk.Sprite.h"
#endif
#ifndef __Desk_LinkList_h
#include "Desk.LinkList.h"
#endif
extern void Desk_Template_Initialise(void);
extern Desk_window_block *Desk_Template_Find(const char *name);
extern Desk_window_block *Desk_Template_Clone(const char *name, int maxtitlesize);
  
#define Desk_template_TITLEDEFAULT (0)
#define Desk_template_TITLEMIN     (-1)
extern void Desk_Template_Free(Desk_window_block **windowdef);
  
extern void Desk_Template_Delete(const char *name);
extern void Desk_Template_ClearAll(void);
  
extern void Desk_Template_LoadFile(const char *leafname);
  
extern void Desk_Template_UseOutlineFonts(void);
extern void Desk_Template_UseSpriteArea(Desk_sprite_area area);
extern void Desk_Template_LinkSpriteArea(const char *identifier, Desk_sprite_area area);
typedef struct
{
Desk_linklist_header header;
char identifier[Desk_wimp_MAXNAME + 1];
Desk_window_block *windowdef;
int dataoffset;
int templatesize; 
int indirectsize; 
char *indirectdata;
} Desk_template_record;
#ifdef Desk__using_SDLS
extern Desk_linklist_header *Desk_Template__Ref_list( void);
extern Desk_font_array **Desk_Template__Ref_fontarray( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Template)
#define Desk_template_list (*Desk_Template__Ref_list())
#define Desk_template_fontarray (*Desk_Template__Ref_fontarray())
#else
extern Desk_linklist_header Desk_template_list;
extern Desk_font_array *Desk_template_fontarray;
#endif
#ifdef __cplusplus
}
#endif
#endif
