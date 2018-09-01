#ifndef __Desk_Font_h
#define __Desk_Font_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
typedef int Desk_font_handle;
typedef struct
{
char name[128]; 
int xsize, ysize, xres, yres;
int age, usage;
} Desk_font_defn;
typedef struct
{
int minx, miny, maxx, maxy;
} Desk_font_info;
typedef struct
{
char *s; 
int x; 
int y; 
int split; 
int term; 
} Desk_font_string;
typedef struct
{
int background, foreground;
} Desk_font_colours;
typedef struct
{
Desk_font_handle font;
Desk_font_colours colour;
int offset;
} Desk_font_state;
typedef struct
{
char offset;
char thresholds[15];
} Desk_font_thresholds;
extern void	Desk_Font_CacheAddr(int *version, int *cacheused, int *cachesize);	
extern void	Desk_Font_ListFonts(char *name, int *count);			
extern void	Desk_Font_ReadDefn(Desk_font_handle font, Desk_font_defn *defn);		
extern void	Desk_Font_ReadInfo(Desk_font_handle font, Desk_font_info *info);		
extern void	Desk_Font_ConverttoOS(int x, int y, int *xout, int *yout);		
#define Desk_Font_ConvertToOS Desk_Font_ConverttoOS					
extern void	Desk_Font_Converttopoints(int x, int y, int *xout, int *yout);	
#define Desk_Font_ConvertToPoints Desk_Font_Converttopoints				
extern void	Desk_Font_FindFont(Desk_font_handle *font, const char *name,
                               int xsize, int ysize, int xres, int yres);	
extern void	Desk_Font_LoseFont(Desk_font_handle font);				
extern void Desk_Font_LoseAllFonts(Desk_font_array *fonts);
extern void	Desk_Font_SetFont(Desk_font_handle font);		
extern void	Desk_Font_CurrentFont(Desk_font_state *state);		
extern void	Desk_Font_FutureFont(Desk_font_state *state);		
extern void	Desk_Font_Paint(char *, int options, int x, int y);	
extern void	Desk_Font_Caret(int colour, int height, int flags, int x, int y);	
extern void	Desk_Font_FindCaret(Desk_font_string *string);				
extern void	Desk_Font_FindCaretJ(Desk_font_string *s, int xoffset, int yoffset);	
extern void	Desk_Font_StringWidth(Desk_font_string *string);		
extern void	Desk_Font_CharBBox(Desk_font_handle font, char c,
                               int flags, Desk_font_info *info);	
extern void	Desk_Font_StringBBox(char *string, Desk_font_info *info);
extern void	Desk_Font_ReadScaleFactor(int *xscale, int *yscale);
extern void	Desk_Font_SetFontColours(Desk_font_handle font,
                                     int Desk_back_colour, int Desk_fore_colour,
                                     int offset);
extern void	Desk_Font_SetPalette(int Desk_back_log,  int Desk_fore_log,
                                 int offset,
                                 int Desk_back_phys, int Desk_fore_phys);
extern void	Desk_Font_ReadThresholds(Desk_font_thresholds *t);
extern void	Desk_Font_SetThresholds(Desk_font_thresholds *t);
#define Desk_font_justify_NONE	(0)
#define Desk_font_justify_CURSOR	(1<<0)
#define Desk_font_justify_COORBLOCK	(1<<5)
#define Desk_font_rubout_NONE	(0)
#define Desk_font_rubout_CURSOR (1<<1)
#define Desk_font_rubout_COORBLOCK (1<<1 + 1<<5)
#define Desk_font_plot_OSCOORS (1<<4)
#define Desk_font_plot_TRANSMATRIX (1<<6)
#define Desk_font_STRLEN (1<<7)
#define Desk_font_plot_CURRENTHANDLE (1<<8)
#define Desk_font_plot_KERN (1<<9)
typedef struct {
struct {
Desk_wimp_point space;
Desk_wimp_point letter;
}
offsets;
Desk_wimp_rect rubout;
}
Desk_font_coorblock;
typedef struct {
struct {
int xx; 
int xy;
int yx;
int yy;
}
scale;
Desk_wimp_point translate;
}
Desk_font_transformation;
void Desk_Font_Paint3(
Desk_font_handle font,
const char *string,
unsigned int plottype,
int x,
int y,
Desk_font_coorblock *coorblock,
Desk_font_transformation *transformation,
int length
);
#ifdef __cplusplus
}
#endif
#endif
