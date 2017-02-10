; Assembler source for FPA support code and emulator
; ==================================================
; Top level assembler source file and core/veneer interface description.
;
; Copyright (C) Advanced RISC Machines Limited, 1992-7 (now named ARM Limited).
; All rights reserved.
;
; Redistribution and use in source and binary forms, with or without
; modification, are permitted provided that the following conditions are met:
;
;     * Redistributions of source code must retain the above copyright notice,
;       this list of conditions and the following disclaimer.
;     * Redistributions in binary form must reproduce the above copyright
;       notice, this list of conditions and the following disclaimer in the
;       documentation and/or other materials provided with the distribution.
;     * Neither the name of Advanced RISC Machines Limited nor ARM Limited nor
;       the names of its contributors may be used to endorse or promote
;       products derived from this software without specific prior written
;       permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
; ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
; LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
; CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
; SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
; CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
; ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
; POSSIBILITY OF SUCH DAMAGE.

; The FPA support code (FPASC) and emulator (FPE) source files are split up
; into two major parts:
;
; * The "core" routines, which are common to all operating systems. These
;   consist mainly of one or more undefined instruction handlers (i.e.
;   routines which handle the ARM's undefined instruction trap). There are
;   also various support routines - e.g. routines to handle a floating point
;   context switch and a routine which detects whether any floating point
;   hardware is present and if so, whether it is the FPA hardware.
;
; * The "veneer" routines, which customise the code for a particular
;   operating system. Among other things, these include:
;   (a) Initialisation and finalisation code (which calls appropriate core
;       initialisation and finalisation routines);
;   (b) The routine that actually installs a particular undefined
;       instruction handler;
;   (c) Code to make workspace memory available to the core routines;
;   (d) Code to interface between the rest of the system and the floating
;       point context switch code;
;   (e) Routines which accept IEEE traps delivered by the core routines and
;       translate them into terms understood by the rest of the system.
;
; The veneer sources are split up into two main parts (one assembled before
; the main core files, the other after it), plus various definition files
; which are assembled before any real code. If any of these is not required,
; just create a null source file.

; The options definition files.

                GET     $CoreDir.defaults$FileExt
                GET     $VeneerDir.options$FileExt
                GET     $CoreDir.optcheck$FileExt

; The rest of the definition files.

                GET     $CoreDir.regnames$FileExt
                GET     $CoreDir.armdefs$FileExt
                GET     $CoreDir.fpadefs$FileExt
                GET     $CoreDir.wsdefs$FileExt ;This GETs the veneer
                                                ; workspace def'n files

; The main source files.

                GET     $VeneerDir.start$FileExt
                GET     $CoreDir.toplevel$FileExt
                GET     $VeneerDir.end$FileExt

; This is all the code there is in this file: the rest of this file
; describes the core/veneer interface and performs various checks.
;
; Core/veneer interface change log
; ================================
;
; Date         Core     Changes
;              version
; --------------------------------------------------------------------------
; 09-Nov-1992  0.00     Initial attempt at core/veneer interface.
; 23-Feb-1993  0.01     Amount of stack required to be available on entry
;                         increased from 256 to 512 bytes: 256 was too small
;                         for some paths through the code;
;                       Change to "BranchTable" entry sequence in 32-bit
;                         code: SPSR is put on stack as well as CPSR.
;                       Trap handler definitions added;
;                       "NextHandler*" variables changed to be double
;                         indirections;
;                       Comments about availability and usefulness of
;                         various routines when 'MultipleContexts' is {TRUE}
;                         or {FALSE} relaxed in the light of experience;
;                       'core_activatecontext', 'core_deactivatecontext',
;                         'core_changecontext' area tidied up in response to
;                         discussions with Acorn;
;                       'core_disable' and 'veneer_coredisabled' calls added
;                         in response to discussions with Acorn;
; 04-Mar-1993  0.02     Trap handler entry changed, to receive floating point
;                         parameters on the stack, not in F0 and F1;
;                       Details added about frame pointers, re-entrancy, etc.
;                       'core_abort' call added;
;                       New section added on linking and symbol names;
;                       'FPInstrDone' macro added;
;                       Optional optimisations switches added;
; 07-Mar-1993  0.03     'core_clearpending' merged into 'core_abort';
;                       Note added to trap handler entry conditions to say
;                         'core_abort' call never necessary;
; 14-Mar-1993  0.04     R5 removed from entry conditions for a trap handler:
;                         the same information was available by other means;
;                       Note added about interrupts never being re-enabled
;                         if a branch to 'veneer_corefaulty' takes place
;                         rather than proper instruction emulation, nor for
;                         some calls via 'NextHandler';
;                       Clarifications about 'veneer_corefaulty' added;
;                       Other minor clarifications;
;                       'core_savecontext' interface enhanced to make it
;                         possible to implement it;
; 08-Apr-1993  0.05     Clarification about 'veneer_newhandlers';
;                       Added the "FPE4WordsPerReg" optimisation;
;                       'core_enable' call added in response to comment from
;                         Acorn;
; 13-Apr-1993  0.06     Added the "DoIntegerPowers" optimisation;
; 19-Apr-1993  1.00     First full released version;
; 26-Apr-1993  1.01     Minor bug-fixing release;
; 06-May-1993  1.02     Added the "ZeroToTheZero" assembly time variable,
;                         and slightly modified "DoIntegerPowers" as a
;                         result;
;                       Description of the 'FPInstrDone' macro clarified;
;                       Comment that 'FPInstrDone' is not called for
;                         recursive entries to the floating point system
;                         corrected to say that it *is* called;
;                       Added the "FPEChecksNextInstr" optimisation;
; 02-Dec-1993  1.06     Source file names changed:
;                         $CoreDir.interface    becomes  $CoreDir.interf;
;                         $CoreDir.loadstore    becomes  $CoreDir.ldst;
;                         $VeneerDir.contextws  becomes  $VeneerDir.ctxtws;
;                         (This is to avoid problems with names over 8
;                         characters long in some filing systems - the
;                         consequences for veneer writers are (a) that you
;                         rename "contextws" to "ctxtws" in your veneer
;                         directory; (b) that you may want to remove old
;                         files called "interface" and "loadstore" from your
;                         core directory to save disc space);
;                       Source file conventions changed so that this main
;                         source file is linked to from a veneer file which
;                         defines the filing system dependent names, rather
;                         than doing it itself - this is to avoid having to
;                         edit this file on a per-veneer basis;
;                       Name of directory used to hold core source files in
;                         release changed from "core" to "coresrc" - this is
;                         to avoid over-enthusiastic deleters of core dumps
;                         on Unix systems;
;                       "NoTranscendentals" and "NoPacked" optimisations
;                         added;
; 08-Dec-1993  1.07     Core-veneer interface augmented with information
;                         about byte tables in the core (this allows the
;                         veneer to rearrange them to change endianness);
; 14-Dec-1993  1.07     Correction made to example in "Endianness" comments
;                         at end of this file. Only comments changed, so not
;                         a new version.
; 17-May-1995  1.08     Bug-fixed version released back to /plg/fpe400 and
;                         /plg/rel200/fpe400. Only change to interface
;                         documentation is the removal of a surplus copy of
;                         a "veneer must supply the following call" comment.
; 14-May-1996  1.10     One instance of "VeneerName" corrected to "VeneerDir"
;                         in "Source file conventions" section.
; 22-Apr-1997  1.11     "AssumedHardware" and "FPESigNaNCopy_Invalid"
;                         options added; various aspects of NaN handling
;                         simplified.

; Source file conventions
; =======================
;
; Developers customising the FPASC/FPE for a particular operating system
; should not modify any files in the "coresrc" directory (including this
; one), except for temporary bug fixes, etc. Any bugs found in these files
; should be reported to Advanced RISC Machines Ltd.
;
; Also, don't rely on any details of these files unless they are documented
; in this file: all such undocumented details may change as and when bugs
; are fixed, upgrades are made, etc.
;
; As noted above, this "main" file should also not be modified. This is a
; change from core versions 1.05 and earlier, which allowed it to be
; modified to specify filing system naming characteristics. For core
; versions 1.06 and later, these should instead be specified by a "header"
; source file, which sets up the following assembly time variables and then
; GETs this one:
;
;   CoreDir: a string variable holding the directory name in which the core
;     source files are to be found. The string must include any character
;     separating the directory name from the individual file name - e.g. for
;     a Unix file system, it should end with "/"; for a RISC OS file system,
;     it should end with "."; etc.
;
;   VeneerDir: a string variable holding the directory name in which the
;     veneer source files are to be found. This must obey the same rules as
;     "CoreDir" above.
;
;   FileExt: a string variable holding any filename extension that should be
;     added after the main part of the file name. Again, this must include
;     any separator character between the main part of the file name and the
;     extension.
;
; Core source files are accessed in these sources as the concatenation of
; the contents of "CoreDir", the file name given in the comments below and
; the contents of "FileExt"; veneer source files are accessed similarly,
; except that "VeneerDir" is used in place of "CoreDir".
;
; For example, the veneer "start" file is included in the assembly by means
; of the assembler directive:
;
;   GET $VeneerDir.start$FileExt
;
; (Note that the "." between "$VeneerDir" and "start$FileExt" is simply the
; way to tell the assembler that the variable name "VeneerDir" stops at that
; point - otherwise, it would think we were trying to access a variable
; called "VeneerDirstart". It does not introduce a "." into the name of the
; file being accessed.)
;
; This file may also define other assembly time variables which are picked
; up by that veneer's source files. This can be used for producing minor
; variants of the same veneer. For example, the supplied "toyriscos" veneer
; sets a string variable "VeneerName", which gets incorporated into a
; version string in its source files, and a logical variable "SupportsFPA",
; which is used to switch between emulator-plus-FPA-support and
; emulator-only versions. This allows the two versions to share most of
; their source files, with only the header files varying between them.
;
; The source files which customise the FPASC/FPE for a particular operating
; environment should all reside in the "$VeneerDir" directory. The following
; files must exist in this directory, since they are included by this file
; or by the "$CoreDir" source files:
;
; ctxtws:    Definitions of any additional context workspace variables
;            required by the veneer;
; end:       Veneer source code that is to be assembled after the core
;            routines;
; globalws:  Definitions of any additional global workspace variables
;            required by the veneer;
; options:   Definitions and settings of assembly time variables to control
;            the assembly of the core source code;
; start:     Veneer source code that is to be assembled before the core
;            routines.
;
; Full details of what these files are required to contain are given in the
; comments below.
;
; If desired, the veneer directory may of course contain other source files,
; which are included by the five required ones. For instance, trap-handling
; routines might be placed in a "traps" file, which is included by one of
; the "start" and "end" files. Such inclusions should be done by lines
; analogous to those above - i.e. "GET $VeneerDir.whatever$FileExt".
;
; Unless otherwise stated, all the interface routines described below should
; be called with the ARM in Supervisor26 mode if the FPASC/FPE was assembled
; for 26-bit ARMs, Supervisor32 mode if it was assembled for 32-bit ARMs.

; Symbol name conventions, linking, etc.
; ======================================
;
; The core source files define a large number of assembler time symbols, and
; the veneer should avoid conflicts with them: such conflicts will generally
; be indicated by the assembler producing a "multiply defined symbol" error.
; In general, long symbol names are used, both to reduce the chance of
; conflicts and to help document the code.
;
; One exception to this "long symbol names" rule are the symbols defined in
; "src.core.armdefs" and "src.core.fpadefs". All these symbols should be
; regarded as part of the core/veneer interface - i.e. the veneer code can
; use them safely, without worrying about what will happen to them in future
; versions of the core. Exception: don't use information from
; "src.core.fpadefs" that relates to the FPCR or internal format numbers -
; they're very similar to instructions and extended precision numbers at
; present, but this could quite easily change in future. If it does change,
; new symbols will be defined relating to the FPCR or internal format
; numbers - so it's OK e.g. to use 'EIExp_mask' to get the exponent field
; from an extended precision number, but not from an internal format number.
;
; All symbol names defined by the core files use just the alphanumeric
; characters and underscore, and do not require the assembler convention of
; putting vertical bars around symbols containing other characters (e.g. the
; dollar character). One suggested way to avoid conflicts with core symbols
; is to make use of symbol names that do require vertical bars.
;
; The core does not export any symbols to the object file - i.e. to the
; linker. It is the responsibility of the veneer to define and export
; whatever symbols are needed to make linking to the rest of the target
; operating system possible.
;
; The veneer "start" file is responsible for issuing an appropriate AREA
; directive to the assembler before any code is produced.

; Version numbers
; ===============
;
; The core has a two-part version number: the major number is changed
; whenever the core/veneer interface is changed in a non-backwards
; compatible way, while the minor number is changed whenever a new version
; of the core is released. (Exception: all pre-first-full-release versions
; have major version number 0.) So, for example, versions 1.09 and 1.15
; would have compatible core/veneer interfaces, though version 1.15 is more
; recent than 1.09. Version 2.01 would be more recent than either and have a
; potentially incompatible core/veneer interface. (Note that it is only
; "potentially incompatible", since any particular veneer may be unaffected
; by the changes to the interface.)
;
; The core exports the two parts of its version number as assembly time
; arithmetic variables called "CoreMajorVersion" and "CoreMinorVersion". It
; also exports an assembly time string variable called "CoreVersion", which
; consists of the core major version number, then ".", then the core minor
; version number, then some possible suffix letters to describe what special
; assembly time options were used:
;
; "A" means that the "AssumedHardware" option has been used.
; "B" means that this core supports the "BranchTable" undefined instruction
;     handler entry and exit conventions (defined below); if not present, it
;     supports the "StandAlone" conventions.
; "E" (Emulator only) means that this core *only* contains FPE code;
; "I" means that this core will leave interrupts disabled while it handles a
;     floating point instruction.
; "M" means that this core supports multiple floating point contexts;
;     otherwise it only supports a single floating point context;
; "S" (Support code only) means that this core *only* contains FPASC code;
; "Z" (the 26th letter of the alphabet :-) means that the core has been
;     assembled for a 26-bit ARM; otherwise it is for a 32-bit ARM.
; "z" (a smaller version of "Z" :-) is like "Z", except that the core does
;     not work safely on an ARM2 - see the description of the assembly time
;     variable "ARM2Safe" below for further details.
;
; If neither "E" nor "S" is present, the core contains both emulator and
; support code.
;
; Each veneer must export an assembly time arithmetic variable called
; "ExpectsCoreVersion": this must match "CoreMajorVersion" and is an attempt
; to ensure that veneers are updated when the core/veneer interface changes
; in an incompatible way.

        ASSERT ExpectsCoreVersion = CoreMajorVersion

; Other version details
; =====================
;
; FPEWanted,FPASCWanted,AssumedHardware
; -------------------------------------
;
; The veneer "options" file must export two logical assembly time variables
; called "FPEWanted" and "FPASCWanted". These control which parts of the
; core are assembled, as follows:
;
; FPEWanted {FALSE}, FPASCWanted {FALSE}:
;   Not allowed.
;
; FPEWanted {FALSE}, FPASCWanted {TRUE}:
;   Core will act as support code for the FPA hardware. If no hardware or
;   hardware other than the FPA is present, core will not work.
;
; FPEWanted {TRUE}, FPASCWanted {FALSE}:
;   Core acts as a pure floating point emulator; floating point hardware is
;   kept disabled if present.
;
; FPEWanted {TRUE}, FPASCWanted {TRUE}:
;   Core will act as support code for the FPA hardware. If no hardware or
;   hardware other than the FPA is present, core will act as a floating
;   point emulator, with any hardware being kept disabled.
;
; The veneer "options" file is allowed to export an additional arithmetic
; assembly-time variable called "AssumedHardware". If it does so, the value
; of this variable must either be -1 to indicate that the code should be
; assembled on the assumption that no hardware is present, or the system ID
; byte from the FPSR of hardware that is to be assumed present.
;
; If this is done, assembly is modified in the following ways:
;
; * Only the correct undefined instruction handler for that option is
;   assembled, regardless of what FPEWanted and FPASCWanted request. (If the
;   latter don't actually match up correctly with what is assembled, a
;   warning note is output during assembly.)
;
; * No dynamic attempts are made to install or remove undefined instruction
;   handlers: the veneer does not need to supply the "veneer_newhandlers" or
;   "veneer_restorehandlers" calls documented below, and the behaviour of
;   routines like "core_initws" and "core_shutdown" is changed so as never
;   to try to change the installed undefined instruction handler.
;
; * A symbol called "FPUndefHandler" will be defined that points to the one
;   and only floating point undefined instruction handler. (This is for the
;   "StandAlone" undefined instruction handler convention; for the
;   "BranchTable" one, two symbols called "FPUndefHandler1" and
;    "FPUndefHandler2" are defined.)
;
; This facility is intended for simple ROM-based systems in which both the
; undefined instruction vector and the floating-point undefined instruction
; handler are in ROM and permanently linked together. The veneer code for
; such a system would typically simply export "FPUndefHandler*" for a "ROM
; vectors" piece of code to import at link time.

; ARM2Safe
; --------
;
; If the code is intended for 26-bit assembly, the veneer "options" file
; must also export a logical assembly time variable called "ARM2Safe". If
; this variable is {TRUE}, the assembled code will run on all ARMs
; supporting 26-bit mode, including ARM2s. If it is {FALSE}, the code will
; run faster but will not run correctly on ARM2s, because it omits a check
; for SWIs entering the undefined instruction handler. See ARM Ltd
; application note A001 "Notes for ARM Code Writers" for further details of
; this ARM2 problem.
;
; This variable need not be defined if the code is only intended for 32-bit
; assembly. However, there is no harm in defining it in this case.

; FPESigNaNCopy_Invalid
; ---------------------
;
; The IEEE standard gives the implementor the option to choose whether
; copying a signalling NaN without change of format generates an invalid
; operation exception, but requires that changing the format of a signalling
; NaN does generate such an exception. Instructions that can potentially do
; these operations in the FP instruction set are LDF, STF, MVF, MNF and ABS.
;   LDF converts a number from an IEEE-defined format to the system-defined
; internal format. This internal format may legitimately be regarded as
; being capable of holding any IEEE-defined format, making it unnecessary to
; regard LDF as ever performing a format conversion. This is fortunate,
; because the coprocessor interface does not allow LDCs to produce
; data-dependent precise exceptions.
;   STF, MVF, MNF and ABS convert a number in a register to a specified
; destination format. The format of the number in the register is basically
; the format of the instruction that put the number in the register (source
; format in the case of an LDF, destination format for any other
; instruction). So if this format differs from the destination format, a
; signalling NaN operand must cause an exception; if they are the same, it
; may do so at the implementor's option. Not generating the exception is
; slightly preferable from the software point of view because it makes it
; simpler e.g. to initialise data areas with signalling NaNs; generating the
; exception is easier for hardware because it means that there is no need
; for STF, MVF, MNF or ABS (or anything else) to ever know the format of
; the instruction that generated the register value.
;   The FPA hardware does keep track of the format of NaNs in registers.
; This allows the FPASC to produce the exception only if there is a format
; conversion involved. In addition, the FPA hardware will handle an STF of a
; NaN which doesn't involve a change of format on its own, without software
; intervention (again to speed up initialisation of data areas with NaNs).
; As a result, if the FPA+FPASC system is to behave consistently in this
; respect, it must never signal an invalid operation exception when an STF,
; MVF, MNF or ABS copies a signalling NaN without change of format.
;   It is possible that future hardware will not keep track of the format of
; NaNs in registers. Such a system would not be able to determine whether a
; change of format is taking place, and so the only option open for it would
; be to generate an invalid operation exception on any STF, MVF, MNF or ABS of
; a signalling NaN.
;   The FPE system is in principle capable of behaving either way. Its
; default behaviour is to behave like the FPA system and thus only generate
; an invalid operation if a change of format of a signalling NaN is
; involved.
;   This default can be overridden by defining an assembly-time logical
; variable called "FPESigNaNCopy_Invalid". If it is defined and set to
; {FALSE}, the FPE will only generate the exception if a change of format is
; involved, regardless of what any accompanying hardware support code does.
; If it is defined and set to {TRUE}, the FPE will generate the exception
; for any STF/MVF of a signalling NaN, again regardless of what any
; accompanying hardware support code does.
;
; A warning message will be printed during assembly if the resulting system
; will behave in different ways depending on which undefined instruction
; handlers are in use.
;
; Finally, note that this variable does not in any way affect what the
; hardware support code does, and so it has no effect at all if FPEWanted =
; {FALSE}.

; Miscellaneous space and time optimisations
; ------------------------------------------
;
; The core "defaults" file supplies default values for the following
; optimisation options as assembly time variables: in general, the default
; value produces the unoptimised version of the code. The veneer "options"
; file can modify these values if desired. Note that the "options" file is
; not expected to create the assembly time variable - merely to change its
; value if desired. This differs from the version details above, for which
; the veneer has to both create and set the variable. (This is basically
; because the version details above are compulsory, while these
; optimisations are optional. Forcing the veneer code to define the
; assembly-time variable in the former case means that a veneer which
; doesn't do it will (correctly) cause assembly-time errors to occur.
;
; TrapsCanReturn (logical - default value {TRUE}):
;   On some systems, veneer trap handlers will never return via the return
;   link (in R14 on entry to the trap handler). On such systems, all code
;   following the calls to the veneer trap handlers is redundant and can be
;   omitted. Setting this option to {FALSE} will cause this code not to be
;   generated and the trap handler to be entered via a branch instruction
;   rather than a branch-and-link (so no return link is generated).
;   * Benefit of optimisation: FPASC/FPE is smaller;
;   * Drawback of optimisation: Trap handlers must never return.
;
; FPE4WordsPerReg (logical - default value {FALSE}):
;   By default, an FPE context uses 3 words per register, for a total of 24
;   words of context devoted to the register bank. This is the same amount
;   of space as an inactive FPA context uses for the same purpose. By making
;   FPE4WordsPerReg {TRUE}, the veneer can request that an FPE context
;   should contain 4 words per register, for a total of 32 words devoted to
;   the register bank. This makes register access slightly faster and so
;   marginally increases the speed of the emulator.
;   * Benefit of optimisation: FPE is slightly faster;
;   * Drawback of optimisation: floating point contexts (both FPE and FPA
;     ones) are bigger.
;
; DoIntegerPowers (logical - default value {TRUE})
;   If this assembly time variable is {FALSE}, the POW and RPW instructions
;   will only do those values of x^y for which there is a clear *floating
;   point* answer - i.e. such that not only x^y is defined mathematically,
;   but also x'^y' for values of (x',y') very close to (x,y). This is only
;   true when x > 0, or when x = 0 and y > 0. (When x = 0 and y > 0, the
;   result is always zero, with a sign equal to that of x: this decision is
;   analogous to the IEEE requirement that SQT(-0) = -0.) If x = 0 and
;   y = 0, the result is determined by the "ZeroToTheZeroIs" variable below;
;   all other values of x and y give invalid operation exceptions.
;     If this assembly-time variable is {TRUE}, the POW and RPW instructions
;   will also calculate x^y for any value of x when y is an integer. (Note
;   that all floating point numbers with sufficiently large exponents are
;   integers, by the way.) If y is not an integer, there will still be
;   invalid operation exceptions when x < 0 or when x = 0 and y < 0. If y is
;   an integer and x < 0, x^y is calculated as (ABS(x))^y if y is even and
;   -((ABS(x))^y) if y is odd. If y is an integer and x = 0, the result is a
;   divide-by-zero exception if y < 0, a zero if y > 0, and determined by
;   the "ZeroToTheZeroIs" assembly time variable if y = 0: in the y > 0
;   case, the sign of the zero is equal to that of x if y is odd and always
;   positive if y is even. (By the way, note that this means that
;   (-0)^(positive even integer) is -0 if "DoIntegerPowers" is {FALSE} and
;   +0 if it is {TRUE}.)
;     If this assembly-time variable is {TRUE}, the POW and RPW instructions
;   may also evaluate x^y by repeated multiplication or division when y is a
;   reasonably small integer. This method of calculation suffers from
;   completely different sources of error than the normal technique, so
;   there may be some minor discontinuities in the results obtained. Also,
;   the errors from the repeated multiplication/division technique will
;   generally be lower, and it is better at producing exact results when
;   they exist.
;   * Benefits of not processing integer powers specially: code space
;     reduced, more consistent results;
;   * Drawbacks of not processing integer powers specially: less exact
;     results, some "obvious" constructions like x^(-1) will suffer from
;     limited range problems;
;
; ZeroToTheZero (string - default value "One")
;   This variable is not strictly speaking an optimisation, but is
;   sufficiently related to the previous optimisation to be put here. It
;   controls how (+/-0)^(+/-0) is evaluated. There are currently three
;   supported values:
;     "One" means that it evaluates to 1 exactly;
;     "Zero" means that it evaluates to 0 exactly - the sign of this zero is
;       always positive if "DoIntegerPowers" is {TRUE} and equal to the sign
;       of the first operand to POW (or the second to RPW) if
;       "DoIntegerPowers" is {FALSE};
;     "InvalidOp" means that it produces an invalid operation.
;
; FPEChecksNextInstr (logical - default value {TRUE})
;   When this variable is {FALSE}, the FPE always returns to the code
;   containing the floating point instruction after emulating it. When it is
;   {TRUE}, the FPE will normally inspect the instruction following the one
;   it has just done to find out whether it is also a floating point
;   instruction, and emulate it immediately if so: this results in higher
;   performance on sequences of consecutive floating point instructions.
;   (This behaviour can be stopped in specific instances by the veneer, by
;   suitable coding of the 'FPInstrDone' macro - see the "Undefined
;   instruction handler exit" section below.)
;     Note that this optimisation does not affect the FPASC, which always
;   returns to the following instruction: even if it *is* a floating point
;   instruction, it can probably be performed faster by the hardware!
;   * Benefits of optimisation: higher performance on sequences of floating
;     point instructions;
;   * Drawbacks of optimisation: slightly decreased performance on isolated
;     floating point instructions (but it should almost always be a net
;     gain); slightly increased code space; instructions emulated
;     immediately by this technique don't go through the undefined
;     instruction trap normally, which could upset some utilities (e.g. an
;     undefined instruction logging program which was called before the FPE
;     on the undefined instruction vector would never see the instruction
;     concerned).
;
; NoTranscendentals (logical - default value {FALSE})
;   When this variable is {FALSE}, the transcendental instructions (EXP,
;   LOG, LGN, SIN, COS, TAN, ASN, ACS, ATN, POL, POW and RPW) are
;   implemented normally. When it is {TRUE}, they are instead treated as
;   undefined FPA instructions - see the descriptions of what is done with
;   these under "Undefined instruction handler entry" below.
;     Discussion: these transcendental functions are often not wanted. Even
;   when they are, implementing them as procedure calls to a library is
;   generally preferable to implementing them as emulated instructions,
;   because:
;
;   (a) The procedure call will suffer much lower overheads than the
;       instruction emulation;
;
;   (b) Using a library makes it much easier to tune the implementation of
;       these instructions to the accuracy and speed requirements of the
;       application. (By the way, the chosen implementation in this emulator
;       is close to that of Cody & Waite "Software Manual for the Elementary
;       Functions", Prentice-Hall 1980, ISBN 0-13-822064-6)
;
;   As a result, the main reasons for using these instructions are either
;   for backwards compatibility, or as a convenient source of transcendental
;   functions when you're not especially concerned about exactly what
;   accuracy or speed you get.
;
;   Benefits of optimisation: FPASC/FPE is substantially smaller (about 5.5K
;     on core version 1.06);
;   Drawbacks of optimisation: FPASC/FPE doesn't supply transcendental
;     instructions.
;
; NoPacked (logical - default value {FALSE})
;   When this variable is {FALSE}, the packed precision instructions (LDFP
;   and STFP) are implemented normally. When it is {TRUE}, they are instead
;   treated as undefined FPA instructions - see the descriptions of what is
;   done with these under "Undefined instruction handler entry" below.
;     See the discussion under "NoTranscendentals" above for the reasons
;   behind this, reading "binary <-> decimal conversion functions" for
;   "transcendental functions".
;
;   Benefits of optimisation: FPASC/FPE is substantially smaller (about 3.5K
;     on core version 1.06);
;   Drawbacks of optimisation: FPASC/FPE doesn't supply packed precision
;     instructions.
;
; This list of optimisations will probably be added to in future. Note
; though that a veneer doesn't *have* to do anything about any of them: new
; optimisations will not make it necessary to do any extra work unless you
; want to take advantage of them.

; Endianness
; ==========
;
; Normally, the FPASC/FPE operates with the endianness for which it was
; assembled. Some applications require switchable endianness, however. For
; these, it is important that any strings and other byte arrays used by the
; core should be rearranged when the endianness is switched. The core
; therefore exports a list of the byte arrays it contains via assembly-time
; variables and labels, as follows:
;
; ByteArrayCount is an assembly-time integer variable which indicates how
; many byte arrays the core contains. Important: it only contains the
; correct count during the assembly of the veneer's "end" file; during the
; assembly of other veneer source files, it either contains zero or some
; other meaningless value.
;
; For each byte array, two labels called ByteArray_xxxxxxxx and
; ByteArrayEnd_xxxxxxxx are defined, where xxxxxxxx is an 8-digit
; hexadecimal representation of the table's sequence number within the
; source (the first table has sequence number 0, the last has sequence
; number ByteArrayCount-1). Both labels will always be word-aligned.
;
; So a veneer that needs to reverse the byte arrays can for instance set up
; a control table containing pointers to their starts and ends by code
; similar to the following:
;
;         GBLA    Index
; Index   SETA    0
;
; ControlTable
;         WHILE   Index < ByteArrayCount
;         DCD     ByteArray_$Index, ByteArrayEnd_$Index
; Index   SETA    Index+1
;         WEND
; ControlTableEnd
;
; This code must appear in the veneer's "end" file, but code which uses the
; control table it sets up can of course be anywhere.

; Undefined instruction handler entry
; ===================================
;
; Two options are supplied for dealing with entry to and exit from the
; undefined instruction handlers. They are selected between by the veneer
; "options" file, by creating and setting an assembly time string variable
; called "UndefHandlerConvention".
;
; UndefHandlerConvention = "StandAlone"
; -------------------------------------
;   In this case, the core's undefined instruction handlers are presumed to
;   be linked directly into the ARM's undefined instruction trap. I.e. the
;   undefined instruction handler is entered with the ARM in precisely the
;   state that it was in immediately after the undefined instruction trap
;   was taken, apart of course from the fact that the PC value may be
;   different.
;
;   The undefined instruction handler will take one of a number of courses
;   of action, depending on what the instruction is and, in the case of the
;   FPASC, what the state of the FPA is:
;
;   (a) If the instruction is in fact a SWI, the correct state for entry to
;       the SWI handler will be constructed and control will be transferred
;       to the SWI handler. (This deals with an ARM2 bug, and the test for a
;       SWI is omitted if the assembly time variable "ARM2Safe" is {FALSE}
;       or if the 32-bit variant of this code is being assembled - see
;       under "ARM2Safe" above.)
;
;   (b) In some circumstances, the floating point system may decide that
;       there is something badly wrong with its hardware and/or software
;       state. In such cases, the code will branch to a veneer-defined label
;       "veneer_corefaulty", with R12 pointing to the entry frame associated
;       with the original non-recursive entry to the floating point system.
;       Such errors are unrecoverable. (See under "Stack and frame
;       considerations, ..." below for more details of the entry frame.)
;
;       Note that there is no guarantee that an internal error will be
;       caught in this way. In general, this mechanism is only used when the
;       test can be done for free - e.g. when there is a branch table with
;       some supposedly impossible cases in it.
;
;   (c) If the instruction is not a coprocessor instruction, or is a
;       coprocessor instruction for another coprocessor, or is an undefined
;       FPA instruction, control is passed to the routine indirectly
;       addressed by the global workspace variable "NextHandler" (i.e.
;       "NextHandler" contains an address; the word at that address contains
;       the address to which control is transferred). On entry to this
;       routine, all registers (except the PC, of course) and the stack are
;       restored to be as they were on entry to the undefined instruction
;       handler.
;
;   (d) If the instruction is a defined FPA instruction, it will be emulated
;       or, in the case of the FPASC only, appropriate fix-up action may be
;       taken to deal with an imprecise exception associated with some
;       earlier instruction. Control will then be returned to the point just
;       after or just before the instruction that bounced to the FPASC/FPE,
;       respectively.
;
; UndefHandlerConvention = "BranchTable"
; --------------------------------------
;   In this case, other parts of the system are supposed to supply the first
;   level of undefined instruction handling, then hand control to the
;   FPASC/FPE's undefined instruction handlers or another coprocessor's
;   undefined instruction handlers based on the coprocessor number. Because
;   the FPA occupies two coprocessor number slots (1 and 2), this code will
;   have two undefined instruction handlers installed at any one time.
;
;   This first level of undefined instruction handling should be roughly as
;   follows:
;
;     26-bit code                32-bit code                Comments
;     -------------------------- -------------------------- ----------------
;     SUB    R13,R13,#16*4       SUB    R13,R13,#16*4       Put user regs on
;     STMIA  R13,{R0-R14}^       STMIA  R13,{R0-R14}^        stack
;     STR    R14,[R13,#15*4]     STR    R14,[R13,#15*4]     And return link
;     MOV    R12,R13             MOV    R12,R13             Stacked regs ptr
;                                MRS    R10,CPSR            Get CPSR and
;                                MRS    R9,SPSR              SPSR and
;                                STMFD  R13!,{R9,R10}        preserve them
;                                TST    R9,#&20             Was this Thumb?  **KJB**
;                                BNE    NotCoprocessor      Can't be coproc.
;     TST    R14,#&3             TST    R9,#&F              Is caller in
;                                                            user mode?
;     SUB    R9,R14,#4           SUB    R9,R14,#4           Point at
;     BIC    R9,R9,#&FC000003                                instruction
;     LDREQT R11,[R9]            LDREQT R11,[R9]            Get instruction
;     LDRNE  R11,[R9]            LDRNE  R11,[R9]             in right mode
;     AND    R9,R11,#&F000000                               **Get opcode
;     TEQ    R9,#&F000000                                   **Is it a SWI?
;     BEQ    DealWithARM2SWIs                               **(ARM2 bug fix)
;     TST    R11,#&8000000       TST    R11,#&8000000       Coproc or undef?
;     ANDNE  R10,R11,#&F00       ANDNE  R10,R11,#&F00       Get coproc. no.
;     ADRNE  R9,BranchTable      ADRNE  R9,BranchTable      Do table-driven
;     LDRNE  R15,[R9,R10,LSR#6]  LDRNE  R15,[R9,R10,LSR#6]   branch
;   NotCoprocessor             NotCoprocessor                              **KJB**
;     ...                        ...                        Code to handle
;     ...                        ...                         a non-coproc.
;     ...                        ...                         undef. instr.
;
;   where "BranchTable" is a block of 16 words containing the addresses of
;   the correct handlers for coprocessors 0 to 15 respectively. Note that
;   the test whether the instruction is a coprocessor instruction or
;   undefined relies on the fact that all coprocessor instructions have bit
;   27 set, and all non-coprocessor undefined instructions have bit 27
;   clear.
;
;   The three lines marked "**" above and the code at "DealWithARM2SWIs" are
;   only needed if the code needs to handle ARM2s, since the bug allowing
;   SWIs to enter the undefined instruction trap is only present in ARM2s.
;   It is therefore not relevant to 32-bit code. See ARM Ltd application
;   note A001 "Notes for ARM Code Writers" for further details. (See also
;   the description of the "ARM2Safe" assembly time variable above.)
;
;   This code need not be adhered to absolutely rigidly, but it is necessary
;   that the stack, the processor mode and registers R11-R14 are *exactly*
;   what the above code would produce: if the handler is capable of dealing
;   with the instruction, it will return directly to the code containing the
;   floating point instruction concerned, which requires it to be able to
;   completely undo the effects of the above code. Registers R0-R10 may
;   contain any values.
;
;   It is also important that IRQs should *not* have been enabled during
;   this code - not even enabled and then re-disabled. The 'core_abort' call
;   documented below may not work correctly if an interrupt is allowed to
;   occur during this period.
;
;   Each of the coprocessor 1 and 2 instruction handlers branched to via
;   "BranchTable" will then take one of three courses of action, depending
;   on what the instruction is and, in the case of the FPASC, what the state
;   of the FPA is:
;
;   (a) In some circumstances, the floating point system may decide that
;       there is something badly wrong with its hardware and/or software
;       state. This is treated exactly the same way as for the "StandAlone"
;       case, documented above.
;
;   (b) If the instruction is an undefined FPA instruction, control is
;       passed to the routine indirectly addressed by the global workspace
;       variable "NextHandler1" or "NextHandler2" (depending on which
;       coprocessor is involved) with the stack, the processor mode and
;       registers R11-R14 restored to be as they were on branching through
;       "BranchTable". (In other words, "NextHandler1" or "NextHandler2"
;       contains an address; the word at that address contains the address
;       of the routine in question.)
;
;   (c) If the instruction is a defined FPA instruction, it will be emulated
;       or, in the case of the FPASC only, appropriate fix-up action may be
;       taken to deal with an imprecise exception associated with some
;       earlier instruction. Control will then be returned to the point just
;       after or just before the instruction that bounced to the FPASC/FPE,
;       respectively. Note that this return of control needs to know how to
;       unwind the stack, restore the registers, etc. (This is why it is
;       important that the first level of undefined instruction handling
;       should conform to the code above.)
;
; The "StandAlone" option is the most efficient for transferring control to
; the floating point undefined instruction handlers when the instruction
; concerned *is* a floating point instruction. It achieves this at the
; expense of not being very efficient at all when dealing with other
; coprocessor instructions, and it will only be efficient if the undefined
; instruction handlers are installed in the right order. It is basically
; intended for single coprocessor systems, or systems in which floating
; point performance is far more important than that of any other coprocessor
; instructions.
;
; The "BranchTable" option is the right one to produce reasonably efficient
; performance from all coprocessor instructions in a system that uses
; multiple coprocessors.
;
; The following checks are to ensure that the code given above is correct.

        ASSERT  LR = R14
        ASSERT  Rsp = R13
        ASSERT  Rfp = R12
        ASSERT  Rins = R11
        ASSERT  Rwp = R10
        ASSERT  Rtmp2 = R9
                      
; Stack and frame considerations, processor modes, re-entrancy, etc.
; ==================================================================
;
; The stack used by this code depends on whether it has been assembled as
; 26-bit or 32-bit code. If 26-bit, it uses the supervisor stack, pointed to
; by R13_svc. If 32-bit, it uses the undefined instruction stack, pointed to
; by R13_undef. In both cases, the stack must be a Full Descending stack.
;
; When floating point code is executed from outside the floating point
; system itself, there must be at least 512 bytes of free memory below the
; stack pointer. This is sufficient for all internal purposes within the
; FPASC/FPE, including recursive entry from itself as a result of an
; internal floating point calculation while emulating an instruction. (The
; possible depth of such recursion is very limited, due to the fact that the
; internal floating point instructions are always a lot "simpler" than the
; instruction being emulated.)
;
; The FPASC/FPE does its own processing in the mode the processor naturally
; enters on taking an undefined instruction trap - i.e. Supervisor26 mode if
; assembled for a 26-bit ARM, Undefined32 mode if assembled for a 32-bit
; ARM. It will handle floating point instructions executed in most modes
; correctly, though with some limitations:
;
; * It will not handle floating point instructions executed in its own mode
;   (i.e. Supervisor26 for 26-bit code, Undefined32 for 32-bit code)
;   correctly if they use R13 or R14 (i.e. the mode-dependent registers) in
;   any way.
;
; * It will not handle floating point instructions executed in FIQ mode
;   correctly;
;
; The restriction about the use of R14 in its own mode is necessary, since
; the processor destroys its value on entry to the undefined instruction
; handler. The restriction about the use of R13 in its own mode could
; probably be programmed around, but this is very messy and would involve
; doing things like block moves of the stack contents: it doesn't seem
; worthwhile!
;
; The restriction about not working in FIQ mode allows the test as to
; whether a register is mode-dependent to be simplified to "R13 and R14 are
; mode-dependent, the rest are not". Obviously, a more complicated rule
; could be used: it doesn't seem worthwhile at present, though, since
; executing floating point code (or indeed any code that can take a software
; trap) in FIQ mode is almost a contradiction in terms!
;
; There are other possible sources of recursive entry to the FPASC/FPE
; besides the possibility of it issuing them itself - these include:
;
;   * A floating point trap handler which executes floating point
;     instructions itself;
;
;   * An interrupt or other machine trap handler that, directly or
;     indirectly, causes other floating point instructions to be executed -
;     e.g. by swapping in another floating point process.
;
; In each case, it is the responsibility of the veneer and/or other parts of
; the operating system to ensure that the stack has sufficient space on it
; before the floating point code is executed. How it does so may of course
; vary from case to case: e.g. the trap handler might perform a stack limit
; check plus a possible error or stack extension, while the process switch
; would do so simply by switching to that process's stack and floating point
; context.
;
; Assuming the stack(s) and the floating point context(s) are handled
; correctly, the code is fully re-entrant.
;
; It is also important in some cases that it should be possible to abort
; some partially complete floating point processing. Some examples:
;
;   * If an invalid address is given to an emulated LDF, STF, LFM or SFM
;     instruction, it will result in an address exception or data abort
;     occurring on a load or store instruction within the FPASC/FPE. Had the
;     address merely been that of a swapped-out piece of store, a virtual
;     memory system could simply swap it in, take other standard remedial
;     action and return to the offending instruction. However, since the
;     address is actually invalid, this is not possible: typically, what is
;     then wanted is that processing of the original LDF, STF, LFM or SFM
;     should be abandoned and that some sort of error handler should be
;     invoked, with the register values, etc., appropriate to the LDF, STF,
;     LFM or SFM being made available to the error handler - not whatever
;     values the FPASC/FPE had in the registers at the time of the internal
;     load or store instruction!
;
;   * If some sort of asynchronous signal is raised for a process while it
;     is swapped out in the middle of some floating point processing, it may
;     be important that you should be able to abandon the partially complete
;     floating point processing.
;
;   * If "core_loadcontext" is used to modify the values in a floating point
;     context, any floating point processing associated with the old values
;     in that context must be aborted. Failure to do this can result in all
;     sorts of confusion within the FPASC/FPE - e.g. exceptions occurring on
;     internal operations which simply shouldn't be able to occur and which
;     therefore haven't been catered for.
;
;   * Some types of floating point exception handlers (e.g. Unix signals)
;     don't have an IEEE-type trap handler interface, but instead want to
;     look at the register values, etc., at the time the floating point
;     exception was detected. Again, these shouldn't be the values that the
;     FPASC/FPE happens to have in the registers when the veneer trap
;     handler code is called.
;
; When floating point processing is to be abandoned, three important things
; may be required:
;
;   * Any pending exception must be cleared. A pending exception is one that
;     has been detected by the hardware, but has not yet caused the
;     undefined instruction vector to be entered. Note that if you're doing
;     something like "core_loadcontext", this should be done even if there
;     is no obvious floating point processing going on at the time. Also
;     note that since there may be a pending exception on an internal
;     calculation within the floating point system, it should also be done
;     when there *is* some floating point processing going on at the time.
;       Finally, note that when a context is deactivated, any pending
;     exception for it is stored away without causing the undefined
;     instruction vector to be entered at the time: the actual processing
;     will occur later. So it is possible for inactive contexts to contain
;     pending exceptions, and not just for the currently active context.
;
;   * Any floating point processing that is currently going on should be
;     abandoned. This means (a) that a suitable new value for the PC is
;     required; (b) that any values put on the stack by the FPASC/FPE should
;     be discarded; (c) that the values in the floating point context
;     concerned should be made consistent with there being no current
;     floating point processing.
;
;   * The register values at the time that the exception occurred must be
;     made available.
;
; To implement this, the floating point system keeps a "frame pointer"
; register (R12) as well as the stack pointer in R13. The first thing done
; on entry to an undefined instruction handler (either by the code given
; above if UndefHandlerConvention = "BranchTable", or by the entry sequence
; of the FPASC/FPE itself) is to set up a stack frame. This is pointed to by
; R12, and has the following format:
;
;   [R12,#-8]: (for 32-bit code only) Value of SPSR_undef immediately after
;              entry to the undefined instruction handler - i.e. value of
;              CPSR before entry to the undefined instruction handler;
;   [R12,#-4]: (for 32-bit code only) Value of CPSR immediately after entry
;              to the undefined instruction handler;
;   [R12,#0]:  Value of user R0 immediately after entry to the undefined
;              instruction handler;
;   [R12,#4]:  Value of user R1 immediately after entry to the undefined
;              instruction handler;
;   [R12,#8]:  Value of user R2 immediately after entry to the undefined
;              instruction handler;
;   [R12,#12]: Value of user R3 immediately after entry to the undefined
;              instruction handler;
;   :          :
;   :          :
;   :          :
;   [R12,#52]: Value of user R13 immediately before entry to the undefined
;              instruction handler;
;   [R12,#56]: Value of user R14 immediately before entry to the undefined
;              instruction handler;
;   [R12,#60]: The return link from this undefined instruction call,
;              including the PSR bits for 26-bit code; see below for more
;              details of this;
;   [R12,#64]: This is the location pointed to by the stack pointer (R13_svc
;              in 26-bit code, R13_undef in 32-bit code) before entry to the
;              undefined instruction handler.
;
; Details of the return link at [R12,#60]: if this is 26-bit code, it
; includes the pre-entry values of the PSR bits. The PC part of the return
; link is the return address, which is normally simply the value put in R14
; by the undefined instruction trap on the ARM. There is however one
; exception to this: if the instruction concerned is a floating point
; instruction, and the FPASC/FPE has determined that it has been bounced by
; the hardware because of an imprecise exception caused by some earlier
; instruction, it will be 4 less than the value delivered to R14 by the ARM.
; This is because the return from such an exception should retry the
; instruction that actually bounced, not resume after it.
;
; Note: this stack frame structure preserves both the pre-entry and the
; post-entry CPSRs for 32-bit code, but only the pre-entry PSR bits for
; 26-bit code. This is because all 26-bit PSR bits are allocated and the
; exact effect of entering the undefined instruction trap in 26-bit code is
; known: the post-entry PSR is equal to the pre-entry PSR with the two mode
; bits and the I bit forced to 1s. On the other hand, not all 32-bit CPSR
; bits are allocated and the effect of future processor developments on what
; the undefined instruction trap does is not known: this makes a similar
; reconstruction technique a bad idea.
;
; This standard entry sequence does not affect the floating point register
; values, so F0-F7 and the FPSR are as they were on entry to the undefined
; instruction trap. It should be noted, though, that hardware
; implementations may have strange values in them at this point: e.g. the
; FPA10 hardware will generally have a small normalised number in the
; destination register of an instruction which has overflowed.
;
; It also does not affect the values of R13 and R14 in modes other than that
; in which it is executed, so entry values of things like R13_irq can be
; obtained if desired by changing mode and accessing the register.
;
; During execution of the instruction, the FPASC/FPE will find it necessary
; to produce values to be returned to the caller. These include (a) integer
; values returned by instructions like FIX; (b) condition codes returned by
; instructions like CMF; (c) write-back values of integer registers produced
; by LDFs, STFs, LFMs and SFMs; (d) floating point results. It does these as
; follows:
;
; * Integer results for user or mode-independent registers replace the
;   appropriate value in the stack frame.
;
; * Integer results for non-user mode-dependent registers are put directly
;   into the register concerned, by changing to the appropriate mode,
;   writing the register and changing mode back again. (By the way,
;   interrupts are disabled during this sequence to prevent weird processor
;   states being seen!)
;
; * Condition code results replace the appropriate PSR bits in [R12,#60] in
;   26-bit code, or in [R12,#-8] in 32-bit code.
;
; * Floating point results are written to the appropriate floating point
;   register.
;
; As stated above, during its internal processing of some of the more
; complex floating point instructions, the floating point system may do
; recursive floating point calculations, producing variant values of the
; FPSR and/or F0-F7. This will be tidied up before the rest of the system
; can see it in most circumstances (e.g. traps are never enabled in the
; recursive floating point contexts, so trap handlers are always called from
; the outermost floating point context), but obviously this can't really be
; the case for interrupts or unexpected data aborts. The following will be
; true for each type of exit from the FPASC/FPE to the rest of the system:
;
;   Normal return: all updates for the instruction concerned have been done
;   and transferred back to "real" processor state.
;
;   Return to "NextHandler*" routine: frame, floating point registers and
;   other mode registers unchanged from entry.
;
;   Entry to floating point trap handler: frame, floating point registers
;   and other mode registers unchanged from entry.
;
;   Reset trap entry: all state may be lost!
;
;   SWI traps and undefined instruction traps: other than recursive floating
;   point instructions, these do not occur.
;
;   Data aborts and address exceptions caused by attempts to access the
;   memory addressed by an LDF, STF, LFM or SFM instruction that is being
;   emulated: if the instruction concerned does base register write-back,
;   the write-back will have occurred in the frame or other mode registers,
;   and memory or the floating point registers may be updated for the part
;   of the transfer that has already occurred.
;
;   Data abort traps may occur for other reasons, and prefetch traps may
;   occur, if the stack, the floating point workspace, the active floating
;   point context or the floating point code are not locked into memory: if
;   this is the case, nothing can be guaranteed about the frame - not even
;   that R12 points to it. Equally, though, a virtual memory system
;   shouldn't need to know anything about the floating point context to deal
;   with such an abort.
;
;   Address exceptions should only occur for other reasons if an error has
;   been made in setting up the stack pointer, floating point workspace
;   pointer or floating point context pointer.
;
;   IRQ and FIQ traps: R12 will point to *some* floating point frame, but it
;   may well be one related to a recursive floating point instruction
;   generated internally by the FPASC/FPE. Furthermore, floating point
;   registers may be being used for internal purposes, and values in the
;   frame, other mode registers and/or the floating point registers may or
;   may not have been have been updated for the external floating point
;   instruction being emulated... in short, the world may be in a mess!
;
; The FPASC/FPE does however supply a general mechanism for sorting out the
; sort of mess that can occur here, implemented by the following call:
;
; core_abort
; ----------
;   This call cancels any pending exception and aborts any incomplete
;   floating point processing associated with a given floating point
;   context. It returns the frame pointer associated with the original
;   non-recursive entry to the FPASC/FPE undefined instruction handler, and
;   restores any floating point registers that have been used for internal
;   calculations. It does *not* restore contents of this original frame, of
;   other mode registers or of floating point registers that have been
;   updated as a result of the partial processing of the original
;   non-recursive floating point instruction.
;
;   Entry: R0 = R12 value associated with the context (only relevant if R1
;            indicates a PC value inside the floating point undefined
;            instruction handlers);
;          R1 = PC value associated with the context (e.g. the PC value the
;            IRQ handler would normally return to);
;          R10 = context pointer;
;          R13 = stack pointer;
;          R14 = return link.
;
;   Exit:  R0 = unchanged if entry value of R1 indicated a PC value outside
;            the floating point undefined instruction handlers; pointer to
;            frame associated with original non-recursive entry to the
;            floating point system if R1 indicated a PC value inside the
;            floating point undefined instruction handlers;
;          R1-R7 and R14 may be corrupt;
;          All other registers preserved.
;
; 'core_abort' detects whether an entry to the floating point system is
; recursive or not by detecting whether its return link lies within the
; address range of the FPASC/FPE undefined instruction handlers. The two
; labels it uses for this purpose are also available, and may be wanted by
; some veneers:
;
;   FP_UndefHandlers_Start points to the first word of the FPASC/FPE
;   undefined instruction handlers.
;
;   FP_UndefHandlers_End points to the word immediately following the last
;   word of the FPASC/FPE undefined instruction handlers.
;
; Three words of data are put before each of these labels, to ensure that
; prefetching doesn't cause the PC to lie after the label when the
; instruction being executed lies before it.
;
; Finally, note that if multiple contexts are supported, either because
; MultipleContexts = {TRUE} or because the rest of the system is doing its
; own context switching, it is important that each context has its own
; undefined instruction/supervisor stack. This is probably automatic in a
; 26-bit system, where each process will probably have its own supervisor
; stack anyway. It needs to be handled correctly in a 32-bit system.
;
; Exception: this doesn't matter if there is no possibility of a context
; switch happening while the FPASC/FPE is processing an instruction - e.g.
; if interrupts are kept disabled until the FPASC/FPE finally returns to the
; instruction stream, or if process switches happen on a purely co-operative
; basis.

; Undefined instruction handler exit
; ==================================
;
; Most of this is described above under "Undefined instruction handler
; entry", but there is one additional point: the veneer is given a chance to
; intervene during the exit sequence. There are two purposes for this:
;
; (1) The veneer may want to take a chance to do other work. E.g. in a
;     system where timing interrupts are handled in a "record the fact and
;     return" way while undefined instruction processing is occurring, the
;     system may want to take note of the recorded interrupts at this point.
;     (Otherwise, floating point-intensive processes would hog the CPU.)
;
; (2) Floating point emulators may contain an optimisation whereby they have
;     a look at the next instruction after the one they've just executed and
;     avoid the cost of exiting and immediately re-entering the FPE if it is
;     also a floating point instruction. Depending on just how virtual
;     memory and/or other system facilities are implemented, it may be
;     undesirable to do this: for instance, if the next instruction is
;     across a page boundary, trying to look at it might cause a data abort
;     at a point where the system is not expecting to have to deal with one.
;
; Accordingly, the veneer is expected to supply a macro to the core which
; does any exit processing desired. This macro will be used by the core
; whenever a floating point instruction has just completed processing. Note
; that it will *not* be used when the floating point system is exited in
; any of the other standard ways - i.e. if the undefined instruction is
; passed on via "NextHandler*", if it turns out to be a SWI that has
; incorrectly entered the undefined instruction vector on an ARM2, or if it
; results in a branch to 'veneer_corefaulty' or 'veneer_coredisabled'.
;
; Furthermore, note that this macro *is* invoked when an internal recursive
; floating point instruction exits as well as for external floating point
; instructions. If you only want to do some part of the exit processing for
; external floating point instructions, range-check the instruction address
; supplied against the limits of the floating point undefined instruction
; handlers. (I.e. against the symbols 'FP_UndefHandlers_Start' and
; 'FP_UndefHandlers_End' defined above.)
;
; This macro must be defined to have the following prototype line:
;
;   $label FPInstrDone $opt
;
; "$label" is simply the label to be associated with the first instruction
; of the code concerned. "$opt" is a non-null string if the core is
; intending to use the optimisation described under (2) above, a null string
; if it is not.
;
; The macro is always entered with R13 holding the stack pointer and R12
; pointing to the entry frame associated with the instruction which has just
; completed processing: all updates to this stack frame, other mode
; registers and floating point registers required by the instruction being
; emulated will have been done. In addition, if "$opt" is non-null, R9 will
; contain the address of the instruction which the core is planning to look
; at.
;
; The macro may return in one of two ways:
;
; (1) Fall through to its end with R8-R13, the processor mode and the stack
;     contents unchanged. If "$opt" is a non-null string, it must also set
;     the Z flag appropriately: Z=1 (i.e. the EQ condition) means that it is
;     telling the core *not* to use the optimisation, while Z=0 (the NE
;     condition) means that it is allowing the core to use the optimisation.
;
; (2) It may do all the code associated with returning to the original
;     caller itself, not returning to the point from which it was called.
;
; Checks that this interface is documented correctly:

        ASSERT  Rtmp2 = R9
        ASSERT  Rsp = R13
        ASSERT  Rfp = R12
        ASSERT  (Rins >= R8) :LAND: (Rins <= R13)
        ASSERT  (Rwp >= R8) :LAND: (Rwp <= R13)

; Workspace and context considerations
; ====================================
;
; The FPASC/FPE requires workspace for a number of purposes, and may need to
; be able to support multiple floating point contexts. Some of the needs for
; workspace are system-wide: e.g. the addresses of the routines to do
; further undefined instruction handling, to which control is transferred
; when the FPASC/FPE decides the instruction is not for it. Some of them are
; context-dependent: e.g. each FPE context needs workspace to hold its set
; of floating point registers, and each inactive FPASC context needs
; workspace for its set of saved register values (the currently active FPASC
; context's register values are of course in the FPA itself).
;
; There are two main options for how the workspace is organised, controlled
; by an assembly time logical variable called MultipleContexts. This
; variable must be defined and set by the veneer "options" file. Whichever
; value it takes, the veneer must provide code to find the global workspace:
; it does so by having the veneer "start" file define a macro called
; "AdrWS". The prototype line for this macro should be:
;
;   $label  AdrWS   $reg
;
; and it should generate code (labelled by $label) to set the specified
; register to a pointer to the main workspace.
;
; Note that this macro is called in many places, including fairly early in
; the undefined instruction entry sequence: it may only assume the
; following:
;
; * That the processor mode is Supervisor26 or Undefined32, depending on
;   whether this is assembled as 26-bit or 32-bit code;
; * That R13 points to a Full Descending stack.
;
; The most usual way to find this workspace is simply to load from a fixed
; location in a piece of global operating system workspace, then possibly
; follow a chain of pointers to find the floating point workspace.
;
; If MultipleContexts = {FALSE}, the pointer loaded by AdrWS must point to a
; piece of workspace of length "WorkspaceLength" (a symbol exported from the
; core to the veneer). This consists of a single floating point context (of
; length "ContextLength", another such symbol), followed by the global
; workspace variables. In this case, the pointer returned by the AdrWS macro
; is used both as a pointer to the global workspace and as one to the
; context workspace.
;
; If MultipleContexts = {TRUE}, this pointer points to a piece of workspace
; of length "WorkspaceLength", which only contains the global workspace
; variables. Among these is a variable called "CurrentContext": this
; contains a pointer to the current context workspace (which must be of
; length "ContextLength"), or 0 to indicate that there is no current
; context. Note that "WorkspaceLength" does not take the same value in this
; case as it does when MultipleContexts = {FALSE}.
;
; The veneer can add to the list of variables in the global workspace by
; means of its "globalws" source file and to the list of variables in a
; floating point context by means of its "ctxtws" file. These files should
; consist only of # directives (to allocate variables) plus any associated
; comments and definitions (e.g. by EQU directives): in particular, they
; should *not* generate any real code.
;
; The veneer can make the following calls to the core to handle the global
; and context workspace:
;
; core_initws
; -----------
;   This call initialises the global workspace, including the context it
;   contains if MultipleContexts = {FALSE}. If MultipleContexts = {TRUE},
;   the CurrentContext variable is set to indicate that there is no current
;   floating point context.
;     Part of the initialisation is to determine what floating point
;   hardware is present and to choose (but not install) the correct
;   undefined instruction handlers accordingly. The call returns the SysId
;   of the hardware found or -1 if no hardware is found: this allows the
;   veneer e.g. to produce error or warning messages. (It should definitely
;   produce an error if it is an FPASC-only version of the code and the FPA
;   hardware is not present; it may also want to produce inefficiency
;   warnings e.g. if it is an FPE-only version and some floating point
;   hardware is found, or if it finds hardware other than the FPA. The core
;   file "src.core.fpadefs" defines a symbol SysID_FPA which is equal to the
;   FPA's SysId - i.e. &81).
;     Veneer-defined parts of the workspace are not initialised by this
;   call: the veneer is expected to handle this task itself.
;
;   Entry: R1 = address to be stored in "NextHandler" or "NextHandler1" (if
;            UndefHandlerConvention = "StandAlone" or "BranchTable"
;            respectively);
;          R2 = address to be stored in "NextHandler2" (if
;            UndefHandlerConvention = "BranchTable");
;          R10 = pointer to workspace;
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  R0 = SysId of hardware found (in bottom byte), or -1 if no
;            hardware found;
;          All other registers preserved.
;
; core_initcontext
; ----------------
;   This call should be made to initialise or re-initialise a floating point
;   context. It puts the context into a standard starting state, in which:
;
;     All floating point registers contain either signalling NaNs or zeros -
;     which is determined by an assembly-time string variable called
;     "FPRegInitValue", which should be created and set by the veneer
;     "options" file. It may take the values "SigNaN" and "Zero".
;
;     The bottom 24 bits of the FPSR are set from the bottom 24 bits of an
;     assembly time arithmetic variable called "FPSRInitValue", which should
;     be created and set by the veneer "options" file. An error will be
;     generated if any of the FPSR reserved bits are non-zero in this value.
;
;     (Note that I do not allow the floating point registers to be set to
;     any desired bit pattern, but just provide a set of options. The reason
;     for this is that specifying the bit patterns would require the veneer
;     to know the internal floating point format being used by the core.)
;
;   This call may also initialise other less obvious context variables. To
;   initialise a floating point context with other registers and/or FPSR
;   values, use 'core_initcontext' and then load the desired values with LDF
;   and/or WFS instructions.
;     If MultipleContexts = {FALSE}, this call is made automatically when
;   'core_initws' is called: it may however still be required if it becomes
;   necessary to re-initialise the context.
;     Note that this call should not be made on a context that is currently
;   active. If it is necessary to re-initialise the currently active
;   context, make it no longer active (by using 'core_activatecontext' or
;   'core_changecontext'), then re-initialise it, then reactivate it.
;     This call does not initialise any veneer-defined variables in a
;   floating point context: the veneer is expected to handle this task
;   itself.
;
;   Entry: R10 = pointer to context;
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  All registers preserved.
;
; core_changecontext
; ------------------
;   This call is the standard way of changing context if MultipleContexts =
;   {TRUE}. A floating point context pointer is passed to it as an argument.
;   It switches over to using this as the current context and returns a
;   pointer to the previous floating point context.
;     Either pointer may be zero: this indicates that the FPASC/FPE
;   was/should be in a completely inactive state, with no current floating
;   point context, its undefined instruction handlers not installed, etc.
;   This option is mainly for use during initialisation and finalisation: in
;   particular, the FPASC/FPE will be in this state from the time that
;   'core_initws' is called until the first call to 'core_changecontext'.
;     Note that this call is available even if MultipleContexts = {FALSE},
;   though it is of limited use then, since the only legitimate argument
;   values are 0 and the standard workspace/context pointer. 
;     Note that it is *not* legitimate in MultipleContexts = {TRUE} code to
;   change the context simply by changing the global workspace variable
;   'CurrentContext'. This is because some system-dependent housekeeping may be
;   necessary at this point - e.g. in the case of the FPASC, the FPA's registers
;   need to be preserved in the old context and then loaded up from the new
;   context.
;
;   Entry: R10 = pointer to context (or 0 to indicate no current context);
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  R0 is the old context pointer (or 0 to indicate no old context);
;          All other registers preserved.
;
; core_shutdown
; -------------
;   This call shuts down the FPASC/FPE world entirely, doing such things as
;   inactivating the current context, returning the hardware to a disabled
;   state, etc.
;
;   Entry: R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  All registers preserved.
;
; To summarise the calls that need to be made:
;
; * If MultipleContexts = {FALSE}, a call to 'core_initws' followed by one
;   to 'core_changecontext' will start up the entire world. One to
;   'core_shutdown' will close it down again.
;
; * If MultipleContexts = {TRUE}, a call to 'core_initws' will start up the
;   world with no currently active floating point context. Floating point
;   contexts can be initialised with 'core_initcontext' and made into the
;   currently active context with 'core_changecontext'. A call to
;   'core_shutdown' will close the whole system down, including deactivating
;   the current context if there is one.
;
; The MultipleContexts = {FALSE} option is simplest and fastest, and can be
; used even if you have multiple floating point contexts, provided you do
; the context-switching work yourself. However, if you do this, the overall
; result will probably be slower than using MultipleContexts = {TRUE}. The
; main reasons for supplying this option are (a) to allow the FPASC/FPE to
; be installed as simply as possible in a genuinely single-threaded system;
; (b) to make it as easy as possible to make the code compatible with old
; systems which effectively adopt this solution (e.g. old RISC OS
; FPEmulators).
;
; The MultipleContexts = {TRUE} option is the recommended one for new
; systems which have multiple floating point contexts: it will generally
; perform floating point context switches faster than the alternative,
; especially with the FPE.
;
; It may sometimes be desirable to split the two components of a
; 'core_changecontext' call - i.e. deactivating the old context and activating
; the new one. In particular, this may be the case in code using the
; MultipleContexts = {FALSE} option and doing its own context switching: a
; good way to do this is to deactivate the one and only "real" context, copy
; it away, copy in a previously saved context, then activate the new context.
;
; To make this possible, the following two calls are supplied:
;
; core_deactivatecontext
; ----------------------
;   This call deactivates the current floating point context, ensuring that
;   everything about the context is held in memory. It returns the address
;   of the current floating point context, or zero if the FPASC/FPE is in
;   the completely disabled state described above under
;   'core_changecontext'. (In this latter case, it will of course not have
;   done anything other than returning zero.)
;
;   Entry: R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  R0 is the current context pointer (or 0 to indicate no current
;            context);
;          All other registers preserved.
;
; core_activatecontext
; --------------------
;   This is the call that will actually install a suitable undefined
;   instruction handler, depending on the state of the specified context,
;   what undefined instruction handlers are available and the hardware that
;   'core_initws' found to be present. To do this, it makes use of the
;   'veneer_newhandlers' and 'veneer_restorehandlers' calls documented below.
;     This call also actually enables the FPA if it is present and wanted;
;   in this case, it also loads the context into the FPA.
;     The argument may also be zero, to indicate that the FPASC/FPE should
;   enter the completely inactive state described above under
;   'core_changecontext'.
;
;   Entry: R10 = pointer to context (or 0 to indicate no current context);
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  All registers preserved.
;
; Note that these calls should be made in pairs, with a
; 'core_activatecontext' call following each 'core_deactivatecontext' call,
; Also, you should not allow any floating point instructions to be executed
; between a 'core_deactivatecontext' call and the following
; 'core_activatecontext' call, since executing a floating point instruction
; will re-activate the context and mean that the memory context may no
; longer be up-to-date. Similarly, you should not call 'core_disable' or
; 'core_enable' between 'core_deactivatecontext' and 'core_activatecontext':
; they are also liable to re-activate the current context.
;
; Exception: it is legitimate to leave out the call to
; 'core_deactivatecontext' in the above sequence, but only if the old context
; is never going to be used again: it is likely to be in an inconsistent
; state if the 'core_deactivatecontext' call is omitted.
;
; The contents of a floating point context should be regarded as a "black
; box": software outside the floating point system itself should neither
; assume that it knows how to interpret them, nor alter them directly.
; However, the core does provide some facilities to allow inspection and
; modification of a floating point context, as follows:
;
; core_savecontext
; ----------------
;   This call saves the register and FPSR values held in a floating point
;   context to a specified 25-word area of memory, in the following format:
;
;     Byte offset   Value
;     ------------------------------------------------------------------
;          0        FPSR value
;          4        F0 value, as an extended precision number
;         16        F1 value, as an extended precision number
;         28        F2 value, as an extended precision number
;         40        F3 value, as an extended precision number
;         52        F4 value, as an extended precision number
;         64        F5 value, as an extended precision number
;         76        F6 value, as an extended precision number
;         88        F7 value, as an extended precision number
;
;   Note that it does this *without* processing any pending exceptions
;   associated with the context, or completing the processing of any
;   exception which is currently being processed. The routine returns a hint
;   about whether there is a pending or incompletely processed exception
;   associated with the context: if there is, the values returned may be
;   rather odd and should *not* be relied upon as an accurate reflection of
;   reality. For instance, if the FPA has a pending overflow exception, the
;   destination register of the instruction concerned will often read as
;   containing a very small number!
;
;   Entry: R0 points to the 25-word area described above;
;          R1 = PC value associated with the context;
;          R10 points to the context;
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  R0 contains a non-zero value if there is a pending or
;            incompletely processed exception associated with the context,
;            zero if there isn't;
;          R14 may be corrupt;
;          All other registers preserved.
;
; core_loadcontext
; ----------------
;   This call allows the veneer to load a floating point context with a
;   specified set of register and FPSR values, destroying any pending or
;   incompletely processed exception in the process.
;     This call should almost always be preceded by one to 'core_abort': you
;   can create chaos in the floating point system by calling
;   'core_loadcontext' while there is a pending or incompletely processed
;   exception.
;
;   Entry: R0 points to a 25-word area containing the new FPSR and register
;            values, as described under 'core_savecontext' above;
;          R10 = pointer to context;
;          R13 = stack pointer;
;          R14 = return link.
;
;   Exit:  R14 may be corrupt;
;          All other registers preserved.
;
; To allow the above calls to be implemented, the veneer must provide the
; following low-level routines to the core:
;
; veneer_newhandlers
; ------------------
;   Install a particular routine or routines as the current undefined
;   instruction handler/coprocessors 1 & 2 handlers.
;
;   Entry: R1 = new undefined instruction handler (if UndefHandlerConvention
;               = "StandAlone") or new coprocessor 1 instruction handler (if
;               UndefHandlerConvention = "BranchTable");
;          R2 = new coprocessor 2 instruction handler (if
;               UndefHandlerConvention = "BranchTable";
;          R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  All registers preserved.
;
;   Note that this routine is usually fairly trivial. It always replaces the
;   existing FPASC/FPE handlers, if any: any chaining of handlers is dealt
;   with by the core_initws routine above.
;
;   Note also that the code of this routine could almost be supplied by the
;   core when UndefHandlerConvention = "StandAlone" - just create and store
;   a branch instruction from location &4 to the specified address, then
;   return. But just in case a particular system wants e.g. to have page 0
;   in ROM or something similar, writing this code is left to the veneer
;   implementor.
;
; veneer_restorehandlers
; ----------------------
;   Remove the currently installed FPASC/FPE handlers, replacing them with
;   whatever was present before the FPASC/FPE was started up. This is used
;   in two sets of circumstances: (a) when closing down the FPASC/FPE; (b)
;   when there is no current context in a MultipleContexts = {TRUE} version
;   of the FPASC/FPE.
;
;   Entry: R13 is the stack pointer;
;          R14 is the return link.
;
;   Exit:  All registers preserved.
;
;   Similar notes apply to this routine as to 'veneer_newhandlers'.
;
; Checks that the above interfaces have been documented correctly:

        ASSERT  Rwp = R10
        ASSERT  Rsp = R13
        ASSERT  LR = R14

; "Disabling" the floating point system
; =====================================
;
; It is possible to temporarily disable the floating point system, in such a
; way that you will get a call-back when an attempt to execute a floating
; point instruction occurs. This can be useful to avoid unnecessary floating
; point context switches when only a few processes are actually using
; floating point.
;
; The following calls should not be made when the current context has been
; deactivated by 'core_deactivatecontext'. Furthermore, if a call to
; 'core_changecontext' or 'core_deactivatecontext' is made while the system
; is disabled, the system will be re-enabled quietly - i.e. without a call
; to 'veneer_coredisabled'.
;
; The following calls are supplied by the core:
;
; core_disable
; ------------
;   When this call is made, the next floating point instruction will not be
;   processed normally, but will cause a call to 'veneer_coredisabled' to
;   occur - see below.
;     This call may be made multiple times without any intervening floating
;   point instructions: this will only result in one call-back being made.
;     Note that this call is system-wide, not associated with any particular
;   context.
;
;   Entry: R13 = stack pointer;
;          R14 = return link;
;
;   Exit:  R0-R7 and R14 may be corrupted;
;          All other registers preserved;
;
; core_enable
; ------------
;   This call cancels the effect of any number of previous calls to
;   'core_disable', returning the system to its normal state.
;     Note that this call is system-wide, not associated with any particular
;   context.
;
;   Entry: R13 = stack pointer;
;          R14 = return link;
;
;   Exit:  R0-R7 and R14 may be corrupted;
;          All other registers preserved;
;
; The veneer must supply the following call:
;
; veneer_coredisabled
; -------------------
;   This call-back is made when an attempt is made to execute a floating
;   point instruction while the floating point system is disabled. The
;   system is automatically re-enabled before the call, as though by a call
;   to 'core_enable': if you want to keep the core disabled, you must call
;   'core_disable' again.
;
;   Entry: R12 is a standard stack frame pointer, with the return value at
;          [R12,#60] pointing before the instruction attempted.
;
;          Processor is in Supervisor26 mode for 26-bit code, Undefined32
;          mode for 32-bit code.
;
;   Exit:  Does not return normally. The usual way to return is to reload
;          everything from the stack frame, causing another attempt to
;          execute the instruction.

; Interrupt considerations
; ========================
;
; When an undefined instruction exception occurs on the ARM, interrupts are
; automatically disabled. The FPASC/FPE core can either be assembled to
; re-enable them fairly quickly, or to leave them disabled for the duration
; of its processing of the instruction. Which of these options is used is
; determined by means of an assembly time logical variable called
; EnableInterrupts, which must be defined and set by the veneer "options"
; file. If EnableInterrupts = {TRUE}, interrupts are re-enabled as soon as
; reasonably possible; if EnableInterrupts = {FALSE}, they are left
; disabled. (This second option increases interrupt latency, in some cases
; by even hundreds of thousands of cycles, but can be useful e.g. if you
; want to make certain the undefined instruction/supervisor stack has
; nothing relating to the FPASC/FPE on it at the time of a process swap.)
;
; Note that when EnableInterrupts = {TRUE}, interrupts are only re-enabled
; if the core identifies the problem as a floating point problem. So they
; are never re-enabled if the core is going to exit via the SWI handler or
; via 'veneer_corefaulty', nor are they re-enabled if 'NextHandler' is
; called because this isn't either a coprocessor 1 or a coprocessor 2
; instruction. For coprocessor 1 or coprocessor 2 instructions passed to
; 'NextHandler*', it is undefined whether interrupts have been re-enabled.
;
; Also, they may not be re-enabled in some circumstances when the problem
; can be dealt with very quickly. E.g. some FPA hardware exceptions simply
; require the support code to immediately retry the instruction concerned:
; these are implemented by simply returning immediately without ever setting
; up the correct return address on the stack or re-enabling interrupts.

; Trap handlers
; =============
;
; If a floating point exception occurs and the corresponding trap enable bit
; is set in the FPSR, a floating point trap occurs. When this happens, the
; core does some processing to determine the nature of the trap and some
; associated diagnostic information, then calls a trap handler provided by
; the veneer.
;
; The following information is made available on all traps:
;
; (1) Enough bits from the instruction that actually caused the exception to
;     allow the operation being performed to be determined, including
;     destination format, rounding mode, etc., where relevant.
;
; (2) Whether this is a precise or imprecise trap. When the SO bit is set in
;     the FPSR, all traps are precise; when it is clear, some may be
;     imprecise.
;
; (3) The address of the instruction at which the exception was detected.
;     For a precise exception, this is the instruction that actually
;     produced the exception; for an imprecise exception, it is some
;     instruction that executed later. (In the case of a loop, it may even
;     be the same instruction, but on a later iteration of the loop!)
;
; (4) Details of the processor state at the point where the exception was
;     detected. Again, this is the state at the time of the offending
;     instruction for a precise exception, but at some later point for an
;     imprecise exception;
;
; (5) The FPSR value, which has *not* been updated for the current exception
;     (though it may have been for an earlier exception associated with the
;     same instruction - e.g. if overflow and inexact occur, with overflow
;     untrapped but inexact trapped, the OFC bit in the FPSR will have been
;     set by the time the inexact trap handler is called, but the IXC bit
;     will still be as it was before the instruction was executed).
;       In some circumstances, the actual FPSR is modified to help with the
;     processing of a floating point instruction in the software. For
;     instance, when an STFP or LDFP is executed, the trap enable bits and
;     some of the cumulative trap bits in the FPSR are cleared to aid in
;     detection and handling of exceptions in the floating point
;     calculations done during the binary <-> decimal conversions concerned.
;     In such circumstances, the FPSR value described above and expected by
;     the user is always replaced in the actual FPSR before the trap handler
;     is entered.
;
; The following information is made available to the invalid operation and
; divide-by-zero traps:
;
; (6) The operand value or values.
;
; The following information is made available to the overflow, underflow
; and inexact traps:
;
; (7) The result value, as defined by the IEEE specification. This means:
;
;     * For an overflow trap, the result value scaled down by a precision-
;       dependent exponent bias (&C0 for single precision, &600 for double
;       precision, &6000 for extended precision), if this is sufficient to
;       bring the result within the destination precision. Otherwise, we say
;       that "massive overflow" has occurred and the result is a quiet NaN.
;       (This can only occur for LDFP or conversions down in precision -
;       including the IEEE-deprecated "arithmetic operation to lower
;       precision than the operands".)
;
;     * For an underflow trap, the result value scaled up by a precision-
;       dependent exponent bias (same values as for overflow above), if this
;       is sufficient to bring the result within the destination precision.
;       Otherwise, we say that "massive underflow" has occurred and the
;       result is a quiet NaN. (This can only occur for LDFP or conversions
;       down in precision - including the IEEE-deprecated "arithmetic
;       operation to lower precision than the operands".)
;
;     * For an inexact trap, the result of the operation, possibly after
;       some earlier overflow or underflow processing has been done.
;
; (8) The direction rounding has changed the result so far. The possible
;     values are "no change so far", "rounded up so far", "rounded down so
;     far" and "direction of rounding so far unknown": the last of these can
;     only occur for the more complicated operations, not for simple
;     arithmetic.
;
; When the trap handler returns, it must always produce:
;
; (A) A result for the operation, in the correct destination format.
;
; (B) A new FPSR value.
;
; (C) For overflow, underflow and inexact traps, a new value of the
;     "direction rounded so far" variable described in (8) above. This is
;     ignored for the inexact trap, but is used after the overflow and
;     underflow traps to determine whether there is also an inexact
;     exception (any value other than "no change so far" means there is
;     one).
;
; In detail, the entry conditions to a trap handler routine are as follows:
;
;   R0 = For inexact on an operation producing a packed or expanded packed
;          result (STFP): the first word of the potential result;
;        For invalid operation on an LDFP: the first word of the operand;
;        Otherwise undefined.
;
;   R1 = For inexact on an operation producing a packed or expanded packed
;          result (STFP): the second word of the potential result;
;        For invalid operation on an LDFP: the second word of the operand;
;        Otherwise undefined.
;
;   R2 = For inexact on an operation producing a packed or expanded packed
;          result (STFP): the third word of the potential result;
;        For invalid operation on an LDFP: the third word of the operand;
;        Otherwise undefined.
;
;   R3 = 0 if this trap is precise; non-zero if it is imprecise - i.e. if
;        the instruction that bounced out to the FPASC/FPE is a later one
;        than the instruction that actually caused the exception.
;
;   R4 = For overflow, underflow and inexact exceptions, the direction the
;        result has been rounded so far:
;                 -1: rounded down in magnitude - i.e. result is closer to
;                     zero than the true mathematical result;
;                  0: rounding has not changed the value of the result;
;                  1: rounded up in magnitude - i.e. result is further from
;                     zero than the true mathematical result;
;          &80000000: rounding so far is in an unknown direction;
;        Undefined for an invalid operation or divide-by-zero exception.
;
;   R6 = For inexact on an operation producing an integer result (FIX): the
;          potential result;
;        For inexact on an operation producing an expanded packed result
;          (STFP with the EP bit set in the FPSR): the fourth word of the
;          potential result;
;        For invalid operation on an LDFP, with the EP bit set in the FPSR:
;          the fourth word of the operand;
;        Otherwise undefined.
;
;   R7 and FPSR = FPSR value as defined in (5) above.
;
;   R11 = Information about the instruction that bounced. The following bits
;        in this register have the same meanings as they do in a floating point
;        instruction:
;          Bit 25 indicates whether the instruction is a CPDT (bit 25 = 0)
;            or a CPDO/CPRT (bit 25 = 1);
;          Bits 23..20 are the corresponding bits from the instruction and
;            identify the particular operation within a group (CPDTs, CPRTs,
;            dyadic CPDOs or monadic CPDOs);
;          Bit 19 is the first precision bit when the instruction is a CPDO
;            or CPRT (i.e. when bit 25 is a 1);
;          Bit 15 indicates whether the instruction is a dyadic CPDO (bit 15
;            = 0) or a monadic CPDO (bit 15 = 1) when bit 25 is a 1 and bit
;            4 is a 0; it also is a precision bit for CPDTs;
;          Bits 11..8 contain the coprocessor number;
;          Bits 7..5 are the second precision bit and the two rounding mode
;            bits when the instruction is a CPDO or CPRT (i.e. when bit 25
;            is a 1);
;          Bit 4 distinguishes CPDOs (bit 4 = 0) from CPRTs (bit 4 = 1) when
;            bit 25 is a 1;
;        All other bits in this word are meaningless, as are these bits in
;        circumstances not described above (e.g. bits 7..4 when bit 25 is a
;        zero). They will often be equal to the corresponding bits from the
;        real instruction, but not always, and the circumstances in which
;        they are the same may change in future.
;
;   R12 = the stack frame pointer, as defined under "Stack and frame
;        considerations, ..." above. Note that the floating point system
;        handles all exceptions arising from floating point instructions it
;        issues itself. This is therefore always the stack frame associated
;        with the original non-recursive entry to the floating point system
;        and it is guaranteed that there is no pending exception on entry to
;        the trap handler. It is therefore legitimate to use
;        'core_loadcontext' and/or to return to the ARM context saved in the
;        frame without a call to 'core_abort'. (Note though that if you use
;        'core_loadcontext' and return from the trap handler via the R14
;        return link, the value you return on the stack will subsequently
;        overwrite the destination register.)
;          The instruction that bounced out to the FPASC/FPE can be located
;        via the return link held at [R12,#60]. If the exception is precise
;        (R3 = 0), this return link points after the instruction concerned,
;        and it can be reasonable either to return to it directly or to
;        return to an address 4 lower: the latter retries the offending
;        instruction. If the exception is imprecise (R3 <> 0), the return
;        link points before the instruction that bounced. Since this
;        instruction has not been executed yet and the exception relates to
;        an earlier instruction, it only really makes sense to return
;        directly to this link.
;
;   R13 = Stack pointer; note that (as stated under "Stack and frame
;        considerations, ..." above), there may not be much stack space
;        remaining. A stack limit check will probably be required at this
;        point, and will certainly be required if the trap handler is to
;        execute any floating point instructions.
;          Floating point parameters are passed on the stack, and the result
;        of the operation should be returned on the stack.
;          When floating point parameters are passed on the stack, they are
;        passed in internal format, and should be loaded via an LFM
;        instruction - i.e. "LFM Fn,1,[R13]" if a single parameter is being
;        passed, or "LFM Fn,2,[R13]" if two parameters are being passed. A
;        single parameter is passed on the stack in the following cases:
;        
;          * For invalid operation or divide-by-zero on a monadic CPDO, a
;            FIX or an STF: the register loaded by "LFM Fn,1,[R13]" will be
;            the instruction operand;
;          * For overflow, underflow or inexact on an operation producing an
;            internal format result or a single or double precision number
;            in memory (all CPDOs, FLTs, STFSs, STFDs and LDFPs - note other
;            LDFs and STFEs don't produce exceptions): the register loaded
;            by "LFM Fn,1,[R13]" will be the result as defined in (7) above,
;            which will be in the correct range for the destination
;            precision of the operation.
;
;        Two parameters are passed on the stack in the following
;        circumstances:
;
;          * For invalid operation or divide-by-zero on a dyadic CPDO or a
;            compare: the first register loaded by "LFM Fn,2,[R13]" (i.e.
;            Fn) is the first operand of the instruction, and the second
;            register loaded (i.e. F(n+1), or F0 if n is 7) is the second
;            operand.
;
;        In addition, the four words at [R13,#0] to [R13,#12] are always
;        available for return of the instruction result (even if the
;        expected result is less than 4 words long): see below for details
;        of this.
;
;   R14 = Return link. (Unless the TrapsCanReturn = {FALSE} optimisation is
;        used - see above.)
;
;   F0-F7 hold appropriate values for the current context, *before*
;   processing of the exception is complete. In general, this means that the
;   destination register of the instruction that caused the exception has
;   *not* been updated for that instruction. (Unlike the situation with the
;   FPSR, where an earlier exception on the same instruction will have been
;   taken into account (see above), the destination register of an
;   instruction is not written until all instruction processing is
;   complete.)
;
;   Processor mode is Supervisor26 if this code was assembled for a 26-bit
;   ARM, Undefined32 if it was assembled for a 32-bit ARM.
;
; Any exceptions that are apparently not covered above are not possible -
; e.g. overflow, underflow or inexact on a compare, or invalid operation on
; a FLT.
;
; If the trap handler wishes to return a result for the trapped operation,
; it should return via the return link in R14, with the following
; conditions:
;
;   The FPSR is updated as appropriate;
;
;   For overflow, underflow and inexact traps, R4 has been updated to
;   contain the new rounding direction (though note this isn't really
;   important for inexact traps); if this is set to contain a value other
;   than -1, 0, 1 or &80000000, it will be taken as meaning "rounded up" if
;   it is positive and "rounded down" if it is negative.
;
;   R12, R13 and F0-F7 must be preserved;
;
;   The 4 words pointed to by the entry and exit value of R13 contain the
;   result being returned for the operation, as a 1-word integer or a
;   single, double, extended, packed or expanded packed precision floating
;   point number, as appropriate for the instruction concerned; when this
;   result is less than 4 words long, it is placed low in this area (so it
;   is always pointed to by R13); note that (unlike entry parameters), the
;   returned value is *never* in internal format;
;
;   R0-R3, R5-R11, R14 and the PSRs may be corrupt, as may R4 for invalid
;   operation and divide-by-zero traps;
;
;   The processor mode must be unchanged from entry.
;
; In the case of an FPA->ARM CPRT with destination R15 (i.e. in particular
; for compare instructions, though there are also some weird cases involving
; FIX, RFS and RFC to R15), the result is an integer. Its top four bits go
; to the N, Z, C and V flags respectively, and the remaining 28 bits will be
; ignored. (One thought: RFS R15 is actually useful: it sets the N flag
; according to whether you've got a hardware or software implementation!)
;
; It is also possible that the trap handler may not want to return a result,
; but instead produce an error, enter a completely different part of the
; application program, or something similar. If this is done and the process
; concerned is not being killed off immediately, it is important that values
; placed on the supervisor/undefined stack by the FPASC/FPE are discarded.
; This can be done by adding 64 to the entry value of R12 and placing the
; result in the stack pointer R13. They may also want to make use of the
; information in the register dump and return value pointed to by R12, e.g.
; for diagnostic purposes.
;
; Note that the asymmetry between passing values into the trap handler in
; internal format and receiving results back in destination format is
; deliberate. The reason for this is twofold: first, we generally cannot
; know the operands' format, making the internal precision registers the
; best way to pass them in most cases.
;
; Secondly, we wish to ensure that the value being returned does fit in the
; destination format: otherwise, there are all sorts of horrible
; possibilities - e.g. an overflow trap handler returning a value which
; underflows its destination format. Forcing the trap handler to return
; results in the destination format pushes such an underflow into the trap
; handler, where we can at least give the user some indication what's to
; blame without violating the IEEE requirements about which exceptions may
; co-exist.
;
; All trap handlers adhere to the entry and exit conventions described
; above. The core routines have to divide each possible trap up into a
; number of cases, depending on what sort of values are going to be passed
; to and returned from the trap handler. To aid the veneer in sorting things
; out, a different veneer-defined entry point label is called for each case.
; (Of course, the veneer is free to define the labels concerned to be equal
; to each other if it is not interested in these distinctions.)
;
; The trap-handler entry point labels are:
;
;   Label                      Value(s) passed    Returned value:
;                              to handler via:    #words   Format
;   ------------------------------------------------------------------------
;   veneer_invalidop1_single    1 stack value       1      Single
;   veneer_invalidop2_single    2 stack values      1      Single
;   veneer_invalidop1_double    1 stack value       2      Double
;   veneer_invalidop2_double    2 stack values      2      Double
;   veneer_invalidop1_extended  1 stack value       3      Extended
;   veneer_invalidop2_extended  2 stack values      3      Extended
;   veneer_invalidop1_integer   1 stack value       1      Integer
;   veneer_invalidop2_integer   2 stack values      1      Integer
;   veneer_invalidop1_packed    1 stack value       3      Packed
;   veneer_invalidop2_packed    2 stack values      3      Packed
;   veneer_invalidop1_xpacked   1 stack value       4      Expanded Packed
;   veneer_invalidop2_xpacked   2 stack values      4      Expanded Packed
;   veneer_invalidop1_ldfp        R0,R1,R2          3      Extended
;   veneer_invalidop1_ldfpx      R0,R1,R2,R6        3      Extended
;
;   veneer_zerodivide1_single   1 stack value       1      Single
;   veneer_zerodivide2_single   2 stack values      1      Single
;   veneer_zerodivide1_double   1 stack value       2      Double
;   veneer_zerodivide2_double   2 stack values      2      Double
;   veneer_zerodivide1_extended 1 stack value       3      Extended
;   veneer_zerodivide2_extended 2 stack values      3      Extended
;
;   veneer_overflow_single      1 stack value       1      Single
;   veneer_overflow_double      1 stack value       2      Double
;   veneer_overflow_extended    1 stack value       3      Extended
;
;   veneer_underflow_single     1 stack value       1      Single
;   veneer_underflow_double     1 stack value       2      Double
;   veneer_underflow_extended   1 stack value       3      Extended
;
;   veneer_inexact_single       1 stack value       1      Single
;   veneer_inexact_double       1 stack value       2      Double
;   veneer_inexact_extended     1 stack value       3      Extended
;   veneer_inexact_integer           R6             1      Integer
;   veneer_inexact_packed         R0,R1,R2          3      Packed
;   veneer_inexact_xpacked       R0,R1,R2,R6        4      Expanded Packed
;
; Note that "packed", "xpacked" and "integer" versions of the divide-by-zero
; handlers do not exist, since only a very limited range of instructions can
; possibly produce a divide-by-zero exception, and they all have floating
; point results.
;
; Also, "packed" and "xpacked" versions of the overflow and underflow
; handlers do not exist because STFP instructions cannot overflow or
; underflow, and "veneer_underflow_integer" does not exist because FIX
; cannot underflow.
;
; FIX *can* overflow; however, from what I've read, the correct way to deal
; with an overflowed FIX is to signal an invalid operation exception. The
; relevant passage from the IEEE specification is section 7.1 (7):
; "Conversion of a binary floating-point number to an integer or decimal
; format when overflow, infinity or NaN precludes a faithful representation
; in that format and this cannot otherwise be signalled".
;
; One argument says that it can be signalled otherwise, i.e. by producing an
; overflow exception. However, the majority opinion appears to be that this
; clause means "unless it can be signalled as an integer overflow" - i.e. in
; terms of the ARM floating point instruction set, unless it can be
; signalled by setting the V flag. This view is supported by the fact that
; the description of what is sent to the overflow trap handler (in section
; 7.3 of the IEEE standard) implicitly assumes that the destination format
; is single, double or extended - i.e. that this is not a conversion to an
; integer or decimal format.
;
; Because of this, and since a normal FIX instruction does not and cannot
; affect the ARM's flags, overflow during a FIX is treated as an invalid
; operation. So "veneer_overflow_integer" doesn't exist.
;
; Checks that the register numbers given above are correct:

        ASSERT  OP1sue = R0
        ASSERT  OP1mhi = R1
        ASSERT  OP1mlo = R2
        ASSERT  RNDdir = R4
        ASSERT  Rarith = R6
        ASSERT  Rfpsr  = R7
        ASSERT  Rins   = R11
        ASSERT  Rfp    = R12
        ASSERT  Rsp    = R13
        ASSERT  LR     = R14

        END
