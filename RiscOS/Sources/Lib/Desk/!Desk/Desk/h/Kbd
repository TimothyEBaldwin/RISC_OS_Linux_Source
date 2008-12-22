#ifndef __Desk_Kbd_h
#define __Desk_Kbd_h
#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_Core_h
#include "Desk.Core.h"
#endif
extern Desk_bool Desk_Kbd_KeyDown(int keynum);
typedef enum
{
  Desk_inkey_ADJUST       = -12,                       
  Desk_inkey_MENU         = -11,                       
  Desk_inkey_SELECT       = -10,                       
  Desk_inkey_RALT         = -9,                        
  Desk_inkey_LALT         = -6,                        
  Desk_inkey_ALT          = -3,                        
  Desk_inkey_RCTRL        = -8,                        
  Desk_inkey_LCTRL        = -5,                        
  Desk_inkey_CTRL         = -2,                        
  Desk_inkey_RSHIFT       = -7,                        
  Desk_inkey_LSHIFT       = -4,                        
  Desk_inkey_SHIFT        = -1                         
} Desk_kbd_neginkey;
extern char Desk_Kbd_GET(void);
typedef struct
{
  unsigned alt         : 1;
  unsigned ctrl        : 1;
  unsigned shift       : 1;
  unsigned Desk_left_alt    : 1;
  unsigned Desk_left_ctrl   : 1;
  unsigned Desk_left_shift  : 1;
  unsigned Desk_right_alt   : 1;
  unsigned Desk_right_ctrl  : 1;
  unsigned Desk_right_shift : 1;
 
} Desk_kbd_modifiers;
extern Desk_kbd_modifiers Desk_Kbd_GetModifiers(Desk_bool detailed);
#ifdef __cplusplus
}
#endif
#endif
