#ifndef __Desk_GFX_h
#define __Desk_GFX_h
#ifdef __cplusplus
extern "C" {
#endif
#define Desk_plot_SOLIDBOTH 0x00
#define Desk_plot_SOLIDEXFINAL 0x08
#define Desk_plot_DOTTEDBOTH 0x10
#define Desk_plot_DOTTEDEXFINAL 0x18
#define Desk_plot_SOLIDEXINIT 0x20
#define Desk_plot_SOLIDEXBOTH 0x28
#define Desk_plot_DOTTEDEXINIT 0x30
#define Desk_plot_DOTTEDEXBOTH 0x38
#define Desk_plot_POINT 0x40
#define Desk_plot_HHORZLINEFILLNB 0x48
#define Desk_plot_TRIANGLEFILL 0x50
#define Desk_plot_HORIZLINEFILLB 0x58
#define Desk_plot_RECTANGLEFILL 0x60
#define Desk_plot_HORIZLINEFILLF 0x68
#define Desk_plot_PARALLELFILL 0x70
#define Desk_plot_HORIZLINEFILLNF 0x78
#define Desk_plot_FLOODTOBACK 0x80
#define Desk_plot_FLOODTOFORE 0x88
#define Desk_plot_CIRCLE 0x90
#define Desk_plot_CIRCLEFILL 0x98
#define Desk_plot_CIRCLEARC 0xA0
#define Desk_plot_SEGMENT 0xA8
#define Desk_plot_SECTOR 0xB0
#define Desk_plot_BLOCK 0xB8
#define Desk_plot_ELLIPSE 0xC0
#define Desk_plot_ELLIPSEFILL 0xC8
#define Desk_plot_GRAPHICSCHAR 0xD0
#define Desk_plot_SPRITE 0xE8
#define Desk_plot_MOVECURSORREL 0
#define Desk_plot_DRAWRELFORE 1
#define Desk_plot_DRAWRELINVERSE 2
#define Desk_plot_DRAWRELBACK 3
#define Desk_plot_MOVECURSORABS 4
#define Desk_plot_DRAWABSFORE 5
#define Desk_plot_DRAWABSINVERSE 6
#define Desk_plot_DRAWABSBACK 7
#define Desk_plot_BMOVEREL 0
#define Desk_plot_BMOVERECTREL 1
#define Desk_plot_BCOPYRECTREL 2
#define Desk_plot_BMOVEABS 4
#define Desk_plot_BMOVERECTABS 5
#define Desk_plot_BCOPYRECTABS 6
enum {
Desk_gfx_action_OVERWRITE = 0,
Desk_gfx_action_OR,
Desk_gfx_action_AND,
Desk_gfx_action_XOR,
Desk_gfx_action_INVERT,
Desk_gfx_action_LEAVE,
Desk_gfx_action_ANDNOT,
Desk_gfx_action_ORNOT,
Desk_gfx_action_TRANSPARENTBACKGROUND = 8,
Desk_gfx_action_COLOURPATTERN_1 = 16,
Desk_gfx_action_COLOURPATTERN_2 = 32,
Desk_gfx_action_COLOURPATTERN_3 = 48,
Desk_gfx_action_COLOURPATTERN_4 = 64,
Desk_gfx_action_COLOURPATTERN_GIANT = 80
};
extern void Desk_GFX_Plot(int plotcode, int x, int y);
#define Desk_GFX_Move(x, y) Desk_GFX_Plot(Desk_plot_SOLIDBOTH + Desk_plot_MOVECURSORABS, x, y)
#define Desk_GFX_MoveBy(x, y) Desk_GFX_Plot(Desk_plot_SOLIDBOTH + Desk_plot_MOVECURSORREL, x, y)
#define Desk_GFX_PlotPoint(x, y) Desk_GFX_Plot(Desk_plot_POINT + Desk_plot_DRAWABSFORE, x, y)
#define Desk_GFX_PlotPointBy(x, y) Desk_GFX_Plot(Desk_plot_POINT + Desk_plot_DRAWRELFORE, x, y)
#define Desk_GFX_Draw(x, y) Desk_GFX_Plot(Desk_plot_SOLIDBOTH + Desk_plot_DRAWABSFORE, x, y)
#define Desk_GFX_DrawBy(x, y) Desk_GFX_Plot(Desk_plot_SOLIDBOTH + Desk_plot_DRAWRELFORE, x, y)
extern void Desk_GFX_Rectangle(int x, int y, int w, int h);
#define Desk_GFX_RectangleFill(x, y, w, h) \
{ \
Desk_GFX_Move(x, y); \
Desk_GFX_Plot(Desk_plot_RECTANGLEFILL + Desk_plot_DRAWRELFORE, w, h); \
}
#define Desk_GFX_Circle(x, y, r) \
{ \
Desk_GFX_Move(x, y); \
Desk_GFX_Plot(Desk_plot_CIRCLE + Desk_plot_DRAWRELFORE, (r), 0); \
}
#define Desk_GFX_CircleFill(x, y, r) \
{ \
Desk_GFX_Move(x, y); \
Desk_GFX_Plot(Desk_plot_CIRCLEFILL + Desk_plot_DRAWRELFORE, (r), 0); \
}
extern void Desk_GFX_CLG(void);
extern void Desk_GFX_VDU(char ch);
#define VDU(C) Desk_GFX_VDU(C)
#define Desk_GFX_GCOL(A, C) {Desk_GFX_VDU(18); Desk_GFX_VDU(A); Desk_GFX_VDU(C);}
#define Desk_GFX_Mode(M) {Desk_GFX_VDU(22); Desk_GFX_VDU(M);}
#define Desk_GFX_SetOrigin(x, y) {short a=(x), b=(y); Desk_GFX_VDU(29); \
Desk_GFX_VDU(a & 0xff); Desk_GFX_VDU((a>>8) & 0xff); \
Desk_GFX_VDU(b & 0xff); Desk_GFX_VDU((b>>8) & 0xff);}
extern void Desk_GFX_Write0( const char *string);
extern void Desk_GFX_WriteN( const char *string, int numchars);
extern void Desk_GFX_Wait(void);
#ifdef __cplusplus
}
#endif
#endif
