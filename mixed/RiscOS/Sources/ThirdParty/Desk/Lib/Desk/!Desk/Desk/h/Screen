#ifndef __Desk_Screen_h
#define __Desk_Screen_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Wimp_h
	#include "Desk.Wimp.h"
#endif
#ifdef Desk__using_SDLS
  extern int        *Desk_Screen__Ref_mode( void);
  extern Desk_wimp_point *Desk_Screen__Ref_size( void);
  extern Desk_wimp_point *Desk_Screen__Ref_eig( void);
  extern Desk_wimp_point *Desk_Screen__Ref_delta( void);
  extern int        *Desk_Screen__Ref_bpp( void);
#endif
#if defined( Desk__using_SDLS) && !defined( Desk__making_Misc)
  #define Desk_screen_mode  (*Desk_Screen__Ref_mode())
  #define Desk_screen_size  (*Desk_Screen__Ref_size())
  #define Desk_screen_eig   (*Desk_Screen__Ref_eig())
  #define Desk_screen_delta (*Desk_Screen__Ref_delta())
  #define Desk_screen_bpp   (*Desk_Screen__Ref_bpp())
#else
  extern int        Desk_screen_mode;
  extern Desk_wimp_point Desk_screen_size;
  extern Desk_wimp_point Desk_screen_eig;		
  extern Desk_wimp_point Desk_screen_delta;	
  extern int        Desk_screen_bpp;		
#endif
extern Desk_bool Desk_Screen_CacheModeInfo(void);
 
#ifdef __cplusplus
}
#endif
#endif
