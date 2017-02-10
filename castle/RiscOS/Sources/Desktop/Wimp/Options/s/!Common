; This source code in this file is licensed to You by Castle Technology
; Limited ("Castle") and its licensors on contractual terms and conditions
; ("Licence") which entitle you freely to modify and/or to distribute this
; source code subject to Your compliance with the terms of the Licence.
; 
; This source code has been made available to You without any warranties
; whatsoever. Consequently, Your use, modification and distribution of this
; source code is entirely at Your own risk and neither Castle, its licensors
; nor any other person who has contributed to this source code shall be
; liable to You for any loss or damage which You may suffer as a result of
; Your use, modification or distribution of this source code.
; 
; Full details of Your rights and obligations are set out in the Licence.
; You should have received a copy of the Licence with this source code file.
; If You have not received a copy, the text of the Licence is available
; online at www.castle-technology.co.uk/riscosbaselicence.htm
; 
;
; Options common to all systems. Hopefully all these options are uncontentious - they are either
; prototype or debugging options, or options that are unlikely to be changed for a particular
; build. If a new project needs to change one of these options, you will need to move the option
; out of this file and into the !Default file.
;
; Note that this file is read _after_ the system options file.
;

;------------------------------------------------------------------------------
;
; The following variables control prototype features - it is strongly
; suggested that these are only used in control environments and are set to
; false for release versions of the Window Manager.
;

;
; "redrawlast"  makes the redraw event lowest priority (except for null) a la Windows,
;               but requires alot more work to make it work sensibly as it a horrible
;               hack to see what would happen.
;
;               See "PrivateDoc.RedrawLast" for some further thoughts.
;
	Option	redrawlast,		false

;------------------------------------------------------------------------------

    [ :LNOT: :DEF: standalone
	Option	standalone,		false		; include messages / templates
    ]

	Option	fastborders,		:LNOT:TrueIcon3	; use PutSpriteAtUserCoords for border plotting
        Option  colourmoreborder,       false :LAND: TrueIcon3 ; colour all tools except scroll wells
	Option	slabinout,		false		; slab in selected 'slab out' icons.
	Option	fixslabalignment,	true		; Fix redraw of non-aligned 3D icons
	Option	PokeBorder,		false		; controls border colour on portables
	Option	ErrorServiceCall,	true		; send service call for Wimp_ReportError
	Option	NewErrorSystem,		true		; enable watchdog and so forth
	Option	Bits30and23,		false		; use bits 30 and 23 of error number
	Option	WatchdogTimer,		false		; use timer interupt for watchdog
	Option	AllowMatrix,		false
	Option	FreePoolWCF,		true
	Option	SnapShot,		false
	Option	UseClipX0,		false		; use clipx0 rather than call kernel
	Option	Swapping,		false		; Swap tasks out to disk.
	Option	StickyMenus,		false
	Option	hvblip,			true		; allow blips on scroll bars
	Option	mousecache,		false		; cache mouse position
	Option	togglebits,		true		; shift toggle thingy
	Option	AutoScroll,		false		; automatically add scroll bars in low res.
	Option	Mode22,			false:LAND:AutoScroll	; cater for low res modes
	Option	RealDarwin,		false		; use bitmapped darwin font
	Option	NoDarwin,		true		; don't even alias it.
        Option  TrueIcon1,              true            ; true colour support, phase 1
        Option  SwitchingToSprite,      true            ; update vdu variables when switching to sprite
        Option  StartTaskPostFilter,    true            ; always call the post filter on exit from Wimp_StartTask

        Option  BlendedFonts,           BlendedFonts :LOR: (true :LAND: RO4) ; Blend fonts directly with window backgrounds
        Option  ThreeDPatch,            true :LAND: RO4         ; implement 3DPatch (now most of the new features)
        Option  No3DChildWindows,       true :LAND: RO4         ; child windows do not have 3D borders
        Option  OldStyleColourMenus,    true :LAND: RO4         ; should the left and right parts of the colour menus be filled
        Option  MinimumMenuHeight,      false :LAND: RO4        ; make all menu items at least 44 high
        Option  TrueSelectionColours,   true :LAND: RO4         ; allow specification of alternate selection colours
        Option  DotsAsWordSeparators,   true :LAND: RO4         ; when moving the caret on writable icons treat '.' the same as space
        Option  FullIconClipping,       false :LAND: RO4        ; always clip the whole of icons to their bounding boxes rather than letting sprites overlap

        Option  SpacesInFilenames,      true            ; when hard space is allowed but space is not, convert

        END

