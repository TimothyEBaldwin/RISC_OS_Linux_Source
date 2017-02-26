#include <stdint.h>

#ifndef __GCC__
#define __attribute__(X)
#endif

#if defined(__BYTE_ORDER__) && __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
#define CONST(x) ((x) << 24)
#else
#define CONST(x) (x)
#endif

#ifdef __cplusplus
class ule32 {
  uint32_t data;
public:
  static uint32_t swap(uint32_t v) {
    if (__BYTE_ORDER__ == __ORDER_BIG_ENDIAN__)  v = __builtin_bswap32(v);
    return v;
  }
  ule32& operator = (uint32_t v) {
    data = swap(v);
    return *this;
  }
  operator uint32_t () {
    return swap(data);
  }
};
#else
typedef uint32_t ule32;
#endif

union report {
  enum {
    ev_mouse     = CONST(0),
    ev_keydown   = CONST(1),
    ev_keyup     = CONST(2),
    ev_mode_sync = CONST(3),
  } reason;
  struct {
    int32_t reason;
    ule32 x, y, buttons;
  } mouse;
  struct {
    int32_t reason;
    ule32 code;
  } key;
};

union command {
  enum {
    c_mode_change = CONST(0),
    c_set_palette = CONST(1),
    c_pointer     = CONST(2),
  } reason;
  struct {
    int32_t reason;
    ule32 vidc[16];
  } mode;
  struct palette {
    int32_t reason;
    ule32 colour, index, type;
  } palette;
  struct pointer {
    int32_t reason;
    uint8_t width, height, active_x, active_y;
    uint8_t visable;
    uint8_t data[];
  } pointer;
  uint8_t pad[33 * 8];
};
