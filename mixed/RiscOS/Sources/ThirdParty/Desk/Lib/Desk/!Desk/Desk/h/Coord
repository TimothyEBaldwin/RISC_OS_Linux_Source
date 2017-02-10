#ifndef __Desk_Coord_h
#define __Desk_Coord_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_core_h
#include "Core.h"
#endif
#ifndef __Desk_Wimp_h
#include "Wimp.h"
#endif
typedef struct
{
Desk_wimp_rect screenrect;
Desk_wimp_point scroll;
} Desk_convert_block;
extern Desk_bool Desk_Coord_PointInRect( const Desk_wimp_point *point, const Desk_wimp_rect *rect);
extern Desk_bool Desk_Coord_RectContained( const Desk_wimp_rect *InsideRect,
const Desk_wimp_rect *OutsideRect);
extern Desk_bool Desk_Coord_RectsOverlap( const Desk_wimp_rect *rect1, const Desk_wimp_rect *rect2);
#define Desk_Coord_RectsIntersect(r1, r2) (Desk_Coord_RectsOverlap(r1, r2) && \
!Desk_Coord_RectContained(r1, r2) && \
!Desk_Coord_RectContained(r2, r1))
extern void Desk_Coord_WindowOrigin( Desk_wimp_point *origin, const Desk_convert_block *convert);
#define Desk_Coord_XToScreen(X, C) \
            (((X) - (C)->scroll.x) + (C)->screenrect.min.x)
#define Desk_Coord_YToScreen(Y, C) \
        ( ((Y) - (C)->scroll.y) + (C)->screenrect.max.y )
extern void Desk_Coord_PointToScreen(Desk_wimp_point *point, const Desk_convert_block *convert);
extern void Desk_Coord_RectToScreen(Desk_wimp_rect *rect, const Desk_convert_block *convert);
#define Desk_Coord_XToWorkArea(X, C) (((X)-(C)->screenrect.min.x)+(C)->scroll.x)
#define Desk_Coord_YToWorkArea(Y, C) (((Y)-(C)->screenrect.max.y)+(C)->scroll.y)
extern void Desk_Coord_PointToWorkArea(Desk_wimp_point *point,
                                    const Desk_convert_block *convert);
extern void Desk_Coord_RectToWorkArea(Desk_wimp_rect *rect, const Desk_convert_block *convert);
extern void Desk_Coord_RectUnion(Desk_wimp_rect *dest,
                              Desk_wimp_rect *src1, Desk_wimp_rect *src2);
#ifdef __cplusplus
}
#endif
#endif
