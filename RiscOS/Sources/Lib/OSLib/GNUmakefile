# Cross-compilation makefile for RISC OS Open hosted variant of OSLib library
#

COMPONENT   = OSLib

HDRS_COMPUTER = \
        adfs        \
        cd          \
        cdfs        \
        devicefs    \
        dosfs       \
        econet      \
        filecore    \
        filer       \
        fileraction \
        fileswitch  \
        free        \
        freeway     \
        fslock      \
        joystick    \
        netfiler    \
        netfs       \
        netprint    \
        nfs         \
        osargs      \
        osfile      \
        osfind      \
        osfscontrol \
        osgbpb      \
        osserialop  \
        parallel    \
        pipefs      \
        ramfs       \
        resourcefs  \
        scsi        \
        scsifs      \
        sharefs     \
        socket      \

HDRS_CORE = \
        buffer               \
        cache                \
        colourtrans          \
        debugger             \
        dma                  \
        fpemulator           \
        iic                  \
        macros               \
        messagetrans         \
        os                   \
        osbyte               \
        osheap               \
        osmodule             \
        osreadsysinfo        \
        osspriteop           \
        osword               \
        podule               \
        portable             \
        screenblanker        \
        screenmodes          \
        serviceinternational \
        sharedclibrary       \
        shell                \
        sound                \
        squash               \
        territory            \

HDRS_TOOLBOX = \
        actionbutton          \
        adjuster              \
        button                \
        colourdbox            \
        colourmenu            \
        dcs                   \
        ddeutils              \
        displayfield          \
        draganobject          \
        draggable             \
        filedbox              \
        fileinfo              \
        fontdbox              \
        fontmenu              \
        frontend              \
        gadget                \
        iconbar               \
        keyboardshortcut      \
        label                 \
        labelledbox           \
        menu                  \
        numberrange           \
        optionbutton          \
        popup                 \
        printdbox             \
        proginfo              \
        quit                  \
        radiobutton           \
        resed                 \
        saveas                \
        scale                 \
        scrollbar             \
        scrolllist            \
        slider                \
        stringset             \
        textarea              \
        textgadgets           \
        toolaction            \
        toolbox               \
        window                \
        windowsupportexternal \
        writablefield         \

HDRS_TYPES = \
        types                \
        coltrans32           \
        devicefs32           \
        dosfs32              \
        filecore32           \
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
        alarm                \
        arcweb               \
        basictrans           \
        colourpicker         \
        compressjpeg         \
        dragasprite          \
        draw                 \
        drawfile             \
        filter               \
        font                 \
        help                 \
        hourglass            \
        inetsuite            \
        jpeg                 \
        makepsfont           \
        mimemap              \
        ole                  \
        pdriver              \
        pdumper              \
        plugin               \
        remoteprintersupport \
        stronghelp           \
        super                \
        taskmanager          \
        taskwindow           \
        uri                  \
        url                  \
        wimp                 \
        wimpextend           \
        wimpreadsysinfo      \
        wimpspriteop         \

OBJ_SUBDIRS = \
        ADFS                  \
        CD                    \
        CDFS                  \
        DeviceFS              \
        DOSFS                 \
        Econet                \
        FileCore              \
        Filer                 \
        FilerAction           \
        FileSwitch            \
        Free                  \
        Freeway               \
        FSLock                \
        Joystick              \
        NetFS                 \
        NetPrint              \
        NFS                   \
        OSArgs                \
        OSFile                \
        OSFind                \
        OSFSControl           \
        OSGBPB                \
        OSSerialOp            \
        Parallel              \
        PipeFS                \
        RamFS                 \
        Resolver              \
        ResourceFS            \
        SCSI                  \
        SCSIFS                \
        ShareFS               \
        Socket                \
        SysLog                \
        BlendTable            \
        Buffer                \
        Cache                 \
        ColourMap             \
        Debugger              \
        DMA                   \
        FPEmulator            \
        HAL                   \
        IIC                   \
        InverseTable          \
        MessageTrans          \
        OS                    \
        OSByte                \
        OSHeap                \
        OSModule              \
        OSReadSysInfo         \
        OSSpriteOp            \
        OSWord                \
        PCI                   \
        Podule                \
        Portable              \
        ScreenBlanker         \
        ScreenModes           \
        ServiceInternational  \
        SharedCLibrary        \
        Sound                 \
        Squash                \
        Territory             \
        ActionButton          \
        Button                \
        ColourDbox            \
        ColourMenu            \
        DCS                   \
        DDEUtils              \
        DisplayField          \
        DragAnObject          \
        Draggable             \
        FileInfo              \
        FontDbox              \
        FontMenu              \
        FrontEnd              \
        Gadget                \
        Iconbar               \
        Menu                  \
        NumberRange           \
        OptionButton          \
        PopUp                 \
        PrintDbox             \
        ProgInfo              \
        Quit                  \
        RadioButton           \
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
        BASICTrans            \
        ColourPicker          \
        CompressJPEG          \
        ConvertPNG            \
        DragASprite           \
        Draw                  \
        DrawFile              \
        Filter                \
        Font                  \
        Hourglass             \
        ImageFileRender       \
        JPEG                  \
        LineEditor            \
        MimeMap               \
        PDriver               \
        PDumper               \
        Report                \
        TaskManager           \
        TaskWindow            \
        URI                   \
        URL                   \
        Wimp                  \
        WimpExtend            \
        WimpReadSysInfo       \
        WimpSpriteOp          \
        ZapFontMenu           \
        ZapRedraw             \
        Zipper                \
        ZLib                  \
        ColourTrans           \

EXPORTING_HDRS_COMPUTER    = $(addsuffix .exphdrcom,${HDRS_COMPUTER})
EXPORTING_HDRS_CORE        = $(addsuffix .exphdrcor,${HDRS_CORE})
EXPORTING_HDRS_TOOLBOX     = $(addsuffix .exphdrtbx,${HDRS_TOOLBOX})
EXPORTING_HDRS_TYPES       = $(addsuffix .exphdrtyp,${HDRS_TYPES})
EXPORTING_HDRS_USER        = $(addsuffix .exphdrusr,${HDRS_USER})
EXPORTING_HDRS             = ${EXPORTING_HDRS_COMPUTER} \
                             ${EXPORTING_HDRS_CORE} \
                             ${EXPORTING_HDRS_TOOLBOX} \
                             ${EXPORTING_HDRS_TYPES} \
                             ${EXPORTING_HDRS_USER} \

ifeq (${APCS},APCS-R)
BLOB = ../Dist/OSLib/o/${TARGET}${SUFFIX_DATA}
else
BLOB = ../Dist/OSLib/o/${TARGET}32${SUFFIX_DATA}
endif

TARGET       ?= ${COMPONENT}
LIBRARY      ?= ${TARGET}
LIBEXT       ?= a
EXPDIR       ?= ${LIBDIR}/${TARGET}

SOURCES_TO_SYMLINK += $(wildcard Dist/OSLib/*/oslib/h/*)

include StdTools

ifneq (objs,$(notdir ${CURDIR}))

# Makefile invoked from same directory
# Create link farm, then execute the makefile from within it

ifeq (clean,${MAKECMDGOALS})
clean:
	@echo Cleaning...
	@rm -rf objs
	@echo ${COMPONENT}: cleaned
else

create_links_dir:
	@${MKDIR} objs

all_libs export export_hdrs export_libs links: create_links_dir
	$(foreach linksource,${SOURCES_TO_SYMLINK}, \
		$(shell \
			[ -L objs/$$(basename ${linksource}).h ] || ln -s ../${linksource} objs/$$(basename ${linksource}).h \
		) \
	)
ifneq (links,${MAKECMDGOALS})
	@${MAKE} -C objs -f ../$(firstword ${MAKEFILE_LIST}) ${MAKECMDGOALS}
endif
endif

else

# Makefile invoked from objs subdirectory

all_libs: ${BLOB}
	@${ECHO} ${COMPONENT}: library pre-built

export: export_${PHASE}
	${NOP}

export_: export_libs export_hdrs
	${NOP}

create_exp_hdr_dirs:
	${MKDIR} ${EXPDIR}/Computer/oslib
	${MKDIR} ${EXPDIR}/Core/oslib
	${MKDIR} ${EXPDIR}/Docs
	${MKDIR} ${EXPDIR}/Toolbox/oslib
	${MKDIR} ${EXPDIR}/User/oslib

.SUFFIXES:  .exphdrcom .exphdrcor .exphdrtbx .exphdrtyp .exphdrusr .h
.h.exphdrcom:;   ${CP} $< ${EXPDIR}/Computer/oslib
.h.exphdrcor:;   ${CP} $< ${EXPDIR}/Core/oslib
.h.exphdrtbx:;   ${CP} $< ${EXPDIR}/Toolbox/oslib
.h.exphdrtyp:;   ${CP} $< ${EXPDIR}/Core/oslib
.h.exphdrusr:;   ${CP} $< ${EXPDIR}/User/oslib

# These headers have moved directory
macros.exphdrcor: macros.h
	${CP} $< ${EXPDIR}/Core/oslib

export_hdrs: create_exp_hdr_dirs ${EXPORTING_HDRS}
	${CP} ../VersionNum        ${EXPDIR}/LibVersion
	${CP} ../Dist/ChangeLog    ${EXPDIR}/ChangeLog
	${CP} ../Dist/Copying      ${EXPDIR}/Docs/Copying
	${CP} ../Dist/OSLib_API    ${EXPDIR}/Docs/OSLib_API
	${CP} ../Dist/OSLib_readme ${EXPDIR}/Docs/OSLib_readme
	${CP} ../Dist/Unix_Build   ${EXPDIR}/Docs/Unix_Build
	${CP} ../Dist/WideFuncts   ${EXPDIR}/Docs/WideFuncts
	@${ECHO} ${COMPONENT}: header export complete

export_libs: ${BLOB}
	${MKDIR} ${EXPDIR}
ifeq (GNU,${TOOLCHAIN})
	${RM} ${EXPDIR}/${TARGET}.${LIBEXT}
	for d in ${OBJ_SUBDIRS}; do mkdir -p l/$$d; done
	/opt/rool/bin/armlib -e ${BLOB} "*"
	objs=; \
	for d in ${OBJ_SUBDIRS}; do \
	    for f in l/$$d/*.o; do \
	        /opt/rool/bin/objdis $$f | sed \
	            -e 's/, A32bit//' \
	            -e 's/, FP3//' \
	            -e 's/\(\(ADD\|SUB\).*#.*\)#/\1/' \
	            > $${f%.o}.s; \
	        ${AS} -o $$f $${f%.o}.s; \
	        objs="$$objs $$f"; \
	    done; \
	done; \
	${AR} ${ARFLAGS} ${EXPDIR}/${TARGET}.${LIBEXT} $$objs
else
	${CP} $^ ${EXPDIR}/${TARGET}.${LIBEXT}
endif
	@${ECHO} ${COMPONENT}: library export complete

endif

# EOF
