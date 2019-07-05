RISC OS Open Release Archive
============================

This is the standard HardDisc4 disc image. It is a
bleeding-edge build which comes from the latest revisions of all the relevant
sources in our source code repository and is completely untested.

The disc image includes the universal boot sequence (!Boot application).

When used with versions of the operating system prior to RISC OS 5 you will 
need to merge some extra support modules into the !System application, which
are otherwise already present in the RISC OS 5 ROM. The !System application 
is available as a separate download from RISC OS Open.

When used with the RISC OS 4.0x series from RISCOS Limited you will need
to copy the contents of
  !Boot.RO400Hook.Res
from your existing copy as these files are not available from RISC OS Open
for copyright reasons.

-- RISC OS Open
