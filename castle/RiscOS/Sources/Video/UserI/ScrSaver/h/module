/* > module.h
 *
 *      Header file for module.
 */

#define FALSE   0
#define TRUE    ~FALSE

#define Service_ScreenBlanking  0xa9
#define Service_ScreenRestored  0x7b

#define NOT_USED(v) ((v)=(v))

extern _kernel_oserror *module_initialise( char *cmd_tail, int podule_base, void *pw );
extern void module_service( int service_no, _kernel_swi_regs *r, void *pw );
