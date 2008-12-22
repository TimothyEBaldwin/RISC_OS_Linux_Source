/*
 * Copyright (c) 1988 Acorn Computers Ltd., Cambridge, England
 *
 * :RCS Log discontinued:
 * Revision 1.1  95/01/11  10:21:35  kwelton
 * Initial revision
 * 
 * Revision 1.9  89/06/21  08:24:09  mark
 * Value of PRIO_SOFTVTE dropped a lot - now below all of
 * FDC, soft-clock and soft-net.  This may well improve net
 * performance in a context of lots of screen output, and is
 * certainly much more reasonable.
 * 
 * Revision 1.8  89/06/09  15:15:26  mark
 * Added PRIO_I2C for CMOS device access protection.
 * 
 * Revision 1.7  89/04/28  15:09:47  mark
 * Changed to suit new XCB manager.
 * 
 * Revision 1.6  89/04/12  12:51:01  jwills
 * Added a soft interrupt for the SCSI driver.
 * 
 * Revision 1.5  88/11/30  02:09:13  keith
 * Mark's new interrupt handling stuff
 * 
 * Revision 1.4  88/11/11  08:36:19  keith
 * Added recursive inclusion protection, and exported MAXSPL since int_prio_tbl
 * has now moved down to page 0.
 * 
 * Revision 1.3  88/06/17  20:07:27  beta
 * Acorn Unix initial beta version
 * 
 */
/*
 *      ARM Interrupt interface - interrupt control structures
 *
 *      Author: J.M. Collins, Xi Software Ltd 1986.
 *      Revised: Mark Taunton, Acorn Computers Ltd, 1988.
 */

#ifndef __INT_HNDLR__
#define __INT_HNDLR__

/*
 * Interrupt source types: one byte is allocated in the mask values
 * for each type.  The order here matches ordering from least-sig
 * byte to most-sig byte.  One of these values is passed to
 * decl_interrupt (), along with a bit-mask for that source.
 */
#define INT_IRQA        0
#define INT_IRQB        1
#define INT_XCB         2
#define INT_SOFT        3

#define INT_BIT(mask,type) ((mask) << ((type) * 8))
#define SINT_SHIFT      (INT_SOFT * 8)

/* Define hardware force-interrupt bit (needs ioc.h)  */
#define SOFTINT_BIT     INT_BIT(IRQA_FORCE,INT_IRQA)

/*
 * At most 8 soft-ints can be defined as things currently 
 * stand: 1 << 7 would be the last.  This could be modified
 * by using some spare XCB type bits for soft-ints, and
 * adjusting the INT_xxx and SOFTINT_BIT macros above.
 */
#define SOFTCLOCKMASK   (1 << 0)
#define SOFTNETMASK     (1 << 1)
#define SOFTFDCMASK     (1 << 2)
#define SOFTVTEOUTPUT   (1 << 3)
#define SOFTSERIAL      (1 << 4)
#define SOFTSCSIMASK    (1 << 5)

/*
 * To declare an interrupt, the routine
 *
 *      decl_interrupt(&thing, level, type)
 *
 * is called with the following structure as 'thing'.
 */

struct int_hndlr
{
    unsigned int        ih_mask;                /* Mask (gets mangled) */
    void                (*ih_fn)();             /* Function to call */
    int                 ih_farg;                /* Argument to pass */
    struct int_hndlr   *ih_next;                /* Next one */
};

/*
 *      This is the vector of masks or-ed from each of the declared
 *      interrupts for each priority level.
 */

struct int_prio_tbl
{
    struct int_prio_tbl *ip_next;       /* link to next lower active level */
    unsigned int        ip_this_level;  /* bits for this level only */
    unsigned int        ip_cum_bits;    /* bits for all levels < this */
    struct int_hndlr    *ip_chain;      /* handler chain */
};

/* Head of chain of active int levels */
extern struct int_prio_tbl  *first_irq;

/* Hardware int priority table */
extern struct int_prio_tbl  int_prio_tbl[];

/* Or of bits for pending software interrupts. This is unshifted. */
extern unsigned int  sint_pending;

#define  PRIO_0         0x00
#define  PRIO_1         0x01
#define  PRIO_SOFTVTE   0x07
#define  PRIO_SOFTCLOCK 0x08
#define  PRIO_FDC       0x09                    /* floppy low-priority */
#define  PRIO_SOFTNET   0x0c
#define  PRIO_I2C       0x0f                    /* for i2c i/o activities */
#define  PRIO_ET        0x10
#define  PRIO_4         0x14
#define  PRIO_5         0x15
#define  PRIO_BIO       0x15
#define  PRIO_TTY       0x15
#define  PRIO_SCSI      PRIO_BIO
#define  PRIO_WINC      PRIO_BIO
#define  PRIO_CENT      PRIO_TTY
#define  PRIO_SOUND     0x15
#define  PRIO_6         0x16
#define  PRIO_IMP       0x16                    /* ? */
#define  PRIO_VFLY      0x16
#define  PRIO_7         0x17
#define  PRIO_HITTY     0x17
#define  PRIO_CLOCK     0x18
#define  PRIO_HIGH      0x1F                    /* maximum priority */
#define  MAX_SPL        0x1F                    /* defined maximum */

#endif 

/* EOF int_hndlr.h */
