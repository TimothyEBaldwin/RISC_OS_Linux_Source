#ifdef __cplusplus
extern "C" {
#endif
#ifndef __Desk_WAssert_h
#define __Desk_WAssert_h
struct Desk_wassert_error
{
char assertion[52];
unsigned int line;
char file[32];
};
extern void Desk_WAssert__wassert(char *,int,char *);
#else
# undef assert
#endif
#ifndef _DEBUG
# define assert(ignore) ((void)0)
#else
# define __SR(x) __VL(x)
# define __VL(x) #x
# define assert(e) ((e) ? (void)0 : Desk_WAssert__wassert(#e, __LINE__, __FILE__))
#ifdef __cplusplus
}
#endif
#endif
