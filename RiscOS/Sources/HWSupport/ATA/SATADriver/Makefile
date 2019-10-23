# Makefile for SATA driver

COMPONENT   = SATADriver
ASMHDRS     = ATA AHCIDevice
ASMCHDRS    = ATA AHCIDevice
HDRS        =
CMHGDEPENDS = device module
OBJS        = coroutine command device fgopcb globals module message op swi trampoline util
LIBS        = ${SYNCLIB}
ROMCDEFINES = -DROM_MODULE

# Enable one of the following groups, depending on what sort of debug you want

#CFLAGS     += -DDEBUG_ENABLED

#CFLAGS     += -DDEBUG_ENABLED -DDEBUGLIB -DDEBUGLIB_NOBRACKETS
#LIBS       += ${DEBUGLIBS} ${NET5LIBS}

# Decide whether to use OS_Memory 0 or OS_Memory 19 for DMA prep
OSMEM19 ?= TRUE

ifeq ($(OSMEM19),TRUE)
CFLAGS += -DOSMEM19
CMHGFLAGS += -DOSMEM19
OBJS += osmem19
CMHGDEPENDS += osmem19
else
OBJS += osmem0
endif

include CModule

expasmc.AHCIDevice: hdr.AHCIDevice h.AHCIDevice
	${HDR2H} hdr.AHCIDevice ${C_EXP_HDR}.AHCIDevice
	FAppend ${C_EXP_HDR}.AHCIDevice h.AHCIDevice ${C_EXP_HDR}.AHCIDevice

# Dynamic dependencies:
