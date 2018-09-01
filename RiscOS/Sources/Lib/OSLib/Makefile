# Makefile for shared-source RISC OS variant of OSLib library
#

COMPONENT   = OSLib

HDRS_COMPUTER = \
        ADFS        \
        CD          \
        CDFS        \
        DeviceFS    \
        DOSFS       \
        Econet      \
        FileCore    \
        Filer       \
        FilerAction \
        FileSwitch  \
        Free        \
        Freeway     \
        FSLock      \
        Joystick    \
        NetFiler    \
        NetFS       \
        NetPrint    \
        NFS         \
        OSArgs      \
        OSFile      \
        OSFind      \
        OSFSControl \
        OSGBPB      \
        OSSerialOp  \
        Parallel    \
        PipeFS      \
        RAMFS       \
        ResourceFS  \
        SCSI        \
        SCSIFS      \
        ShareFS     \
        Socket      \

HDRS_CORE = \
        Buffer               \
        Cache                \
        ColourTrans          \
        Debugger             \
        DMA                  \
        FPEmulator           \
        IIC                  \
        macros               \
        MessageTrans         \
        OS                   \
        OSByte               \
        OSHeap               \
        OSModule             \
        OSReadSysInfo        \
        OSSpriteOp           \
        OSWord               \
        Podule               \
        Portable             \
        ScreenBlanker        \
        ScreenModes          \
        ServiceInternational \
        SharedCLibrary       \
        Shell                \
        Sound                \
        Squash               \
        Territory            \

HDRS_TOOLBOX = \
        ActionButton          \
        Adjuster              \
        Button                \
        ColourDbox            \
        ColourMenu            \
        DCS                   \
        DDEUtils              \
        DisplayField          \
        DragAnObject          \
        Draggable             \
        FileDbox              \
        FileInfo              \
        FontDbox              \
        FontMenu              \
        FrontEnd              \
        Gadget                \
        Iconbar               \
        KeyboardShortcut      \
        Label                 \
        LabelledBox           \
        Menu                  \
        NumberRange           \
        OptionButton          \
        PopUp                 \
        PrintDbox             \
        ProgInfo              \
        Quit                  \
        RadioButton           \
        ResEd                 \
        SaveAs                \
        Scale                 \
        Scrollbar             \
        ScrollList            \
        Slider                \
        StringSet             \
        TextArea              \
        TextGadgets           \
        ToolAction            \
        Toolbox               \
        Window                \
        WindowSupportExternal \
        WritableField         \

HDRS_TYPES = \
        types                \
        coltrans32           \
        devicefs32           \
        fileswch32           \
        osargs32             \
        oscore32             \
        osf32                \
        osfind32             \
        osfsctrl32           \
        osgbpb32             \
        pdriver32            \
        wimp32               \

HDRS_USER = \
        Alarm                \
        Arcweb               \
        BASICTrans           \
        ColourPicker         \
        CompressJPEG         \
        DragASprite          \
        Draw                 \
        DrawFile             \
        Filter               \
        Font                 \
        Help                 \
        Hourglass            \
        InetSuite            \
        JPEG                 \
        MakePSFont           \
        MimeMap              \
        OLE                  \
        PDriver              \
        PDumper              \
        PlugIn               \
        RemotePrinterSupport \
        StrongHelp           \
        Super                \
        TaskManager          \
        TaskWindow           \
        URI                  \
        URL                  \
        Wimp                 \
        WimpExtend           \
        WimpReadSysInfo      \
        WimpSpriteOp         \

include StdTools
include StdRules

LIBDIR        = <Lib$Dir>

TARGET       ?= ${COMPONENT}
LIBRARY      ?= ${TARGET}
LIBRARIES    ?= ${LIBRARY}
LIBEXT       ?= o
EXPDIR       ?= ${LIBDIR}.${TARGET}

EXPORTING_HDRS_COMPUTER    = $(addprefix exphdrcom.,${HDRS_COMPUTER})
EXPORTING_ASMHDRS_COMPUTER = $(addprefix expasmcom.,${HDRS_COMPUTER})
EXPORTING_HDRS_CORE        = $(addprefix exphdrcor.,${HDRS_CORE})
EXPORTING_ASMHDRS_CORE     = $(addprefix expasmcor.,${HDRS_CORE})
EXPORTING_HDRS_TOOLBOX     = $(addprefix exphdrtbx.,${HDRS_TOOLBOX})
EXPORTING_ASMHDRS_TOOLBOX  = $(addprefix expasmtbx.,${HDRS_TOOLBOX})
EXPORTING_HDRS_TYPES       = $(addprefix exphdrtyp.,${HDRS_TYPES})
EXPORTING_ASMHDRS_TYPES    = $(addprefix expasmtyp.,${HDRS_TYPES})
EXPORTING_HDRS_USER        = $(addprefix exphdrusr.,${HDRS_USER})
EXPORTING_ASMHDRS_USER     = $(addprefix expasmusr.,${HDRS_USER})
EXPORTING_HDRS             = ${EXPORTING_ASMHDRS_USER} \
                             ${EXPORTING_HDRS_USER} \
                             ${EXPORTING_ASMHDRS_TYPES} \
                             ${EXPORTING_HDRS_TYPES} \
                             ${EXPORTING_ASMHDRS_TOOLBOX} \
                             ${EXPORTING_HDRS_TOOLBOX} \
                             ${EXPORTING_ASMHDRS_CORE} \
                             ${EXPORTING_HDRS_CORE} \
                             ${EXPORTING_ASMHDRS_COMPUTER} \
                             ${EXPORTING_HDRS_COMPUTER} \
                             
EXPORTING_LIBS             = $(addprefix explib.,${LIBRARIES})
TARGET_LIBS                = $(addprefix ${LIBEXT}.,${TARGET})

all_libs: ${TARGET_LIBS}
        @${ECHO} ${COMPONENT}: library built

clean:
        @${ECHO} ${COMPONENT}: cleaned

export: export_${PHASE}
        ${NOP}

export_: export_libs export_hdrs
        ${NOP}

create_exp_hdr_dirs:
        ${MKDIR} ${EXPDIR}.Computer.oslib.h
        ${MKDIR} ${EXPDIR}.Computer.oslib.Hdr
        ${MKDIR} ${EXPDIR}.Core.oslib.h
        ${MKDIR} ${EXPDIR}.Core.oslib.Hdr
        ${MKDIR} ${EXPDIR}.Docs
        ${MKDIR} ${EXPDIR}.Toolbox.oslib.h
        ${MKDIR} ${EXPDIR}.Toolbox.oslib.Hdr
        ${MKDIR} ${EXPDIR}.User.oslib.h
        ${MKDIR} ${EXPDIR}.User.oslib.Hdr

create_exp_lib_dir:
        ${MKDIR} ${EXPDIR}.${LIBEXT}

VPATH       = Dist.OSLib Dist.OSLib.Computer.oslib Dist.OSLib.Core.oslib Dist.OSLib.Macros.oslib Dist.OSLib.Toolbox.oslib Dist.OSLib.Types.oslib Dist.OSLib.User.oslib
.SUFFIXES:  .exphdrcom .expasmcom .exphdrcor .expasmcor .exphdrtbx .expasmtbx .exphdrtyp .expasmtyp .exphdrusr .expasmusr .explib .h .Hdr ${LIBEXT}
.h.exphdrcom:;   ${CP} $< ${EXPDIR}.Computer.oslib.h.$*   ${CPFLAGS}
.Hdr.expasmcom:; ${CP} $< ${EXPDIR}.Computer.oslib.Hdr.$* ${CPFLAGS}
.h.exphdrcor:;   ${CP} $< ${EXPDIR}.Core.oslib.h.$*       ${CPFLAGS}
.Hdr.expasmcor:; ${CP} $< ${EXPDIR}.Core.oslib.Hdr.$*     ${CPFLAGS}
.h.exphdrtbx:;   ${CP} $< ${EXPDIR}.Toolbox.oslib.h.$*    ${CPFLAGS}
.Hdr.expasmtbx:; ${CP} $< ${EXPDIR}.Toolbox.oslib.Hdr.$*  ${CPFLAGS}
.h.exphdrtyp:;   ${CP} $< ${EXPDIR}.Core.oslib.h.$*       ${CPFLAGS}
.Hdr.expasmtyp:; ${CP} $< ${EXPDIR}.Core.oslib.Hdr.$*     ${CPFLAGS}
.h.exphdrusr:;   ${CP} $< ${EXPDIR}.User.oslib.h.$*       ${CPFLAGS}
.Hdr.expasmusr:; ${CP} $< ${EXPDIR}.User.oslib.Hdr.$*     ${CPFLAGS}
.${LIBEXT}.explib:; if "<APCS>"="APCS-R" then ${CP} $< ${EXPDIR}.o.$* ${CPFLAGS} else ${CP} $<32 ${EXPDIR}.o.$* ${CPFLAGS}

# These headers have moved directory
exphdrcor.macros: h.macros
        ${CP} Dist.OSLib.Macros.oslib.h.macros   ${EXPDIR}.Core.oslib.h.macros   ${CPFLAGS}
expasmcor.Macros: Hdr.Macros
        ${CP} Dist.OSLib.Macros.oslib.Hdr.macros ${EXPDIR}.Core.oslib.Hdr.Macros ${CPFLAGS}

export_hdrs: ${EXPORTING_HDRS} create_exp_hdr_dirs
        ${CP} VersionNum        ${EXPDIR}.LibVersion        ${CPFLAGS}
        ${CP} Dist.ChangeLog    ${EXPDIR}.ChangeLog         ${CPFLAGS}
        ${MKDIR} ${EXPDIR}.Docs
        ${CP} Dist.Copying      ${EXPDIR}.Docs.Copying      ${CPFLAGS}
        ${CP} Dist.OSLib_API    ${EXPDIR}.Docs.OSLib_API    ${CPFLAGS}
        ${CP} Dist.OSLib_readme ${EXPDIR}.Docs.OSLib_readme ${CPFLAGS}
        ${CP} Dist.Unix_Build   ${EXPDIR}.Docs.Unix_Build   ${CPFLAGS}
        ${CP} Dist.WideFuncts   ${EXPDIR}.Docs.WideFuncts   ${CPFLAGS}
        @${ECHO} ${COMPONENT}: header export complete

export_libs: ${EXPORTING_LIBS} ${TARGET_LIBS} ${TARGET_LIBS}32 create_exp_lib_dir
        @${ECHO} ${COMPONENT}: library export complete

# Dynamic dependencies:
