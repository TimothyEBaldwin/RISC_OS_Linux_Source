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
		GET	Hdr:ListOpts
		GET	Hdr:Macros
		GET	Hdr:System
		GET	Hdr:ResourceFS
		GET	Hdr:Proc

		GBLS	out_dir
out_dir		SETS	"Resources.PortMan."

		MACRO
$label		ADDFILE	$in_dir, $name
		LCLS	in_name
		LCLS	out_name
in_name		SETS	"$in_dir":CC:"$name"
out_name	SETS	"$out_dir":CC:"$name"
$label
		ResourceFile	$in_name,	$out_name
		MEND

		EXPORT	resfiles_service
		EXPORT	resfiles_init
		EXPORT	resfiles_final

		AREA	|resfiles$DATA|, DATA, READONLY
resources	ADDFILE	"Resources.<Machine>.", "Tags"
		ADDFILE	"Resources.<Locale>.",  "Messages"
		DCD	0

		AREA	|resfiles$CODE|, CODE, READONLY
resfiles_service
		EntryS	"r10,r11"
		MOV	r3, r0
		ADR	r0, resources
		MOV	lr, pc
		MOV	pc, r1
		MOVVC	r0, #0
		EXITS

resfiles_init	EntryS	"r10,r11"
		ADR	r0, resources
		SWI	XResourceFS_RegisterFiles
		MOVVC	r0, #0
		EXITS

resfiles_final	EntryS	"r10,r11"
		ADR	r0, resources
		SWI	XResourceFS_DeregisterFiles
		MOVVC	r0, #0
		EXITS

		END
