#ifndef __Desk_Clear_h
#define __Desk_Clear_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Wimp.h"
#endif
typedef struct
{
char *creator;
unsigned creatorversion;
unsigned width,
height;
unsigned bpp;
Desk_palette_entry *palette;
unsigned char *bitmap;
} Desk_clear_picture;
void Desk_Clear_Init(char *creator, unsigned version);
Desk_clear_picture *Desk_Clear_Load(char *filename);
void Desk_Clear_Save(Desk_clear_picture *picture, char *filename);
Desk_clear_picture *Desk_Clear_Create(unsigned width, unsigned height, unsigned bpp);
void Desk_Clear_Free(Desk_clear_picture *picture);
#ifdef __cplusplus
}
#endif
#endif
