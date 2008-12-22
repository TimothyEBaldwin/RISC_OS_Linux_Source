Copyright © Acorn Computers Ltd. 1993 1994   0197,269/FS Issue 0 ****DRAFT****

.start
            Expansion Card Software Functional Specification
            ================================================

                -----------------------------------------
                | Drawing No : 0197,269/FS              |
                |      Issue : 0 ****DRAFT****          |
                |       Date : 3rd March 1994           |
                |     Author : Bruce Cockburn           |
                |     Sheets : <many>                   |
                | Last Issue : None                     |
                -----------------------------------------

Contents
--------

1.      History
2.      Outstanding Issues
3.      Overview
4.      Technical Background
5.      Programmer Interface
6.      External Dependencies
7.      Development Test Strategy
8.      Organisation
9.      Possible Enhancements


1. History
----------

    BCockburn   14-Apr-93   Created.
    BCockburn   22-Apr-93   Included stuff about CMOS and reading the
                            address of EASI space from the kernel (SWI OS_Memory).
    BCockburn   22-Apr-93   Included feedback from review meeting.
    BCockburn   11-May-93   Removed one of the description things from ReadInfo.
    BCockburn   23-Jun-93   Added interrupt interfaces to SWI Podule_ReadInfo.
    BCockburn   30-Jun-93   Added device vector stuff to SWI Podule_ReadInfo.
    BCockburn   02-Jul-93   Added FIQ as IRQ register stuff to SWI Podule_ReadInfo.
    BCockburn   13-Sep-93   Removed EASI physical space stuff.
    BCockburn   26-Nov-93   Cleaned up stuff about having only one ROM.
    BCockburn   29-Nov-93   Added stuff about having only one ROM present (or else).
    BCockburn   20-Jan-94   Added ReadInfo_Ethernet
    BCockburn   21-Jan-94   Added ReadInfo_MEMC
    BCockburn   24-Jan-94   Added information about BaseAddres/CMOS split
    BCockburn   24-Feb-94   Updated dates at the top
    BCockburn   03-Mar-94   Updated Ethernet code to reflect changed API

.end

2. Outstanding Issues
---------------------

  If there are two chunks of the same type which has priority the first or
the last.  My feeling is the first for things of which there are only one
(like the description) since software will enumerate until it finds one.  In
the case of chunks of which there are expected to be more than one (like
relocatable modules) then it will be up to the client software to decide.  I
think the relocatable module manager will use the last one found (if they
are the same version).

3. Overview
-----------

  The design of the new machine has added two new areas for the
PoduleManager software to consider:

        1)  The extension of the existing Podule bus to include a directly
            mapped area of 16 megabytes, known as EASI space.

        2)  The introduction of a new format for network expansion.

  The new PoduleManager needs to provide a user interface to these two new
areas as well as a machine level programmer's interface (API).

  Both of these new areas will be electrically capable of having ROMs (or
EPROMs) connected.  It is the responsibility of the PoduleManager to be able
to read these ROMs for the operating system.

4. Technical Background
-----------------------

4.1  EASI space

  The new podules have EASI space, each has 16M.  The address will be bound
in at assembly time.  Both the address and the size  and will be available
from SWI Podule_ReadInfo.  This address is stable as long as the machine
configuration is stable.  Software clients of the PoduleManager need only
read this address once after reset.

4.2  ROMs in EASI space

  It is obvious that sticking a ROM is EASI space is a good thing, it
removes the need for a loader and for the paging register.  This also means
that access to the entire ROM address space is faster.  This is trivial
since ROMs are only 8 bits wide and are copied once at startup into RAM. 
However not having loaders will free-up ROM space.

  The format for ROMs in EASI space is exactly the same as that for ROMs in
the normal Podule space.  However since the size restriction is effectively
lifted there will be no need to have a second Chunk Directory accessed
through the loader.  All the standard header information must be present
including;

  i)    Identification byte.
  ii)   Manufacturer's identification number.
  iii)  Product identification number.
  iv)   Width field.
  v)    Interrupt relocations.
  vi)   Chunk directory.
  vii)  Description chunk.

  Note that although the ROM may be in the EASI space the interrupt
relocations are still relative to the base of Podule space.

  The PoduleManager will only cope with a ROM in either Podule space or EASI
space, not both at once.  Once it has determined that there is a ROM in
Podule space the EASI space will not be accessed.  Once it has determined
that there is a ROM in EASI space the Podule space will not be accessed. 
Note that the PoduleManager checks for a ROM in Podule space first (the test
being a read of location zero and a test of bit one, low indicates the
presence of a ROM).  If the ROM is to be in EASI space it is imperative that
the expansion card either doesn't respond to reads of location zero or
provides data with bit one set high.  Failure to do this will make the
PoduleManager think a ROM is present, read spurious data from the Podule
space, and ignore the ROM in EASI space.

4.3  ROMS on the network card

  The definition of the new network card interface specifies how a ROM may
be attached to the card.  It also describes the paging scheme.  The new
PoduleManager software will have code to understand this paging scheme built
in.

  The format for a ROM on the network card is exactly the same as that for
ROMs in the normal Podule space.  However since the loader is
effectively loaded before the enumeration begins there will be no need to
have a second Chunk Directory.  All the standard header information must be
present including;

  i)    Identification byte.
  ii)   Manufacturer's identification number.
  iii)  Product identification number.
  iv)   Chunk directory.
  v)    Description chunk.

  Note that the interrupt relocations must still be present and must
always be all zeros.

  Some network products will be allocated simple podule identification
values for use in the Expansion Card Identity low byte (ECId).  As a
reminder the bit assignments in the ECId are as follows;

        Bit 0 ==> IRQ bit
        Bit 1 ==> Present, must be a zero
        Bit 2 ==> FIQ bit
        Bit 3 ==> ID<0>
        Bit 4 ==> ID<1>
        Bit 5 ==> ID<2>
        Bit 6 ==> ID<3>
        Bit 7 ==> Acorn conformant, must be a zero

  When ID<0..3> are all zero the normal extended ID fields are present
however values 1 to 15 may be allocated to specific products.  Once
allocated specific software drivers may assume specific hardware when they
read the ECId from the PoduleManager (using SWI Podule_ReadID).  Support
will also be included in the PoduleManager for providing a description for
allocated non-extended simple IDs.  This will not only extend to the
implementation of *Podules.  It will also be available from the new SWI
Podule_ReadInfo.  Note that it will also be in the PoduleManager's message
file (Resources:$.Resources.Podule.Messages).  The format of the token is
the string "Simple" followed by a single hexadecimal digit from "1" to "F"
e.g.

        Simple1:Acorn Econet



5. Programmer's Interface
-------------------------

5.1  How the network card fits in

  The network card is always treated as the highest numbered podule, so in
the current system, being the fifth podule it will have the number 4 and
will be the the last in the printout from *Podules.  This number (4) is
suitable for use with these all SWIs except Podule_CallLoader and
Podule_WriteBytes, since the loader isn't valid and the ROM space is
treated as read only.  The SWI Podule_ReadBytes will read the ROM image via
the built in loader.  The SWIs Podule_RawRead and Podule_RawWrite will access
the device address space.  It will be the device address that will be
returned by SWIs like Podule_HardwareAddress and Podule_HardwareAddresses.

5.2  Extending the scope of register 3

  Currently all PoduleManager SWIs (with the single exception of SWI
Podule_ReturnNumber) use register 3 to indicate which podule (or extension
ROM) to access.  Currently this is referred to as the ROM section and has
one of the following values/meanings:

        -1   System ROM
         0   Expansion card 0
         1   Expansion card 1
         2   Expansion card 2
         3   Expansion card 3
        -2   Extension ROM 1
        -3   Extension ROM 2
        -4   Extension ROM 3

  This will be extended to understand ROM section 4 as the network card.

  However as it is currently implemented the PoduleManager does actually
take a much more liberal attitude to the value passed in R3, if it is a
hardware base address (as returned by Podule_HardwareAddress or
Podule_HardwareAddress) whether combined with a CMOS address or not this
will also be acceptable.  The "formal definition" of what is now acceptable in
register 3 is as follows (as demonstrated by the following pseudo code):

  CASE 

    WHEN Value = -1: System ROM ==> Error "System ROM not acceptable as Expansion Card or Extension ROM number"

    WHEN Value <= -2 AND => -16: Extension ROM(-Value-1)

    WHEN Value >= 0 AND <= 31: Expansion Card(Value)

    WHEN Value AND &FFE73000 = &03240000: Expansion Card((Value AND &C000)>>14)

    WHEN Value AND &FFE73000 = &03270000: Expansion Card(4+(Value AND &C000)>>14)

    WHEN Value AND &FFFF3FFF = &03000000: Expansion Card((Value AND &C000)>>14)

    WHEN Value AND &FFFF3FFF = &03030000: Expansion Card(4+(Value AND &C000)>>14)

    WHEN Value >= &70 AND <=&7F: Expansion Card((Value AND &C)>>2)

    WHEN Value >= &3C AND <=&4F: Expansion Card(7-((Value AND &C)>>2))

    WHEN Value = EASILogicalBase(0..7): Expansion Card()

    OTHERWISE Error "Bad Expansion Card or Extension ROM number"

  ENDCASE
 
5.3  New SWIs

5.3.1   SWI Podule_ReadInfo &4028D

        On entry
            R0  Bitset of required results
            R1  Pointer to buffer to receive word aligned word results
            R2  Length in bytes of buffer
            R3  Any recognisable part of podule addressing;
                e.g.  Podule number
                      Base address
                      CMOS address
                      New base address

        On exit
            R0  Preserved
            R1  Preserved, a pointer to results in order (lowest bit number
                at the lowest address)
            R2  Length of results
            R3  Preserved

        Bitset in R0, values;

            Bit  0 ==> Podule/Extension ROM number
            Bit  1 ==> Normal (syncronous) base address of hardware
            Bit  2 ==> CMOS address
            Bit  3 ==> CMOS size in bytes
            Bit  4 ==> Extension ROM or network ROM base address
            Bit  5 ==> Podule ID
            Bit  6 ==> Podule product type
            Bit  7 ==> Combined hardware address
            Bit  8 ==> Pointer to description (zero for no description)
            Bit  9 ==> Logical address of EASI space
            Bit 10 ==> Size of the EASI space in bytes
            Bit 11 ==> Logical number of the primary DMA channel (minus one for no channel)
            Bit 12 ==> Logical number of the secondary DMA channel (minus one for no channel)
            Bit 13 ==> Address of Interrupt Status Register
            Bit 14 ==> Address of Interrupt Request Register
            Bit 15 ==> Address of Interrupt Mask Register
            Bit 16 ==> Interrupt Mask value
            Bit 17 ==> Device Vector number (for IRQ)
            Bit 18 ==> Address of FIQ as Interrupt Status Register
            Bit 19 ==> Address of FIQ as Interrupt Request Register
            Bit 20 ==> Address of FIQ as Interrupt Mask Register
            Bit 21 ==> FIQ as Interrupt Mask value
            Bit 22 ==> Device Vector number (for FIQ as IRQ)
            Bit 23 ==> Address of Fast Interrupt Status Register
            Bit 24 ==> Address of Fast Interrupt Request Register
            Bit 25 ==> Address of Fast Interrupt Mask Register
            Bit 26 ==> Fast Interrupt Mask value
            Bit 27 ==> Ethernet address (low 32 bits)
            Bit 28 ==> Ethernet address (high 16 bits)
            Bit 29 ==> Address of MEMC space (zero for no space)

            Bits 30 and 31 are reserved and must be zero.

        Interrupts
            Interrupt status is unaltered
            Fast interrupts are enabled

        Processor mode
            Processor is in SVC mode

        Re-entrancy
            SWI is re-entrant

        Use
            This call returns a selection of data specific to the podule it
            was requested for.  All the returned data is a single words, and
            they are placed into the user supplied buffer at word intervals. 
            The description strings may be in temporary buffers (i.e.
            MessageTrans error buffers) so it is wise to copy them to
            private workspace before calling any other SWIs.

            When updating any of the nine interrupt registers it is essential
            that both IRQ and FIQ are disabled for the duration.

            The setting of bits 30 and 31 are not permitted, if they are set
            then an error condition will be returned.

            Reading the machine supplied value for the Ethernet address should
            ideally be carried out using the following code.  Note that this
            is not the only way to get the required result but it is the
            recommended way.

        GetEthernetAddress

        ;   Entry;
        ;       R3 ==> Any recognisable part of podule addressing
        ;
        ;   Exit;
        ;       R0 ==> Low 32 bits of the Ethernet address
        ;       R1 ==> High 16 bits of the Ethernet address

                STMFD   sp!, { r0-r2, r4, lr }
                MOV     r0, &18000000           ; Bits for read high and low
                MOV     r1, sp                  ; Point to the buffer
                MOV     r2, #8                  ; Size of buffer
                SWI     XPodule_ReadInfo
                LDMVCFD sp!, { r0-r2, r4, pc }  ; Return with results if OK
                MOV     r4, r0                  ; Save the original error
                MOV     r0, #0                  ; Start at the first chunk
        Loop
                SWI     XPodule_EnumerateChunks
                BVS     ErrorExit
                TEQ     r0, #0
                BEQ     ErrorExit               ; End of list, so not found
                TEQ     r2, #&F7                ; Ethernet Address?
                BNE     Loop
                TEQ     r1, #6                  ; Wrong size is a failure
                BNE     ErrorExit
                SUB     r0, r0, #1              ; Back to the chunk we liked
                MOV     r2, sp                  ; Pass in the data pointer
                SWI     XPodule_ReadChunk
                LDMVCFD sp!, { r0-r2, r4, pc }  ; Return with results if OK
        ErrorExit
                CMP     pc, #&80000000          ; Set V
                STR     r4, [ sp, #0 ]          ; Original error Podule_ReadInfo
                LDMFD   sp!, { r0-r2, r4, pc }

        Related SWIs
            Podule_ReadID, Podule_ReadHeader, Podule_HardwareAddress,
            Podule_HardwareAddresses, Podule_ReturnNumber,
            OS_ClaimDeviceVector, OS_ReleaseDeviceVector.

        Related vectors
            None.

        Implementation note
            CMOS RAM for podule 4 is from &4C to &4F inclusive and
            allocations have been made for podules 5 to 7 as well (&48 to
            &4B, &44 to 47, and &40 to &43 respectively).


5.3.2   SWI Podule_SetSpeed &4028E

        On entry
            R0  Enumerated type for the speed required.
                R0 = 0 ==> No change
                R0 = 1 ==> IOMD+ timing type "A"
                R0 = 2 ==> IOMD+ timing type "B"
                R0 = 3 ==> IOMD+ timing type "C"
                R0 = 4 ==> IOMD+ timing type "D"

            R3  Any recognisable part of podule addressing;
                e.g.  Podule number
                      Base address
                      CMOS address
                      New base address

        On exit
            R0  Current speed setting
            R1  Preserved
            R2  Preserved
            R3  Preserved

        Interrupts
            Interrupt status is unaltered
            Fast interrupts are enabled

        Processor mode
            Processor is in SVC mode

        Re-entrancy
            SWI is re-entrant

        Use
            Used by client code that NEEDs to have faster access to its
            hardware.  The kernel initialises all podules' access speed
            to type A.

        Related SWIs
            None.

        Related vectors
            None.

5.4  Changes to the value given as the combined Syncronous base
     address and CMOS base address.

  With the introduction of the Network card and processors with 32 bit
addressing it has become neccessary to change the definition of the
way the combined Syncronous base address and CMOS base address are
separated from the single 32 bit value passed to loaders.

         31                                    10 9               0
         +---------------------------------------+----------------+
         |  Hardware base address (Synchronous)  |  CMOS address  |
         +---------------------------------------+----------------+
       
        So this means that entry points expecting the hardware base
        address should now mask the incoming register value;
       
               LDR    Rmv, =2_00000000000000000000001111111111
               BIC    Rba, Rha, Rmv
        OR
               LDR    Rmv, =2_11111111111111111111110000000000
               AND    Rba, Rha, Rmv
       
          To obtain the true base address, and they should also mask to
        obtain the CMOS address for use in R1 in the SWI XOS_Byte for
        ReadCMOS or WriteCMOS;

               LDR    Rmv, =2_11111111111111111111110000000000
               BIC    Rca, Rha, Rmv
        OR
               LDR    Rmv, =2_00000000000000000000001111111111
               AND    Rca, Rha, Rmv
       

6. External Dependencies
------------------------

6.1  Support in the kernel for *unplugging in a fifth podule.

6.2  IOMD+.

6.3  Availability of a network test card.

6.4  Availability of the EASI test card.


7. Development Test Strategy
----------------------------

  Using the BASIC program "ListSegs", the following interfaces are tested:
Podule_ReturnNumber, Podule_ReadID, Podule_ReadHeader, Podule_ReadChunk, and
Podule_EnumerateChunks.

  This program can be expanded to test Podule_EnumerateChunksWithInfo,
Podule_HardwareAddress, Podule_HardwareAddresses, and Podule_ReadInfo.

  All interfaces need testing with many different values for R3 (the common
input for which Podule/ExtensionROM.

  The SWI Podule_SetSpeed will have to be tested with an osciloscope!


8. Organisation
---------------

  The PoduleManager is resident in the main system ROM.

9. Possible Enhancements
------------------------

  Change the sources so that the number of podules (currently four) is a
true assembly-time variable [done].  The support for Extension ROMs should
also be an assembly-time choice [done].  The support for the Network card
should also be an assembly-time choice [done].


