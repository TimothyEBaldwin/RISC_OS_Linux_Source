#ifndef __Desk_Sprite_h
#define __Desk_Sprite_h
#ifdef __cplusplus
extern "C" {
#endif
#include <stdarg.h>
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_Coord_h
#include "Desk.Coord.h"
#endif
#define Desk_sprite_MAXNAME 12
#define Desk_spritepool_SYSTEM 0
#define Desk_spritepool_WIMP 1
typedef struct {
unsigned int areasize ;
unsigned int numsprites ;
unsigned int firstoffset ;
unsigned int freeoffset ;
} Desk_sprite_areainfo ;
typedef Desk_sprite_areainfo *Desk_sprite_area;
typedef struct {
unsigned int width ;
unsigned int height ;
unsigned int maskstatus ;
unsigned int mode ;
} Desk_sprite_info ;
typedef Desk_sprite_info *sprite;
typedef struct {
int callno ;
Desk_sprite_area spritearea ;
sprite sprite ;
void *savearea ;
} Desk_sprite_outputstate ;
typedef struct
{
int Desk_offset_next;
char name[Desk_sprite_MAXNAME];
int width;
int height;
int leftbit;
int rightbit;
int imageoffset;
int maskoffset;
int screenmode;
} Desk_sprite_header;
typedef struct
{
Desk_wimp_point multiply;
Desk_wimp_point divide;
} Desk_sprite_scalefactors;
extern void Desk_Sprite_ScreenSave(const char *filename, Desk_bool savepalette);
extern void Desk_Sprite_ScreenLoad(const char *filename);
extern void Desk_Sprite_InitArea(Desk_sprite_area area);
extern void Desk_Sprite_Load(Desk_sprite_area area, const char *filename) ;
extern void Desk_Sprite_Merge(Desk_sprite_area area, const char *filename);
extern void Desk_Sprite_Save(Desk_sprite_area area, const char *filename);
extern void Desk_Sprite_Create(Desk_sprite_area area, const char *name, int haspalette,
int width, int height, int screenmode);
extern void Desk_Sprite_Select(Desk_sprite_area area, const char *name,
Desk_sprite_header **spriteptr);
extern void Desk_Sprite_Delete(Desk_sprite_area area, const char *name);
extern void Desk_Sprite_Rename(Desk_sprite_area area, const char *oldname, const char *newname);
extern void Desk_Sprite_Copy(Desk_sprite_area area, const char *oldname, const char *newname);
extern void Desk_Sprite_Get(Desk_sprite_area area, const char *name, int Desk_with_palette,
int left, int bottom, int right, int top,
sprite *Desk_sprite_ptr);
extern void Desk_Sprite_Plot(Desk_sprite_area area, const char *name, 
int x, int y, int Desk_plot_action);
extern void	Desk_Sprite_ReadInfo(Desk_sprite_area area, const char *name,
                                 Desk_sprite_info *info);
 
extern void	Desk_Sprite_Redirect(Desk_sprite_area area, const char *name,
                                 void *savearea, Desk_sprite_outputstate *oldstate);
 
extern void	Desk_Sprite_UnRedirect(Desk_sprite_outputstate *oldstate);
 
extern void	Desk_Sprite_ReadSaveAreaSize(Desk_sprite_area area, const char *name,
                                         int *saveareasize);
 
extern int Desk_Sprite_ReadControl(Desk_sprite_area area, int *size, sprite *firstsprite,
void *firstfree);
extern int Desk_Sprite_GetName(Desk_sprite_area area, char *name, int spritenumber);
extern void Desk_Sprite_CreateMask(Desk_sprite_area area, const char *name);
extern void Desk_Sprite_RemoveMask(Desk_sprite_area area, const char *name);
extern void Desk_Sprite_InsertRow(Desk_sprite_area area, const char *name, int pos);
extern void Desk_Sprite_DeleteRow(Desk_sprite_area area, const char *name, int pos);
extern void Desk_Sprite_FlipX(Desk_sprite_area area, const char *name);
extern void Desk_Sprite_Append(Desk_sprite_area area, const char *name1, const char *name2,
int dir);
extern int Desk_Sprite_CreatePalette(Desk_sprite_area area, const char *name, Desk_bool big);
extern void Desk_Sprite_RemovePalette(Desk_sprite_area area, const char *name);
extern int Desk_Sprite_ReadPixel(Desk_sprite_area area, const char *name, const Desk_wimp_point *pos);
extern void	Desk_Sprite_WritePixel(Desk_sprite_area area, const char *name,
                                   const Desk_wimp_point *pos, int colour, int tint);
extern Desk_bool Desk_Sprite_ReadMask(Desk_sprite_area area, const char *name, const Desk_wimp_point *pos);
extern void	Desk_Sprite_WriteMask(Desk_sprite_area area, const char *name, const Desk_wimp_point *pos,
                                  Desk_bool solid);
extern void	Desk_Sprite_InsertColumn(Desk_sprite_area area, const char *name, int pos);
extern void	Desk_Sprite_DeleteColumn(Desk_sprite_area area, const char *name, int pos);
extern void	Desk_Sprite_FlipY(Desk_sprite_area area, const char *name);
extern void	Desk_Sprite_PlotMask(Desk_sprite_area area, const char *name, const Desk_wimp_point *pos);
extern void	Desk_Sprite_PlotMaskScaled(Desk_sprite_area area, const char *name,
                                       const Desk_wimp_point *pos, Desk_sprite_scalefactors sc);
extern void	Desk_Sprite_PlotScaled(Desk_sprite_area area, const char *name,
                                   const Desk_wimp_point *pos, const Desk_sprite_scalefactors *scale,
                                   const void *pixtrans);
extern void Desk_Sprite_PlotGrey(Desk_sprite_area area, const char *name,
const Desk_wimp_point *pos, Desk_sprite_scalefactors scale,
const void *pixtrans);
extern void Desk_Sprite_WimpPlot(Desk_sprite_area area, const char *name, const Desk_wimp_point *pos,
const Desk_convert_block *convert, int Desk_plot_action);
typedef enum
{
Desk_sprite_HASNOMASKPAL = 0x00, 
Desk_sprite_HASNOPALMASK = 0x00,
Desk_sprite_HASMASK = 0x01, 
Desk_sprite_HASPAL = 0x02, 
Desk_sprite_HASMASKPAL = 0x03, 
Desk_sprite_HASPALMASK = 0x03
} Desk_spritemem_flags;
extern int Desk_Sprite_MemorySize(int width, int height, int mode,
Desk_spritemem_flags flags);
extern int Desk_Sprite_IconMemorySize(const Desk_window_block *pWinBlock, Desk_icon_handle icon,
int mode, Desk_spritemem_flags flags,
Desk_wimp_point *dimensions);
extern Desk_sprite_area Desk_Sprite_LoadFile(const char *filename);
extern Desk_sprite_area Desk_Sprite_LoadFiles(int nooffiles, ...);
#ifdef __cplusplus
}
#endif
 
#endif
