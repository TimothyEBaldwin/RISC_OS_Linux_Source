#line 1 "c.drawtrans"
 



















#line 1 "assert.h"
___toplevel















 extern void __assert(char *, char *, int);












#line 22 "c.drawtrans"
#line 1 "stdlib.h"
___toplevel














 typedef unsigned int size_t; 



 typedef int wchar_t; 







typedef struct div_t { int quot, rem; } div_t;
 
typedef struct ldiv_t { long int quot, rem; } ldiv_t;
 








 


 

 

 




extern double atof(const char * );
 
extern int atoi(const char * );
 
extern long int atol(const char * );
 

extern double strtod(const char * , char ** );
 
extern long int strtol(const char * , char **, int );
 
extern unsigned long int strtoul(const char * ,
 char ** , int );
 

extern int rand(void);
 
extern void srand(unsigned int );
 
extern int _ANSI_rand(void);
 
extern void _ANSI_srand(unsigned int );
 













extern void *calloc(size_t , size_t );
 
extern void free(void * );
 
extern void *malloc(size_t );
 
extern void *realloc(void * , size_t );
 


extern void abort(void);
 
extern int atexit(void (* )(void));
 

extern void exit(int status);
 

extern char *getenv(const char * );
 
extern int system(const char * );
 

extern void *bsearch(const void *key, const void * ,
 size_t , size_t ,
 int (* )(const void *, const void *));
 
extern void qsort(void * , size_t , size_t ,
 int (* )(const void *, const void *));
 

extern int abs(int );
 
extern div_t div(int , int );
 
extern long int labs(long int );
 
extern ldiv_t ldiv(long int , long int );
 


extern int mblen(const char * , size_t );
 
extern int mbtowc(wchar_t * , const char * , size_t );
 
extern int wctomb(char * , wchar_t );
 


extern size_t mbstowcs(wchar_t * , const char * , size_t );
 
extern size_t wcstombs(char * , const wchar_t * , size_t );
 







#line 23 "c.drawtrans"
#line 1 "stdio.h"
___toplevel























typedef char *__va_list[1]; 





typedef struct __fpos_t_struct
{ unsigned long __lo; 
} fpos_t;
 

typedef struct __FILE_struct
{ unsigned char *__ptr;
 int __icnt; 
 int __ocnt; 
 int __flag;
 
 
 unsigned char *__base; 
 int __file; 
 long __pos; 
 int __bufsiz; 
 int __signature; 
 struct __extradata *__extrap; 
} FILE;
 

















 


 



 

 








 









extern FILE __iob[];
 


 

 

 


extern int remove(const char * );
 
extern int rename(const char * , const char * );
 
extern FILE *tmpfile(void);
 
extern char *tmpnam(char * );
 

extern int fclose(FILE * );
 
extern int fflush(FILE * );
 
extern FILE *fopen(const char * , const char * );
 
extern FILE *freopen(const char * , const char * ,
 FILE * );
 
extern void setbuf(FILE * , char * );
 
extern int setvbuf(FILE * , char * ,
 int , size_t );
 


extern int fprintf(FILE * , const char * , ...);
 
extern int printf(const char * , ...);
 
extern int sprintf(char * , const char * , ...);
 

extern int fscanf(FILE * , const char * , ...);
 
extern int scanf(const char * , ...);
 
extern int sscanf(const char * , const char * , ...);
 

extern int vprintf(const char * , __va_list );
 
extern int vfprintf(FILE * ,
 const char * , __va_list );
 
extern int vsprintf(char * , const char * , __va_list );
 

extern int fgetc(FILE * );
 
extern char *fgets(char * , int , FILE * );
 
extern int fputc(int , FILE * );
 
extern int fputs(const char * , FILE * );
 
extern int __filbuf(FILE * );
 



extern int (getc)(FILE * );

 


extern int (getchar)(void);

 
extern char *gets(char * );
 
extern int __flsbuf(int , FILE * );
 



extern int (putc)(int , FILE * );

 


extern int (putchar)(int );

 
extern int puts(const char * );
 
extern int ungetc(int , FILE * );
 

extern size_t fread(void * ,
 size_t , size_t , FILE * );
 
extern size_t fwrite(const void * ,
 size_t , size_t , FILE * );
 

extern int fgetpos(FILE * , fpos_t * );
 
extern int fseek(FILE * , long int , int );
 
extern int fsetpos(FILE * , const fpos_t * );
 
extern long int ftell(FILE * );
 
extern void rewind(FILE * );
 

extern void clearerr(FILE * );
 



extern int (feof)(FILE * );

 


extern int (ferror)(FILE * );

 
extern void perror(const char * );
 







#line 24 "c.drawtrans"
#line 1 "math.h"
___toplevel
















extern const double  __huge_val ;








extern double acos(double );
 
 
 
extern double asin(double );
 
 
 
 
extern double atan(double );
 
 
extern double atan2(double , double );
 
 
 
 

extern double __d_atan(double);


extern double cos(double );
 
 
 
extern double sin(double );
 
 
 

extern double __d_sin(double);
extern double __d_cos(double);



extern double tan(double );
 
 
 
 

extern double cosh(double );
 
 
 
 
extern double sinh(double );
 
 
 
 
 
extern double tanh(double );
 
 

extern double exp(double );
 
 
 
 
 
extern double frexp(double , int * );
 
 
 
 
 
 
extern double ldexp(double , int );
 
 
 
 
extern double log(double );
 
 
 
 
 
extern double log10(double );
 
 
 
extern double modf(double , double * );
 
 
 
 

extern double pow(double , double );
 
 
 
 
 
 
extern double sqrt(double );
 
 
 

extern double ceil(double );
 
 
extern double fabs(double );
 
 
extern double floor(double );
 
 
extern double fmod(double , double );
 
 
 
 
 

extern double __d_abs(double);











#line 25 "c.drawtrans"
#line 1 "limits.h"
___toplevel











 

 

 

 

 

 

 
 


 

 

 

 

 

 

 

 

 




#line 26 "c.drawtrans"
#line 1 "string.h"
___toplevel
























extern char *strcpy(char * , const char * );
 
extern char *strncpy(char * , const char * , size_t );
 

extern char *strcat(char * , const char * );
 
extern char *strncat(char * , const char * , size_t );
 



extern int memcmp(const void * , const void * , size_t );
 
extern int strcmp(const char * , const char * );
 
extern int strncmp(const char * , const char * , size_t );
 
extern int strcoll(const char * , const char * );
 

extern size_t strxfrm(char * , const char * , size_t );
 

extern char *strchr(const char * , int );
 
extern size_t strcspn(const char * , const char * );
 
extern char *strpbrk(const char * , const char * );
 
extern char *strrchr(const char * , int );
 
extern size_t strspn(const char * , const char * );
 
extern char *strstr(const char * , const char * );
 
extern char *strtok(char * , const char * );
 

extern void *memcpy(void * , const void * , size_t );
 
extern void *memmove(void * , const void * , size_t );
 
extern void *memchr(const void * , int , size_t );
 
extern void *memset(void * , int , size_t );
 

extern char *strerror(int );
 
extern size_t strlen(const char * );
 







#line 27 "c.drawtrans"

#line 1 "C:h.os"
 







 





 









#line 1 "C:h.kernel"
___toplevel


 












typedef struct {
   int r[10];             
} _kernel_swi_regs;

typedef struct {
   int load, exec;        
   int start, end;        
} _kernel_osfile_block;

typedef struct {
   void * dataptr;        
   int nbytes, fileptr;
   int buf_len;           
   char * wild_fld;       
} _kernel_osgbpb_block;

typedef struct {
   int errnum;            
   char errmess[252];     
} _kernel_oserror;

typedef struct stack_chunk {
   unsigned long sc_mark;        
   struct stack_chunk *sc_next, *sc_prev;
   unsigned long sc_size;
   int (*sc_deallocate)();
} _kernel_stack_chunk;

extern _kernel_stack_chunk *_kernel_current_stack_chunk(void);

extern void _kernel_setreturncode(unsigned code);

extern void _kernel_exit(int);

extern void _kernel_raise_error(_kernel_oserror *);
 
 

extern void _kernel_exittraphandler(void);












extern int _kernel_hostos(void);
 



extern int _kernel_fpavailable(void);
 




extern _kernel_oserror *_kernel_swi(int no, _kernel_swi_regs *in,
                                   _kernel_swi_regs *out);
 






extern _kernel_oserror *_kernel_swi_c(int no, _kernel_swi_regs *in,
                                      _kernel_swi_regs *out, int *carry);
 





extern char *_kernel_command_string(void);
 



 











extern int _kernel_osbyte(int op, int x, int y);
 










extern int _kernel_osrdch(void);
 



extern int _kernel_oswrch(int ch);
 




extern int _kernel_osbget(unsigned handle);
 




extern int _kernel_osbput(int ch, unsigned handle);
 




extern int _kernel_osgbpb(int op, unsigned handle, _kernel_osgbpb_block *inout); 







extern int _kernel_osword(int op, int *data);
 





extern int _kernel_osfind(int op, char *name);
 





extern int _kernel_osfile(int op, const char *name, _kernel_osfile_block *inout);
 




extern int _kernel_osargs(int op, unsigned handle, int arg);
 






extern int _kernel_oscli(const char *s);
 








extern _kernel_oserror *_kernel_last_oserror(void);
 









extern _kernel_oserror *_kernel_getenv(const char *name, char *buffer, unsigned size);
 





extern _kernel_oserror *_kernel_setenv(const char *name, const char *value);
 




extern int _kernel_system(const char *string, int chain);
 
















extern unsigned _kernel_alloc(unsigned minwords, void **block);
 







typedef void freeproc(void *);
typedef void * allocproc(unsigned);

extern void _kernel_register_allocs(allocproc *malloc, freeproc *free);
 







typedef int _kernel_ExtendProc(int  , void**  );
extern _kernel_ExtendProc *_kernel_register_slotextend(_kernel_ExtendProc *proc);
 







extern int _kernel_escape_seen(void);
 







typedef union {
    struct {int s:1, u:16, x: 15; unsigned mhi, mlo; } i;
    int w[3]; } _extended_fp_number;

typedef struct {
   int r4, r5, r6, r7, r8, r9;
   int fp, sp, pc, sl;
   _extended_fp_number f4, f5, f6, f7; } _kernel_unwindblock;

extern int _kernel_unwind(_kernel_unwindblock *inout, char **language);
 












extern char *_kernel_procname(int pc);
 




extern char *_kernel_language(int pc);
 




 










extern unsigned _kernel_udiv(unsigned divisor, unsigned dividend);
extern unsigned _kernel_urem(unsigned divisor, unsigned dividend);
extern unsigned _kernel_udiv10(unsigned dividend);

extern int _kernel_sdiv(int divisor, int dividend);
extern int _kernel_srem(int divisor, int dividend);
extern int _kernel_sdiv10(int dividend);

 



typedef enum { NotHandled, Handled } _kernel_HandledOrNot;

typedef struct {
   int regs [16];
} _kernel_registerset;

typedef struct {
   int regs [10];
} _kernel_eventregisters;

typedef void (*PROC) (void);
typedef _kernel_HandledOrNot (*_kernel_trapproc) (int code, _kernel_registerset *regs);
typedef _kernel_HandledOrNot (*_kernel_eventproc) (int code, _kernel_registerset *regs);

typedef struct {
   int size;
   int codestart, codeend;
   char *name;
   PROC (*InitProc)(void);
   PROC FinaliseProc;
   _kernel_trapproc TrapProc;
   _kernel_trapproc UncaughtTrapProc;
   _kernel_eventproc EventProc;
   _kernel_eventproc UnhandledEventProc;
   void (*FastEventProc) (_kernel_eventregisters *);
   int (*UnwindProc) (_kernel_unwindblock *inout, char **language);
   char * (*NameProc) (int pc);
} _kernel_languagedescription;

typedef int _kernel_ccproc(int, int, int);

extern int _kernel_call_client(int a1, int a2, int a3, _kernel_ccproc callee);
 





extern int _kernel_client_is_module(void);
 




extern int _kernel_processor_mode(void);

extern void _kernel_irqs_on(void);

extern void _kernel_irqs_off(void);

extern int _kernel_irqs_disabled(void);
 

extern void *_kernel_RMAalloc(size_t size);

extern void *_kernel_RMAextend(void *p, size_t size);

extern void _kernel_RMAfree(void *p);


 
#line 26 "C:h.os"








typedef struct {
        int r[10];                
} os_regset;

typedef _kernel_oserror os_error;

 



   
 









void (os_swi)(int swicode, os_regset *regs);
 



 







os_error *os_swix(int swicode, os_regset *regs);




 







 









os_error *(os_swi0)(int swicode);  




os_error *(os_swi1)(int swicode, ...);




os_error *(os_swi2)(int swicode, ...);




os_error *(os_swi3)(int swicode, ...);




os_error *(os_swi4)(int swicode, ...);




os_error *(os_swi5)(int swicode, ...);




os_error *(os_swi6)(int swicode, ...);





os_error *(os_swi1r)(int swicode, ...);




os_error *(os_swi2r)(int swicode, ...);




os_error *(os_swi3r)(int swicode, ...);




os_error *(os_swi4r)(int swicode, ...);




os_error *(os_swi5r)(int swicode, ...);




os_error *(os_swi6r)(int swicode, ...);

os_error *os_swix0(int swicode);  
os_error *os_swix1(int swicode, ...);
os_error *os_swix2(int swicode, ...);
os_error *os_swix3(int swicode, ...);
os_error *os_swix4(int swicode, ...);
os_error *os_swix5(int swicode, ...);
os_error *os_swix6(int swicode, ...);

os_error *os_swix1r(int swicode, ...);
os_error *os_swix2r(int swicode, ...);
os_error *os_swix3r(int swicode, ...);
os_error *os_swix4r(int swicode, ...);
os_error *os_swix5r(int swicode, ...);
os_error *os_swix6r(int swicode, ...);

 





os_error *os_byte(int a, int *x  , int *y  );


 





os_error *os_word(int wordcode, void *p);

typedef struct {
        int action;              
        int file_handle;         

        void *data_addr;         
        int number, seq_point, buf_len;
        char *wild_fld;          
        int reserved[3];         
} os_gbpbstr;


 




os_error *os_gbpb(os_gbpbstr*);

typedef struct {
        int action;              
        char * name;             
        int loadaddr, execaddr;  
        int start, end;          
        int reserved[4];         
} os_filestr;


 




os_error *os_file(os_filestr*);


 




os_error *os_args(os_regset*);


 




os_error *os_find(os_regset*);


 




os_error *os_cli(char *cmd);


 




void os_read_var_val(char *name, char *buf  , int bufsize);




 
#line 29 "c.drawtrans"
#line 1 "C:h.msgs"
 







 



















 







extern struct msgtrans_control_block *msgs_main_control_block (void);

 







extern struct msgtrans_control_block *msgs_default_control_block (void);

 













void msgs_init(void);


 
















char *msgs_lookup(char *tag_and_default);

 




















 

#line 30 "c.drawtrans"
#line 1 "C:h.wimp"
 







 











#line 1 "C:h.sprite"
 







 











 









 

typedef enum
{
  sprite_nopalette  = 0,
  sprite_haspalette = 1
} sprite_palflag;

typedef struct
{
  int xmag,ymag,xdiv,ydiv;
} sprite_factors;

typedef char sprite_pixtrans; 




 




extern os_error * sprite_screensave(const char *filename, sprite_palflag);
 
 



extern os_error * sprite_screenload(const char *filename);



 

typedef struct  
{
  int size;
  int number;
  int sproff;
  int freeoff;
} sprite_area;

typedef struct  
{
  int  next;       
  char name[12];   
  int  width;      
  int  height;     
  int  lbit;       
  int  rbit;       
  int  image;      
  int  mask;       
  int  mode;       
                   
                   
} sprite_header;



typedef void * sprite_ptr;


 



void sprite_area_initialise(sprite_area *, int size);

 



extern os_error * sprite_area_readinfo(sprite_area *, sprite_area *resultarea);

 




extern os_error * sprite_area_reinit(sprite_area *);

 




extern os_error * sprite_area_load(sprite_area *, const char *filename);
 
 




extern os_error * sprite_area_merge(sprite_area *, const char *filename);
 
 




extern os_error * sprite_area_save(sprite_area *, const char *filename);

 




extern os_error * sprite_getname(sprite_area *, void *buffer, int *length, int index);

 





extern os_error * sprite_get(sprite_area *, char *name, sprite_palflag);

 





extern os_error * sprite_get_rp(sprite_area *, char *name, sprite_palflag,
                         sprite_ptr *resultaddress);

 





extern os_error * sprite_get_given(sprite_area *, char *name, sprite_palflag,
                            int x0, int y0, int x1, int y1);

 





extern os_error * sprite_get_given_rp(sprite_area *, char *name, sprite_palflag,
                               int x0, int y0, int x1, int y1,
                               sprite_ptr *resultaddress);

 




extern os_error * sprite_create(sprite_area *, char *name, sprite_palflag,
                         int width, int height, int mode);

 





extern os_error * sprite_create_rp(sprite_area *, char *name, sprite_palflag,
                            int width, int height, int mode,
                            sprite_ptr *resultaddress);


 

typedef enum
{
  sprite_id_name = 0,
  sprite_id_addr = 0x74527053  
} sprite_type;

typedef struct
{
  union
  {
    char *     name;  
    sprite_ptr addr;
  } s;
  sprite_type tag;    
} sprite_id;


 



extern os_error * sprite_select(sprite_area *, sprite_id *);

 



 
extern os_error * sprite_select_rp(sprite_area *, sprite_id *,
                            sprite_ptr *resultaddress);

 



extern os_error * sprite_delete(sprite_area *, sprite_id *);

 



extern os_error * sprite_rename(sprite_area *, sprite_id *, char *newname);

 



extern os_error * sprite_copy(sprite_area *, sprite_id *, char *copyname);

 



extern os_error * sprite_put(sprite_area *, sprite_id *, int gcol);

 



extern os_error * sprite_put_given(sprite_area *, sprite_id *, int gcol,
                            int x, int y);

 




extern os_error * sprite_put_scaled(sprite_area *, sprite_id *, int gcol,
                            int x, int y,
                            sprite_factors *factors,
                            sprite_pixtrans pixtrans[]);

 




extern os_error * sprite_put_greyscaled(sprite_area *, sprite_id *,
                            int x, int y,
                            sprite_factors *factors,
                            sprite_pixtrans pixtrans[]);

 



extern os_error * sprite_put_mask(sprite_area *, sprite_id *);

 



extern os_error * sprite_put_mask_given(sprite_area *, sprite_id *, int x, int y);

 



extern os_error * sprite_put_mask_scaled(sprite_area *, sprite_id *,
                            int x, int y,
                            sprite_factors *factors);

 



extern os_error * sprite_put_char_scaled(char ch,
                                  int x, int y,
                                  sprite_factors *factors);

 



extern os_error * sprite_create_mask(sprite_area *, sprite_id *);

 



extern os_error * sprite_remove_mask(sprite_area *, sprite_id *);

 



extern os_error * sprite_insert_row(sprite_area *, sprite_id *, int row);

 



extern os_error * sprite_delete_row(sprite_area *, sprite_id *, int row);

 



extern os_error * sprite_insert_column(sprite_area *, sprite_id *, int column);

 



extern os_error * sprite_delete_column(sprite_area *, sprite_id *, int column);

 



extern os_error * sprite_flip_x(sprite_area *, sprite_id *);

 



extern os_error * sprite_flip_y(sprite_area *, sprite_id *);


typedef struct
{
 int width;
 int height;
 int mask;
 int mode;
} sprite_info;

 



extern os_error * sprite_readsize(sprite_area *, sprite_id *,
                           sprite_info *resultinfo);


typedef struct
{
  int colour;
  int tint;
} sprite_colour;

 



extern os_error * sprite_readpixel(sprite_area *, sprite_id *,
                            int x, int y, sprite_colour *resultcolour);

 



extern os_error * sprite_writepixel(sprite_area *, sprite_id *,
                             int x, int y, sprite_colour *colour);


typedef enum
{
  sprite_masktransparent = 0,
  sprite_masksolid       = 1
} sprite_maskstate;

 



extern os_error * sprite_readmask(sprite_area *, sprite_id *,
                           int x, int y, sprite_maskstate *resultmaskstate);

 



extern os_error * sprite_writemask(sprite_area *, sprite_id *,
                            int x, int y, sprite_maskstate *maskstate);


typedef struct
        { int r[4];
        } sprite_state;

 



extern os_error *sprite_restorestate(sprite_state state);


 



extern os_error *sprite_outputtosprite(sprite_area *area, sprite_id *id,
                                int *save_area, sprite_state *state);

 



extern os_error *sprite_outputtomask(sprite_area *area, sprite_id *id,
                              int *save_area, sprite_state *state);

 



extern os_error *sprite_outputtoscreen(int *save_area, sprite_state *state);

 



extern os_error *sprite_sizeof_spritecontext(sprite_area *area, sprite_id *id,
                                      int *size);

 



extern os_error *sprite_sizeof_screencontext(int *size);

 



extern os_error *sprite_removewastage(sprite_area *area, sprite_id *id);

 



extern os_error
  *sprite_change_size
  (sprite_area *area, sprite_id *id,  int  rows, int at, int number);

 

typedef struct {int p0 [2], p1 [2], p2 [2], p3 [2];} sprite_pgm;
typedef int sprite_transmat [6];
typedef struct {int x0, y0, x1, y1;} sprite_box;

 



extern os_error
  *sprite_put_mask_trans
  (sprite_area *, sprite_id *, sprite_box *, sprite_transmat *);

 



extern os_error
  *sprite_put_mask_pgm
  (sprite_area *, sprite_id *, sprite_box *, sprite_pgm *);

 



extern os_error
  *sprite_put_trans
  (sprite_area *, sprite_id *, int gcol_action, sprite_box *, sprite_transmat *, sprite_pixtrans *);

 



extern os_error
  *sprite_put_pgm
  (sprite_area *, sprite_id *, int gcol_action, sprite_box *, sprite_pgm *, sprite_pixtrans *);



 
#line 23 "C:h.wimp"










typedef enum {                      

  wimp_WMOVEABLE = 0x00000002,      
  wimp_REDRAW_OK = 0x00000010,      

  wimp_WPANE     = 0x00000020,      
  wimp_WTRESPASS = 0x00000040,      

  wimp_WSCROLL_R1= 0x00000100,      

  wimp_SCROLL_R2 = 0x00000200,      
  wimp_REAL_COLOURS = 0x000000400,  
  wimp_BACK_WINDOW = 0x000000800,   
  wimp_HOT_KEYS = 0x000001000,      

  wimp_WOPEN  = 0x00010000,         
  wimp_WTOP   = 0x00020000,         
  wimp_WFULL  = 0x00040000,         
  wimp_WCLICK_TOGGLE = 0x00080000,  

  wimp_WFOCUS = 0x00100000,          

  wimp_WBACK  = 0x01000000,         
  wimp_WQUIT  = 0x02000000,         
  wimp_WTITLE = 0x04000000,         
  wimp_WTOGGLE= 0x08000000,         
  wimp_WVSCR  = 0x10000000,         
  wimp_WSIZE  = 0x20000000,         
  wimp_WHSCR  = 0x40000000,         
  wimp_WNEW   = ~0x7fffffff         
                                    
} wimp_wflags;

typedef enum {
  wimp_WCTITLEFORE,
  wimp_WCTITLEBACK,
  wimp_WCWKAREAFORE,
  wimp_WCWKAREABACK,
  wimp_WCSCROLLOUTER,
  wimp_WCSCROLLINNER,
  wimp_WCTITLEHI,
  wimp_WCRESERVED
} wimp_wcolours;
 
 

typedef enum {                       
  wimp_ITEXT      = 0x00000001,      
  wimp_ISPRITE    = 0x00000002,      
  wimp_IBORDER    = 0x00000004,      
  wimp_IHCENTRE   = 0x00000008,      
  wimp_IVCENTRE   = 0x00000010,      
  wimp_IFILLED    = 0x00000020,      
  wimp_IFONT      = 0x00000040,      
  wimp_IREDRAW    = 0x00000080,      
  wimp_INDIRECT   = 0x00000100,      
  wimp_IRJUST     = 0x00000200,      
  wimp_IESG_NOC   = 0x00000400,      

  wimp_IHALVESPRITE=0x00000800,      
  wimp_IBTYPE     = 0x00001000,      
  wimp_ISELECTED  = 0x00200000,      
  wimp_INOSELECT  = 0x00400000,      
  wimp_IDELETED   = 0x00800000,      
  wimp_IFORECOL   = 0x01000000,      
  wimp_IBACKCOL   = 0x10000000       
} wimp_iconflags;

 



typedef enum {                 
  wimp_BIGNORE,                
  wimp_BNOTIFY,
  wimp_BCLICKAUTO,
  wimp_BCLICKDEBOUNCE,
  wimp_BSELREL,
  wimp_BSELDOUBLE,
  wimp_BDEBOUNCEDRAG,
  wimp_BRELEASEDRAG,
  wimp_BDOUBLEDRAG,
  wimp_BSELNOTIFY,
  wimp_BCLICKDRAGDOUBLE,
  wimp_BCLICKSEL,               
  wimp_BWRITABLE = 15
} wimp_ibtype;

typedef enum {                  
  wimp_BRIGHT       = 0x001,
  wimp_BMID         = 0x002,
  wimp_BLEFT        = 0x004,
  wimp_BDRAGRIGHT   = 0x010,
  wimp_BDRAGLEFT    = 0x040,
  wimp_BCLICKRIGHT  = 0x100,
  wimp_BCLICKLEFT   = 0x400
} wimp_bbits;

typedef enum {
  wimp_MOVE_WIND = 1,                  
  wimp_SIZE_WIND = 2,                  
  wimp_DRAG_HBAR = 3,                  
  wimp_DRAG_VBAR = 4,                  
  wimp_USER_FIXED = 5,                 
  wimp_USER_RUBBER = 6,                
  wimp_USER_HIDDEN = 7                 
} wimp_dragtype;

 

typedef int wimp_w;  
typedef int wimp_i;  
typedef int wimp_t;  

typedef union {            
  char text[12];           
  char sprite_name[12];    
  struct {
    char *name;
    void *spritearea;      
                           
     int  nameisname;       
  } indirectsprite;
  struct {                 
    char *buffer;          
    char *validstring;     
    int bufflen;           
  } indirecttext;
} wimp_icondata;

typedef struct {
  int x0, y0, x1, y1;
} wimp_box;

typedef struct {
  wimp_box box;            
  int scx, scy;            
  wimp_w behind;           
  wimp_wflags flags;       
  char colours[8];         
  wimp_box ex;             
  wimp_iconflags titleflags;      
  wimp_iconflags workflags;       
  void *spritearea;        
                           
  int minsize;             

  wimp_icondata title;     
  int nicons;              
} wimp_wind;
 


typedef struct {           
  wimp_w w;
  wimp_wind info;
} wimp_winfo;
 

typedef struct {           
  wimp_box box;            

  wimp_iconflags flags;    
  wimp_icondata data;      
} wimp_icon;

typedef struct {           
  wimp_w w;
  wimp_icon i;
} wimp_icreate;

typedef struct {
  wimp_w w;                
  wimp_box box;            
  int x, y;                
  wimp_w behind;           

} wimp_openstr;

typedef struct {  
  wimp_openstr o;
  wimp_wflags flags;
} wimp_wstate;

typedef enum {                
  wimp_ENULL,                 
  wimp_EREDRAW,               
  wimp_EOPEN,
  wimp_ECLOSE,
  wimp_EPTRLEAVE,
  wimp_EPTRENTER,
  wimp_EBUT,                  
  wimp_EUSERDRAG,
  wimp_EKEY,
  wimp_EMENU,
  wimp_ESCROLL,
  wimp_ELOSECARET,
  wimp_EGAINCARET,
  wimp_ESEND = 17,         
  wimp_ESENDWANTACK = 18,  
  wimp_EACK = 19           
} wimp_etype;

typedef enum {                
  wimp_EMNULL     = 1 << wimp_ENULL,
  wimp_EMREDRAW   = 1 << wimp_EREDRAW,
  wimp_EMOPEN     = 1 << wimp_EOPEN,
  wimp_EMCLOSE    = 1 << wimp_ECLOSE,
  wimp_EMPTRLEAVE = 1 << wimp_EPTRLEAVE,
  wimp_EMPTRENTER = 1 << wimp_EPTRENTER,
  wimp_EMBUT      = 1 << wimp_EBUT,
  wimp_EMUSERDRAG = 1 << wimp_EUSERDRAG,
  wimp_EMKEY      = 1 << wimp_EKEY,
  wimp_EMMENU     = 1 << wimp_EMENU,
  wimp_EMSCROLL   = 1 << wimp_ESCROLL,
  wimp_EMLOSECARET= 1 << wimp_ELOSECARET,
  wimp_EMGAINCARET= 1 << wimp_EGAINCARET,
  wimp_EMSEND     = 1 << wimp_ESEND,
  wimp_EMSENDWANTACK
                  = 1 << wimp_ESENDWANTACK,
  wimp_EMACK      = 1 << wimp_EACK
} wimp_emask;

typedef struct {
  wimp_w w;
  wimp_box box;            
  int scx, scy;            
  wimp_box g;              
} wimp_redrawstr;

typedef struct {
  int x, y;          
  wimp_bbits bbits;  
  wimp_w w;          
  wimp_i i;          
} wimp_mousestr;

typedef struct {
  wimp_w w;
  wimp_i i;
  int x, y;                 
  int height;               




  int index;                
} wimp_caretstr;

 
typedef enum {
  wimp_MCLOSEDOWN    = 0,  

  wimp_MDATASAVE     = 1,  
  wimp_MDATASAVEOK   = 2,  
  wimp_MDATALOAD     = 3,  
  wimp_MDATALOADOK   = 4,  
  wimp_MDATAOPEN     = 5,  
  wimp_MRAMFETCH     = 6,  
  wimp_MRAMTRANSMIT  = 7,  

  wimp_MPREQUIT      = 8,
  wimp_PALETTECHANGE = 9,
  wimp_SAVEDESK      = 10,  
  wimp_MDEVICECLAIM  = 11,  
  wimp_MDEVICEINUSE  = 12,  
  wimp_MDATASAVED    = 13,  

  wimp_FilerOpenDir  = 0x0400,
  wimp_FilerCloseDir = 0x0401,

  wimp_Notify        = 0x40040,   

  wimp_MMENUWARN     = 0x400c0,
   







  wimp_MMODECHANGE   = 0x400c1,
  wimp_MINITTASK     = 0x400c2,
  wimp_MCLOSETASK    = 0x400c3,
  wimp_MSLOTCHANGE   = 0x400c4,        
  wimp_MSETSLOT      = 0x400c5,        

  wimp_MTASKNAMERQ   = 0x400c6,        
  wimp_MTASKNAMEIS   = 0x400c7,        
  wimp_MTASKSTARTED  = 0x400c8,        

  wimp_MHELPREQUEST  = 0x502,          
  wimp_MHELPREPLY    = 0x503,          

   

  wimp_MPrintFile       = 0x80140,     
                                       
  wimp_MWillPrint       = 0x80141,     
  wimp_MPrintSave       = 0x80142,     
  wimp_MPrintError      = 0x80144,     
  wimp_MPrintTypeOdd    = 0x80145,     
                                       
  wimp_MPrintTypeKnown  = 0x80146,     
  wimp_MPrinterChange   = 0x80147      

} wimp_msgaction;

typedef struct {           
  int size;                
  wimp_t task;             
  int my_ref;              
  int your_ref;            
  wimp_msgaction action;   
} wimp_msghdr;
 


typedef struct {
  wimp_w w;                
  wimp_i i;                
  int x;                   
  int y;
  int estsize;             
  int type;                
  char leaf[212];          
} wimp_msgdatasave;

typedef struct {
   
  wimp_w w;                
  wimp_i i;                
  int x;                   
  int y;
  int estsize;             
  int type;                
  char name[212];          
} wimp_msgdatasaveok;

typedef struct {
  wimp_w w;                
  wimp_i i;                
  int x;                   
  int y;
  int size;                
  int type;                
  char name[212];          
} wimp_msgdataload;

 

typedef wimp_msgdataload wimp_msgdataopen;
 



typedef struct {              
  char *addr;                 
  int nbytes;                 
} wimp_msgramfetch;

typedef struct {              
  char *addr;                 
  int nbyteswritten;          
} wimp_msgramtransmit;

typedef struct {            
  int filehandle;           
} wimp_msgsavedesk;

typedef struct {
  int major;          
  int minor;          
  char information[228];    
} wimp_msgdevice;

typedef struct {
  wimp_mousestr m;     
} wimp_msghelprequest;

typedef struct {
  char text[200];         
} wimp_msghelpreply;

typedef struct {          
  int filler[5] ;
  int type ;              
  char name[256-44] ;     
} wimp_msgprint ;

typedef struct {           
  wimp_msghdr hdr;
  union {
    char chars[236];
    int words[59];              
    wimp_msgdatasave    datasave;
    wimp_msgdatasaveok  datasaveok;
    wimp_msgdataload    dataload;
    wimp_msgdataopen    dataopen;
    wimp_msgramfetch    ramfetch;
    wimp_msgramtransmit ramtransmit;
    wimp_msghelprequest helprequest;
    wimp_msghelpreply   helpreply;
    wimp_msgprint       print;
    wimp_msgsavedesk    savedesk;
    wimp_msgdevice      device;
  } data;
} wimp_msgstr;

typedef union {
    wimp_openstr o;          
    struct {
      wimp_mousestr m;
      wimp_bbits b;} but;    
    wimp_box dragbox;        
    struct {wimp_caretstr c; int chcode;} key;   
    int menu[10];            
    struct {wimp_openstr o; int x, y;} scroll;   
                                        
                                        
                              
    wimp_caretstr c;         
    wimp_msgstr msg;         
} wimp_eventdata;

typedef struct {             
  wimp_etype e;              
  wimp_eventdata data;
} wimp_eventstr;

typedef struct {
  char title[12];          
  char tit_fcol, tit_bcol, work_fcol, work_bcol;  
  int width, height;       
  int gap;                 
} wimp_menuhdr;

typedef enum {            
  wimp_MTICK       = 1,
  wimp_MSEPARATE   = 2,
  wimp_MWRITABLE   = 4,
  wimp_MSUBLINKMSG = 8,  

  wimp_MLAST = 0x80,     
  wimp_MINDIRECTED = 0x100
} wimp_menuflags;
 


typedef struct wimp_menustr *wimp_menuptr;
 

typedef struct {
  wimp_menuflags flags;          
  wimp_menuptr submenu;          


  wimp_iconflags iconflags;      
  wimp_icondata data;            
} wimp_menuitem;
 


typedef struct wimp_menustr {
  wimp_menuhdr hdr;
     
} wimp_menustr;

typedef struct {
  wimp_w window;
  wimp_dragtype type;
  wimp_box box;            
  wimp_box parent;         
} wimp_dragstr;

typedef struct {
  wimp_w window;           
  int bit_mask;            
  int bit_set;             
} wimp_which_block;

typedef struct {
  int shape_num;           
  char * shape_data;       

  int width, height;       

  int activex, activey;    
} wimp_pshapestr;

typedef struct {
  char f[256];             


} wimp_font_array;

typedef struct {                
        int reserved;           
        wimp_wind *buf;         
        char *work_free;        


        char *work_end;         
        wimp_font_array *font;  

        char *name;             
        int index;              
} wimp_template;

typedef union {
  struct {char gcol; char red; char green; char blue;} bytes;
  int word;
} wimp_paletteword;
 


typedef struct {
  wimp_paletteword c[16];               
  wimp_paletteword screenborder, mouse1, mouse2, mouse3;
} wimp_palettestr;

 

os_error *wimp_initialise(int * v);
 





os_error *wimp_taskinit (char *name, int *version  ,
                         wimp_t *t  , ...);

 




os_error *wimp_create_wind(wimp_wind *, wimp_w *);
 

os_error *wimp_create_icon(wimp_icreate *, wimp_i *result);
 

os_error *wimp_delete_wind(wimp_w);

os_error *wimp_delete_icon(wimp_w, wimp_i);

os_error *wimp_open_wind(wimp_openstr *);
 

os_error *wimp_close_wind(wimp_w);
 

os_error *wimp_poll(wimp_emask mask, wimp_eventstr *result);
 

void wimp_save_fp_state_on_poll(void) ;
 





void wimp_corrupt_fp_state_on_poll(void) ;
 



os_error *wimp_redraw_wind(wimp_redrawstr*,  int *  );
 

os_error *wimp_update_wind(wimp_redrawstr*,  int *  );
 

os_error *wimp_get_rectangle(wimp_redrawstr*,  int *);
 

os_error *wimp_get_wind_state(wimp_w, wimp_wstate * result);
 

os_error *wimp_get_wind_info(wimp_winfo * result);
 


os_error *wimp_set_icon_state(wimp_w, wimp_i,
  wimp_iconflags value, wimp_iconflags mask);
 

os_error *wimp_get_icon_info(wimp_w, wimp_i, wimp_icon * result);
 

os_error *wimp_get_point_info(wimp_mousestr * result);
 

os_error *wimp_drag_box(wimp_dragstr *);
 

os_error *wimp_force_redraw(wimp_redrawstr * r);
 



os_error *wimp_set_caret_pos(wimp_caretstr *);
 

os_error *wimp_get_caret_pos(wimp_caretstr *);
 

os_error *wimp_create_menu(wimp_menustr *m, int x, int y);
 


os_error *wimp_decode_menu(wimp_menustr *, void *, void *);

os_error *wimp_which_icon(wimp_which_block *, wimp_i * results);
 

os_error *wimp_set_extent(wimp_redrawstr *);
 


os_error *wimp_set_point_shape(wimp_pshapestr *);
 

os_error *wimp_open_template(char * name);
 


os_error *wimp_close_template(void);
 

os_error *wimp_load_template(wimp_template *);
 

os_error *wimp_processkey(int chcode);
 

os_error *wimp_closedown(void);

os_error *wimp_taskclose(wimp_t);
 

os_error *wimp_starttask(char *clicmd);
 

os_error *wimp_getwindowoutline(wimp_redrawstr *r);
 


os_error *wimp_pollidle(wimp_emask mask, wimp_eventstr *result, int earliest);
 


os_error *wimp_ploticon(wimp_icon*);
 


os_error *wimp_setmode(int mode);
 

os_error *wimp_readpalette(wimp_palettestr*);

os_error *wimp_setpalette(wimp_palettestr*);
 


os_error *wimp_setcolour(int colour);
 




os_error *wimp_spriteop(int reason_code, char *name) ;
 
os_error *wimp_spriteop_full(os_regset *) ;
 

void *wimp_baseofsprites(void);
 

os_error *wimp_blockcopy(wimp_w, wimp_box *source, int x, int y);
 



typedef enum {
  wimp_EOK       = 1,         
  wimp_ECANCEL   = 2,         
  wimp_EHICANCEL = 4          
} wimp_errflags;
 

os_error *wimp_reporterror(os_error*, wimp_errflags, char *name);
 



os_error *wimp_sendmessage(wimp_etype code, wimp_msgstr* msg, wimp_t dest);
 



os_error *wimp_sendwmessage(
  wimp_etype code, wimp_msgstr *msg, wimp_w w, wimp_i i);
 


os_error *wimp_create_submenu(wimp_menustr *sub, int x, int y);
 


os_error *wimp_slotsize(int *currentslot  ,
                        int *nextslot  ,
                        int *freepool  );
 

os_error *wimp_transferblock(
  wimp_t sourcetask,
  char *sourcebuf,
  wimp_t desttask,
  char *destbuf,
  int buflen);
 

os_error *wimp_setfontcolours(int foreground, int background);
 

os_error *wimp_readpixtrans(sprite_area *area, sprite_id *id, 
                         sprite_factors *factors, sprite_pixtrans *pixtrans);
 


typedef enum
        {  wimp_command_TITLE = 0,
           wimp_command_ACTIVE = 1,
           wimp_command_CLOSE_PROMPT = 2,
           wimp_command_CLOSE_NOPROMPT = 3
        }  wimp_command_tag;

typedef struct
        {
          wimp_command_tag tag;
          char *title;
        } wimp_commandwind;

os_error *wimp_commandwindow(wimp_commandwind commandwindow);

 








 
#line 31 "c.drawtrans"
#line 1 "C:h.sprite"
 







 























































































































































































































































































































































































































































































































 
#line 32 "c.drawtrans"
#line 1 "C:h.werr"
 







 








 















void werr(int fatal, char* format, ...);



 
#line 33 "c.drawtrans"
#line 1 "C:h.visdelay"
 







 








 










void visdelay_begin(void);


 








void visdelay_percent(int p);


 








void visdelay_end(void);


 








void visdelay_init(void);



 
#line 34 "c.drawtrans"

#line 1 "h.ftrace"
 











 







































    

   

    
   extern void ftracef (char *file, int line, char *, ...);

   
   
   
   
   
   

   
   
   



#line 36 "c.drawtrans"
#line 1 "h.guard"
 

 






 




 



























   

   

   

#line 37 "c.drawtrans"

#line 1 "h.Draw"
 



















#line 1 "C:h.drawmod"
 







 






 















 

typedef enum
        {
          path_term      = 0,    
          path_ptr       = 1,    
          path_move_2    = 2,    
                                 
          path_move_3    = 3,    
                                 
                                 
          path_closegap  = 4,    
                                 
          path_closeline = 5,    
                                 
          path_bezier    = 6,    
                                 
                                 
          path_gapto     = 7,    
                                 
          path_lineto    = 8     
        } drawmod_path_tagtype;

typedef struct                         
        {
          drawmod_path_tagtype  tag;
          unsigned int  bytes_free;
        } drawmod_path_endstr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
          void        *ptr;
        } drawmod_path_ptrstr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
          int          x, y;
        } drawmod_path_movestr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
        } drawmod_path_closegapstr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
        } drawmod_path_closelinestr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
          int          x1,             
                       y1,
                       x2,             
                       y2,
                       x3,             
                       y3;
        } drawmod_path_bezierstr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
          int          x,y;
        } drawmod_path_gaptostr;

typedef struct                         
        {
          drawmod_path_tagtype tag;
          int          x,y;
        } drawmod_path_linetostr;

typedef union                             
        {
          drawmod_path_endstr       *end;
          drawmod_path_ptrstr       *ptr;
          drawmod_path_movestr      *move2;
          drawmod_path_movestr      *move3;
          drawmod_path_closegapstr  *closegap;
          drawmod_path_closelinestr *closeline;
          drawmod_path_bezierstr    *bezier;
          drawmod_path_gaptostr     *gapto;
          drawmod_path_linetostr    *lineto;

          char  *bytep;
          int   *wordp;

        } drawmod_pathelemptr;

 

typedef enum
        {
          fill_Default        = 0x00000000,   





          fill_WNonzero       = 0x00000000,   
          fill_WNegative      = 0x00000001,   
          fill_WEvenodd       = 0x00000002,   
          fill_WPositive      = 0x00000003,   

          fill_FNonbext       = 0x00000004,   


          fill_FBext          = 0x00000008,   


          fill_FNonbint       = 0x00000010,   


          fill_FBint          = 0x00000020,   


                 







          fill_PClose         = 0x08000000,   
          fill_PFlatten       = 0x10000000,   
          fill_PThicken       = 0x20000000,   
          fill_PReflatten     = 0x40000000    
 
                                              



        } drawmod_filltype;

 

 





 






typedef struct
        {
          unsigned char join;                 
          unsigned char leadcap;              
          unsigned char trailcap;             
          unsigned char reserved8;            
          int  mitrelimit;                    

          unsigned short lead_tricap_w;      


          unsigned short lead_tricap_h;      


          unsigned short trail_tricap_w;     


          unsigned short trail_tricap_h;     



        } drawmod_capjoinspec;

 
 





typedef struct
        {
          int dashstart;      
          int dashcount;      
        } drawmod_dashhdr;

 
 
















typedef struct
        {
          int flatness;
          int thickness;
          drawmod_capjoinspec spec;
          drawmod_dashhdr *dash_pattern;
        } drawmod_line;
          

 
 








 

typedef  int drawmod_transmat[6];


 
 









typedef struct 
        {
          int zeroword;
          int sizeword;
        } drawmod_buffer;
          

 

typedef  enum
         {
            tag_fill = 1,
            tag_box  = 2,
            tag_buf  = 3
         } drawmod_tagtype;

typedef  enum
         {  option_insitu      = 0,   
            option_normalfill  = 1,   
            option_subpathfill = 2,   
            option_countsize   = 3    
         } drawmod_filling_options;

typedef  struct
         {
           int lowx;
           int lowY;
           int highX;
           int highY;
         } drawmod_box;

typedef  struct
         {
           drawmod_tagtype tag;
           union
           {
              drawmod_filling_options opts;
              drawmod_box *box;       



              drawmod_buffer *buffer;
           } data;
         } drawmod_options;


           

 















os_error *drawmod_fill(drawmod_pathelemptr path_seq,
                       drawmod_filltype fill_style,
                       drawmod_transmat *matrix,
                       int flatness);


 













os_error *drawmod_stroke(drawmod_pathelemptr path_seq, 
                         drawmod_filltype fill_style,
                         drawmod_transmat *matrix,
                         drawmod_line *line_style);


 












os_error *drawmod_do_strokepath(drawmod_pathelemptr path_seq,
                                drawmod_transmat *matrix,
                                drawmod_line *line_style,
                                drawmod_buffer *buffer);


 













os_error *drawmod_ask_strokepath(drawmod_pathelemptr path_seq,
                                 drawmod_transmat *matrix,
                                 drawmod_line *line_style,
                                 int *buflen);


 











os_error *drawmod_do_flattenpath(drawmod_pathelemptr path_seq,
                                 drawmod_buffer *buffer,
                                 int flatness);


 












os_error *drawmod_ask_flattenpath(drawmod_pathelemptr path_seq,
                                  int flatness,
                                  int *buflen);


 











os_error *drawmod_buf_transformpath(drawmod_pathelemptr path_seq,
                                    drawmod_buffer *buffer,
                                    drawmod_transmat *matrix);
                                                       

 










os_error *drawmod_insitu_transformpath(drawmod_pathelemptr path_seq,
                                       drawmod_transmat *matrix);      


 


























os_error *drawmod_processpath(drawmod_pathelemptr path_seq,
                              drawmod_filltype fill_style,
                              drawmod_transmat *matrix,
                              drawmod_line *line_style,
                              drawmod_options *options,
                              int *buflen);



 
#line 23 "h.Draw"



#line 1 "C:h.dbox"
 







 





 







 














 




typedef struct dbox__str *dbox;



 


 















dbox dbox_new(char *name);


 










void dbox_dispose(dbox*);



 

 










  

void dbox_show(dbox);


 










void dbox_showstatic(dbox);


 









void dbox_hide(dbox);




 

 





















 





 
typedef int dbox_field; 

typedef enum {
               dbox_FACTION, dbox_FOUTPUT, dbox_FINPUT, dbox_FONOFF
} dbox_fieldtype;


 


















void dbox_setfield(dbox, dbox_field, char*);


 













void dbox_getfield(dbox, dbox_field, char *buffer, int size);


 














void dbox_setnumeric(dbox, dbox_field, int);


 













int dbox_getnumeric(dbox, dbox_field);


 









void dbox_fadefield(dbox d, dbox_field f);


 









void dbox_unfadefield(dbox d, dbox_field f);


 

 






 






 








 

dbox_field dbox_get(dbox d);


 








 

dbox_field dbox_read(dbox d);


 




















typedef void (*dbox_handler_proc)(dbox, void *handle);

void dbox_eventhandler(dbox, dbox_handler_proc, void* handle);


 

















 
typedef  int  (*dbox_raw_handler_proc)(dbox, void *event, void *handle);

void dbox_raw_eventhandler(dbox, dbox_raw_handler_proc, void *handle);



 




 










dbox_field dbox_fillin(dbox d);


 









dbox_field dbox_fillin_fixedcaret(dbox d);



 













dbox_field dbox_popup(char *name, char *message);


 












 int  dbox_persist(void);


 

 












int dbox_syshandle(dbox);


 

 










void dbox_init(void);



 
#line 27 "h.Draw"



#line 1 "h.jpeg"



 



 



































 


typedef struct jpeg_image                       jpeg_image;

 


struct jpeg_image
   {  int i [1];
   };









 









 



 


















extern os_error *xjpeginfo_dimensions (jpeg_image *image,
      int size,
      unsigned int *info_flags,
      int *width,
      int *height,
      int *xdpi,
      int *ydpi);

 














extern os_error *xjpeg_plot_scaled (jpeg_image *image,
      int x,
      int y,
      sprite_factors *factors,
      int size,
      unsigned int flags);

 













extern os_error *xjpeg_plot_transformed (jpeg_image *image,
      unsigned int flags,
      drawmod_transmat trfm_or_rect,
      int size);


#line 31 "h.Draw"


 













  













  
  




 











 








 
























 


 
 










 

int draw_pointsToFont(int xx);
int draw_drawToFont(int xx);
int draw_fontToDraw(int xx);
int draw_fontToOS(int xx);

 


























 



 



 











                                
                                



 
 
typedef enum                     
{ overSpace,
  overObject,
  overRotate,
  overStretch,

  overMoveEp,
  overLineEp,
  overCurveB1,
  overCurveB2,
  overCurveEp
} region;

 





typedef enum
{
  state_path,   
   state_path_move,    
   state_path_point1,  
   state_path_point2,  
   state_path_point3,  

  state_text,   
   state_text_caret,   
   state_text_char,    

  state_sel,    
   state_sel_select,   
   state_sel_adjust,   
    
   state_sel_shift_select,   
   state_sel_shift_adjust,   
   state_sel_trans,    
   state_sel_scale,    
   state_sel_rotate,   

  state_edit,   
   state_edit_drag,    
   state_edit_drag1,   
   state_edit_drag2,   

  state_rect,   
   state_rect_drag,    

  state_elli,   
   state_elli_drag,    

  state_zoom,   

  state_printerI,  
  state_printerO   

} draw_state;

 
typedef struct
{  
  unsigned int curved : 1;
  unsigned int closed : 1;

   
  unsigned int modified : 1;

   


  unsigned int datestamped: 1;
} diag_options;

 
typedef struct
{ unsigned int show   : 1;
  unsigned int lock   : 1;

  unsigned int  xinch : 1;
  unsigned int  xcm   : 1;
  unsigned int  yinch : 1;
  unsigned int  ycm   : 1;

  unsigned int  rect  : 1;
  unsigned int  iso   : 1;

   
  unsigned int  autoadj : 1;

   
  unsigned int  zoomlock : 1;

   
  unsigned int  showpane : 1;
} viewflags_typ;

 





typedef struct
{
   
  double space[2];          
  int    divide[2];         
} gridparams;

typedef int draw_sizetyp;

 


typedef struct { int x0,y0, x1,y1; } draw_bboxtyp;
typedef int draw_coltyp;

typedef int draw_pathwidth;    

 
typedef int draw_jointyp;
typedef int draw_captyp;

typedef enum
{ wind_nonzero = 0,
  wind_evenodd = 1
} draw_windtyp;

typedef enum
{ dash_absent  = 0,
  dash_present = 1
} draw_dashtyp;

 











 





 
typedef union
{ struct                              
  { unsigned int join      : 2;
    unsigned int endcap    : 2;
    unsigned int startcap  : 2;
    unsigned int windrule  : 1;
    unsigned int dashed    : 1;
    unsigned int reserved8 : 8;       
    unsigned int tricapwid : 8;         
    unsigned int tricaphei : 8;         
  } s;
  struct                              
  { unsigned char style;                
                                                    
                                                    
                                                    
                                                    
    unsigned char reserved8;          
    unsigned char tricapwid;            
    unsigned char tricaphei;            
  } p;
  int i;
} draw_pathstyle;

 

typedef enum
{ Paper_Show  = 1,
  Paper_Limit = 2,

  Paper_Landscape = 0x10,   

  Paper_Default   = 0x100   
} paperoptions_typ;

typedef enum
{ Paper_A0 = 0x100,
  Paper_A1 = 0x200,
  Paper_A2 = 0x300,
  Paper_A3 = 0x400,
  Paper_A4 = 0x500,
  Paper_A5 = 0x600
} papersize_typ;

typedef struct
{ draw_bboxtyp pagelimit;      
  draw_bboxtyp visiblelimit;   
} printmargin_typ;

typedef struct
{  int  present;
   
  printmargin_typ box;
} printer_typ;

typedef struct
{
  papersize_typ size;          
  paperoptions_typ options;    
  draw_bboxtyp viewlimit;
  draw_bboxtyp setlimit;       
} paperstate_typ;




 
typedef struct { int mul, div; } draw_zoomstr;

typedef char draw_fontref;     

typedef struct
{ draw_fontref fontref;              
  char         reserved8;            
  short        reserved16;           
} draw_textstyle;    

typedef int draw_fontsize;           

typedef struct
  { int
      kerned: 1,        
      direction: 1,     
      underline: 1;     
  }
  draw_fontflags;

typedef int coord;

typedef struct
{ int typeface;      
  draw_fontsize typesizex;
  draw_fontsize typesizey;
  draw_coltyp textcolour;     
  draw_coltyp background;     
} fontrec;

typedef enum
{ draw_OBJFONTLIST     = 0,
  draw_OBJTEXT         = 1,
  draw_OBJPATH         = 2,
 
 
  draw_OBJSPRITE       = 5,
  draw_OBJGROUP        = 6,
  draw_OBJTAGG         = 7,
  draw_OBJTEXTAREA     = 9,
  draw_OBJTEXTCOL      = 10,
  draw_OPTIONS         = 11,
  draw_OBJTRFMTEXT     = 12,
  draw_OBJTRFMSPRITE   = 13,
  draw_OBJTRFMTEXTAREA = 14,
  draw_OBJTRFMTEXTCOL  = 15,
  draw_OBJJPEG         = 16,
   

  draw_TAG_LIMIT       = 17  
} draw_tagtyp;

typedef int draw_taggtyp;

 


typedef struct { int x,y; } draw_objcoord;
typedef struct { double x, y;} draw_doublecoord;

 
 
 
 

typedef struct
{ char title[4];
  int  majorstamp;
  int  minorstamp;
  char progident[12];
  draw_bboxtyp   bbox;       
} draw_fileheader;

 
 
 
 
 

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       
  draw_bboxtyp   bbox;       
} draw_objhdr;

 
 
 
 

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       
} draw_fontliststrhdr;

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       

  draw_fontref   fontref;
  char           fontname[1];    
} draw_fontliststr;

 
 
 
 

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
  draw_coltyp    textcolour;  
  draw_coltyp    background;  
  draw_textstyle textstyle;   
  draw_fontsize  fsizex;      
  draw_fontsize  fsizey;      
  draw_objcoord  coord;       
} draw_textstrhdr;

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
  draw_coltyp    textcolour;  
  draw_coltyp    background;  
  draw_textstyle textstyle;   
  draw_fontsize  fsizex;      
  draw_fontsize  fsizey;      
  draw_objcoord  coord;       

  char           text[1];    
} draw_textstr;

typedef drawmod_path_tagtype draw_path_tagtype;  

 
typedef struct { drawmod_path_tagtype tag; } drawmod_path_termstr;

typedef union            
{ drawmod_path_movestr      a;
  drawmod_path_linetostr    b;
  drawmod_path_bezierstr    c;
  drawmod_path_closelinestr d;
  drawmod_path_termstr      e;
} largest_path_str;

 
typedef struct
{ drawmod_path_movestr     move;
  drawmod_path_linetostr   line1;
  drawmod_path_linetostr   line2;
  drawmod_path_linetostr   line3;
  drawmod_path_linetostr   line4;
  drawmod_path_closegapstr close;
  drawmod_path_termstr     term;
} path_pseudo_rectangle;

 
typedef struct
{ drawmod_path_movestr     move;
  drawmod_path_bezierstr   curve1;
  drawmod_path_bezierstr   curve2;
  drawmod_path_bezierstr   curve3;
  drawmod_path_bezierstr   curve4;
  drawmod_path_closegapstr close;
  drawmod_path_termstr     term;
} path_pseudo_ellipse;

typedef struct
{ drawmod_dashhdr dash;         
  int             elements[6];  
} draw_dashstr;

typedef struct
{ draw_pathwidth linewidth;
  draw_coltyp    linecolour;
  draw_coltyp    fillcolour;

  draw_dashstr* pattern;
  draw_jointyp  join;        
  draw_captyp   endcap;      
  draw_captyp   startcap;    
  draw_windtyp  windrule;    
  int           tricapwid;
  int           tricaphei;
} pathrec;

 
 
 
 

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
  draw_coltyp    fillcolour;  
  draw_coltyp    pathcolour;  
  draw_pathwidth pathwidth;   
  draw_pathstyle pathstyle;   
} draw_pathstrhdr;

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
  draw_coltyp    fillcolour;  
  draw_coltyp    pathcolour;  
  draw_pathwidth pathwidth;   
  draw_pathstyle pathstyle;   

  draw_dashstr   data;        
  int            PATH;
} draw_pathstr;

 
 
 
 

 
 
 
 

 
 
 
 

typedef struct
{ draw_tagtyp    tag;           
  draw_sizetyp   size;          
  draw_bboxtyp   bbox;          
} draw_spristrhdr;

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       
  draw_bboxtyp   bbox;       
  sprite_header  sprite;
  int            palette[1];  
} draw_spristr;

 
 
 
 

typedef struct { char ch[12]; } draw_groupnametyp;   

typedef struct
{ draw_tagtyp       tag;    
  draw_sizetyp      size;   
  draw_bboxtyp      bbox;   
  draw_groupnametyp name;   
} draw_groustr;

 
 
 
 

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       
  draw_bboxtyp   bbox;       
} draw_taggstrhdr;

typedef struct
{ draw_tagtyp    tag;        
  draw_sizetyp   size;       
  draw_bboxtyp   bbox;       
  draw_taggtyp   tagg;       

   
} draw_taggstr;

 
 
 
 
 

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
} draw_textcolhdr;

 
 
 
 
 

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
  draw_textcolhdr column;     
} draw_textareastrhdr;

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
   
} draw_textareahdr;

 
typedef struct                
{
  int            endmark;     
  int            blank1;      
  int            blank2;      
  draw_coltyp    textcolour;  
  draw_coltyp    backcolour;  
   
} draw_textareastrend;

typedef struct
{
  int            endmark;     
  int            blank1;      
  int            blank2;      
  draw_coltyp    textcolour;  
  draw_coltyp    backcolour;  
  char           text[1];     
} draw_textareaend;

 
 
 
 

 
 
typedef
  struct
  { struct
    { papersize_typ    size;
      paperoptions_typ o;
    }
    paper;
    struct
    { double space;
      int    divide;
      int    o[5];  
    }
    grid;
    struct
    { int mul, div;
      int lock;
    }
    zoom;
    int toolbox;
    struct
    { unsigned int   line : 1;
      unsigned int  cline : 1;
      unsigned int  curve : 1;
      unsigned int ccurve : 1;
      unsigned int   rect : 1;
      unsigned int   elli : 1;
      unsigned int   text : 1;
      unsigned int  select: 1;
    }
    mode;
    int undo_size;  
  }
  draw_options;

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        
} draw_optionsstrhdr;

typedef struct
{ draw_tagtyp    tag;         
  draw_sizetyp   size;        
  draw_bboxtyp   bbox;        

  draw_options   options;

} draw_optionsstr;

 





typedef struct
{ draw_tagtyp     tag;         
  draw_sizetyp    size;        
  draw_bboxtyp    bbox;        
  drawmod_transmat trfm;        
  draw_fontflags  flags;       
  draw_coltyp     textcolour;  
  draw_coltyp     background;  
  draw_textstyle  textstyle;   
  draw_fontsize   fsizex;      
  draw_fontsize   fsizey;      
  draw_objcoord   coord;       
} draw_trfmtextstrhdr;

typedef struct
{ draw_tagtyp     tag;         
  draw_sizetyp    size;        
  draw_bboxtyp    bbox;        
  drawmod_transmat trfm;        
  draw_fontflags  flags;       
  draw_coltyp     textcolour;  
  draw_coltyp     background;  
  draw_textstyle  textstyle;   
  draw_fontsize   fsizex;      
  draw_fontsize   fsizey;      
  draw_objcoord   coord;       

  char            text[1];    
} draw_trfmtextstr;

 





typedef struct
{ draw_tagtyp     tag;         
  draw_sizetyp    size;        
  draw_bboxtyp    bbox;        
  drawmod_transmat trfm;        
} draw_trfmspristrhdr;

typedef struct
{ draw_tagtyp     tag;       
  draw_sizetyp    size;      
  draw_bboxtyp    bbox;      
  drawmod_transmat trfm;      
  sprite_header   sprite;
  int             palette [1];  
} draw_trfmspristr;

 





typedef struct
{ draw_tagtyp     tag;         
  draw_sizetyp    size;        
  draw_bboxtyp    bbox;        
  drawmod_transmat trfm;        
  draw_textcolhdr column;     
} draw_trfmtextareastrhdr;

typedef struct
{ draw_tagtyp     tag;         
  draw_sizetyp    size;        
  draw_bboxtyp    bbox;        
  drawmod_transmat trfm;        
   
} draw_trfmtextareastr;

 



typedef struct
{ draw_tagtyp      tag;             
  draw_sizetyp     size;            
  draw_bboxtyp     bbox;            
  int              width, height;   
  int              xdpi, ydpi;      
  drawmod_transmat trans_mat;       
  int              len;             
} draw_jpegstrhdr;

typedef struct
{ draw_tagtyp      tag;
  draw_sizetyp     size;
  draw_bboxtyp     bbox;
  int              width, height;
  int              xdpi, ydpi;
  drawmod_transmat trans_mat;
  int              len;
  jpeg_image       image;
} draw_jpegstr;

 
 
 
 

typedef union
{ draw_objhdr         *objhdrp;

  draw_fileheader     *filehdrp;

  draw_fontliststrhdr *fontlisthdrp;
  draw_textstrhdr     *texthdrp;
  draw_pathstrhdr     *pathhdrp;
  draw_spristrhdr     *spritehdrp;
  draw_taggstrhdr     *tagghdrp;
  draw_textareastrhdr *textareastrp;
  draw_textareastrend *textareastrendp;
  draw_optionsstrhdr  *optionshdrp;
  draw_trfmtextstrhdr *trfmtexthdrp;
  draw_trfmspristrhdr *trfmsprihdrp;
  draw_trfmtextareastrhdr
                      *trfmtextareahdrp;
  draw_jpegstrhdr     *jpeghdrp;

  draw_fontliststr    *fontlistp;
  draw_textstr        *textp;
  draw_pathstr        *pathp;
  draw_spristr        *spritep;
  draw_groustr        *groupp;
  draw_taggstr        *taggp;
  draw_textareahdr    *textareap;
  draw_textareaend    *textareaendp;
  draw_textcolhdr     *textcolp;
  draw_optionsstr     *optionsp;
  draw_trfmtextstr    *trfmtextp;
  draw_trfmspristr    *trfmspritep;
  draw_trfmtextareastr*trfmtextareap;
  draw_jpegstr        *jpegp;

  draw_objcoord       *coordp;

  char *bytep;
  int  *wordp;
} draw_objptr;

 
 
 
 

typedef struct
{
  region over;    

  int obj_off;    
  int sub_off;    

   
  int fele_off;   
  int pele_off;   
  int cele_off;   

  int cor_off;    

  int corA_off;   
  int corB_off;   
  int corC_off;   
  int corD_off;   

   int  changed;   
  double ratio, angle;
                  
} pathedit_str;

 
 

typedef struct
{
  draw_state   state;  
  diag_options opts;   
} diag_save;

 
 
 
 

typedef struct drec *diagptr;

typedef struct vref
{ struct vref   *nextview;
  struct vref   *prevview;

  diagptr       diag;               

  wimp_w        w;                  
  wimp_w        pw;                 
  wimp_box      lastextent;         
  int           lastx, lasty;       

  draw_zoomstr  zoom;
  double        zoomfactor;         
  draw_zoomstr  lastzoom;           

  viewflags_typ flags;

  gridparams    gridunit[2];        
  gridparams    grid;               

  draw_coltyp   gridcolour;
  char          *title;
} viewrec;

 
 
 
 

typedef struct
{
  int solidstart;       
  int solidlimit;       
  int ghoststart;       
  int ghostlimit;       
  int stacklimit;       
  int bufferlimit;      

  draw_state    mainstate;
  draw_state    substate;
  diag_options  options;

  paperstate_typ paperstate;   

  viewrec *wantsnulls;  

  pathrec path;
  fontrec font;

  int pta_off, ptb_off;
  int ptw_off, ptx_off, pty_off;
  int ptz_off;

  draw_objcoord ptzzz;            
  draw_objcoord ellicentre;

  char filename[ 256 ];
  struct {int load, exec;} address;  



  int  vuuecnt;

  pathedit_str pathedit_cb;

  diag_save    save;              
} draw_diagstr;

typedef struct drec
{ struct drec      *nextdiag;
  struct drec      *prevdiag;

  draw_diagstr     *misc;
  char             *paper;
  viewrec          *view;    
  void             *undo;    
} diagrec;

extern diagrec       *draw_startdiagchain;
extern draw_objcoord  draw_stdcircpoints[13];

extern draw_fileheader draw_blank_header;

typedef struct                
{ diagrec      *diag;         
  viewrec      *view;         
  draw_zoomstr zoom;          
} zoomchangestr;

typedef struct       
                     
{
  int gcharaltered;  

  int gcharsizex;       
  int gcharsizey;
  int gcharspacex;
  int gcharspacey;

  int ncolour;
  int xeigfactor;
  int yeigfactor;                                    

  int pixx;          
  int pixy;          
  int pixsizex;      
  int pixsizey;      

  int x_wind_limit, y_wind_limit;
  int mode;
} currentmodestr;

extern currentmodestr  draw_currentmode;
extern wimp_palettestr draw_palette;  

typedef struct
{ int skeleton;      
  int anchorpt;
  int bezierpt;
  int highlight;

  int grid;          

  int bbox;          

  int printmargin;
} coloursstr;

extern coloursstr draw_colours;    

typedef struct
{ int menu_size;         
  int list_size;         
  char* name[256];       
} fontcatstr;

extern fontcatstr draw_fontcat;

typedef struct
{ int centreX,   centreY;  
  double sinB,   cosB;     
  double sinA_B, cosA_B;
} rotat_str;

extern rotat_str draw_rotate_cb;

typedef draw_bboxtyp captu_str;  

extern captu_str draw_capture_cb;

typedef struct
{ int dx, dy;              
} trans_str;

extern trans_str draw_translate_cb;

typedef struct
{ int old_Dx, old_Dy;        
  int new_Dx, new_Dy;  
} scale_str;

extern scale_str draw_scale_cb;

extern draw_options draw_current_options;
   


extern char draw_numvalid0[];
extern char draw_numvalid1[];
extern char draw_numvalid2[];

extern char draw_zero_str[];
extern char draw_one_str[];

extern  int  draw_jpegs_rotate;

extern void draw_set_current_font(diagrec *diag, int, int,int);

 
extern void draw_open_wind(wimp_openstr *main, viewrec *vuue);

extern os_error *draw_opennewdiag(diagrec **diagp,  int  grab_selection);
extern os_error *draw_opennewview(diagrec *diag, viewrec **vuuep);

extern void draw_fillwindowtitle(viewrec *vuue);
extern void draw_toolbox_showall(diagrec *diag, int show);

extern void draw_modified(diagrec *diag);
extern void draw_modified_no_undo(diagrec *diag);

extern void draw_action_abandon(diagrec *diag);  
extern void draw_action_changestate(diagrec *diag, draw_state, int,int,  int );

 




extern int draw_scaledown(int A);


extern void draw_set_caret(wimp_w w, int x, int y, int height);
extern void draw_get_focus(void);
extern void draw_kill_caret(void);

 


extern void draw_dispose_diag(diagrec *diag);
extern void draw_paper_close(viewrec *vuue);

extern void draw_start_capture(viewrec *vuue, draw_state state, draw_objcoord *pt,
                         int  abandon);

 
extern void draw_sort(int *a, int *b);

extern void draw_setextent(viewrec *vuue);

 
extern draw_bboxtyp draw_big_box;

extern void draw_make_clip(wimp_redrawstr *r, draw_objcoord *org, draw_bboxtyp *clip);

 
extern void draw_set_paper_limits(diagrec *diag, captu_str box);

 
extern void draw_reset_gchar(void);

 
 

 
 
extern void draw_point_scale(draw_objcoord *to,
                      draw_objcoord *from, draw_objcoord *org);

 
extern void draw_setfield(dbox d, int field, double n);

 
extern void draw_widen_box(draw_bboxtyp *box, int xwiden, int ywiden);

 
extern void draw_box_scale(draw_bboxtyp *to, draw_bboxtyp *from,
    double factor);

 
 
extern void draw_box_scale_shift(draw_bboxtyp *to, draw_bboxtyp *from,
                          double factor, draw_objcoord *shift);





  
















  
  
  
  
  
  

#line 39 "c.drawtrans"
#line 1 "h.DrawDispl"
 












#line 1 "C:h.font"
 







 








#line 1 "stddef.h"
___toplevel












typedef int ptrdiff_t;



 




















 



#line 19 "C:h.font"










typedef int font;  


 










extern os_error * font_cacheaddress(int *version, int *cacheused, int *cachesize);


 











extern os_error * font_find(
  char* name,
  int xsize, int ysize,     
  int xres, int yres,       
  font*);                   


 








extern os_error * font_lose(font f);

typedef struct font_def {
    char name[16];
    int xsize, ysize, xres, yres;  
    int usage, age;
} font_def;


 



















extern os_error * font_readdef(font, font_def*);

typedef struct font_info {
    int minx, miny, maxx, maxy;
} font_info;


 
















extern os_error * font_readinfo(font, font_info*);


typedef struct font_string {

    char* s;
    int x;                 
    int y;                 
    int split;             
                           
    int term;              

    } font_string;


 



















extern os_error * font_strwidth(font_string *fs);


 



         



 









  
extern os_error * font_paint(char*, int options, int x, int y);


 











extern os_error *font_caret(int colour, int height, int flags, int x, int y);


 









extern os_error *font_converttoos(int x_inch, int y_inch, int *x_os, int *y_os);


 









extern os_error *font_converttopoints(int x_os, int y_os, int *x_inch, int *y_inch);


 








extern os_error * font_setfont(font);


typedef struct font_state {

       font f;
       int back_colour;
       int fore_colour;
       int offset;

       } font_state;


 












extern os_error *font_current(font_state *f);


 













extern os_error *font_future(font_state *f);


 











extern os_error *font_findcaret(font_string *fs);


 












extern os_error * font_charbbox(font, char, int options, font_info*);


 









extern os_error *font_readscalefactor(int *x, int *y);


 









extern os_error *font_setscalefactor(int x, int y);


 










extern os_error * font_list(char*, int*);

                 
 











extern os_error * font_setcolour(font, int background, int foreground, int offset);







 













extern os_error *font_setpalette(int background, int foreground, int offset, 
                          int physical_back, int physical_fore);

typedef struct font_threshold {

     char offset;
     char thresholds[15];

     } font_threshold;
                                        

 









extern os_error *font_readthresholds(font_threshold *th);


 








extern os_error *font_setthresholds(font_threshold *th);


 










extern os_error *font_findcaretj(font_string *fs, int offset_x, int offset_y);


 










   
extern os_error *font_stringbbox(char *s, font_info *fi);

 
 

typedef enum {font_CONVERT, font_IGNORE, font_ERROR} font_action_on_bitmap;

extern os_error
   *font_output_to_null
   (   int  add_hints,
       int  output_skeleton,
      font_action_on_bitmap action_on_bitmap
   );

extern os_error *font_output_size (size_t *size);

extern os_error
   *font_output_to_buffer
   (  drawmod_buffer *buff_ptr,
       int  add_hints,
       int  output_skeleton,
      font_action_on_bitmap action_on_bitmap
   );

extern os_error *font_output_to_screen (void);

 












typedef enum {
  fontmenu_WithoutSystemFont = 0,
  fontmenu_WithSystemFont    = 1,
  fontmenu_Delete            = 2
} fontmenu_flags;

extern os_error *font_makemenu(wimp_menustr ** menup, char * tickitem, fontmenu_flags flags);

 
















extern os_error *font_decodemenu(wimp_menustr * menu, int * selections, char ** resultp);



 
#line 15 "h.DrawDispl"


extern double draw_displ_scalefactor;

extern os_error *draw_displ_do_printmargin (diagrec *diag, draw_objcoord *org);
extern os_error *draw_displ_show_printmargins (diagrec *diag);

extern os_error *draw_displ_do_objects (diagrec *diag, int offset, int end,
    draw_objcoord *org, draw_bboxtyp *clip);

extern void draw_displ_forceredraw (diagrec *diag);
extern void draw_displ_totalredraw (diagrec *diag);
extern void draw_displ_redrawarea (diagrec *diag, draw_bboxtyp *bboxp);
extern void draw_displ_redrawobject (diagrec *diag, int obj_off);
extern void draw_displ_redraw_one_title (viewrec *vuue);
extern void draw_displ_redrawtitle (diagrec *diag);

extern os_error *draw_displ_eor_skeleton (diagrec *diag);
extern os_error *draw_displ_paint_skeleton (diagrec *diag,
    draw_objcoord *org);

extern os_error *draw_displ_eor_currnext (diagrec *diag);
extern os_error *draw_displ_eor_prevcurr (diagrec *diag);
extern os_error *draw_displ_eor_cons2 (diagrec *diag);
extern os_error *draw_displ_eor_cons3 (diagrec *diag);
extern void draw_displ_eor_bbox (diagrec *diag, int  );
extern os_error *draw_displ_eor_bboxes (diagrec *diag);
extern os_error *draw_displ_eor_capturebox (diagrec *diag);
extern os_error *draw_displ_eor_transboxes (diagrec *diag);
extern os_error *draw_displ_eor_rotatboxes (diagrec *diag);
extern os_error *draw_displ_eor_scaleboxes (diagrec *diag);
extern os_error *draw_displ_eor_grid (viewrec *vuue);
extern os_error *draw_displ_eor_highlightskeleton (diagrec *diag);
extern os_error *draw_displ_paint_bboxes (diagrec *diag,
    draw_objcoord *org);
extern os_error *draw_displ_paint_grid (viewrec *vuue, draw_objcoord *org,
    draw_bboxtyp clip);





extern os_error *draw_displ_setVDU5charsize (int xsize, int ysize, 
    int xspace, int yspace);

extern void draw_displ_unpackpathstyle (draw_objptr hdrptr, 
    drawmod_capjoinspec *jspecp);

extern int  draw_displ_lineheight (diagrec *diag);
extern void draw_displ_showcaret (viewrec *vuue);

extern void draw_displ_showcaret_if_up (diagrec *diag);

extern os_error *draw_displ_font_stringpixbbox (font fonth, char *ptr, 
    draw_bboxtyp *boundp);


extern draw_bboxtyp *draw_displ_bbox (draw_objptr hdrptr);









#line 40 "c.drawtrans"
#line 1 "h.DrawGrid"
 









void draw_grid_jog(viewrec *v, trans_str *jog);
void draw_grid_setstate(viewrec *v);

void draw_grid_snap(viewrec *vuue, draw_objcoord *pt);
void draw_grid_snap_if_locked(viewrec *vuue, draw_objcoord *pt);

void draw_grid_paint(viewrec *vuue, draw_objcoord *org, draw_bboxtyp clip);
#line 41 "c.drawtrans"
#line 1 "h.DrawObject"
 










 
os_error *draw_obj_checkspace(diagrec *diag, int needed);
void      draw_obj_fileheader(diagrec *diag);
void      draw_obj_start(diagrec *diag, draw_tagtyp);






extern void draw_obj_fin(diagrec *diag);
extern void draw_obj_finish(diagrec *diag);
extern void draw_obj_complete(diagrec *diag);
extern void draw_obj_appendghost(diagrec *diag);
extern void draw_obj_flush(diagrec *diag);

extern int  draw_obj_next(diagrec *diag, int offset);

 
extern void draw_obj_unify(draw_bboxtyp *to, draw_bboxtyp *from);

 
extern os_error *draw_obj_makespace(diagrec *diag, int atoff, int size);
extern os_error *draw_obj_insert(diagrec *diag, int atoff, int size);
extern void      draw_obj_losespace(diagrec *diag, int atoff, int size);
extern void      draw_obj_delete(diagrec *diag, int atoff, int size);
extern void      draw_obj_delete_object(diagrec *diag);
extern void      draw_obj_deleteObject(diagrec *diag, int oldOffset, int newOffset);

 
extern void draw_obj_addpath_move(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_addpath_line(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_addpath_curve(diagrec *diag, draw_objcoord *pt1,
                                           draw_objcoord *pt2,
                                           draw_objcoord *pt3);
extern void                 draw_obj_addpath_close(diagrec *diag);
extern void                 draw_obj_addpath_term(diagrec *diag);
extern drawmod_pathelemptr  draw_obj_pathstart(draw_objptr hdrptr);
extern draw_dashstr        *draw_obj_dashstart(draw_objptr hdrptr);

 
extern void draw_obj_addstring(diagrec *diag, char *from);
extern void draw_obj_addtext_char(diagrec *diag, char ch);
extern int  draw_obj_findtext_len(diagrec *diag);
extern void draw_obj_addtext_term(diagrec *diag);
extern void draw_obj_deltext_char(diagrec *diag);

 
extern void draw_obj_settext_font(diagrec *diag, int fref, int fsizex, int fsizey);
extern void draw_obj_settext_colour(diagrec *diag, draw_coltyp textcolour,
                                            draw_coltyp background);
extern void draw_obj_setcoord(diagrec *diag, draw_objcoord *pt);
extern void draw_obj_readcoord(diagrec *diag, draw_objcoord *blk);
extern void draw_obj_addfontentry(diagrec *diag, int ref, char *name);
extern void draw_obj_setpath_colours(diagrec *diag, draw_coltyp    fillcolour,
                                             draw_coltyp    linecolour,
                                             draw_pathwidth linewidth);
extern void draw_obj_setpath_style(diagrec *diag, draw_jointyp join,
                                           draw_captyp  startcap,
                                           draw_captyp  endcap,
                                           draw_windtyp windrule,
                                           int          tricapwid,
                                           int          tricaphei);
extern os_error *draw_obj_setpath_dashpattern(diagrec *diag, draw_dashstr *pattern);

 
extern void draw_obj_bound_minmax(int x, int y, draw_bboxtyp *boundp);
extern void draw_obj_bound_minmax2(draw_objptr hdrptr, draw_bboxtyp *boundp);
extern  int  draw_obj_findTextBox(draw_objptr hdrptr, draw_bboxtyp *box);
extern  int  draw_obj_bound_object(draw_objptr hdrptr);
extern void draw_obj_bound_objects(diagrec *diag, int from, int to,draw_bboxtyp *box);
extern void draw_obj_bound_selection(draw_bboxtyp *boundp);
extern void draw_obj_bound_all(diagrec *diag, draw_bboxtyp *bboxp);
extern void draw_obj_bound_selection_width (int *widthp);

extern void draw_obj_get_box(draw_bboxtyp *box, draw_bboxtyp *bbox);

 
extern int  draw_obj_previous_object(diagrec *diag, int, draw_objcoord *pt);
extern void draw_obj_path_move(diagrec *diag, draw_objcoord *pt);
extern int  draw_obj_over_object(diagrec *diag, draw_objcoord *pt, region*, int*);

 
extern void      draw_obj_move_construction(diagrec *diag, draw_objcoord *pt);
extern os_error *draw_obj_drop_construction(diagrec *diag);

 
extern void draw_obj_addpath_centred_circle(diagrec *, draw_objcoord, int, int);

extern  int  draw_obj_rotatable (draw_objptr);
#line 42 "c.drawtrans"
#line 1 "h.DrawScan"
 













 
 





typedef void (*despatch_fn)();
typedef despatch_fn despatch_tab [draw_TAG_LIMIT];

 










void draw_scan_traverse(char *start, char *end,
                        despatch_tab arrayp, void *handle);

 


void draw_scan_traverse_withredraw(char *start, char *end, diagrec *diag,
                                   despatch_tab arrayp,void *handle,
                                    int  undo);
void draw_scan_traverse_splitredraw(char *start, char *end, diagrec *diag,
                                    despatch_tab arrayp, void *handle,
                                     int  undo);

 
void draw_scan_traverse_object(draw_objptr hdrptr,
                               despatch_tab arrayp, void *handle);
#line 43 "c.drawtrans"
#line 1 "h.DrawTextC"
 











 


extern char *draw_text_header;  

 
void draw_text_bound_objtextcol(draw_objptr hdrptr);
void draw_text_bound_objtextarea(draw_objptr hdrptr);

os_error *draw_text_do_objtextcol
         (draw_objptr hdrptr, draw_objcoord *org  );
os_error *draw_text_do_objtextarea
         (draw_objptr hdrptr, draw_objcoord *org  );

 int  draw_text_verifyTextArea (char *text, int length, int *areas,
    char *fontusetab);

 int  draw_text_previous_textcolumn
              (diagrec *diag, int parent, draw_objcoord *pt, int *column_off);

draw_objptr  draw_text_findParent(draw_textcolhdr *from);

 



void draw_text_rebound(draw_objptr hdrptr);
 int  draw_text_parentSelected(draw_objptr parent);

draw_textareaend *draw_text_findEnd(draw_objptr hdrptr);

 int  draw_text_create(diagrec *diag, char **text, int length,
                      int columns, draw_objcoord *mouse);
#line 44 "c.drawtrans"
#line 1 "h.DrawTrans"
 










 
typedef struct
{
  double old_Dx, old_Dy;        
  double new_Dx, new_Dy;
  union
  {
    struct
    {
      unsigned int dolines : 1;     
      unsigned int dobody  : 1;     
    } flags;
    int i;
  } u;
} draw_trans_scale_str;

typedef struct
{
  double sin_theta, cos_theta;
} draw_trans_rotate_str;

 




void draw_trans_translate(diagrec *diag, int start, int end,
                          trans_str *trans);
void draw_trans_translate_without_undo(diagrec *diag, int start, int end,
                                       trans_str *trans);
void draw_trans_rotate(diagrec *diag, int start, int end,
                       draw_trans_rotate_str *rotate);
void draw_trans_scale(diagrec *diag, int start, int end,
                      draw_trans_scale_str *scale);

void draw_trans_gridsnap_selection(viewrec *vuue);
#line 45 "c.drawtrans"
#line 1 "h.DrawUndo"
 

















 

 




typedef enum
{
  draw_undo__changestate = 0,
   



  draw_undo__trans = 1,
   



  draw_undo__rotate = 2,
   



  draw_undo__object = 3,
   






  draw_undo__insert = 4,
   





  draw_undo__delete = 5,
   





  draw_undo__select = 6,
   




  draw_undo__sel_array = 7,
   





  draw_undo__sel_array_no = 8,
   

  draw_undo__redraw = 9,
   

  draw_undo__info = 10
   


} draw_undo_class;

 





 
typedef struct   
{
  int start, end;
  trans_str  t;
} draw_undo_trans;


typedef struct   
{
  int start, end;
  double sin_theta, cos_theta;
} draw_undo_rotate;

 

void draw_undo_setbufsize(diagrec *diag, int nbytes);
 




void draw_undo_separate_major_edits(diagrec *diag);
 






void draw_undo_put_unwind(diagrec *diag);
 

void draw_undo_prevent_undo(diagrec *diag);
 

typedef enum {
     
  drawundo_MAJOR,    
  drawundo_RANOUT    

} drawundo_result;

void draw_undo_init(diagrec *diag);
 

drawundo_result draw_undo_undo(diagrec *diag);
 









drawundo_result draw_undo_redo(diagrec *diag);
 



 




void draw_undo_commit(diagrec *diag);
 



 

 


typedef struct drawundo__state *drawundo;  

drawundo draw_undo_new(void);
 

void draw_undo_dispose(drawundo);

void draw_undo_put(diagrec *diag, draw_undo_class class, int data, int data1);
 



 int  draw_undo_may_undo(diagrec *diag,  int  *redo);
#line 46 "c.drawtrans"




static void transform_matrix (drawmod_transmat t, drawmod_transmat m)
   

{ double T [6], M [6], R [6];
  int i;

  for (i = 0; i < 4; i++)
    T [i] = (double) t [i]/65536.0, M [i] = (double) m [i]/65536.0;

  T [4] = (double) t [4], M [4] = (double) m [4];
  T [5] = (double) t [5], M [5] = (double) m [5];

  R [0] = T [0]*M [0] + T [2]*M [1];
  R [1] = T [1]*M [0] + T [3]*M [1];
  R [2] = T [0]*M [2] + T [2]*M [3];
  R [3] = T [1]*M [2] + T [3]*M [3];
  R [4] = T [0]*M [4] + T [2]*M [5] + T [4];
  R [5] = T [1]*M [4] + T [3]*M [5] + T [5];

  for (i = 0; i < 4; i++)
    m [i] = (int) (65536.0*R [i]);

  m [4] = (int) R [4];
  m [5] = (int) R [5];
}

 
 
static void start_trans (diagrec *diag, int start, int end, char **s,
    char **e)

{ *s = start == -1?  0 : diag->paper + start;
  *e = end   == -1?  0 : diag->paper + end;
}

 

 
static void full_set_undo (diagrec *diag, draw_objptr hdrptr)

{ if (diag)
    draw_undo_put (diag, (draw_undo_class) (draw_undo__object |  0x1000 ),
        (int) hdrptr.bytep, hdrptr.objhdrp->size);
}

 
 
 
 

static void translate_bbox (draw_objptr hdrptr, trans_str *trans)

{ draw_bboxtyp *bbox = draw_displ_bbox (hdrptr);
  bbox->x0 += trans->dx;
  bbox->y0 += trans->dy;
  bbox->x1 += trans->dx;
  bbox->y1 += trans->dy;
}

static void translate_coord (int *c, trans_str *trans)

{ c [0] += trans->dx;
  c [1] += trans->dy;
}

static void translate_text (draw_objptr hdrptr, trans_str *trans)

{ translate_bbox (hdrptr, trans);
  translate_coord (&hdrptr.textp->coord.x, trans);
}

static void translate_path (draw_objptr hdrptr, trans_str *trans)

{ drawmod_pathelemptr pathptr;

  translate_bbox (hdrptr, trans);

   
  pathptr = draw_obj_pathstart (hdrptr);  

  while (pathptr.end->tag != path_term)
    switch (pathptr.end->tag)
    { case path_move_2:
      case path_lineto:
        translate_coord (&pathptr.move2->x, trans);
        pathptr.move2++;
      break;

      case path_bezier:
        translate_coord (&pathptr.bezier->x1, trans);
        translate_coord (&pathptr.bezier->x2, trans);
        translate_coord (&pathptr.bezier->x3, trans);
        pathptr.bezier++;
      break;

      case path_closeline:
        pathptr.closeline++;
      break;
    }
}

static void translate_textcolumn (draw_objptr hdrptr, trans_str *trans)

{ draw_objptr parent;

  parent = draw_text_findParent (hdrptr.textcolp);
  if (!draw_text_parentSelected (parent))
  { translate_bbox (hdrptr, trans);
    draw_text_rebound (parent);
} }

static void translate_textarea (draw_objptr hdrptr, trans_str *trans)

{ draw_textcolhdr *column;
  draw_objptr      columnObject;

   
  translate_bbox (hdrptr, trans);

   
  column = & (hdrptr.textareastrp->column);
  while (column->tag == draw_OBJTEXTCOL)
  { columnObject.textcolp = column++;
    translate_bbox (columnObject, trans);
} }

static void translate_trfmtext (draw_objptr hdrptr, trans_str *trans)

{ translate_bbox (hdrptr, trans);
  translate_coord (&hdrptr.trfmtextp->coord.x, trans);
}

static void translate_trfmsprite (draw_objptr hdrptr, trans_str *trans)

{ hdrptr.trfmspritep->bbox.x0 += trans->dx;
  hdrptr.trfmspritep->bbox.y0 += trans->dy;
  hdrptr.trfmspritep->bbox.x1 += trans->dx;
  hdrptr.trfmspritep->bbox.y1 += trans->dy;

  hdrptr.trfmspritep->trfm [4] += trans->dx;
  hdrptr.trfmspritep->trfm [5] += trans->dy;
}

static void translate_jpeg (draw_objptr hdrptr, trans_str *trans)

{  ((void) 0) ;

  hdrptr.jpegp->bbox.x0 += trans->dx;
  hdrptr.jpegp->bbox.y0 += trans->dy;
  hdrptr.jpegp->bbox.x1 += trans->dx;
  hdrptr.jpegp->bbox.y1 += trans->dy;

  hdrptr.jpegp->trans_mat [4] += trans->dx;
  hdrptr.jpegp->trans_mat [5] += trans->dy;
}

static void translate_group (draw_objptr hdrptr, trans_str *trans);

static despatch_tab translatetab =
{ 0  ,     translate_text,         translate_path,
  0  ,         0  ,             translate_bbox  ,
  translate_group,    0  ,           0  ,
  translate_textarea, translate_textcolumn,   0  ,
  translate_trfmtext, translate_trfmsprite,   0,
  0,                  translate_jpeg
};

static void translate_group (draw_objptr hdrptr, trans_str *trans)

{ translate_bbox (hdrptr, trans);
  draw_scan_traverse (hdrptr.bytep,  0 , translatetab, trans);
}

void draw_trans_translate_without_undo (diagrec *diag, int start, int end,
    trans_str *trans)

{ char      *s, *e;

  start_trans (diag, start, end, &s, &e);
  draw_scan_traverse_splitredraw (s, e, diag, translatetab, trans,  0 );
}

void draw_trans_translate (diagrec *diag, int start, int end,
    trans_str *trans)

{ draw_undo_trans undo;

  visdelay_begin ();  

  draw_trans_translate_without_undo (diag, start, end, trans);

  undo.start = start;
  undo.end   = end;
  undo.t     = *trans;

  draw_undo_put (diag, draw_undo__trans, (int)&undo, 0);

  visdelay_end ();  
}

 
 
 
 

typedef struct
{ double sin_theta, cos_theta;
  int    centx,     centy;
   int    set_centre;  
} rotate_typ;

static void matrix_from_rotate (drawmod_transmat m, rotate_typ *r)

 




{ m [0] = (int) (65536.0*r->cos_theta);
  m [1] = (int) (65536.0*r->sin_theta);
  m [2] =-m [1];
  m [3] = m [0];
  m [4] = (int) ((double) r->centx* (1.0 - r->cos_theta) +
      (double) r->centy*r->sin_theta);
  m [5] = (int) (- (double) r->centx*r->sin_theta +
      (double) r->centy* (1.0 - r->cos_theta));
}

 
static void set_centre (draw_objptr hdrptr, rotate_typ *rotate)

{ draw_bboxtyp *bbox;
  if (rotate->set_centre)
  { bbox = draw_displ_bbox (hdrptr);
    rotate->centx = (bbox->x1 + bbox->x0)/2;
    rotate->centy = (bbox->y1 + bbox->y0)/2;
  }
}

 
 

static void rotate_coord (rotate_typ *r, double *from, int *to,
    double *offset)

{ from[0] -= r->centx;
  from[1] -= r->centy;

  to[0] = (int) (r->centx + from[0]*r->cos_theta - from[1]*r->sin_theta
                         - offset[0]);
  to[1] = (int) (r->centy + from[1]*r->cos_theta + from[0]*r->sin_theta
                         - offset[1]);
}

static void rotate_coord_int (rotate_typ *r, int *c, double *offset)

{ double from[2];
  from[0] = (double)c[0] - r->centx;
  from[1] = (double)c[1] - r->centy;

  c[0] = (int) (r->centx + from[0]*r->cos_theta - from[1]*r->sin_theta
                        - offset[0]);
  c[1] = (int) (r->centy + from[1]*r->cos_theta + from[0]*r->sin_theta
                        - offset[1]);
}

 
static void rotate_shift (draw_bboxtyp *box, rotate_typ *rotate,
                         trans_str *shift)

{ double pt[2], offset[2];

   
  offset[0] = pt[0] = ((double) box->x1 + (double) box->x0)/2;
  offset[1] = pt[1] = ((double) box->y1 + (double) box->y0)/2;
  shift->dx = shift->dy = 0;

  rotate_coord (rotate, pt, (int *) shift, offset);
}

static void rotate_text (draw_objptr hdrptr, rotate_typ *rotate)

{ double pt [2], offset [2];

  set_centre (hdrptr, rotate);

  pt [0] = ((double) hdrptr.textp->bbox.x1 +
      (double) hdrptr.textp->bbox.x0)/2;
  pt [1] = ((double) hdrptr.textp->bbox.y1 +
      (double) hdrptr.textp->bbox.y0)/2;

  offset [0] = pt [0] - hdrptr.textp->coord.x;
  offset [1] = pt [1] - hdrptr.textp->coord.y;

  rotate_coord (rotate, pt, &hdrptr.textp->coord.x, offset);
}

static void rotate_path (draw_objptr hdrptr, rotate_typ *rotate)

{ drawmod_pathelemptr pathptr;
  double     offset[2];

  set_centre (hdrptr, rotate);
  offset[0] = offset[1] = 1.0;

   
   
   
  pathptr = draw_obj_pathstart (hdrptr);         

  while (pathptr.end->tag != path_term)
    switch (pathptr.end->tag)
    { case path_move_2:
      case path_lineto:
        rotate_coord_int (rotate, &pathptr.move2->x, offset);
        pathptr.move2++;
      break;

      case path_bezier:
        rotate_coord_int (rotate, &pathptr.bezier->x1, offset);
        rotate_coord_int (rotate, &pathptr.bezier->x2, offset);
        rotate_coord_int (rotate, &pathptr.bezier->x3, offset);
        pathptr.bezier++;
      break;

      case path_closeline:
        pathptr.closeline++;
      break;
}   }

static void rotate_sprite (draw_objptr hdrptr, rotate_typ *rotate)

{ double pt[2], offset[2];
  int    wid, hei;
  set_centre (hdrptr, rotate);

  wid = hdrptr.spritep->bbox.x1 - hdrptr.spritep->bbox.x0;
  hei = hdrptr.spritep->bbox.y1 - hdrptr.spritep->bbox.y0;

  offset [0] = (double) wid/2.0;
  offset [1] = (double) hei/2.0;

  pt [0] = ((double) hdrptr.spritep->bbox.x1 +
      (double) hdrptr.spritep->bbox.x0)/2;
  pt [1] = ((double) hdrptr.spritep->bbox.y1 +
      (double) hdrptr.spritep->bbox.y0)/2;

  rotate_coord (rotate, pt, &hdrptr.spritep->bbox.x0, offset);
  hdrptr.spritep->bbox.x1 = hdrptr.spritep->bbox.x0 + wid;
  hdrptr.spritep->bbox.y1 = hdrptr.spritep->bbox.y0 + hei;
}


 
static void rotate_textarea (draw_objptr hdrptr, rotate_typ *rotate)

{ trans_str trans;
  set_centre (hdrptr, rotate);

   
  rotate_shift (draw_displ_bbox (hdrptr), rotate, &trans);

   
  translate_textarea (hdrptr, &trans);
}

static void rotate_textcol (draw_objptr hdrptr, rotate_typ *rotate)

{ draw_objptr parent = draw_text_findParent (hdrptr.textcolp);

  if (!draw_text_parentSelected (parent))
  { trans_str trans;

    set_centre (hdrptr, rotate);

     
    rotate_shift (draw_displ_bbox (hdrptr), rotate, &trans);

     
    translate_bbox (hdrptr, &trans);

     
    draw_text_rebound (parent);
} }

static void rotate_trfmtext (draw_objptr hdrptr, rotate_typ *rotate)

{ drawmod_transmat mat;
  double offset [2];

  set_centre (hdrptr, rotate);
  offset [0] = offset [1] = 0.0;

   
  matrix_from_rotate (mat, rotate);

   
  rotate_coord_int (rotate, &hdrptr.trfmtextp->coord.x, offset);

   ((void) 0) 
;
   ((void) 0) 
;

   ((void) 0) 
;
   ((void) 0) 
;

   
  transform_matrix (mat, hdrptr.trfmtextp->trfm);

   
  hdrptr.trfmtextp->trfm [4] = hdrptr.trfmtextp->trfm [5] = 0;

   ((void) 0) 


;
   ((void) 0) 


;

   ((void) 0) 


;
   ((void) 0) 


;

   
}

static void rotate_trfmsprite (draw_objptr hdrptr, rotate_typ *rotate)

{ drawmod_transmat mat;

  set_centre (hdrptr, rotate);

   
  matrix_from_rotate (mat, rotate);

   
  transform_matrix (mat, hdrptr.trfmspritep->trfm);

   
}

static void rotate_jpeg (draw_objptr hdrptr, rotate_typ *rotate)

{ drawmod_transmat mat;
  trans_str trans;

  set_centre (hdrptr, rotate);

  if (draw_jpegs_rotate)
  {  
    matrix_from_rotate (mat, rotate);

     
    transform_matrix (mat, hdrptr.jpegp->trans_mat);
  }
  else
  {  
    rotate_shift (draw_displ_bbox (hdrptr), rotate, &trans);

     
    translate_jpeg (hdrptr, &trans);
  }

   
}

static void rotate_group (draw_objptr hdrptr, rotate_typ *rotate);

static despatch_tab rotatetab =
{ 0  ,    rotate_text,       rotate_path,
  0  ,        0  ,        rotate_sprite,
  rotate_group,      0  ,      0  ,
  rotate_textarea,   rotate_textcol,    0  ,
  rotate_trfmtext,   rotate_trfmsprite, 0  ,
  0  , rotate_jpeg
};

static void rotate_group (draw_objptr hdrptr, rotate_typ *rotate)

{  int  saved_set = rotate->set_centre;

  set_centre (hdrptr, rotate);
  rotate->set_centre =  0 ;  
  draw_scan_traverse (hdrptr.bytep,  0 , rotatetab, rotate);
  rotate->set_centre = saved_set;  
}

 
void draw_trans_rotate (diagrec *diag, int start, int end,
    draw_trans_rotate_str *rotate)

{ rotate_typ  r;
  char *s, *e;
  draw_undo_rotate undo;

  r.sin_theta  = rotate->sin_theta;
  r.cos_theta  = rotate->cos_theta;
  r.set_centre =  1 ;

  visdelay_begin ();  

  start_trans (diag, start, end, &s, &e);
  draw_scan_traverse_withredraw (s, e, diag, rotatetab, &r,  0 );

  undo.start = start;
  undo.end   = end;
  undo.sin_theta = rotate->sin_theta;
  undo.cos_theta = rotate->cos_theta;

  draw_undo_put (diag, draw_undo__rotate, (int)&undo, 0);

  visdelay_end ();  
}

 
 



















 

typedef struct

{ double   xscale, yscale;  
  double   rawxsc, rawysc;  
  draw_objcoord org;
   int      set_org;         
  int      table;           
  diagrec *diag;            
} scale_typ;

static void matrix_from_scale (drawmod_transmat m, scale_typ *s)

 




{ m [0] = (int) (65536.0*s->xscale);
  m [1] = 0;
  m [2] = 0;
  m [3] = (int) (65536.0*s->yscale);
  m [4] = (int) ((double) s->org.x*(1.0 - s->xscale));
  m [5] = (int) ((double) s->org.y*(1.0 - s->yscale));
}

 
 
 
 
static void scale_check (draw_objptr hdrptr, scale_typ *scale, diagrec *diag)

{






   






  scale->xscale =  __d_abs( scale->rawxsc ) ;
  scale->yscale =  __d_abs( scale->rawysc ) ;

   ((void) 0) 


;
































  if (scale->rawxsc < 0) scale->xscale = -scale->xscale;
  if (scale->rawysc < 0) scale->yscale = -scale->yscale;

   ((void) 0) ;

   
  if (scale->set_org)
  { draw_bboxtyp *bbox = draw_displ_bbox (hdrptr);
    scale->org.x = bbox->x0;
    scale->org.y = bbox->y1;
     ((void) 0) 
;
  }

  full_set_undo (diag, hdrptr);
}

 

static int point_scale (int p2, double p, int p1)

{ int ret = (int) ((1.0 - p)*p1 + p*p2);

   ((void) 0) 
;

  return ret;
}

 

static double fpoint_scale (double p2, double p, int p1)

{ double ret = (1.0 - p)*p1 + p*p2;

   ((void) 0) 
;

  return ret;
}

 
static void scale_coord (scale_typ *scale, int *point)

{ point[0] = point_scale (point[0], scale->xscale, scale->org.x);
  point[1] = point_scale (point[1], scale->yscale, scale->org.y);
}

 
static void fscale_coord (scale_typ *scale, double *point)

{ point [0] = fpoint_scale (point [0], scale->xscale, scale->org.x);
  point [1] = fpoint_scale (point [1], scale->yscale, scale->org.y);
}

static void scale_coord_abs (scale_typ *scale, int *point)

{ point[0] = point_scale (point[0],  __d_abs( scale->xscale ) , scale->org.x);
  point[1] = point_scale (point[1],  __d_abs( scale->yscale ) , scale->org.y);

 




}

 
 
 
 
static void scale_text (draw_objptr hdrptr, scale_typ *scale)

{ double fsizex, fsizey;

  scale_check (hdrptr, scale, scale->diag);

  fsizex = hdrptr.textp->fsizex* __d_abs( scale->xscale ) ,
  fsizey = hdrptr.textp->fsizey* __d_abs( scale->yscale ) ;

  if (fsizex <= -(double)  (0x6FFF << 8)  || fsizex >= (double)  (0x6FFF << 8) )
  { werr( 0 , msgs_lookup ("DrawO"), (double)  (0x6FFF << 8) /hdrptr.textp->fsizex);
    return;
  }

  if (fsizey <= -(double)  (0x6FFF << 8)  || fsizey >= (double)  (0x6FFF << 8) )
  { werr( 0 , msgs_lookup ("DrawO"), (double)  (0x6FFF << 8) /hdrptr.textp->fsizey);
    return;
  }

  if (scale->xscale < 0)
    hdrptr.textp->coord.x -= hdrptr.textp->bbox.x1 + hdrptr.textp->bbox.x0
                             - 2*scale->org.x;
  if (scale->yscale < 0)
    hdrptr.textp->coord.y -= hdrptr.textp->bbox.y1 + hdrptr.textp->bbox.y0
                             - 2*scale->org.y;

  hdrptr.textp->fsizex = (int) fsizex;
  hdrptr.textp->fsizey = (int) fsizey;

  scale_coord_abs (scale, &hdrptr.textp->coord.x);
   ((void) 0) 

;
}

 
static void scale_pathLines (draw_objptr hdrptr, scale_typ *scale)

{ hdrptr.pathp->pathwidth =
      (int) (hdrptr.pathp->pathwidth* __d_abs( scale->xscale ) );
}

 
static void scale_pathL (draw_objptr hdrptr, scale_typ *scale)

{ scale_check (hdrptr, scale, scale->diag);
  scale_pathLines (hdrptr, scale);
}

 
static void scale_pathBody (draw_objptr hdrptr, scale_typ *scale)

{ drawmod_pathelemptr pathptr;

   
  pathptr = draw_obj_pathstart (hdrptr);         

  while (pathptr.end->tag != path_term)
    switch (pathptr.end->tag)
    { case path_move_2:
      case path_lineto:
        scale_coord (scale, &pathptr.move2->x);
        pathptr.move2++;
      break;

      case path_bezier:
        scale_coord (scale, &pathptr.bezier->x1);
        scale_coord (scale, &pathptr.bezier->x2);
        scale_coord (scale, &pathptr.bezier->x3);
        pathptr.bezier++;
      break;

      case path_closeline:
        pathptr.closeline++;
      break;
}   }

 
static void scale_pathB (draw_objptr hdrptr, scale_typ *scale)

{ scale_check (hdrptr, scale, scale->diag);
  scale_pathBody (hdrptr, scale);
}

 
static void scale_pathBL (draw_objptr hdrptr, scale_typ *scale)

{ scale_check (hdrptr, scale, scale->diag);
  scale_pathBody (hdrptr, scale);
  scale_pathLines (hdrptr, scale);
}

static void scale_sprite (draw_objptr hdrptr, scale_typ *scale)

{ int spriwid = hdrptr.spritep->bbox.x1 - hdrptr.spritep->bbox.x0;
  int sprihei = hdrptr.spritep->bbox.y1 - hdrptr.spritep->bbox.y0;

  sprite_id id;

  id.tag    = sprite_id_addr;
  id.s.addr = &hdrptr.spritep->sprite;

  scale_check (hdrptr, scale, scale->diag);

  if (scale->xscale < 0)
  { hdrptr.spritep->bbox.x0 = 2*scale->org.x - hdrptr.spritep->bbox.x1;
    sprite_flip_y ((sprite_area*)0xFF, &id);
  }

  if (scale->yscale < 0)
  { hdrptr.spritep->bbox.y0 = 2*scale->org.y - hdrptr.spritep->bbox.y1;
    sprite_flip_x ((sprite_area*)0xFF, &id);
  }

  scale_coord_abs (scale, &hdrptr.spritep->bbox.x0);
  hdrptr.spritep->bbox.x1 = (int) (hdrptr.spritep->bbox.x0 + spriwid
                                  *  __d_abs( scale->xscale ) );
  hdrptr.spritep->bbox.y1 = (int) (hdrptr.spritep->bbox.y0 + sprihei
                                  *  __d_abs( scale->yscale ) );
}

static void scale_textC (draw_objptr hdrptr, scale_typ *scale)

{ draw_bboxtyp box;
  int width, height;
  int topx, basey;
  draw_textcolhdr *column = hdrptr.textcolp;

   
  box = column->bbox;
  width = (int) (scale->xscale* ((double) box.x1 - (double) box.x0));
  height= (int) (scale->yscale* ((double) box.y1 - (double) box.y0));

   
  topx  = scale->org.x + width;
  basey = scale->org.y - height;

   
  if (topx > scale->org.x)
  { column->bbox.x0 = scale->org.x;
    column->bbox.x1 = topx;
  }
  else
  { column->bbox.x0 = topx;
    column->bbox.x1 = scale->org.x;
  }

  if (basey < scale->org.y)
  { column->bbox.y0 = basey;
    column->bbox.y1 = scale->org.y;
  }
  else
  { column->bbox.y0 = scale->org.y;
    column->bbox.y1 = basey;
  }
}

static void scale_textarea (draw_objptr hdrptr, scale_typ *scale)

{  

   

  scale_check (hdrptr, scale, scale->diag);

  if ( (*(int *)( hdrptr .bytep + sizeof(draw_textareahdr) + sizeof(draw_textcolhdr)) == 0) )
  { draw_objptr colptr;

     
    colptr.textcolp = &hdrptr.textareastrp->column;
    scale_textC (colptr, scale);

     
    hdrptr.textareastrp->bbox = colptr.textcolp->bbox;  
  }
}

static void scale_textcolumn (draw_objptr hdrptr, scale_typ *scale)

{ draw_objptr parent = draw_text_findParent (hdrptr.textcolp);

   
  full_set_undo (scale->diag, parent);

  scale_check (hdrptr, scale,  0 );

   
  scale_textC (hdrptr, scale);

   
  draw_text_rebound (parent);
}

static void scale_trfmtext (draw_objptr hdrptr, scale_typ *scale)

{ double
    m0 = (double) hdrptr.trfmtextp->trfm [0]/65536.0,
    m1 = (double) hdrptr.trfmtextp->trfm [1]/65536.0,
    m2 = (double) hdrptr.trfmtextp->trfm [2]/65536.0,
    m3 = (double) hdrptr.trfmtextp->trfm [3]/65536.0,
    alpha, beta, rx, ry;
  int t;

  scale_check (hdrptr, scale, scale->diag);
  alpha = scale->xscale;
  beta  = scale->yscale;

   
  rx = sqrt ( (( alpha*m0 )*( alpha*m0 ))  +  (( beta*m1 )*( beta*m1 )) );
  ry = rx != 0.0?
       __d_abs( sqrt ( (( m2 )*( m2 ))  +  (( m3 )*( m3 )) )*alpha*beta*(m0*m3 - m1*m2)/rx ) : 0.0;
   ((void) 0) ;

  








   
   ((void) 0) 
;
  t = (int) (hdrptr.trfmtextp->fsizex*rx);
  if (t >=  640 /16)
    hdrptr.trfmtextp->fsizex = t;
  else
  { hdrptr.trfmtextp->fsizex =  640 /16;
    rx = (double)  640 /(16.0*(double) hdrptr.trfmtextp->fsizex);
  }

  t = (int) (hdrptr.trfmtextp->fsizey*ry);
  if (t >=  640 /16)
    hdrptr.trfmtextp->fsizey = t;
  else
  { hdrptr.trfmtextp->fsizey =  640 /16;
    ry = (double)  640 /(16.0*(double) hdrptr.trfmtextp->fsizey);
  }
   ((void) 0) 
;

   ((void) 0) 
;
   
  scale_coord (scale, &hdrptr.trfmtextp->coord.x);
   ((void) 0) 
;

   
  hdrptr.trfmtextp->trfm [0] =
      (int) (hdrptr.trfmtextp->trfm [0]*alpha/rx);
  hdrptr.trfmtextp->trfm [1] =
      (int) (hdrptr.trfmtextp->trfm [1]*beta/rx);
  hdrptr.trfmtextp->trfm [2] =
      (int) (hdrptr.trfmtextp->trfm [2]*alpha/ry);
  hdrptr.trfmtextp->trfm [3] =
      (int) (hdrptr.trfmtextp->trfm [3]*beta/ry);
}

static void scale_trfmsprite (draw_objptr hdrptr, scale_typ *scale)

{ drawmod_transmat mat;

  scale_check (hdrptr, scale, scale->diag);
  matrix_from_scale (mat, scale);

   ((void) 0) 
;
   ((void) 0) 
;

   ((void) 0) 
;
   ((void) 0) 
;

   
  transform_matrix (mat, hdrptr.trfmspritep->trfm);

   ((void) 0) 


;
   ((void) 0) 


;

   ((void) 0) 


;
   ((void) 0) 


;

   
}

static void scale_jpeg (draw_objptr hdrptr, scale_typ *scale)

{ drawmod_transmat mat, m;

  scale_check (hdrptr, scale, scale->diag);

  if (!(draw_jpegs_rotate || (scale->xscale >= 0 && scale->yscale >= 0)))
  {  


    m [1] = m [2] = 0;

    if (scale->xscale >= 0)
      m [0] =  0x10000, m [4] = 0;
    else
      m [0] = -0x10000, m [4] = hdrptr.jpegp->width;

    if (scale->yscale >= 0)
      m [3] =  0x10000, m [5] = 0;
    else
      m [3] = -0x10000, m [5] = hdrptr.jpegp->height;

    transform_matrix (hdrptr.jpegp->trans_mat, m);
    memcpy (hdrptr.jpegp->trans_mat, m, sizeof m);
  }

  matrix_from_scale (mat, scale);

   
  transform_matrix (mat, hdrptr.jpegp->trans_mat);

    }

static void scale_group (draw_objptr hdrptr, scale_typ *scale);

 
static despatch_tab scaletab[3] =

{  
  { 0  ,     0  ,         scale_pathL,
    0  ,         0  ,         0  ,
    scale_group
  },

   
  { 0  ,     scale_text,         scale_pathB,
    0  ,         0  ,         scale_sprite,
    scale_group,        0  ,       0  ,
    scale_textarea,     scale_textcolumn,   0  ,
    scale_trfmtext,     scale_trfmsprite,   0,
    0,                  scale_jpeg
  },

   
  { 0  ,     scale_text,         scale_pathBL,
    0  ,         0  ,         scale_sprite,
    scale_group,        0  ,       0  ,
    scale_textarea,     scale_textcolumn,   0  ,
    scale_trfmtext,     scale_trfmsprite,   0,
    0,                  scale_jpeg
  }
};

static void scale_group (draw_objptr hdrptr, scale_typ *scale)

{ scale_typ saved_scale = *scale;

   
  full_set_undo (scale->diag, hdrptr);

  if (scale->set_org)   
  { draw_bboxtyp *bbox = draw_displ_bbox (hdrptr);
    scale->org.x = bbox->x0;
    scale->org.y = bbox->y1;
     ((void) 0) 

;
  }

  scale->set_org =  0 ;
  scale->diag    =  0 ;   

  draw_scan_traverse (hdrptr.bytep,  0 , scaletab[scale->table], scale);

  *scale = saved_scale;
}

 
void draw_trans_scale (diagrec *diag, int start, int end,
    draw_trans_scale_str *scale)

{ scale_typ sc;
  char *s, *e;
  double scale_factor;

   ((void) 0) 


;

  visdelay_begin ();  

  sc.rawxsc  = scale->old_Dx == 0.0? 0.0: scale->new_Dx/scale->old_Dx;
  sc.rawysc  = scale->old_Dy == 0.0? 0.0: scale->new_Dy/scale->old_Dy;
  sc.xscale  = sc.rawxsc;
  sc.yscale  = sc.rawysc;
  sc.set_org =  1 ;
  sc.table   = scale->u.flags.dolines? (scale->u.flags.dobody? 2: 0): 1;
  sc.diag    = diag;

   ((void) 0) ;

   

  if ( __d_abs( scale_factor = sc.rawxsc > sc.rawysc? sc.rawxsc: sc.rawysc )  >
      1.0)
  { if (scale->u.flags.dobody)
    { draw_bboxtyp selection_bbox;
      struct {double x0, y0, x1, y1;} fbbox;
      int i, a, b;

       
      draw_obj_bound_selection (&selection_bbox);
      for (i = 0; i < 4; i++)
        (&fbbox.x0) [i] = (&selection_bbox.x0) [i];

      sc.org.x = selection_bbox.x0;
      sc.org.y = selection_bbox.y1;
      fscale_coord (&sc, &fbbox.x0);  
      fscale_coord (&sc, &fbbox.x1);
       ((void) 0) 
;
      a = selection_bbox.x1 - selection_bbox.x0;
      b = selection_bbox.y1 - selection_bbox.y0;

      for (i = 0; i < 4; i++)
         if (!(-(double)  (0x6FFF << 8)  <= (&fbbox.x0) [i] &&
             (&fbbox.x0) [i] <= (double)  (0x6FFF << 8) ))
         { double f1, f2, f;

           f1 = a != 0? ((double)  (0x6FFF << 8)  - sc.org.x)/(double) a:  0x7fffffff ;
           f2 = b != 0? ((double)  (0x6FFF << 8)  - sc.org.y)/(double) b:  0x7fffffff ;
                

           f = f1 < f2? f1: f2;

           werr ( 0 , msgs_lookup ("DrawO"), f > 1.0? f: 1.0);
           return;
    }    }

    if (scale->u.flags.dolines)
    { int width;
      double scaled_width;

       
      draw_obj_bound_selection_width (&width);

      scaled_width = (double) width*scale_factor;

      if (!(-(double)  (0x6FFF << 8)  <= scaled_width &&
          (double) scaled_width <=  (0x6FFF << 8) ))
      { double f = (double)  (0x6FFF << 8) /(double) width;

        werr ( 0 , msgs_lookup ("DrawO"), f);
        return;
  } } }

  start_trans (diag, start, end, &s, &e);
  draw_scan_traverse_withredraw (s, e, diag, scaletab [sc.table], &sc,
       0 );

  visdelay_end ();  
}

 
 
 
 

typedef
  struct
  { diagrec *diag;
    viewrec *vuue;
    int dx, dy;
     int  set_offset;
  } gridsnap_str;

 
static void set_offset (draw_objptr hdrptr, gridsnap_str *snap)

{ draw_objcoord c;

   


  if (snap->set_offset)
    switch (hdrptr.objhdrp->tag)
    { case draw_OBJTEXT:
        c.x = hdrptr.textp->coord.x;
        c.y = hdrptr.textp->coord.y;

        draw_grid_snap (snap->vuue, &c);

        snap->dx = c.x - hdrptr.textp->coord.x;
        snap->dy = c.y - hdrptr.textp->coord.y;
      break;

      case draw_OBJPATH:
      { drawmod_pathelemptr path_elem = draw_obj_pathstart (hdrptr);

        



        if (path_elem.end->tag == path_move_2)  
        { c.x = path_elem.move2->x;
          c.y = path_elem.move2->y;

          draw_grid_snap (snap->vuue, &c);

          snap->dx = c.x - path_elem.move2->x;
          snap->dy = c.y - path_elem.move2->y;
        }
        else  
          snap->dx = snap->dy = 0;
      }
      break;

      case draw_OBJTRFMTEXT:
        c.x = hdrptr.trfmtextp->coord.x;
        c.y = hdrptr.trfmtextp->coord.y;

        draw_grid_snap (snap->vuue, &c);

        snap->dx = c.x - hdrptr.trfmtextp->coord.x;
        snap->dy = c.y - hdrptr.trfmtextp->coord.y;
      break;

      default:
        { draw_bboxtyp *bbox = draw_displ_bbox (hdrptr);
          c.x = bbox->x0;
          c.y = bbox->y1;

          draw_grid_snap (snap->vuue, &c);

          snap->dx = c.x - bbox->x0;
          snap->dy = c.y - bbox->y1;
        }
      break;
}   }

static void gridsnap_text (draw_objptr hdrptr, gridsnap_str *snap)

{ full_set_undo (snap->diag, hdrptr);
  set_offset (hdrptr, snap);

  hdrptr.textp->coord.x += snap->dx;
  hdrptr.textp->coord.y += snap->dy;
     

   
  draw_obj_bound_object (hdrptr);
}

static void gridsnap_path (draw_objptr hdrptr, gridsnap_str *snap)

{ trans_str     trans;

  full_set_undo (snap->diag, hdrptr);
  set_offset (hdrptr, snap);
   ((void) 0) 
;

  






















     
    trans.dx = snap->dx;
    trans.dy = snap->dy;
    translate_path (hdrptr, &trans);
  

   
  draw_obj_bound_object (hdrptr);
}

static void gridsnap_sprite (draw_objptr hdrptr, gridsnap_str *snap)

{
  















    full_set_undo (snap->diag, hdrptr);
    set_offset (hdrptr, snap);

    hdrptr.spritep->bbox.x0 += snap->dx;
    hdrptr.spritep->bbox.y0 += snap->dy;

    hdrptr.spritep->bbox.x1 += snap->dx;
    hdrptr.spritep->bbox.y1 += snap->dy;

     
  
}

static void gridsnap_textcol (draw_objptr hdrptr, gridsnap_str *snap)

{ full_set_undo (snap->diag, hdrptr);

  














    set_offset (hdrptr, snap);

    hdrptr.textcolp->bbox.x0 += snap->dx;
    hdrptr.textcolp->bbox.y0 += snap->dy;
    hdrptr.textcolp->bbox.x1 += snap->dx;
    hdrptr.textcolp->bbox.y1 += snap->dy;
  
}

static void gridsnap_textarea (draw_objptr hdrptr, gridsnap_str *snap)

{ draw_textcolhdr *textcol_hdrptr;

  full_set_undo (snap->diag, hdrptr);

  



























    set_offset (hdrptr, snap);

     
    for (textcol_hdrptr = (draw_textcolhdr *) (hdrptr.textareap + 1);
        textcol_hdrptr->tag != 0; textcol_hdrptr++)
    { textcol_hdrptr->bbox.x0 += snap->dx;
      textcol_hdrptr->bbox.y0 += snap->dy;
      textcol_hdrptr->bbox.x1 += snap->dx;
      textcol_hdrptr->bbox.y1 += snap->dy;
    }

     
    hdrptr.textareap->bbox.x0 += snap->dx;
    hdrptr.textareap->bbox.y0 += snap->dy;
    hdrptr.textareap->bbox.x1 += snap->dx;
    hdrptr.textareap->bbox.y1 += snap->dy;
  
}

static void gridsnap_trfmtext (draw_objptr hdrptr, gridsnap_str *snap)

{ full_set_undo (snap->diag, hdrptr);

  


    set_offset (hdrptr, snap);

    hdrptr.trfmtextp->coord.x += snap->dx;
    hdrptr.trfmtextp->coord.y += snap->dy;

    draw_obj_bound_object (hdrptr);
  
}

static void gridsnap_trfmsprite (draw_objptr hdrptr, gridsnap_str *snap)

{ draw_objcoord pt;

  pt.x = hdrptr.trfmspritep->bbox.x0;
  pt.y = hdrptr.trfmspritep->bbox.y1;

  full_set_undo (snap->diag, hdrptr);

  












    set_offset (hdrptr, snap);

    hdrptr.trfmspritep->bbox.x0 += snap->dx;
    hdrptr.trfmspritep->bbox.y0 += snap->dy;
    hdrptr.trfmspritep->bbox.x1 += snap->dx;
    hdrptr.trfmspritep->bbox.y1 += snap->dy;

    hdrptr.trfmspritep->trfm [4] += snap->dx;
    hdrptr.trfmspritep->trfm [5] += snap->dy;
  
}

static void gridsnap_jpeg (draw_objptr hdrptr, gridsnap_str *snap)

{ draw_objcoord pt;

  pt.x = hdrptr.jpegp->bbox.x0;
  pt.y = hdrptr.jpegp->bbox.y1;

  full_set_undo (snap->diag, hdrptr);
  set_offset (hdrptr, snap);

  hdrptr.jpegp->bbox.x0 += snap->dx;
  hdrptr.jpegp->bbox.y0 += snap->dy;
  hdrptr.jpegp->bbox.x1 += snap->dx;
  hdrptr.jpegp->bbox.y1 += snap->dy;

  hdrptr.jpegp->trans_mat [4] += snap->dx;
  hdrptr.jpegp->trans_mat [5] += snap->dy;
}

static void gridsnap_group (draw_objptr hdrptr, gridsnap_str *snap);

static despatch_tab gridsnaptab =
{ 0  ,    gridsnap_text,       gridsnap_path,    0  ,
  0  ,        gridsnap_sprite,     gridsnap_group,   0  ,
  0  ,         gridsnap_textarea,   gridsnap_textcol, 0  ,
  gridsnap_trfmtext, gridsnap_trfmsprite, 0,                0,
  gridsnap_jpeg
};

static void gridsnap_group (draw_objptr hdrptr, gridsnap_str *snap)

{  int  saved_set = snap->set_offset;

   
  if (snap->diag)
    draw_undo_put (snap->diag, (draw_undo_class) (draw_undo__object |  0x1000 ),
        (int) hdrptr.bytep, sizeof (draw_groustr));

  


    set_offset (hdrptr, snap);
    snap->set_offset =  0 ;  
    draw_scan_traverse (hdrptr.bytep,  0 , gridsnaptab, snap);
    snap->set_offset = saved_set;  
  
}

void draw_trans_gridsnap_selection (viewrec *vuue)

{ gridsnap_str snap;
  diagrec      *diag = vuue->diag;

  snap.diag = diag;
  snap.vuue = vuue;

  visdelay_begin ();  

  


    draw_undo_separate_major_edits (diag);
  

   
  snap.set_offset =  1 ;
  draw_scan_traverse_withredraw ( 0 ,  0 , diag, gridsnaptab, &snap,
       0 );

  visdelay_end ();  
}
