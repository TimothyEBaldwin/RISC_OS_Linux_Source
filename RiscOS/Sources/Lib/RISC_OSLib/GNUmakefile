# The common alternative way of invoking this makefile, from ROM builds, is with
# COMPONENT=SharedRISC_OSLib TARGET=RISC_OSLib
#
# This component is just too weird to try to use the CLibrary shared makefile

COMPONENT ?= SharedCLibrary
TARGET    ?= CLib

LIBDIR     = ${BUILDDIR}/Export/${APCS}/Lib
CLIBDIR    = ${LIBDIR}/CLib
RLIBDIR    = ${LIBDIR}/RISC_OSLib

ASMHDRS    = SharedCLib
ifeq (${APCS},Host)
# Yes, some cross-compilation components use kernel definitions even for host tools
CLIBHDRS   = kernel
else
CLIBHDRS   = assert complex ctype errno fenv float inttypes iso646 kernel limits locale math setjmp signal stdarg stdbool stddef stdint stdio stdlib string swis tgmath time varargs wchar wctype
RLIBHDRS   = akbd alarm baricon bbc colourmenu colourpick colourtran coords dbox dboxfile dboxquery dboxtcol dragasprit drawfdiag drawferror drawfobj drawftypes drawmod event fileicon flex font fontlist fontselect heap help jpeg magnify menu msgs msgtrans os pointer print res resspr saveas sprite template trace txt txtedit txtopt txtscrap txtwin typdat visdelay werr wimp wimpt win xferrecv xfersend
CLIBEXPLIBS = ansilib ansilibm stubs
RLIBEXPLIBS = risc_oslib riscoslibm rstubs romstubs romcstubs
endif

EXPORTING_ASMHDRS  = $(addsuffix .expasm,${ASMHDRS})
EXPORTING_CLIBHDRS = $(addsuffix .expclibhdr,${CLIBHDRS})
EXPORTING_RLIBHDRS = $(addsuffix .exprlibhdr,${RLIBHDRS})
EXPORTING_CLIBLIBS = $(addsuffix .expcliblib,${CLIBEXPLIBS})
EXPORTING_RLIBLIBS = $(addsuffix .exprliblib,${RLIBEXPLIBS})
EXPORTING_MODWRAP  = modulewrap.exps
TARGET_LIBS        = $(addsuffix .a,${CLIBEXPLIBS}) $(addsuffix .a,${RLIBEXPLIBS})

CLIB_COMMON_OBJS   = alloc armsys complex ctype cxsupport error fenv fpprintf locale longlong math mathasm mathl memcpset printf scanf signal sort stdio stdlib string swiv time
CLIB_STATIC_OBJS   = ${CLIB_COMMON_OBJS} armprof overmgr
CLIB_SHARED_OBJS   = ${CLIB_COMMON_OBJS} cl_spare
RLIB_COMMON_OBJS   = akbd alarm baricon bastxt bbc colourmenu colourtran dbox dboxfile dboxquery dboxtcol dragasprit drawfobj drawmod event fileicon flex font heap help jpeg magnify menu msgs os pointer poll print res resspr saveas sprite swi template txt txt1 txt3 txtar txtedit txtfile txtfind txtmisc txtopt txtoptmenu txtregexp txtscrap txtundo txtwin visdelay werr wimp wimpt win xferrecv xfersend
RLIB_STATIC_OBJS   = ${RLIB_COMMON_OBJS} coords drawcheck drawfdiag drawfiles drawtextc fontlist fontselect trace
RLIB_SHARED_OBJS   = ${RLIB_COMMON_OBJS} rl_spare

ANSILIB_OBJS       =               clib.o   kernel.o   $(addsuffix .o,      ${CLIB_STATIC_OBJS})
ANSILIBM_OBJS      = cl_stub_m.m_o clib.m_o kernel.m_o $(addsuffix .m_o,    ${CLIB_STATIC_OBJS})
RISCOSLIB_OBJS     =                                   $(addsuffix .o_rl,   ${RLIB_STATIC_OBJS})
RISCOSLIBM_OBJS    =                                   $(addsuffix .m_o_rl, ${RLIB_STATIC_OBJS})
SHAREDCLIB_OBJS    = cl_rmhdr.rm_o initmodule.o       k_modbody.rm_o cl_modbody.rm_o                    $(addsuffix .rm_o, ${CLIB_SHARED_OBJS})
ROMSHAREDCLIB_OBJS = cl_rmhdr.rm_o initmodule.rm_o    k_modbody.rm_o cl_modbody.rm_o                    $(addsuffix .rm_o, ${CLIB_SHARED_OBJS})
ROMSHAREDRLIB_OBJS = cl_rmhdr.rm_o initmodule.rm_o_rl k_modbody.rm_o cl_modbody.rm_o rl_modbody.rm_o_rl $(addsuffix .rm_o, ${CLIB_SHARED_OBJS}) $(addsuffix .rm_o_rl, ${RLIB_SHARED_OBJS})
STUBS_OBJS         = cl_stub_r.o        cl_stub2_r.o     k_stub2_r.o     mathl.o
ROMCSTUBS_OBJS     = cl_stub_rm.rm_o    cl_stub2_rm.rm_o k_stub2_rm.rm_o mathl.o
RSTUBS_OBJS        = rl_stub_r.o_rl     cl_stub2_r.o     k_stub2_r.o     mathl.o
ROMSTUBS_OBJS      = rl_stub_rm.rm_o_rl cl_stub2_rm.rm_o k_stub2_rm.rm_o mathl.o

SOURCES_TO_SYMLINK = \
  $(wildcard c/*)      $(wildcard h/*)                 $(wildcard s/*)        $(wildcard hdr/*) \
  $(wildcard clib/c/*) $(wildcard clib/h/*)            $(wildcard clib/s/*)                     \
                                                       $(wildcard kernel/s/*)                   \
  $(wildcard rlib/c/*) $(wildcard rlib/h/*)            $(wildcard rlib/s/*)                     \
                       $(wildcard rlib/DrawIntern/h/*)                                          \
                       $(wildcard rlib/EditIntern/h/*)                                          \
                       $(wildcard rlib/VerIntern/h/*)                                           \
  VersionNum VersionASM

ifneq (objs,$(notdir ${CURDIR}))

# Makefile invoked from same directory
# Create link farm, then execute the makefile from within it

ifeq (clean,${MAKECMDGOALS})
clean:
	@echo Cleaning...
	@rm -rf objs
	@echo ${COMPONENT}: cleaned
else
all_libs export export_hdrs export_libs install resources rom rom_link links:
	@mkdir -p objs
	@[ -d objs/clib ] || mkdir objs/clib
	@[ -d objs/kernel ] || mkdir objs/kernel
	@[ -d objs/rlib ] || mkdir objs/rlib
	@[ -d objs/rlib/DrawIntern ] || mkdir objs/rlib/DrawIntern
	@[ -d objs/rlib/EditIntern ] || mkdir objs/rlib/EditIntern
	@[ -d objs/rlib/VerIntern ] || mkdir objs/rlib/VerIntern
	@[ -L objs/clib/Resources ] || ln -s ../../clib/Resources objs/clib/Resources
	@[ -L objs/rlib/Resources ] || ln -s ../../rlib/Resources objs/rlib/Resources
	@[ -L objs/rlib/swi ] || ln -s ../../rlib/swi objs/rlib/swi
	$(foreach linksource,${SOURCES_TO_SYMLINK}, \
		$(shell \
			linkdest=`echo ${linksource} | sed -e 's,\([^/]*\)/\([^/]*\)$$,\2.\1,' -e 's,^,objs/,'`; \
			linkdestdir=`echo $$linkdest | sed -e 's,/[^/]*$$,,'`; \
			linkbackpath=`echo $$linkdestdir | sed -e 's,[^/]*,..,g'`; \
			[ -d ${linksource} ] || [ -L $$linkdest ] || mkdir -p $$linkdestdir; \
			[ -d ${linksource} ] || [ -L $$linkdest ] || ln -s $$linkbackpath/${linksource} $$linkdest; \
		 ) \
	)
ifneq (links,${MAKECMDGOALS})
	@${MAKE} -C objs -f ../$(firstword ${MAKEFILE_LIST}) ${MAKECMDGOALS}
endif
endif

else

# Makefile invoked from objs subdirectory

ifeq ("${INCLUDED_STDTOOLS}","")
include StdTools
endif

ifeq ("${INCLUDED_MODULELIBS}","")
include ModuleLibs
endif

XTENT   = ${PERL} ${TOOLSDIR}/Build/xtentries,102 >

ansilib.a:    ${ANSILIB_OBJS}
	${AR} ${ARFLAGS} $@ $^
ansilibm.a:   ${ANSILIBM_OBJS}
	${AR} ${ARFLAGS} $@ $^
stubs.a:      ${STUBS_OBJS}
	${AR} ${ARFLAGS} $@ $^
risc_oslib.a: ${RISCOSLIB_OBJS}
	${AR} ${ARFLAGS} $@ $^
riscoslibm.a: ${RISCOSLIBM_OBJS}
	${AR} ${ARFLAGS} $@ $^
rstubs.a:     ${RSTUBS_OBJS}
	${AR} ${ARFLAGS} $@ $^
romstubs.a:   ${ROMSTUBS_OBJS}
	${AR} ${ARFLAGS} $@ $^
romcstubs.a:  ${ROMCSTUBS_OBJS}
	${AR} ${ARFLAGS} $@ $^
clib${SUFFIX_MODULE}: ${SHAREDCLIB_OBJS}
	${LD} ${LDFLAGS} -o $@ -rmf $^
	${MODSQZ} $@
CLib.aof:             ${ROMSHAREDCLIB_OBJS}
	${LD} ${LDFLAGS} -o $@ -aof $^
RISC_OSLib.aof:       ${ROMSHAREDRLIB_OBJS}
	${LD} ${LDFLAGS} -o $@ -aof $^

CDEFINES     += -DDDE
ifeq (GNU,${TOOLCHAIN})
# Untested. Note in particular,
# * gcc doesn't have an analogue of -fk, which will probably cause trouble
# * gcc doesn't support PCC dialect
CINCLUDES    = -nostdinc -isystem ${LIBDIR}/CLib -isystem ${LIBDIR}/RISC_OSLib
CFLAGS       +=  ${C_NO_ZI}
else
CINCLUDES    = -j${LIBDIR}/CLib -j${LIBDIR}/RISC_OSLib
CFLAGS       += -fk ${C_NO_ZI}
endif

# Flags for RISCOS_Lib txt* sources, used for objects with _rl suffix
DFLAGS =\
 -DFIELDNUM\
 -DBIG_WINDOWS\
 -DSETOPTIONS\
 -DALLOW_OLD_PATTERNS\
 -DSET_MISC_OPTIONS

# ANSILib and stub flags ('L' variants), used for static objects without _rl suffix
CLFLAGS =\
 -DDEFAULT_TEXT

ASLFLAGS =\
 -PD "DEFAULT_TEXT SETL {TRUE}"

VLFLAGS =\
 -DLIB_SHARED="\"\""

# Shared C Library flags ('S' variants), used for shared objects
CSFLAGS =\
 -DSHARED_C_LIBRARY\
 -DUROM\
 ${SCL_APCS}

VSFLAGS =\
 -DLIB_SHARED="\"Shared \""

ASSFLAGS =\
 -PD "SHARED_C_LIBRARY SETL {TRUE}"\
 ${SCL_APCS}

UROM_DEFS =\
 -PD "UROM SETL {FALSE}"
UROM_ROM_DEFS =\
 -PD "UROM SETL {TRUE}"


VPATH = kernel clib rlib

.SUFFIXES: .hdr .expasm .expclibhdr .exprlibhdr .a .expcliblib .exprliblib .exps .o .m_o .rm_o .o_rl .m_o_rl .rm_o_rl

# $(call make-depend,source,object,depend,flags)
define make-depend
	${CC} ${CFLAGS} $4 -M $1 > $3 2> /dev/null
	${SED} -i -e 's,$(basename $2).o *:,$2:,' $3
endef

.hdr.expasm:;	${CP} $< ${LIBDIR}/../Hdr/Interface/$* ${CPFLAGS}
.h.expclibhdr:;	${CP} $< ${CLIBDIR} ${CPFLAGS}
.h.exprlibhdr:;	${CP} $< ${RLIBDIR} ${CPFLAGS}
.a.expcliblib:;	${CP} $< ${CLIBDIR} ${CPFLAGS}
.a.exprliblib:;	${CP} $< ${RLIBDIR} ${CPFLAGS}
.s.exps:;	${CP} $< ${RLIBDIR} ${CPFLAGS}


.c.o:
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${CLFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .o,.d,$@),${CLFLAGS})
armprof.o: armprof.c
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${CLFLAGS} ${VLFLAGS} -pcc -o $@ $<
	$(call make-depend,$<,$@,$(subst .o,.d,$@),${CLFLAGS} ${VLFLAGS} -pcc)
armsys.o: armsys.c
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${CLFLAGS} ${VLFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .o,.d,$@),${CLFLAGS} ${VLFLAGS})
string.o: string.c
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${CLFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET -o $@ $<
	$(call make-depend,$<,$@,$(subst .o,.d,$@),${CLFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET)

.c.m_o:
	${CC} ${CFLAGS} ${C_MODULE} ${CLFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o,.m_d,$@),${CLFLAGS})
armprof.m_o: armprof.c
	${CC} ${CFLAGS} ${C_MODULE} ${CLFLAGS} ${VLFLAGS} -pcc -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o,.m_d,$@),${CLFLAGS} ${VLFLAGS} -pcc)
armsys.m_o: armsys.c
	${CC} ${CFLAGS} ${C_MODULE} ${CLFLAGS} ${VLFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o,.m_d,$@),${CLFLAGS} ${VLFLAGS})
string.m_o: string.c
	${CC} ${CFLAGS} ${C_MODULE} ${CLFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o,.m_d,$@),${CLFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET)

.c.rm_o:
	${CC} ${CFLAGS} -zm1 ${CSFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .rm_o,.rm_d,$@),${CSFLAGS})
armsys.rm_o: armsys.c
	${CC} ${CFLAGS} -zm1 ${CSFLAGS} ${VSFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .rm_o,.rm_d,$@),${CSFLAGS} ${VSFLAGS})
string.rm_o: string.c
	${CC} ${CFLAGS} -zm1 ${CSFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET -o $@ $<
	$(call make-depend,$<,$@,$(subst .rm_o,.rm_d,$@),${CSFLAGS} -DSEPARATE_MEMCPY -DSEPARATE_MEMSET)

.s.o:
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .o,.d,$@) -o $@ $<
clib.o: clib/cl_obj_r.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .o,.d,$@) -o $@ $<
initmodule.o: clib/initmod_r.s
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .o,.d,$@) -o $@ $<
kernel.o: kernel/k_obj_r.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .o,.d,$@) -o $@ $<

.s.m_o:
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .m_o,.m_d,$@) -pd "zM SETL {TRUE}" -o $@ $<
clib.m_o: clib/cl_obj_m.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .m_o,.m_d,$@) -pd "zM SETL {TRUE}" -o $@ $<
kernel.m_o: kernel/k_obj_m.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .m_o,.m_d,$@) -pd "zM SETL {TRUE}" -o $@ $<

.s.rm_o:
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
cl_modbody.rm_o: clib/cl_mod_r.s
	${AS} ${ASFLAGS} ${ASSFLAGS} ${UROM_ROM_DEFS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
cl_stub2_rm.rm_o: clib/cl_stub2_rm.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
initmodule.rm_o: clib/initmod_rm.s
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
k_modbody.rm_o: kernel/k_mod_r.s
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
k_stub2_rm.rm_o: kernel/k_stub2_rm.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .rm_o,.rm_d,$@) -pd "zm1 SETL {TRUE}" -o $@ $<


.c.o_rl:
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${DFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .o_rl,.d_rl,$@),${DFLAGS})
trace.o_rl: rlib/trace.c
	${CC} $(filter-out ${C_NO_FNAMES},${CFLAGS}) ${DFLAGS} -DTRACE -o $@ $<
	$(call make-depend,$<,$@,$(subst .o_rl,.d_rl,$@),${DFLAGS} -DTRACE)

.c.m_o_rl:
	${CC} ${CFLAGS} ${C_MODULE} ${DFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o_rl,.m_d_rl,$@),${DFLAGS})
trace.m_o_rl: rlib/trace.c
	${CC} ${CFLAGS} ${C_MODULE} ${DFLAGS} -DTRACE -o $@ $<
	$(call make-depend,$<,$@,$(subst .m_o_rl,.m_d_rl,$@),${DFLAGS} -DTRACE)

.c.rm_o_rl:
	${CC} ${CFLAGS} -zm1 ${DFLAGS} ${CSFLAGS} -o $@ $<
	$(call make-depend,$<,$@,$(subst .rm_o_rl,.rm_d_rl,$@),${DFLAGS} ${CSFLAGS})

.s.o_rl:
	${AS} ${ASFLAGS} -depend $(subst .o_rl,.d_rl,$@) -o $@ $<
poll.o_rl: rlib/poll.s
	${AS} ${ASFLAGS} ${UROM_DEFS} -depend $(subst .o_rl,.d_rl,$@) -o $@ $<
rl_stub_r.o_rl: rlib/rl_stub_r.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .o_rl,.d_rl,$@) -o $@ $<
swi.o_rl: rlib/swi.s
	${AS} ${ASFLAGS} ${UROM_DEFS} -depend $(subst .o_rl,.d_rl,$@) -o $@ $<

.s.m_o_rl:
	${AS} ${ASFLAGS} -depend $(subst .m_o_rl,.m_d_rl,$@) -pd "zM SETL {TRUE}" -o $@ $<
poll.m_o_rl: rlib/poll.s
	${AS} ${ASFLAGS} ${UROM_DEFS} -depend $(subst .m_o_rl,.m_d_rl,$@) -pd "zM SETL {TRUE}" -o $@ $<
swi.m_o_rl: rlib/swi.s
	${AS} ${ASFLAGS} ${UROM_DEFS} -depend $(subst .m_o_rl,.m_d_rl,$@) -pd "zM SETL {TRUE}" -o $@ $<

.s.rm_o_rl:
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
initmodule.rm_o_rl: rlib/initmod_r.s
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
poll.rm_o_rl: rlib/poll.s
	${AS} ${ASFLAGS} ${UROM_ROM_DEFS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
rl_modbody.rm_o_rl: rlib/rl_mod_r.s
	${AS} ${ASFLAGS} ${ASSFLAGS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
rl_stub_rm.rm_o_rl: rlib/rl_stub_rm.s
	${AS} ${ASFLAGS} ${ASLFLAGS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<
swi.rm_o_rl: rlib/swi.s
	${AS} ${ASFLAGS} ${UROM_ROM_DEFS} -depend $(subst .rm_o_rl,.rm_d_rl,$@) -pd "zm1 SETL {TRUE}" -o $@ $<


SWIHDRS = ADFS ATAPI ATA BlendTable Buffer CDROM CDFS ColourPick ColourTran DDT Debugger DeviceFS DMA DOSFS DragASprit DragAnObj Draw Econet FileCore FilerAct Filter Font FPEmulator Free Freeway FSLock Hourglass HostFS IIC ITable Joystick SprExtend MakePSFont MsgTrans RISCOS Parallel PCI PDriver PDumper Podule Portable RAMFS RemotePrin ResourceFS RTC ScrBlank ScrModes SCSI SCSIFS SDFS SDIO SharedCLib Shell Sound Squash Super Switcher TaskWindow Territory VCHIQ Wimp ZLib

swis.h: swisheader.h makehswis.s
	@echo \; Automatically generated file > swioptions.s
	@-for h in ${SWIHDRS}; do test -e ${LIBDIR}/../Hdr/Interface/$$h && echo \ GET $$h >> swioptions.s; done
	@echo \ END >> swioptions.s
	${AS} ${ASFLAGS} makehswis.s -o swis.o
	${LDBIN} $@ swis.o

# The swis.h header is only copied if the file differs from an existing
# exported header.  This prevents needless recompilations
swis.expclibhdr: swis.h
	@diff $< ${CLIBDIR}/swis.h > /dev/null || ${CP} $< ${CLIBDIR} ${CPFLAGS}


all_libs: ${TARGET_LIBS}
	@${ECHO} ${COMPONENT}: library built

${DIRS} ::
	${TOUCH} $@

export: export_${PHASE}
	${NOP}

export_: export_libs export_hdrs
	${NOP}

create_exp_hdr_dirs:
	${MKDIR} ${LIBDIR}/../Hdr/Interface
	${MKDIR} ${CLIBDIR}
	${MKDIR} ${RLIBDIR}

create_exp_lib_dirs:
	${MKDIR} ${CLIBDIR}
	${MKDIR} ${RLIBDIR}

# We are a bit unusual in that most headers aren't exported until the export_libs phase
export_hdrs: create_exp_hdr_dirs ${DIRS} ${EXPORTING_ASMHDRS}
	${CP} ../VersionNum ${CLIBDIR}/LibVersion ${CPFLAGS}
	${CP} ../VersionNum ${RLIBDIR}/LibVersion ${CPFLAGS}
	@${ECHO} ${COMPONENT}: header export complete

export_libs: create_exp_lib_dirs ${DIRS} ${EXPORTING_CLIBHDRS} ${EXPORTING_RLIBHDRS} ${EXPORTING_MODWRAP} ${EXPORTING_CLIBLIBS} ${EXPORTING_RLIBLIBS}
	${CP} ../VersionNum ${CLIBDIR}/LibVersion ${CPFLAGS}
	${CP} ../VersionNum ${RLIBDIR}/LibVersion ${CPFLAGS}
	@${ECHO} ${COMPONENT}: library export complete

install-: clib${SUFFIX_MODULE}
	${MKDIR} ${INSTDIR}
	${CP} $^ ${INSTDIR}/${TARGET}${SUFFIX_MODULE}
	@${ECHO} ${COMPONENT}: ram module installed

install-libraries: ansilib.a ansilibm.a overmgr.o stubs.a risc_oslib.a riscoslibm.a
	${MKDIR} ${INSTDIR}/CLib ${INSTDIR}/RISC_OSLib
	${CP}    clib/*.h ansilib.a ansilibm.a overmgr.o stubs.a ${INSTDIR}/CLib
	${CP}    rlib/*.h modulewrap.s risc_oslib.a riscoslibm.a ${INSTDIR}/RISC_OSLib
	@echo ${COMPONENT}: libraries installed

install: install-${INSTTYPE}

resources:
	${MKDIR} ${RESDIR}/CLib
	${INSTRES} -I clib.Resources.${LOCALE}.${SYSTEM},clib.Resources.${LOCALE} ${RESDIR}/CLib Messages
	${MKDIR} ${RESDIR}/RISC_OSLib
	${INSTRES} -I rlib.Resources.${LOCALE}.${SYSTEM},rlib.Resources.${LOCALE} ${RESDIR}/RISC_OSLib Messages
	@${ECHO} ${COMPONENT}: resources copied to Messages module

rom: ${TARGET}.aof

rom_link_Entries:
	${XTENT} C_Entries.syms kernel/k_entries.s kernel/k_entries2.s clib/cl_entries.s clib/cl_entry2.s
	cat rlib/swi >> C_Entries.syms
	${XTENT} A_Entries1.syms kernel/k_entries.s clib/cl_entries.s
	egrep -v "^(0x00000000 . )?_swix?$$" < A_Entries1.syms > A_Entries.syms
	${RM} A_Entries1.syms

rom_link_CLib: rom_link_Entries ${ROMSHAREDCLIB_OBJS}
	${XTENT} Entries.syms kernel/k_entries.s kernel/k_entries2.s clib/cl_entries.s clib/cl_entry2.s
	cat rlib/swi >> Entries.syms
	${LD} ${LDFLAGS} -o CLib.linked ${ROMSHAREDCLIB_OBJS} \
              -symdefs C_Entries.syms \
              -symdefs A_Entries.syms \
              -symdefs Entries.syms \
              -symbols ${TARGET}_sym.linked \
              -bin -base ${ADDRESS} \
              -map > ${TARGET}.map

rom_link_RISC_OSLib: rom_link_Entries ${ROMSHAREDRLIB_OBJS}
	${XTENT} Entries.syms kernel/k_entries.s kernel/k_entries2.s clib/cl_entries.s clib/cl_entry2.s rlib/rl_entries.s
	cat rlib/swi >> Entries.syms
	${LD} ${LDFLAGS} -o RISC_OSLib.linked ${ROMSHAREDRLIB_OBJS} \
              -symdefs C_Entries.syms \
              -symdefs A_Entries.syms \
              -symdefs Entries.syms \
              -symbols ${TARGET}_sym.linked \
              -bin -base ${ADDRESS} \
              -map > ${TARGET}.map

rom_link: rom_link_${TARGET}
	${MKDIR} ${LINKDIR}
	${CP} ${TARGET}.linked ${LINKDIR}/${TARGET}
	${CP} ${TARGET}_sym.linked ${LINKDIR}/${TARGET}_sym
	${CP} Entries.syms ${ABSSYM}
	${CP} C_Entries.syms ${C_ABSSYM}
	${CP} A_Entries.syms ${A_ABSSYM}
	@${ECHO} ${COMPONENT}: rom_link complete

include $(wildcard *.d)
include $(wildcard *.m_d)
include $(wildcard *.rm_d)
include $(wildcard *.d_rl)
include $(wildcard *.m_d_rl)
include $(wildcard *.rm_d_rl)

endif
