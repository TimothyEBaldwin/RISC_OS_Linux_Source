#ifndef __Desk_Icon_h
#define __Desk_Icon_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
#include "Desk.Wimp.h"
#endif
#ifndef __Desk_DragASpr_h
#include "Desk.DragASpr.h"
#endif
extern Desk_icon_handle Desk_Icon_BarIcon(const char *spritename, Desk_window_handle pos);
extern Desk_icon_handle Desk_Icon_BarIconUser( const char *spritename, Desk_window_handle pos,
unsigned int *area);
extern Desk_bool Desk_Icon_GetSelect(Desk_window_handle window, Desk_icon_handle icon);
extern Desk_bool Desk_Icon_GetShade(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_SetSelect(Desk_window_handle window, Desk_icon_handle icon, int flag);
extern void Desk_Icon_Select(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_Deselect(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_SetShade(Desk_window_handle window, Desk_icon_handle icon, int flag);
extern void Desk_Icon_Shade(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_Unshade(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_SetForeColour(Desk_window_handle window, Desk_icon_handle icon,
int wimpcolour);
extern void Desk_Icon_SetBackColour(Desk_window_handle window, Desk_icon_handle icon,
int wimpcolour);
extern void Desk_Icon_ForceWindowRedraw(Desk_window_handle window, Desk_icon_handle icon);
#define Desk_Icon_ForceRedraw(wind, icon) Desk_Wimp_SetIconState(wind, icon, 0, 0);
extern void Desk_Icon_SetCaret(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_LoseCaret(Desk_window_handle window, Desk_icon_handle icon);
extern void Desk_Icon_SetInteger(Desk_window_handle w, Desk_icon_handle i, int value);
extern void Desk_Icon_SetDouble(Desk_window_handle w, Desk_icon_handle i,
                           double value, int decimalplaces);
extern void Desk_Icon_SetText(Desk_window_handle w, Desk_icon_handle i, char *text);
extern void Desk_Icon_SetTextRJ(Desk_window_handle w, Desk_icon_handle i, char *text);
extern void Desk_Icon_printf(Desk_window_handle window, Desk_icon_handle icon,
                        const char *format, ...);
extern double Desk_Icon_GetDouble(Desk_window_handle w, Desk_icon_handle i);
extern int Desk_Icon_GetInteger(Desk_window_handle w, Desk_icon_handle i);
extern void Desk_Icon_GetText(Desk_window_handle w, Desk_icon_handle i, char *text);
extern char *Desk_Icon_GetTextPtr(Desk_window_handle, Desk_icon_handle);
#define Desk_Icon_SetFlags(window, icon, flags, set) \
  Desk_Wimp_SetIconState((window), (icon), ((set) ? (flags) : 0), (flags))
#define Desk_Icon_SetFgCol(w, i, col) \
Desk_Wimp_SetIconState((w), (i), (col) * Desk_icon_FORECOLOUR, 0xF * Desk_icon_FORECOLOUR)
#define Desk_Icon_SetBgCol(w, i, col) \
Desk_Wimp_SetIconState((w), (i), \
                (unsigned) (col) * (unsigned) Desk_icon_BACKCOLOUR, \
                (unsigned) 0xF * (unsigned) Desk_icon_BACKCOLOUR)
 
extern void Desk_Icon_ShadeGroup(Desk_window_handle window,
                            Desk_icon_handle icons[],
                            Desk_bool shade);
extern void Desk_Icon_SelectGroup(Desk_window_handle window,
                             Desk_icon_handle icons[],
                             Desk_bool select);
extern int Desk_Icon_GetFgCol(const Desk_icon_block *icon);
extern int Desk_Icon_GetBgCol(const Desk_icon_block *icon);
extern void Desk_Icon_SetRadios(Desk_window_handle window,
                           Desk_icon_handle first, Desk_icon_handle last,
                           Desk_icon_handle onradio);
extern int Desk_Icon_WhichRadio(Desk_window_handle window,
                           Desk_icon_handle first, Desk_icon_handle last);
extern int Desk_Icon_WhichRadioInEsg(Desk_window_handle wh, int esg);
extern void Desk_Icon_ClickWait(int waittime);
extern void Desk_Icon_StartDrag(Desk_window_handle window, Desk_icon_handle icon);
#define Desk_Icon_StartSolidDrag Desk_DragASprite_DragIcon
extern void Desk_Icon_DisposeIndData(Desk_icon_data *data, Desk_icon_flags flags);
extern void Desk_Icon_FileIcon(Desk_window_handle window, Desk_icon_handle icon, int filetype);
extern void Desk_Icon_ScreenPos(Desk_window_handle window,
                           Desk_icon_handle icon,
                           Desk_wimp_rect *rect);
extern int Desk_Icon_SetSlider(Desk_window_handle window,
                          Desk_icon_handle baseicon, Desk_icon_handle slidericon,
                          int sliderpos);
extern int Desk_Icon_UpdateSlider(Desk_window_handle window,
                             Desk_icon_handle baseicon, Desk_icon_handle slidericon,
                             int lastpos);
extern int Desk_Icon_DragSlider(Desk_window_handle window,
                           Desk_icon_handle baseicon, Desk_icon_handle slidericon);
extern int Desk_Icon_ReadSlider(Desk_window_handle window,
                           Desk_icon_handle baseicon, Desk_icon_handle slidericon);
typedef struct {
                Desk_window_handle window;
                Desk_icon_handle   texticon;
                Desk_icon_handle   incrementicon;
                Desk_icon_handle   decrementicon;
                Desk_bool          loop;
                unsigned int  step;
                int           min;
                int           max;
               } Desk_icon_incdecblock;
extern Desk_icon_incdecblock *Desk_Icon_InitIncDecHandler(
                                           const Desk_window_handle window,
                                           const Desk_icon_handle   texticon,
                                           const Desk_icon_handle   incrementicon,
                                           const Desk_icon_handle   decrementicon,
                                           const Desk_bool          loop,
                                           const unsigned int  step,
                                           const int           min,
                                           const int           max,
                                           const int           start);
extern Desk_bool Desk_Icon_ReleaseIncDecHandler(Desk_icon_incdecblock *incdecblock);
extern void Desk_Icon_AlterValidation(Desk_window_handle window, Desk_icon_handle icon,
                                 const char *newvalidation);
extern Desk_bool Desk_Icon_ButtonIsHeld(void);
extern void Desk_Icon_InsertText(Desk_window_handle w, Desk_icon_handle i, const char *text);
#ifdef __cplusplus
}
#endif
#endif
