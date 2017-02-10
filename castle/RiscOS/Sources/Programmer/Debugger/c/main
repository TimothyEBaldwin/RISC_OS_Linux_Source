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
#include "dis2.h"

/* main() function for the standalone version of the C disassembler */

static const char *conds_cscc[16] = {"EQ","NE","CS","CC","MI","PL","VS","VC","HI","LS","GE","LT","GT","LE","","NV"};

static const char *conds_hslo[16] = {"EQ","NE","HS","LO","MI","PL","VS","VC","HI","LS","GE","LT","GT","LE","","NV"};

static dis_options options_debugger =
{
	{ "R0", "R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "PC" },
	conds_cscc,
	0xffff, // reggroups
	~0 - (1<<FPA), // warnversions
	false, // ual
	true, // vfpual
	false, // dci
	true, // bashex
	false, //true, // nonstandard_undefined - should be true, but leave at false for testbed
	false, // allhex
	false, // swihash
	false, // positionind
	{ 8, 27 }, // column widths
	SWIMODE_NAME, // swimode
	LFMSFM_FORM1, // lfmsfmmode
	';' // comment char
};

static dis_options options_decaof =
{
	{ "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "pc" },
	conds_cscc,
	0xffff, // reggroups
	0, // warnversions
	false, // ual
	false, // vfpual
	true, // dci
	false, // bashex
	false, // nonstandard_undefined
	true, // allhex
	false, // swihash
	false, // positionind
	{ 9, 9 }, // column widths
	SWIMODE_NAME, // swimode
	LFMSFM_FORM1, // lfmsfmmode
	';' // comment char
};

static dis_options options_decaof_ual =
{
	{ "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "sp", "lr", "pc" },
	conds_cscc,
	0xffff, // reggroups
	0, // warnversions
	true, // ual
	true, // vfpual
	true, // dci
	false, // bashex
	false, // nonstandard_undefined
	true, // allhex
	true, // swihash
	false, // positionind
	{ 9, 9 }, // column widths
	SWIMODE_NAME, // swimode
	LFMSFM_FORM1, // lfmsfmmode
	';' // comment char
};

int main(int argc,char **argv)
{
	if(argc != 4)
	{
		fprintf(stderr,"Usage: dis2 <file> <addr> [-debugger|-decaof|-decaofual]\n");
		exit(EXIT_FAILURE);
	}
	FILE *f = fopen(argv[1],"rb");
	if(!f)
	{
		fprintf(stderr,"Couldn't open '%s'\n",argv[1]);
		exit(EXIT_FAILURE);
	}
	fseek(f,0,SEEK_END);
	uint32_t len = ((uint32_t) ftell(f)) & ~3;
	uint32_t *prog = (uint32_t *) malloc(len);
	fseek(f,0,SEEK_SET);
	fread(prog,len,1,f);
	fclose(f);
	uint32_t addr;
	if(sscanf(argv[2],"0x%x",&addr) != 1)
		addr = atoi(argv[2]);
	bool debugger = false;
	dis_options *opt;
	if(!strcmp(argv[3],"-debugger"))
	{
		opt = &options_debugger;
		debugger = true;
	}
	else if(!strcmp(argv[3],"-decaof"))
	{
		opt = &options_decaof;
	}
	else if(!strcmp(argv[3],"-decaofual"))
	{
		opt = &options_decaof_ual;
	}
	else
	{
		fprintf(stderr,"Unknown disassembly format '%s'\n",argv[3]);
		exit(EXIT_FAILURE);
	}
	while(len)
	{
		char buf[1024];
		uint32_t instr = *prog;
		arm_engine(instr,addr,opt,buf,sizeof(buf));
		if(debugger)
			printf("%08X : %c%c%c%c : %08X : %s\n",addr,(disprint(instr&0xff)?instr:'.'),(disprint((instr>>8)&0xff)?instr>>8:'.'),(disprint((instr>>16)&0xff)?instr>>16:'.'),(disprint(instr>>24)?instr>>24:'.'),instr,buf);
		else
			printf("  0x%06x:  %08x  %c%c%c%c : %s\n",addr,instr,(isprint(instr&0xff)?instr:'.'),(isprint((instr>>8)&0xff)?instr>>8:'.'),(isprint((instr>>16)&0xff)?instr>>16:'.'),(isprint(instr>>24)?instr>>24:'.'),buf);
		prog++;
		addr+=4;
		len-=4;
	}
	return 0;
}
