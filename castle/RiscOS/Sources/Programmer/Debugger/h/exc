/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
#ifndef EXC_H
#define EXC_H

#include <stdint.h>
#include <stdbool.h>
#include "dis2.h"

/* To avoid dynamic memory allocation we use a line buffer to collect annotations before they are output
   The buffer acts as a sliding window, storing the annotations for a contiguous range of memory
   The buffer is flushed in a lazy manner; we only emit entries once we need to add an annotation for an address which is outside the current window
   This allows us to go back and add annotations up to LINEBUFFER_SIZE lines in the past (required for e.g. STM decoding) */
#define LINEBUFFER_SIZE 32 /* 16 in an APCS frame plus 10 for a _kernel_swi_regs. But round up to power of 2 for simplicity. N.B. 32 is max due to use of bitflags */
#define LINEBUFFER_COLUMNS 4 /* If we find some overlapping stack frames (e.g. from stale data on the stack) we output them in separate columns */
#define LINEBUFFER_COLWIDTH 40

typedef struct {
	uint32_t val;
	bool ok;
} excresult;

typedef enum {
	/* Messages used in annotations */
	EXC_MSG_NONE = 0,
	EXC_MSG_SWI,
	EXC_MSG_MAYBEPSR,
	EXC_MSG_R14_DESC,
	EXC_MSG_REGNO,
	EXC_MSG_IRQSEMA,
	EXC_MSG_PSR,
	EXC_MSG_ASMCALL,
	EXC_MSG_RETURN_2DESC,
	EXC_MSG_APCS,
	EXC_MSG_CMHG_R0,
	EXC_MSG_CMHG_RN,
	EXC_MSG_CMHG_R9,
	EXC_MSG_RETURN_1DESC,
	EXC_MSG_APCS_BROKEN,

	/* Other messages */
	EXC_MSG_UNKNOWN,
	EXC_MSG_OUT_OF_ANNOT,
	EXC_MSG_DUMP_CORRUPT,
	EXC_MSG_BLOCK_MEM,
	EXC_MSG_BLOCK_OSRSI6,
	EXC_MSG_BLOCK_ERROR,
	EXC_MSG_BLOCK_OSMEM16,
	EXC_MSG_IRQ_STACK,
	EXC_MSG_SVC_STACK,
	EXC_MSG_USR_STACK,
	EXC_MSG_END,
	EXC_MSG_CALLTO,
	EXC_MSG_ABT_STACK,
	EXC_MSG_UND_STACK,
} exc_msg;

/* This represents a single annotation block/column (e.g. decoded stack frame) */
typedef struct exc_annotation_block {
	uint8_t msgs[LINEBUFFER_SIZE]; /* Message type/number to display for the line */
	uint32_t addrs[LINEBUFFER_SIZE][2]; /* Two addresses (or other values, e.g. SWI numbers) to display for the line */
	uint32_t next_fp; /* Next FP value in an APCS stack frame chain - allows all frames within a chain to use the same column */
	uint32_t min,max; /* Min/max address range of current (or last) block */
	uint32_t lineflags; /* Each bit corresponds to a line in the buffer; bit is set if it's the middle of an annotation, clear if it's the start */
} exc_annotation_block_t;

typedef struct exc_context {
	uint32_t lineaddr; /* The address of the first line in the buffer */
	uint8_t line; /* The index of the first line in the buffer (it's a circular buffer) */
	exc_annotation_block_t annotations[LINEBUFFER_COLUMNS];

	const uint32_t *buffer; /* The buffer containing the dump blocks */
	size_t bufferlen;
#ifndef MODULE
	const uint32_t *rom;
	size_t romlen;
#endif

	void (*print)(void *param, const char *str);
	void *print_param;
} exc_context_t;

typedef struct {
	const uint32_t *symbols;
	uint32_t romaddr;
} romsymtable;

extern __value_in_regs excresult ExcPeekMem2(exc_context_t *ctx, uint32_t addr);
extern const char *ExcGetMsg(exc_context_t *ctx, exc_msg msg);
extern void ExcDescribeAddr(exc_context_t *ctx, uint32_t addr, char *buf, size_t len);
extern __value_in_regs romsymtable ExcGetROMSymbols(void);

#endif
