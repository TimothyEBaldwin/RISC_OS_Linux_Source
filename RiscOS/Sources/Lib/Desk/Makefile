# Makefile for shared-source RISC OS variant of Desk library
#

COMPONENT   = Desk
LIBRARYZM   = ${LIBRARY}_M
HDRS        = \
        BackTrace \
        Clear \
        ColourMenu \
        ColourTran \
        Coord \
        Core \
        Debug \
        DeskMem \
        Dialog \
        Dialog2 \
        Dispatch \
        Drag \
        DragASpr \
        DynamArea \
        Error \
        Error2 \
        Error3 \
        Event \
        EventMsg \
        Export \
        File \
        Filing \
        Filter \
        Font \
        Font2 \
        GFX \
        Handler \
        Hourglass \
        Icon \
        Import \
        Import2 \
        Jump \
        JumpRaw \
        Kbd \
        KernelSWIs \
        KeyCodes \
        LinkList \
        Mem \
        Menu \
        Menu2 \
        Module \
        Msgs \
        MsgTrans \
        OSBuffer \
        Pane \
        Pane2 \
        PDriver \
        Platform \
        Pointer \
        PopUp \
        Print \
        Ptr \
        Resource \
        Save \
        Save2 \
        Screen \
        Serial \
        Slider \
        Sound \
        Sprite \
        Str \
        StringCR \
        SWI \
        TaskWindow \
        Template \
        TextFile \
        Time \
        Validation \
        WAssert \
        Wimp \
        WimpSWIs \
        Window \

CUSTOMLIB   = custom
CUSTOMLIBZM = custom
EXPDIR      = ${LIBDIR}.${TARGET}

# Define the export-header rule before we include
# Makefiles:CLibrary so that we take precedence
VPATH       = !Desk.Desk
.SUFFIXES:  .exphdr
.h.exphdr:; ${CP} $< ${EXPDIR}.h.$* ${CPFLAGS}

include StdTools
include StdRules
include CLibrary

${LIBEXT}.${LIBRARY}: !Desk.o.Normal
        ${CP} !Desk.o.Normal $@ ${CPFLAGS}
        BASIC -quit Patch325 $@

${LIBEXT}.${LIBRARYZM}: !Desk.o.Normalzm
        ${CP} !Desk.o.Normalzm $@ ${CPFLAGS}
        BASIC -quit Patch325 $@

install: export_libs
        ${MKDIR} ${INSTDIR}
        ${CP} ${EXPDIR} ${INSTDIR}.${COMPONENT} ${CPFLAGS}
        @${ECHO} ${COMPONENT}: install complete

# Dynamic dependencies:
