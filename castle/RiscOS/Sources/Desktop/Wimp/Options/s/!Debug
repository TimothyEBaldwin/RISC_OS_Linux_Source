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
;========================================================================================
; Debugging options.
;
; To debug the Wimp, set debug to true, then turn on the debugXXX options of your choice.
;========================================================================================
;
	Option	hostvdu,   false               ; destination for debug output
	Option	debug_flush, true              ; flushing if going to file
	Option	pdebug_module, false	       ; use PDebug module

	Option	DebugMemory, false

	Option	debug,	   false               ; ONLY FALSE IF NO DEBUGGING
	OptionD	omd,       false
	OptionD	sm,        false
	OptionD	nk,        false               ; Neil's special debugs
	OptionD	pk,        false               ; special 2
	OptionD	ptr,       false               ; pointer window
	OptionD	tmp,       false               ; templates
	OptionD	fp,        false               ; FP register saving
	OptionD	sv,        false               ; all service calls
	OptionD	dy,        false               ; ChangeDynamicArea monitoring
	OptionD	sw,        false               ; switching
	OptionD	co,        false               ; command window
	OptionD	xx,        false               ; misc
	OptionD	x1,        false               ; misc II
	OptionD	ic,        false               ; icons
	OptionD	icb,       false               ; icon bar
	OptionD	sc,        false               ; set caret
	OptionD	ms,        false               ; message passing
	OptionD	task,      false               ; for wholesale debugging!
	OptionD	task1,     false               ; for exception handlers etc.
	OptionD	task2,     false               ; for entry points
	OptionD	task3,     false               ; check for single-tasking errors
	OptionD	task4,     false               ; Idle poll performance monitoring
	OptionD	ints,      false
	OptionD	extent,    false
	OptionD	escape,    false               ; trap escape enabled on Wimp_Poll
	OptionD	crw,       false               ; window creation
	OptionD	opn,       false               ; window opening
	OptionD	child,     false               ; child windows
	OptionD	mode,      false               ; mode changing
	OptionD	bpr,       false               ; braindead panic redraw debugging
	OptionD	swp,       false               ; Swapping of tasks to disk.
	OptionD	spr,       false               ; Wimp sprite ops
	OptionD	bo,        false               ; Special borders
	OptionD	valid,     false               ; Service_ValidateAddress
	OptionD	fl,        false               ; Filter handling debugging
	OptionD	am,        false               ; Auto opening of submenus
	OptionD	ff,        false               ; Fancy font for system text
	OptionD	ub,        false               ; User definable scroll bars
	OptionD	val,       false               ; New validation string commands (K)
	OptionD	check,     false               ; Check for inconsistent window stacks and flags
	OptionD	err,       false               ; Wimp_ReportError and errors in general
	OptionD	autoopen,  false               ; For opening of wimp's own windows
	OptionD	rma,       false
	OptionD	perth,     false               ; For Perth power managerment
	OptionD	colours,   false               ; For use of ColourTrans
	OptionD	sprite,    false               ; For sprite caching
	OptionD	msgsel,    false               ; Selective message passing
	OptionD	menu,      false               ; New menu handling (indirection and bits)
	OptionD	tools,     false               ; Tool caching and ToolSprite commands
	OptionD	tools2,    false               ; Plotting and clicking
	OptionD	borders,   false               ; border plotting on icons
	OptionD	inverse,   false               ; Colour inversion/highlighting
	OptionD	font,      false               ; anti-aliased fonts in icons
	OptionD	fcol,      false               ; colour of antialiased fonts
	OptionD	die,       false               ; Die entry
	OptionD	systmpl,   false               ; Loading Wimp's templates
	OptionD	key,       false               ; ProcessKey handling
	OptionD	scroll,    false               ; Funky scroll bars
	OptionD	poll,      false               ; PollWord list management
	OptionD	menuparam, false               ; CreateMenu parameters
	OptionD	exit,      false               ; ExitWimp
	OptionD	L40,       false               ; Fancy font in L40-type icons
	OptionD	menuw,     false               ; Automatic calculation of menu width
	OptionD	upcall,    false               ; Upcalls
	OptionD	mjs,       false               ; Mike's debugs
	OptionD	mjs2,      false               ; Mike's debugs 2
	OptionD	mjs3,      false               ; Mike's debugs 3
	OptionD	mjs4,      false               ; Mike's debugs 4 (TransferBlock)
	OptionD autohg,    false               ; AutoHourglass
	OptionD sprprior,  false               ; ROM vs RAM sprite priority
	OptionD autoscr,   false               ; autoscrolling / drags within windows
	OptionD poll2,     false               ; stages through Wimp_Poll

	OptionD tiling,    false	       ; new tiling code
	OptionD threedpatch, false	       ; 3DPatch code
        OptionD wcf,       false               ; Wimp_ClaimFreeMemory

	END
