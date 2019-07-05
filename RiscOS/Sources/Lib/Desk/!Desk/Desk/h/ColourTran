#ifndef __Desk_ColourTran_h
#define __Desk_ColourTran_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Core.h"
#endif
extern void Desk_ColourTrans_SetGCOL( int palette, int flag, int gcolaction);
#define Desk_ColourTrans_RGB( r, g, b)	\
	( ( (unsigned)(r)<<8 | (unsigned)(g)<<16 | (unsigned)(b)<<24))
#define	Desk_ColourTrans_SetGCOL2( palette)	\
	Desk_ColourTrans_SetGCOL( palette, 1<<8, 0)
#define Desk_ColourTrans_SetGCOL3( r, g, b)	\
	Desk_ColourTrans_SetGCOL2( Desk_ColourTrans_RGB( r, g, b))
extern void	Desk_ColourTrans_InvalidateCache(void);
extern void	Desk_ColourTrans_SelectTable(int Desk_src_mode, int *Desk_src_pal,
                                  int Desk_dst_mode, int *Desk_dst_pal,
                                  char *table);
typedef struct
{
  int font;
  int back;
  int fore;
  int max;
} Desk_colourtrans_fontblock;
extern void	Desk_ColourTrans_ReturnFontColours(Desk_colourtrans_fontblock *fontcols);
extern int Desk_ColourTrans_ReturnColourNumberForMode(int palette, int mode,
                                                 int *pal);
extern int	Desk_ColourTrans_ReturnColourNumber(int entry);
extern int	Desk_ColourTrans_ReturnGCOL(int entry);
#ifdef __cplusplus
}
#endif
#endif
