#ifndef __Desk_Resource_h
#define __Desk_Resource_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Sprite_h
#include "Desk.Sprite.h"
#endif
#ifdef Desk__using_SDLS
extern char *Desk_Resource__Ref_pathname( void);
extern Desk_sprite_area *Desk_Resource__Ref_sprites ( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Resource)
#define Desk_resource_pathname Desk_Resource__Ref_pathname()
#define Desk_resource_sprites (*Desk_Resource_Ref_sprites())
#else
extern char Desk_resource_pathname[32];
extern Desk_sprite_area Desk_resource_sprites;
#endif
extern void Desk_Resource_Initialise(const char *respath);
extern void Desk_Resource_InitialisePath(const char *respath);
extern void Desk_Resource_LoadSprites(void);
#ifdef __cplusplus
}
#endif
#endif
