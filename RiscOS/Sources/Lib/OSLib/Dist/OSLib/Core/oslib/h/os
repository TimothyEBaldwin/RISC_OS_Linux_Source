#ifndef os_H
#define os_H

/* C header file for OS
 * written by DefMod (Jan  2 2007) on Tue Jan  2 11:51:28 2007
 * Jonathan Coxhead, jonathan@doves.demon.co.uk, 9 Feb 1997
 */

/*OSLib---efficient, type-safe, transparent, extensible,
   register-safe A P I coverage of RISC O S*/
/*Copyright © 1994 Jonathan Coxhead*/

/*
      OSLib is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 1, or (at your option)
   any later version.

      OSLib is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

      You should have received a copy of the GNU General Public License
   along with this programme; if not, write to the Free Software
   Foundation, Inc, 675 Mass Ave, Cambridge, MA 02139, U S A.
*/

#ifndef types_H
#include "oslib/types.h"
#endif

#if defined NAMESPACE_OSLIB
  namespace OSLib {
#endif

/**********************************
 * SWI names and SWI reason codes *
 **********************************/
#undef  OS_ReadVarValSize
#define OS_ReadVarValSize                       0x23
#undef  XOS_ReadVarValSize
#define XOS_ReadVarValSize                      0x20023
#undef  OS_ChangeDynamicAreaNoFail
#define OS_ChangeDynamicAreaNoFail              0x2A
#undef  XOS_ChangeDynamicAreaNoFail
#define XOS_ChangeDynamicAreaNoFail             0x2002A
#undef  OS_WriteC
#define OS_WriteC                               0x0
#undef  XOS_WriteC
#define XOS_WriteC                              0x20000
#undef  WrchV
#define WrchV                                   0x3
#undef  OS_WriteS
#define OS_WriteS                               0x1
#undef  XOS_WriteS
#define XOS_WriteS                              0x20001
#undef  OS_Write0
#define OS_Write0                               0x2
#undef  XOS_Write0
#define XOS_Write0                              0x20002
#undef  OS_NewLine
#define OS_NewLine                              0x3
#undef  XOS_NewLine
#define XOS_NewLine                             0x20003
#undef  OS_ReadC
#define OS_ReadC                                0x4
#undef  XOS_ReadC
#define XOS_ReadC                               0x20004
#undef  RdchV
#define RdchV                                   0x4
#undef  OS_CLI
#define OS_CLI                                  0x5
#undef  XOS_CLI
#define XOS_CLI                                 0x20005
#undef  CLIV
#define CLIV                                    0x5
#undef  OS_ReadLine
#define OS_ReadLine                             0xE
#undef  XOS_ReadLine
#define XOS_ReadLine                            0x2000E
#undef  OS_ReadLineGivenEcho
#define OS_ReadLineGivenEcho                    0xE
#undef  XOS_ReadLineGivenEcho
#define XOS_ReadLineGivenEcho                   0x2000E
#undef  OS_ReadLineSuppressInvalid
#define OS_ReadLineSuppressInvalid              0xE
#undef  XOS_ReadLineSuppressInvalid
#define XOS_ReadLineSuppressInvalid             0x2000E
#undef  OS_ReadLineGivenEchoSuppressInvalid
#define OS_ReadLineGivenEchoSuppressInvalid     0xE
#undef  XOS_ReadLineGivenEchoSuppressInvalid
#define XOS_ReadLineGivenEchoSuppressInvalid    0x2000E
#undef  OS_ReadLine32
#define OS_ReadLine32                           0x7D
#undef  XOS_ReadLine32
#define XOS_ReadLine32                          0x2007D
#undef  ReadLineV
#define ReadLineV                               0xE
#undef  ReadLine32V
#define ReadLine32V                             0xE
#undef  OS_Control
#define OS_Control                              0xF
#undef  XOS_Control
#define XOS_Control                             0x2000F
#undef  OS_GetEnv
#define OS_GetEnv                               0x10
#undef  XOS_GetEnv
#define XOS_GetEnv                              0x20010
#undef  OS_Exit
#define OS_Exit                                 0x11
#undef  XOS_Exit
#define XOS_Exit                                0x20011
#undef  OS_SetEnv
#define OS_SetEnv                               0x12
#undef  XOS_SetEnv
#define XOS_SetEnv                              0x20012
#undef  OS_IntOn
#define OS_IntOn                                0x13
#undef  XOS_IntOn
#define XOS_IntOn                               0x20013
#undef  OS_IntOff
#define OS_IntOff                               0x14
#undef  XOS_IntOff
#define XOS_IntOff                              0x20014
#undef  IrqV
#define IrqV                                    0x2
#undef  OS_CallBack
#define OS_CallBack                             0x15
#undef  XOS_CallBack
#define XOS_CallBack                            0x20015
#undef  OS_EnterOS
#define OS_EnterOS                              0x16
#undef  XOS_EnterOS
#define XOS_EnterOS                             0x20016
#undef  OS_LeaveOS
#define OS_LeaveOS                              0x7C
#undef  XOS_LeaveOS
#define XOS_LeaveOS                             0x2007C
#undef  OS_BreakPt
#define OS_BreakPt                              0x17
#undef  XOS_BreakPt
#define XOS_BreakPt                             0x20017
#undef  OS_BreakCtrl
#define OS_BreakCtrl                            0x18
#undef  XOS_BreakCtrl
#define XOS_BreakCtrl                           0x20018
#undef  OS_UnusedSWI
#define OS_UnusedSWI                            0x19
#undef  XOS_UnusedSWI
#define XOS_UnusedSWI                           0x20019
#undef  UKSWIV
#define UKSWIV                                  0x18
#undef  OS_UpdateMEMC
#define OS_UpdateMEMC                           0x1A
#undef  XOS_UpdateMEMC
#define XOS_UpdateMEMC                          0x2001A
#undef  OS_SetCallBack
#define OS_SetCallBack                          0x1B
#undef  XOS_SetCallBack
#define XOS_SetCallBack                         0x2001B
#undef  OS_Mouse
#define OS_Mouse                                0x1C
#undef  XOS_Mouse
#define XOS_Mouse                               0x2001C
#undef  MouseV
#define MouseV                                  0x1A
#undef  OS_Claim
#define OS_Claim                                0x1F
#undef  XOS_Claim
#define XOS_Claim                               0x2001F
#undef  OS_Release
#define OS_Release                              0x20
#undef  XOS_Release
#define XOS_Release                             0x20020
#undef  OS_ReadUnsigned
#define OS_ReadUnsigned                         0x21
#undef  XOS_ReadUnsigned
#define XOS_ReadUnsigned                        0x20021
#undef  OS_GenerateEvent
#define OS_GenerateEvent                        0x22
#undef  XOS_GenerateEvent
#define XOS_GenerateEvent                       0x20022
#undef  EventV
#define EventV                                  0x10
#undef  OS_ReadVarVal
#define OS_ReadVarVal                           0x23
#undef  XOS_ReadVarVal
#define XOS_ReadVarVal                          0x20023
#undef  OS_SetVarVal
#define OS_SetVarVal                            0x24
#undef  XOS_SetVarVal
#define XOS_SetVarVal                           0x20024
#undef  OS_GSInit
#define OS_GSInit                               0x25
#undef  XOS_GSInit
#define XOS_GSInit                              0x20025
#undef  OS_GSRead
#define OS_GSRead                               0x26
#undef  XOS_GSRead
#define XOS_GSRead                              0x20026
#undef  OS_GSTrans
#define OS_GSTrans                              0x27
#undef  XOS_GSTrans
#define XOS_GSTrans                             0x20027
#undef  OS_BinaryToDecimal
#define OS_BinaryToDecimal                      0x28
#undef  XOS_BinaryToDecimal
#define XOS_BinaryToDecimal                     0x20028
#undef  OS_ChangeDynamicArea
#define OS_ChangeDynamicArea                    0x2A
#undef  XOS_ChangeDynamicArea
#define XOS_ChangeDynamicArea                   0x2002A
#undef  OS_GenerateError
#define OS_GenerateError                        0x2B
#undef  XOS_GenerateError
#define XOS_GenerateError                       0x2002B
#undef  ErrorV
#define ErrorV                                  0x1
#undef  OS_ReadEscapeState
#define OS_ReadEscapeState                      0x2C
#undef  XOS_ReadEscapeState
#define XOS_ReadEscapeState                     0x2002C
#undef  OS_EvaluateExpression
#define OS_EvaluateExpression                   0x2D
#undef  XOS_EvaluateExpression
#define XOS_EvaluateExpression                  0x2002D
#undef  OS_ReadPalette
#define OS_ReadPalette                          0x2F
#undef  XOS_ReadPalette
#define XOS_ReadPalette                         0x2002F
#undef  PaletteV
#define PaletteV                                0x23
#undef  PaletteV_ReadEntry
#define PaletteV_ReadEntry                      0x1
#undef  PaletteV_SetEntry
#define PaletteV_SetEntry                       0x2
#undef  PaletteV_SetOn
#define PaletteV_SetOn                          0x3
#undef  PaletteV_SetOff
#define PaletteV_SetOff                         0x4
#undef  PaletteV_Default
#define PaletteV_Default                        0x5
#undef  PaletteV_BlankScreen
#define PaletteV_BlankScreen                    0x6
#undef  PaletteV_ReadEntries
#define PaletteV_ReadEntries                    0x7
#undef  PaletteV_WriteEntries
#define PaletteV_WriteEntries                   0x8
#undef  PaletteV_SetGammaCorrections
#define PaletteV_SetGammaCorrections            0x9
#undef  PaletteV_InvertLCD
#define PaletteV_InvertLCD                      0xA
#undef  PaletteV_DimScreen
#define PaletteV_DimScreen                      0xB
#undef  OS_ServiceCall
#define OS_ServiceCall                          0x30
#undef  XOS_ServiceCall
#define XOS_ServiceCall                         0x20030
#undef  OS_ReadVduVariables
#define OS_ReadVduVariables                     0x31
#undef  XOS_ReadVduVariables
#define XOS_ReadVduVariables                    0x20031
#undef  OS_ReadPoint
#define OS_ReadPoint                            0x32
#undef  XOS_ReadPoint
#define XOS_ReadPoint                           0x20032
#undef  OS_UpCall
#define OS_UpCall                               0x33
#undef  XOS_UpCall
#define XOS_UpCall                              0x20033
#undef  UpCallV
#define UpCallV                                 0x1D
#undef  OS_CallAVector
#define OS_CallAVector                          0x34
#undef  XOS_CallAVector
#define XOS_CallAVector                         0x20034
#undef  OS_ReadModeVariable
#define OS_ReadModeVariable                     0x35
#undef  XOS_ReadModeVariable
#define XOS_ReadModeVariable                    0x20035
#undef  OS_RemoveCursors
#define OS_RemoveCursors                        0x36
#undef  XOS_RemoveCursors
#define XOS_RemoveCursors                       0x20036
#undef  OS_RestoreCursors
#define OS_RestoreCursors                       0x37
#undef  XOS_RestoreCursors
#define XOS_RestoreCursors                      0x20037
#undef  OS_SWINumberToString
#define OS_SWINumberToString                    0x38
#undef  XOS_SWINumberToString
#define XOS_SWINumberToString                   0x20038
#undef  OS_SWINumberFromString
#define OS_SWINumberFromString                  0x39
#undef  XOS_SWINumberFromString
#define XOS_SWINumberFromString                 0x20039
#undef  OS_ValidateAddress
#define OS_ValidateAddress                      0x3A
#undef  XOS_ValidateAddress
#define XOS_ValidateAddress                     0x2003A
#undef  OS_CallAfter
#define OS_CallAfter                            0x3B
#undef  XOS_CallAfter
#define XOS_CallAfter                           0x2003B
#undef  OS_CallEvery
#define OS_CallEvery                            0x3C
#undef  XOS_CallEvery
#define XOS_CallEvery                           0x2003C
#undef  OS_RemoveTickerEvent
#define OS_RemoveTickerEvent                    0x3D
#undef  XOS_RemoveTickerEvent
#define XOS_RemoveTickerEvent                   0x2003D
#undef  TickerV
#define TickerV                                 0x1C
#undef  OS_InstallKeyHandler
#define OS_InstallKeyHandler                    0x3E
#undef  XOS_InstallKeyHandler
#define XOS_InstallKeyHandler                   0x2003E
#undef  KeyV
#define KeyV                                    0x13
#undef  KeyV_Present
#define KeyV_Present                            0x0
#undef  KeyV_TransitionUp
#define KeyV_TransitionUp                       0x1
#undef  KeyV_TransitionDown
#define KeyV_TransitionDown                     0x2
#undef  KeyV_LEDState
#define KeyV_LEDState                           0x3
#undef  KeyV_EnableDrivers
#define KeyV_EnableDrivers                      0x4
#undef  OS_CheckModeValid
#define OS_CheckModeValid                       0x3F
#undef  XOS_CheckModeValid
#define XOS_CheckModeValid                      0x2003F
#undef  OS_ChangeEnvironment
#define OS_ChangeEnvironment                    0x40
#undef  XOS_ChangeEnvironment
#define XOS_ChangeEnvironment                   0x20040
#undef  ChangeEnvironmentV
#define ChangeEnvironmentV                      0x1E
#undef  OS_ClaimScreenMemory
#define OS_ClaimScreenMemory                    0x41
#undef  XOS_ClaimScreenMemory
#define XOS_ClaimScreenMemory                   0x20041
#undef  OSClaimScreenMemory_Alloc
#define OSClaimScreenMemory_Alloc               0x1
#undef  OSClaimScreenMemory_Free
#define OSClaimScreenMemory_Free                0x0
#undef  OS_ReadMonotonicTime
#define OS_ReadMonotonicTime                    0x42
#undef  XOS_ReadMonotonicTime
#define XOS_ReadMonotonicTime                   0x20042
#undef  OS_SubstituteArgs
#define OS_SubstituteArgs                       0x43
#undef  XOS_SubstituteArgs
#define XOS_SubstituteArgs                      0x20043
#undef  OS_SubstituteArgs32
#define OS_SubstituteArgs32                     0x7E
#undef  XOS_SubstituteArgs32
#define XOS_SubstituteArgs32                    0x2007E
#undef  OS_PrettyPrint
#define OS_PrettyPrint                          0x44
#undef  XOS_PrettyPrint
#define XOS_PrettyPrint                         0x20044
#undef  OS_Plot
#define OS_Plot                                 0x45
#undef  XOS_Plot
#define XOS_Plot                                0x20045
#undef  UKPLOTV
#define UKPLOTV                                 0x19
#undef  OS_WriteN
#define OS_WriteN                               0x46
#undef  XOS_WriteN
#define XOS_WriteN                              0x20046
#undef  OS_AddToVector
#define OS_AddToVector                          0x47
#undef  XOS_AddToVector
#define XOS_AddToVector                         0x20047
#undef  OS_WriteEnv
#define OS_WriteEnv                             0x48
#undef  XOS_WriteEnv
#define XOS_WriteEnv                            0x20048
#undef  OS_ReadArgs
#define OS_ReadArgs                             0x49
#undef  XOS_ReadArgs
#define XOS_ReadArgs                            0x20049
#undef  OS_ReadRAMFsLimits
#define OS_ReadRAMFsLimits                      0x4A
#undef  XOS_ReadRAMFsLimits
#define XOS_ReadRAMFsLimits                     0x2004A
#undef  OS_ClaimDeviceVector
#define OS_ClaimDeviceVector                    0x4B
#undef  XOS_ClaimDeviceVector
#define XOS_ClaimDeviceVector                   0x2004B
#undef  OS_ReleaseDeviceVector
#define OS_ReleaseDeviceVector                  0x4C
#undef  XOS_ReleaseDeviceVector
#define XOS_ReleaseDeviceVector                 0x2004C
#undef  OS_DelinkApplication
#define OS_DelinkApplication                    0x4D
#undef  XOS_DelinkApplication
#define XOS_DelinkApplication                   0x2004D
#undef  OS_RelinkApplication
#define OS_RelinkApplication                    0x4E
#undef  XOS_RelinkApplication
#define XOS_RelinkApplication                   0x2004E
#undef  OS_HeapSort
#define OS_HeapSort                             0x4F
#undef  XOS_HeapSort
#define XOS_HeapSort                            0x2004F
#undef  OS_HeapSort32
#define OS_HeapSort32                           0x7F
#undef  XOS_HeapSort32
#define XOS_HeapSort32                          0x2007F
#undef  OS_ExitAndDie
#define OS_ExitAndDie                           0x50
#undef  XOS_ExitAndDie
#define XOS_ExitAndDie                          0x20050
#undef  OS_ReadMemMapInfo
#define OS_ReadMemMapInfo                       0x51
#undef  XOS_ReadMemMapInfo
#define XOS_ReadMemMapInfo                      0x20051
#undef  OS_ReadMemMapEntries
#define OS_ReadMemMapEntries                    0x52
#undef  XOS_ReadMemMapEntries
#define XOS_ReadMemMapEntries                   0x20052
#undef  OS_SetMemMapEntries
#define OS_SetMemMapEntries                     0x53
#undef  XOS_SetMemMapEntries
#define XOS_SetMemMapEntries                    0x20053
#undef  OS_AddCallBack
#define OS_AddCallBack                          0x54
#undef  XOS_AddCallBack
#define XOS_AddCallBack                         0x20054
#undef  OS_ReadDefaultHandler
#define OS_ReadDefaultHandler                   0x55
#undef  XOS_ReadDefaultHandler
#define XOS_ReadDefaultHandler                  0x20055
#undef  OS_SetECFOrigin
#define OS_SetECFOrigin                         0x56
#undef  XOS_SetECFOrigin
#define XOS_SetECFOrigin                        0x20056
#undef  OS_Confirm
#define OS_Confirm                              0x59
#undef  XOS_Confirm
#define XOS_Confirm                             0x20059
#undef  OS_ChangedBox
#define OS_ChangedBox                           0x5A
#undef  XOS_ChangedBox
#define XOS_ChangedBox                          0x2005A
#undef  OS_CRC
#define OS_CRC                                  0x5B
#undef  XOS_CRC
#define XOS_CRC                                 0x2005B
#undef  OS_ReadDynamicArea
#define OS_ReadDynamicArea                      0x5C
#undef  XOS_ReadDynamicArea
#define XOS_ReadDynamicArea                     0x2005C
#undef  OS_PrintChar
#define OS_PrintChar                            0x5D
#undef  XOS_PrintChar
#define XOS_PrintChar                           0x2005D
#undef  OS_ChangeRedirection
#define OS_ChangeRedirection                    0x5E
#undef  XOS_ChangeRedirection
#define XOS_ChangeRedirection                   0x2005E
#undef  OS_ChangeRedirectionW
#define OS_ChangeRedirectionW                   0x5E
#undef  XOS_ChangeRedirectionW
#define XOS_ChangeRedirectionW                  0x2005E
#undef  OS_RemoveCallBack
#define OS_RemoveCallBack                       0x5F
#undef  XOS_RemoveCallBack
#define XOS_RemoveCallBack                      0x2005F
#undef  OS_FindMemMapEntries
#define OS_FindMemMapEntries                    0x60
#undef  XOS_FindMemMapEntries
#define XOS_FindMemMapEntries                   0x20060
#undef  OS_SetColour
#define OS_SetColour                            0x61
#undef  XOS_SetColour
#define XOS_SetColour                           0x20061
#undef  OS_ReadColour
#define OS_ReadColour                           0x61
#undef  XOS_ReadColour
#define XOS_ReadColour                          0x20061
#undef  OS_Pointer
#define OS_Pointer                              0x64
#undef  XOS_Pointer
#define XOS_Pointer                             0x20064
#undef  OSPointer_Get
#define OSPointer_Get                           0x0
#undef  OSPointer_Set
#define OSPointer_Set                           0x1
#undef  OSPointer_ReadAlternatePosition
#define OSPointer_ReadAlternatePosition         0x2
#undef  PointerV
#define PointerV                                0x26
#undef  PointerV_Status
#define PointerV_Status                         0x0
#undef  PointerV_Enumerate
#define PointerV_Enumerate                      0x1
#undef  PointerV_Selected
#define PointerV_Selected                       0x2
#undef  PointerV_ExtendedStatus
#define PointerV_ExtendedStatus                 0x4
#undef  OS_ScreenMode
#define OS_ScreenMode                           0x65
#undef  XOS_ScreenMode
#define XOS_ScreenMode                          0x20065
#undef  OSScreenMode_Select
#define OSScreenMode_Select                     0x0
#undef  OSScreenMode_Current
#define OSScreenMode_Current                    0x1
#undef  OSScreenMode_Enumerate
#define OSScreenMode_Enumerate                  0x2
#undef  OSScreenMode_CacheControl
#define OSScreenMode_CacheControl               0x4
#undef  OSScreenMode_RequestClean
#define OSScreenMode_RequestClean               0x5
#undef  OSScreenMode_ForceClean
#define OSScreenMode_ForceClean                 0x6
#undef  OS_DynamicArea
#define OS_DynamicArea                          0x66
#undef  XOS_DynamicArea
#define XOS_DynamicArea                         0x20066
#undef  OSDynamicArea_Create
#define OSDynamicArea_Create                    0x0
#undef  OSDynamicArea_Delete
#define OSDynamicArea_Delete                    0x1
#undef  OSDynamicArea_Read
#define OSDynamicArea_Read                      0x2
#undef  OSDynamicArea_Enumerate
#define OSDynamicArea_Enumerate                 0x3
#undef  OSDynamicArea_Renumber
#define OSDynamicArea_Renumber                  0x4
#undef  OSDynamicArea_FreeSpace
#define OSDynamicArea_FreeSpace                 0x5
#undef  OSDynamicArea_SetClamps
#define OSDynamicArea_SetClamps                 0x8
#undef  OSDynamicArea_EnsureRegion
#define OSDynamicArea_EnsureRegion              0x9
#undef  OSDynamicArea_ReleaseRegion
#define OSDynamicArea_ReleaseRegion             0xA
#undef  OSDynamicArea_HeapDescribe
#define OSDynamicArea_HeapDescribe              0xE
#undef  OSDynamicArea_HeapAlloc
#define OSDynamicArea_HeapAlloc                 0xF
#undef  OSDynamicArea_HeapFree
#define OSDynamicArea_HeapFree                  0x10
#undef  OSDynamicArea_HeapRealloc
#define OSDynamicArea_HeapRealloc               0x11
#undef  OSDynamicArea_HeapReadSize
#define OSDynamicArea_HeapReadSize              0x12
#undef  OS_Memory
#define OS_Memory                               0x68
#undef  XOS_Memory
#define XOS_Memory                              0x20068
#undef  OSMemory_PageOp
#define OSMemory_PageOp                         0x0
#undef  OSMemory_ReadArrangementTableSize
#define OSMemory_ReadArrangementTableSize       0x6
#undef  OSMemory_ReadArrangementTable
#define OSMemory_ReadArrangementTable           0x7
#undef  OSMemory_ReadSize
#define OSMemory_ReadSize                       0x8
#undef  OSMemory_ReadController
#define OSMemory_ReadController                 0x9
#undef  OSMemory_FindContiguous
#define OSMemory_FindContiguous                 0xC
#undef  OSMemory_MapInPermanentIO
#define OSMemory_MapInPermanentIO               0xD
#undef  OSMemory_MapInTemporaryIO
#define OSMemory_MapInTemporaryIO               0xE
#undef  OSMemory_MapOutTemporaryIO
#define OSMemory_MapOutTemporaryIO              0xF
#undef  OSMemory_GetAreaInfo
#define OSMemory_GetAreaInfo                    0x10
#undef  OS_ClaimProcessorVector
#define OS_ClaimProcessorVector                 0x69
#undef  XOS_ClaimProcessorVector
#define XOS_ClaimProcessorVector                0x20069
#undef  OSClaimProcessorVector_Alloc
#define OSClaimProcessorVector_Alloc            0x100
#undef  OSClaimProcessorVector_Free
#define OSClaimProcessorVector_Free             0x0
#undef  OS_Reset
#define OS_Reset                                0x6A
#undef  XOS_Reset
#define XOS_Reset                               0x2006A
#undef  OS_MMUControl
#define OS_MMUControl                           0x6B
#undef  XOS_MMUControl
#define XOS_MMUControl                          0x2006B
#undef  OS_PlatformFeatures
#define OS_PlatformFeatures                     0x6D
#undef  XOS_PlatformFeatures
#define XOS_PlatformFeatures                    0x2006D
#undef  OSPlatformFeatures_GetFeatures
#define OSPlatformFeatures_GetFeatures          0x0
#undef  OS_SynchroniseCodeAreas
#define OS_SynchroniseCodeAreas                 0x6E
#undef  XOS_SynchroniseCodeAreas
#define XOS_SynchroniseCodeAreas                0x2006E
#undef  OS_CallASWI
#define OS_CallASWI                             0x6F
#undef  XOS_CallASWI
#define XOS_CallASWI                            0x2006F
#undef  OS_AMBControl
#define OS_AMBControl                           0x70
#undef  XOS_AMBControl
#define XOS_AMBControl                          0x20070
#undef  OS_CallASWIR12
#define OS_CallASWIR12                          0x71
#undef  XOS_CallASWIR12
#define XOS_CallASWIR12                         0x20071
#undef  OS_EnterUSR32
#define OS_EnterUSR32                           0x73
#undef  XOS_EnterUSR32
#define XOS_EnterUSR32                          0x20073
#undef  OS_EnterUSR26
#define OS_EnterUSR26                           0x74
#undef  XOS_EnterUSR26
#define XOS_EnterUSR26                          0x20074
#undef  OS_Hardware
#define OS_Hardware                             0x7A
#undef  XOS_Hardware
#define XOS_Hardware                            0x2007A
#undef  OS_HardwareCallHAL
#define OS_HardwareCallHAL                      0x0
#undef  OS_HardwareFindHALRoutine
#define OS_HardwareFindHALRoutine               0x1
#undef  OS_ConvertStandardDateAndTime
#define OS_ConvertStandardDateAndTime           0xC0
#undef  XOS_ConvertStandardDateAndTime
#define XOS_ConvertStandardDateAndTime          0x200C0
#undef  OS_ConvertDateAndTime
#define OS_ConvertDateAndTime                   0xC1
#undef  XOS_ConvertDateAndTime
#define XOS_ConvertDateAndTime                  0x200C1
#undef  OS_ConvertHex1
#define OS_ConvertHex1                          0xD0
#undef  XOS_ConvertHex1
#define XOS_ConvertHex1                         0x200D0
#undef  OS_ConvertHex2
#define OS_ConvertHex2                          0xD1
#undef  XOS_ConvertHex2
#define XOS_ConvertHex2                         0x200D1
#undef  OS_ConvertHex4
#define OS_ConvertHex4                          0xD2
#undef  XOS_ConvertHex4
#define XOS_ConvertHex4                         0x200D2
#undef  OS_ConvertHex6
#define OS_ConvertHex6                          0xD3
#undef  XOS_ConvertHex6
#define XOS_ConvertHex6                         0x200D3
#undef  OS_ConvertHex8
#define OS_ConvertHex8                          0xD4
#undef  XOS_ConvertHex8
#define XOS_ConvertHex8                         0x200D4
#undef  OS_ConvertCardinal1
#define OS_ConvertCardinal1                     0xD5
#undef  XOS_ConvertCardinal1
#define XOS_ConvertCardinal1                    0x200D5
#undef  OS_ConvertCardinal2
#define OS_ConvertCardinal2                     0xD6
#undef  XOS_ConvertCardinal2
#define XOS_ConvertCardinal2                    0x200D6
#undef  OS_ConvertCardinal3
#define OS_ConvertCardinal3                     0xD7
#undef  XOS_ConvertCardinal3
#define XOS_ConvertCardinal3                    0x200D7
#undef  OS_ConvertCardinal4
#define OS_ConvertCardinal4                     0xD8
#undef  XOS_ConvertCardinal4
#define XOS_ConvertCardinal4                    0x200D8
#undef  OS_ConvertInteger1
#define OS_ConvertInteger1                      0xD9
#undef  XOS_ConvertInteger1
#define XOS_ConvertInteger1                     0x200D9
#undef  OS_ConvertInteger2
#define OS_ConvertInteger2                      0xDA
#undef  XOS_ConvertInteger2
#define XOS_ConvertInteger2                     0x200DA
#undef  OS_ConvertInteger3
#define OS_ConvertInteger3                      0xDB
#undef  XOS_ConvertInteger3
#define XOS_ConvertInteger3                     0x200DB
#undef  OS_ConvertInteger4
#define OS_ConvertInteger4                      0xDC
#undef  XOS_ConvertInteger4
#define XOS_ConvertInteger4                     0x200DC
#undef  OS_ConvertBinary1
#define OS_ConvertBinary1                       0xDD
#undef  XOS_ConvertBinary1
#define XOS_ConvertBinary1                      0x200DD
#undef  OS_ConvertBinary2
#define OS_ConvertBinary2                       0xDE
#undef  XOS_ConvertBinary2
#define XOS_ConvertBinary2                      0x200DE
#undef  OS_ConvertBinary3
#define OS_ConvertBinary3                       0xDF
#undef  XOS_ConvertBinary3
#define XOS_ConvertBinary3                      0x200DF
#undef  OS_ConvertBinary4
#define OS_ConvertBinary4                       0xE0
#undef  XOS_ConvertBinary4
#define XOS_ConvertBinary4                      0x200E0
#undef  OS_ConvertSpacedCardinal1
#define OS_ConvertSpacedCardinal1               0xE1
#undef  XOS_ConvertSpacedCardinal1
#define XOS_ConvertSpacedCardinal1              0x200E1
#undef  OS_ConvertSpacedCardinal2
#define OS_ConvertSpacedCardinal2               0xE2
#undef  XOS_ConvertSpacedCardinal2
#define XOS_ConvertSpacedCardinal2              0x200E2
#undef  OS_ConvertSpacedCardinal3
#define OS_ConvertSpacedCardinal3               0xE3
#undef  XOS_ConvertSpacedCardinal3
#define XOS_ConvertSpacedCardinal3              0x200E3
#undef  OS_ConvertSpacedCardinal4
#define OS_ConvertSpacedCardinal4               0xE4
#undef  XOS_ConvertSpacedCardinal4
#define XOS_ConvertSpacedCardinal4              0x200E4
#undef  OS_ConvertSpacedInteger1
#define OS_ConvertSpacedInteger1                0xE5
#undef  XOS_ConvertSpacedInteger1
#define XOS_ConvertSpacedInteger1               0x200E5
#undef  OS_ConvertSpacedInteger2
#define OS_ConvertSpacedInteger2                0xE6
#undef  XOS_ConvertSpacedInteger2
#define XOS_ConvertSpacedInteger2               0x200E6
#undef  OS_ConvertSpacedInteger3
#define OS_ConvertSpacedInteger3                0xE7
#undef  XOS_ConvertSpacedInteger3
#define XOS_ConvertSpacedInteger3               0x200E7
#undef  OS_ConvertSpacedInteger4
#define OS_ConvertSpacedInteger4                0xE8
#undef  XOS_ConvertSpacedInteger4
#define XOS_ConvertSpacedInteger4               0x200E8
#undef  OS_ConvertFixedNetStation
#define OS_ConvertFixedNetStation               0xE9
#undef  XOS_ConvertFixedNetStation
#define XOS_ConvertFixedNetStation              0x200E9
#undef  OS_ConvertNetStation
#define OS_ConvertNetStation                    0xEA
#undef  XOS_ConvertNetStation
#define XOS_ConvertNetStation                   0x200EA
#undef  OS_ConvertFixedFileSize
#define OS_ConvertFixedFileSize                 0xEB
#undef  XOS_ConvertFixedFileSize
#define XOS_ConvertFixedFileSize                0x200EB
#undef  OS_ConvertFileSize
#define OS_ConvertFileSize                      0xEC
#undef  XOS_ConvertFileSize
#define XOS_ConvertFileSize                     0x200EC
#undef  OS_WriteI
#define OS_WriteI                               0x100
#undef  XOS_WriteI
#define XOS_WriteI                              0x20100
#undef  OS_Null
#define OS_Null                                 0x100
#undef  XOS_Null
#define XOS_Null                                0x20100
#undef  OS_CharToPrinter
#define OS_CharToPrinter                        0x101
#undef  XOS_CharToPrinter
#define XOS_CharToPrinter                       0x20101
#undef  OS_PrinterOn
#define OS_PrinterOn                            0x102
#undef  XOS_PrinterOn
#define XOS_PrinterOn                           0x20102
#undef  OS_PrinterOff
#define OS_PrinterOff                           0x103
#undef  XOS_PrinterOff
#define XOS_PrinterOff                          0x20103
#undef  OS_SplitCursors
#define OS_SplitCursors                         0x104
#undef  XOS_SplitCursors
#define XOS_SplitCursors                        0x20104
#undef  OS_JoinCursors
#define OS_JoinCursors                          0x105
#undef  XOS_JoinCursors
#define XOS_JoinCursors                         0x20105
#undef  OS_VDUOn
#define OS_VDUOn                                0x106
#undef  XOS_VDUOn
#define XOS_VDUOn                               0x20106
#undef  OS_Bell
#define OS_Bell                                 0x107
#undef  XOS_Bell
#define XOS_Bell                                0x20107
#undef  OS_Backspace
#define OS_Backspace                            0x108
#undef  XOS_Backspace
#define XOS_Backspace                           0x20108
#undef  OS_Tab
#define OS_Tab                                  0x109
#undef  XOS_Tab
#define XOS_Tab                                 0x20109
#undef  OS_LineFeed
#define OS_LineFeed                             0x10A
#undef  XOS_LineFeed
#define XOS_LineFeed                            0x2010A
#undef  OS_VerticalTab
#define OS_VerticalTab                          0x10B
#undef  XOS_VerticalTab
#define XOS_VerticalTab                         0x2010B
#undef  OS_ClS
#define OS_ClS                                  0x10C
#undef  XOS_ClS
#define XOS_ClS                                 0x2010C
#undef  OS_Return
#define OS_Return                               0x10D
#undef  XOS_Return
#define XOS_Return                              0x2010D
#undef  OS_PageModeOn
#define OS_PageModeOn                           0x10E
#undef  XOS_PageModeOn
#define XOS_PageModeOn                          0x2010E
#undef  OS_PageModeOff
#define OS_PageModeOff                          0x10F
#undef  XOS_PageModeOff
#define XOS_PageModeOff                         0x2010F
#undef  OS_ClG
#define OS_ClG                                  0x110
#undef  XOS_ClG
#define XOS_ClG                                 0x20110
#undef  OS_SetTextColour
#define OS_SetTextColour                        0x111
#undef  XOS_SetTextColour
#define XOS_SetTextColour                       0x20111
#undef  OS_SetGCOL
#define OS_SetGCOL                              0x112
#undef  XOS_SetGCOL
#define XOS_SetGCOL                             0x20112
#undef  OS_SetPalette
#define OS_SetPalette                           0x113
#undef  XOS_SetPalette
#define XOS_SetPalette                          0x20113
#undef  OS_ResetColours
#define OS_ResetColours                         0x114
#undef  XOS_ResetColours
#define XOS_ResetColours                        0x20114
#undef  OS_VDUOff
#define OS_VDUOff                               0x115
#undef  XOS_VDUOff
#define XOS_VDUOff                              0x20115
#undef  OS_SetMode
#define OS_SetMode                              0x116
#undef  XOS_SetMode
#define XOS_SetMode                             0x20116
#undef  OS_Misc
#define OS_Misc                                 0x117
#undef  XOS_Misc
#define XOS_Misc                                0x20117
#undef  OS_SetGraphicsWindow
#define OS_SetGraphicsWindow                    0x118
#undef  XOS_SetGraphicsWindow
#define XOS_SetGraphicsWindow                   0x20118
#undef  OS_PlotVDU
#define OS_PlotVDU                              0x119
#undef  XOS_PlotVDU
#define XOS_PlotVDU                             0x20119
#undef  OS_ResetWindows
#define OS_ResetWindows                         0x11A
#undef  XOS_ResetWindows
#define XOS_ResetWindows                        0x2011A
#undef  OS_Escape
#define OS_Escape                               0x11B
#undef  XOS_Escape
#define XOS_Escape                              0x2011B
#undef  OS_SetTextWindow
#define OS_SetTextWindow                        0x11C
#undef  XOS_SetTextWindow
#define XOS_SetTextWindow                       0x2011C
#undef  OS_SetGraphicsOrigin
#define OS_SetGraphicsOrigin                    0x11D
#undef  XOS_SetGraphicsOrigin
#define XOS_SetGraphicsOrigin                   0x2011D
#undef  OS_HomeTextCursor
#define OS_HomeTextCursor                       0x11E
#undef  XOS_HomeTextCursor
#define XOS_HomeTextCursor                      0x2011E
#undef  OS_SetTextCursor
#define OS_SetTextCursor                        0x11F
#undef  XOS_SetTextCursor
#define XOS_SetTextCursor                       0x2011F
#undef  OS_Space
#define OS_Space                                0x120
#undef  XOS_Space
#define XOS_Space                               0x20120
#undef  OS_Delete
#define OS_Delete                               0x17F
#undef  XOS_Delete
#define XOS_Delete                              0x2017F
#undef  UserV
#define UserV                                   0x0
#undef  UKVDU23V
#define UKVDU23V                                0x17
#undef  VDUXV
#define VDUXV                                   0x1B
#undef  Service_ReleaseFIQ
#define Service_ReleaseFIQ                      0xB
#undef  Service_ClaimFIQ
#define Service_ClaimFIQ                        0xC
#undef  Service_Reset
#define Service_Reset                           0x27
#undef  Service_KeyHandler
#define Service_KeyHandler                      0x44
#undef  Service_ModeChange
#define Service_ModeChange                      0x46
#undef  Service_ClaimFIQInBackground
#define Service_ClaimFIQInBackground            0x47
#undef  Service_MemoryMoved
#define Service_MemoryMoved                     0x4E
#undef  Service_PreModeChange
#define Service_PreModeChange                   0x4D
#undef  Service_ModeExtension
#define Service_ModeExtension                   0x50
#undef  Service_ModeTranslation
#define Service_ModeTranslation                 0x51
#undef  Service_ValidateAddress
#define Service_ValidateAddress                 0x6D
#undef  Service_MonitorLeadTranslation
#define Service_MonitorLeadTranslation          0x76
#undef  Service_ModeChanging
#define Service_ModeChanging                    0x89
#undef  Service_EnumerateScreenModes
#define Service_EnumerateScreenModes            0x8D
#undef  Service_PagesUnsafe
#define Service_PagesUnsafe                     0x8E
#undef  Service_PagesSafe
#define Service_PagesSafe                       0x8F
#undef  Service_DynamicAreaCreate
#define Service_DynamicAreaCreate               0x90
#undef  Service_DynamicAreaRemove
#define Service_DynamicAreaRemove               0x91
#undef  Service_DynamicAreaRenumber
#define Service_DynamicAreaRenumber             0x92
#undef  Event_CharInput
#define Event_CharInput                         0x2
#undef  Event_VSync
#define Event_VSync                             0x4
#undef  Event_IntervalTimer
#define Event_IntervalTimer                     0x5
#undef  Event_Escape
#define Event_Escape                            0x6
#undef  Event_User
#define Event_User                              0x9
#undef  Event_MouseTransition
#define Event_MouseTransition                   0xA
#undef  Event_KeyTransition
#define Event_KeyTransition                     0xB
#undef  Event_PointerScroll
#define Event_PointerScroll                     0x4
#undef  UpCall_MoveMemoryRequest
#define UpCall_MoveMemoryRequest                0x101

/************************************
 * Structure and union declarations *
 ************************************/
typedef struct os_mode_                         *os_mode;
      /*Mode number*/
typedef struct os_colour_pair                   os_colour_pair;
typedef struct os_palette                       os_palette;
typedef struct os_palette_base                  os_palette_base;
typedef struct os_sprite_palette                os_sprite_palette;
typedef struct os_sprite_palette_base           os_sprite_palette_base;
typedef struct os_ecf                           os_ecf;
typedef struct os_correction_table              os_correction_table;
typedef struct os_bcd_date_and_time             os_bcd_date_and_time;
typedef struct os_station_number                os_station_number;
typedef struct os_box                           os_box;
typedef struct os_factors                       os_factors;
typedef struct os_change_box                    os_change_box;
typedef struct os_error                         os_error;
typedef struct os_coord                         os_coord;
typedef struct os_trfm                          os_trfm;
typedef struct os_hom_trfm                      os_hom_trfm;
typedef struct os_pgm                           os_pgm;
typedef struct os_error_handler_buffer          os_error_handler_buffer;
typedef union  os_string_value                  os_string_value;
typedef struct os_register_block                os_register_block;
typedef struct os_vdu_var_list                  os_vdu_var_list;
typedef struct os_vdu_var_list_base             os_vdu_var_list_base;
typedef struct os_key_handler                   os_key_handler;
typedef struct os_key_handler_base              os_key_handler_base;
typedef struct os_gi                            os_gi;
typedef struct os_gs                            os_gs;
typedef struct os_gs_base                       os_gs_base;
typedef struct os_heap_sort_flags_              *os_heap_sort_flags;
typedef struct os_mem_map_request               os_mem_map_request;
typedef struct os_mem_map_request_list          os_mem_map_request_list;
typedef struct os_mem_map_request_list_base     os_mem_map_request_list_base;
typedef struct os_page_block                    os_page_block;
typedef struct pointerv_record                  pointerv_record;
typedef struct osmemory_io_reference_key_       *osmemory_io_reference_key;
typedef struct os_mode_block                    os_mode_block;
typedef struct os_mode_block_base               os_mode_block_base;
typedef struct os_mode_selector                 os_mode_selector;
typedef struct os_mode_selector_base            os_mode_selector_base;

/********************
 * Type definitions *
 ********************/
typedef int os_t;
      /*Monotonic time*/

typedef byte os_f;
      /*Deprecated 8-bit File handle. From OSLib V6.3 onwards the headers equate this name to its 32 bit equivalent, but the library retains this symbol for binary compatibility. To revert to legacy bahaviour, #define OSLIB_F8 during compilation.*/

typedef bits os_fw;
      /*Wide (32-bit) File handle*/

typedef byte os_gcol;
      /*Graphical colour, 6 or 8 bits*/

typedef byte os_tint;
      /*Graphical tint*/

typedef byte os_action;
      /*Graphical action*/

typedef bits os_colour;
      /*0xBBGGRR00 triplet, also called palette entry*/

typedef int os_colour_number;
      /*Colour number - value in screen memory*/

struct os_colour_pair
   {  os_colour on;
      os_colour off;
   };

struct os_palette
   {  os_colour entries [UNKNOWN];
   };

#define os_PALETTE(N) \
   struct \
      {  os_colour entries [N]; \
      }

#define os_SIZEOF_PALETTE(N) \
   ((N)*sizeof ((os_palette *) NULL)->entries)

struct os_sprite_palette
   {  os_colour_pair entries [UNKNOWN];
   };

#define os_SPRITE_PALETTE(N) \
   struct \
      {  os_colour_pair entries [N]; \
      }

#define os_SIZEOF_SPRITE_PALETTE(N) \
   ((N)*sizeof ((os_sprite_palette *) NULL)->entries)

struct os_ecf
   {  bits ecf [8];
   };

struct os_correction_table
   {  byte gamma [256];
   };

struct os_bcd_date_and_time
   {  byte year;
      byte month;
      byte date;
      byte weekday;
      byte hour;
      byte minute;
      byte second;
   };

struct os_station_number
   {  int station;
      int net;
   };

struct os_box
   {  int x0;
      int y0;
      int x1;
      int y1;
   };

/* ------------------------------------------------------------------------
 * Type:          os_factors
 *
 * Description:   Scaling factors for plotting
 */

struct os_factors
   {  int xmul;
      int ymul;
      int xdiv;
      int ydiv;
   };

struct os_change_box
   {  int state;
      os_box box;
   };

struct os_error
   {  bits errnum;
      char errmess [252];
   };

typedef byte os_date_and_time [5];
      /*System date and time*/

struct os_coord
   {  int x;
      int y;
   };

/* ------------------------------------------------------------------------
 * Type:          os_trfm
 *
 * Description:   Transformation matrix
 */

struct os_trfm
   {  int entries [3] [2];
   };

/* ------------------------------------------------------------------------
 * Type:          os_hom_trfm
 *
 * Description:   Transformation matrix without translation part
 */

struct os_hom_trfm
   {  int entries [2] [2];
   };

/* ------------------------------------------------------------------------
 * Type:          os_pgm
 *
 * Description:   Parallelogram 
 */

struct os_pgm
   {  os_coord coords [4];
   };

struct os_error_handler_buffer
   {  int pc;
      bits errnum;
      char errmess [248];
   };

union os_string_value
   {  int offset;
      char *pointer;
   };

typedef bits os_plot_code;

typedef int os_var_type;

typedef int os_mode_var;

typedef bits os_mode_flags;

typedef os_mode_var os_vdu_var;

typedef int os_device_type;

typedef bits osreadline_flags;

struct os_register_block
   {  int registers [16];
   };

typedef bits os_read_unsigned_flags;

typedef bits os_gs_flags;

typedef int os_dynamic_area_no;

typedef int palettev_screen_state;

struct os_vdu_var_list
   {  os_vdu_var var [UNKNOWN];
   };

#define os_VDU_VAR_LIST(N) \
   struct \
      {  os_vdu_var var [N]; \
      }

#define os_SIZEOF_VDU_VAR_LIST(N) \
   ((N)*sizeof ((os_vdu_var_list *) NULL)->var)

struct os_key_handler
   {  byte k [UNKNOWN];
   };

#define os_KEY_HANDLER(N) \
   struct \
      {  byte k [N]; \
      }

#define os_SIZEOF_KEY_HANDLER(N) \
   ((N)*sizeof ((os_key_handler *) NULL)->k)

typedef int keyv_type;

typedef int os_handler_type;

typedef bits os_substitute_args_flags;

/* ------------------------------------------------------------------------
 * Type:          os_gi
 *
 * Description:   Type to which the output from a /e directive points after OS_ReadArgs
 */

struct os_gi
   {  byte type;
      byte i [4];
   };

/* ------------------------------------------------------------------------
 * Type:          os_gs
 *
 * Description:   Type to which the output from a /g directive points after OS_ReadArgs
 */

#define os_GS_MEMBERS \
   short size;

/* Base os_gs structure without variable part */
struct os_gs_base
   {  os_GS_MEMBERS
   };

/* legacy structure */
struct os_gs
   {  os_GS_MEMBERS
      char s [UNKNOWN];
   };

#define os_GS(N) \
   struct \
      {  os_GS_MEMBERS \
         char s [N]; \
      }

#define os_SIZEOF_GS(N) \
   (offsetof (os_gs, s) + \
         (N)*sizeof ((os_gs *) NULL)->s)

typedef void *os_sort_type;

typedef bits os_area_flags;

struct os_mem_map_request
   {  int page_no;
      byte *map;
      os_area_flags access;
   };

struct os_mem_map_request_list
   {  os_mem_map_request requests [UNKNOWN];
   };

#define os_MEM_MAP_REQUEST_LIST(N) \
   struct \
      {  os_mem_map_request requests [N]; \
      }

#define os_SIZEOF_MEM_MAP_REQUEST_LIST(N) \
   ((N)*sizeof ((os_mem_map_request_list *) NULL)->requests)

struct os_page_block
   {  int page_no;
      byte *log_addr;
      byte *phys_addr;
   };

typedef int os_changed_box_state;

typedef bits os_colour_flags;

typedef int os_pointer_type;

struct pointerv_record
   {  pointerv_record *next;
      bits flags;
      os_pointer_type pointer_type;
      char name [30];
   };

typedef bits osscreenmode_cache_flags;

typedef int osscreenmode_cleaner_laziness;

typedef bits osmemory_flags;

typedef bits osmemory_type_flags;

typedef bits osmemory_controller_flags;

typedef bits osmemory_io_flags;

typedef bits osmemory_area_flags;

typedef bits os_platform_feature_flags;

typedef bits os_synchronise_code_flags;

typedef bits os_hardware_flags;

#define os_MODE_BLOCK_MEMBERS \
   int size; \
   bits flags; \
   int xres; \
   int yres; \
   int log2_bpp; \
   int frame_rate;

/* Base os_mode_block structure without variable part */
struct os_mode_block_base
   {  os_MODE_BLOCK_MEMBERS
   };

/* legacy structure */
struct os_mode_block
   {  os_MODE_BLOCK_MEMBERS
      char name [UNKNOWN];
   };

#define os_MODE_BLOCK(N) \
   struct \
      {  os_MODE_BLOCK_MEMBERS \
         char name [N]; \
      }

#define os_SIZEOF_MODE_BLOCK(N) \
   (offsetof (os_mode_block, name) + \
         (N)*sizeof ((os_mode_block *) NULL)->name)

#define os_MODE_SELECTOR_MEMBERS \
   bits flags; \
   int xres; \
   int yres; \
   int log2_bpp; \
   int frame_rate;

/* Base os_mode_selector structure without variable part */
struct os_mode_selector_base
   {  os_MODE_SELECTOR_MEMBERS
   };

/* legacy structure */
struct os_mode_selector
   {  os_MODE_SELECTOR_MEMBERS
      struct \
   {  os_mode_var var; \
      int val; \
   } \
   modevars [UNKNOWN];
   };

#define os_MODE_SELECTOR(N) \
   struct \
      {  os_MODE_SELECTOR_MEMBERS \
         struct \
   {  os_mode_var var; \
      int val; \
   } \
   modevars [N]; \
      }

#define os_SIZEOF_MODE_SELECTOR(N) \
   (offsetof (os_mode_selector, modevars) + \
         (N)*sizeof ((os_mode_selector *) NULL)->modevars)

/************************
 * Constant definitions *
 ************************/
#define os_ERROR_LIMIT                          252
#define os_FILE_NAME_LIMIT                      256
#define os_CLI_LIMIT                            256
#define os_CLI_LIMIT_RO4                        1024
#define os_RSHIFT                               8
#define os_GSHIFT                               16
#define os_BSHIFT                               24
#define os_R                                    0xFF00u
#define os_G                                    0xFF0000u
#define os_B                                    0xFF000000u
#define os_COLOUR_RANGE                         255
#define os_MODE1BPP90X45                        ((os_mode) 0x0u)
#define os_MODE2BPP90X45                        ((os_mode) 0x8u)
#define os_MODE4BPP90X45                        ((os_mode) 0xCu)
#define os_MODE8BPP90X45                        ((os_mode) 0xFu)
#define os_MODE2BPP45X45                        ((os_mode) 0x1u)
#define os_MODE4BPP45X45                        ((os_mode) 0x9u)
#define os_MODE8BPP45X45                        ((os_mode) 0xDu)
#define os_MODE1BPP90X90                        ((os_mode) 0x19u)
#define os_MODE2BPP90X90                        ((os_mode) 0x1Au)
#define os_MODE4BPP90X90                        ((os_mode) 0x1Bu)
#define os_MODE8BPP90X90                        ((os_mode) 0x1Cu)
#define os_INCH                                 180
      /*1in in O S units*/
#define os_VDU_NULL                             ((char) '\x00')
#define os_VDU_CHAR_TO_PRINTER                  ((char) '\x01')
#define os_VDU_PRINTER_ON                       ((char) '\x02')
#define os_VDU_PRINTER_OFF                      ((char) '\x03')
#define os_VDU_GRAPH_TEXT_OFF                   ((char) '\x04')
#define os_VDU_SPLIT_CURSORS                    ((char) '\x04')
#define os_VDU_GRAPH_TEXT_ON                    ((char) '\x05')
#define os_VDU_JOIN_CURSORS                     ((char) '\x05')
#define os_VDU_SCREEN_ON                        ((char) '\x06')
#define os_VDU_VDU_ON                           ((char) '\x06')
#define os_VDU_BELL                             ((char) '\x07')
#define os_VDU_BACKSPACE                        ((char) '\x08')
#define os_VDU_TAB                              ((char) '\x09')
#define os_VDU_LINEFEED                         ((char) '\x0A')
#define os_VDU_LINE_FEED                        ((char) '\x0A')
#define os_VDU_VERTICAL_TAB                     ((char) '\x0B')
#define os_VDU_CLS                              ((char) '\x0C')
#define os_VDU_RETURN                           ((char) '\x0D')
#define os_VDU_PAGE_MODE_ON                     ((char) '\x0E')
#define os_VDU_PAGE_MODE_OFF                    ((char) '\x0F')
#define os_VDU_CLG                              ((char) '\x10')
#define os_VDU_SET_TEXT_COLOUR                  ((char) '\x11')
#define os_VDU_SET_GCOL                         ((char) '\x12')
#define os_VDU_SET_PALETTE                      ((char) '\x13')
#define os_VDU_RESET_COLOURS                    ((char) '\x14')
#define os_VDU_SCREEN_OFF                       ((char) '\x15')
#define os_VDU_VDU_OFF                          ((char) '\x15')
#define os_VDU_MODE                             ((char) '\x16')
#define os_VDU_SET_MODE                         ((char) '\x16')
#define os_VDU_MISC                             ((char) '\x17')
#define os_VDU_SET_GRAPHICS_WINDOW              ((char) '\x18')
#define os_VDU_PLOT                             ((char) '\x19')
#define os_VDU_PLOT_VDU                         ((char) '\x19')
#define os_VDU_RESET_WINDOWS                    ((char) '\x1A')
#define os_VDU_ESCAPE                           ((char) '\x1B')
#define os_VDU_SET_TEXT_WINDOW                  ((char) '\x1C')
#define os_VDU_SET_GRAPHICS_ORIGIN              ((char) '\x1D')
#define os_VDU_HOME_TEXT_CURSOR                 ((char) '\x1E')
#define os_VDU_SET_TEXT_CURSOR                  ((char) '\x1F')
#define os_VDU_SPACE                            ((char) ' ')
#define os_VDU_DELETE                           ((char) '\x7F')
#define os_MISC_INTERLACE                       ((char) '\x00')
#define os_MISC_CURSOR                          ((char) '\x01')
#define os_MISC_SET_ECF1                        ((char) '\x02')
#define os_MISC_SET_ECF2                        ((char) '\x03')
#define os_MISC_SET_ECF3                        ((char) '\x04')
#define os_MISC_SET_ECF4                        ((char) '\x05')
#define os_MISC_SET_DOT_STYLE                   ((char) '\x06')
#define os_MISC_SCROLL                          ((char) '\x07')
#define os_MISC_CLEAR_REGION                    ((char) '\x08')
#define os_MISC_SET_ON                          ((char) '\x09')
#define os_MISC_SET_OFF                         ((char) '\x0A')
#define os_MISC_SET_BBCECF                      ((char) '\x0B')
#define os_MISC_SET_UNPACKED_ECF1               ((char) '\x0C')
#define os_MISC_SET_UNPACKED_ECF2               ((char) '\x0D')
#define os_MISC_SET_UNPACKED_ECF3               ((char) '\x0E')
#define os_MISC_SET_UNPACKED_ECF4               ((char) '\x0F')
#define os_MISC_SET_CURSOR_MOVEMENT             ((char) '\x10')
#define os_MISC_MISC                            ((char) '\x11')
#define os_MISC_SET_TEXT_FG_TINT                ((char) '\x00')
#define os_MISC_SET_TEXT_BG_TINT                ((char) '\x01')
#define os_MISC_SET_GRAPHICS_FG_TINT            ((char) '\x02')
#define os_MISC_SET_GRAPHICS_BG_TINT            ((char) '\x03')
#define os_MISC_SET_ECF_INTERPRETATION          ((char) '\x04')
#define os_MISC_INVERT_TEXT                     ((char) '\x05')
#define os_MISC_SET_ECF_ORIGIN                  ((char) '\x06')
#define os_MISC_SET_CHAR_SIZE                   ((char) '\x07')
#define os_ACTION_OVERWRITE                     ((os_action) 0x0u)
#define os_ACTION_DISJOIN                       ((os_action) 0x1u)
#define os_ACTION_CONJOIN                       ((os_action) 0x2u)
#define os_ACTION_EXCLUSIVE_DISJOIN             ((os_action) 0x3u)
#define os_ACTION_INVERT                        ((os_action) 0x4u)
#define os_ACTION_IDENTITY                      ((os_action) 0x5u)
#define os_ACTION_CONJOIN_NEGATION              ((os_action) 0x6u)
#define os_ACTION_DISJOIN_NEGATION              ((os_action) 0x7u)
#define os_ACTION_USE_MASK                      ((os_action) 0x8u)
#define os_ACTION_USE_ECF1                      ((os_action) 0x10u)
#define os_ACTION_USE_ECF2                      ((os_action) 0x20u)
#define os_ACTION_USE_ECF3                      ((os_action) 0x30u)
#define os_ACTION_USE_ECF4                      ((os_action) 0x40u)
#define os_ACTION_USE_GIANT_ECF                 ((os_action) 0x50u)
#define os_GCOL_SET_FG                          ((os_gcol) 0x0u)
#define os_GCOL_SET_BG                          ((os_gcol) 0x80u)
#define os_PLOT_SOLID                           ((os_plot_code) 0x0u)
#define os_PLOT_SOLID_EX_END                    ((os_plot_code) 0x8u)
#define os_PLOT_DOTTED                          ((os_plot_code) 0x10u)
#define os_PLOT_DOTTED_EX_END                   ((os_plot_code) 0x18u)
#define os_PLOT_SOLID_EX_START                  ((os_plot_code) 0x20u)
#define os_PLOT_SOLID_EX_BOTH                   ((os_plot_code) 0x28u)
#define os_PLOT_DOTTED_EX_START                 ((os_plot_code) 0x30u)
#define os_PLOT_DOTTED_EX_BOTH                  ((os_plot_code) 0x38u)
#define os_PLOT_POINT                           ((os_plot_code) 0x40u)
#define os_PLOT_HORIZONTAL_TO_NON_BG            ((os_plot_code) 0x48u)
#define os_PLOT_TRIANGLE                        ((os_plot_code) 0x50u)
#define os_PLOT_RIGHT_TO_BG                     ((os_plot_code) 0x58u)
#define os_PLOT_RECTANGLE                       ((os_plot_code) 0x60u)
#define os_PLOT_HORIZONTAL_TO_FG                ((os_plot_code) 0x68u)
#define os_PLOT_PARALLELOGRAM                   ((os_plot_code) 0x70u)
#define os_PLOT_RIGHT_TO_NON_FG                 ((os_plot_code) 0x78u)
#define os_PLOT_FLOOD_TO_NON_BG                 ((os_plot_code) 0x80u)
#define os_PLOT_FLOOD_TO_FG                     ((os_plot_code) 0x88u)
#define os_PLOT_CIRCLE_OUTLINE                  ((os_plot_code) 0x90u)
#define os_PLOT_CIRCLE                          ((os_plot_code) 0x98u)
#define os_PLOT_ARC                             ((os_plot_code) 0xA0u)
#define os_PLOT_SEGMENT                         ((os_plot_code) 0xA8u)
#define os_PLOT_SECTOR                          ((os_plot_code) 0xB0u)
#define os_PLOT_BLOCK                           ((os_plot_code) 0xB8u)
#define os_PLOT_ELLIPSE_OUTLINE                 ((os_plot_code) 0xC0u)
#define os_PLOT_ELLIPSE                         ((os_plot_code) 0xC8u)
#define os_MOVE_BY                              ((os_plot_code) 0x0u)
#define os_PLOT_BY                              ((os_plot_code) 0x1u)
#define os_PLOT_INVERSE_BY                      ((os_plot_code) 0x2u)
#define os_PLOT_BG_BY                           ((os_plot_code) 0x3u)
#define os_MOVE_TO                              ((os_plot_code) 0x4u)
#define os_PLOT_TO                              ((os_plot_code) 0x5u)
#define os_PLOT_INVERSE_TO                      ((os_plot_code) 0x6u)
#define os_PLOT_BG_TO                           ((os_plot_code) 0x7u)
#define os_VARTYPE_STRING                       ((os_var_type) 0x0u)
#define os_VARTYPE_NUMBER                       ((os_var_type) 0x1u)
#define os_VARTYPE_MACRO                        ((os_var_type) 0x2u)
#define os_VARTYPE_EXPANDED                     ((os_var_type) 0x3u)
#define os_VARTYPE_LITERAL_STRING               ((os_var_type) 0x4u)
#define os_VARTYPE_CODE                         ((os_var_type) 0x10u)
#define os_MODEVAR_MODE_FLAGS                   ((os_mode_var) 0x0u)
#define os_MODEVAR_RSCREEN                      ((os_mode_var) 0x1u)
#define os_MODEVAR_BSCREEN                      ((os_mode_var) 0x2u)
#define os_MODEVAR_NCOLOUR                      ((os_mode_var) 0x3u)
#define os_MODEVAR_XEIG_FACTOR                  ((os_mode_var) 0x4u)
#define os_MODEVAR_YEIG_FACTOR                  ((os_mode_var) 0x5u)
#define os_MODEVAR_LINE_LENGTH                  ((os_mode_var) 0x6u)
#define os_MODEVAR_SCREEN_SIZE                  ((os_mode_var) 0x7u)
#define os_MODEVAR_YSHIFT_FACTOR                ((os_mode_var) 0x8u)
#define os_MODEVAR_LOG2_BPP                     ((os_mode_var) 0x9u)
#define os_MODEVAR_LOG2_BPC                     ((os_mode_var) 0xAu)
#define os_MODEVAR_XWIND_LIMIT                  ((os_mode_var) 0xBu)
#define os_MODEVAR_YWIND_LIMIT                  ((os_mode_var) 0xCu)
#define os_MODE_FLAG_NON_GRAPHICS               ((os_mode_flags) 0x1u)
#define os_MODE_FLAG_TELETEXT                   ((os_mode_flags) 0x2u)
#define os_MODE_FLAG_GAP                        ((os_mode_flags) 0x4u)
#define os_MODE_FLAG_BBC_GAP                    ((os_mode_flags) 0x8u)
#define os_MODE_FLAG_HI_RES_MONO                ((os_mode_flags) 0x10u)
#define os_MODE_FLAG_DOUBLE_HEIGHT              ((os_mode_flags) 0x20u)
#define os_MODE_FLAG_HARDWARE_SCROLL            ((os_mode_flags) 0x40u)
#define os_MODE_FLAG_FULL_PALETTE               ((os_mode_flags) 0x80u)
#define os_MODE_FLAG_DATA_FORMAT                ((os_mode_flags) 0xF000u)
      /*RISC O S 4.32+*/
#define os_MODE_FLAG_DATA_FORMAT_SHIFT          12
      /*RISC O S 4.32+*/
#define os_MODE_FLAG_DATA_FORMAT_RGB            ((os_mode_flags) 0x0u)
      /*RISC O S 4.32+*/
#define os_MODE_FLAG_DATA_FORMAT_CMYK           ((os_mode_flags) 0x1u)
      /*RISC O S 4.32+*/
#define os_VDUVAR_GWL_COL                       ((os_vdu_var) 0x80u)
#define os_VDUVAR_GWB_ROW                       ((os_vdu_var) 0x81u)
#define os_VDUVAR_GWR_COL                       ((os_vdu_var) 0x82u)
#define os_VDUVAR_GWT_ROW                       ((os_vdu_var) 0x83u)
#define os_VDUVAR_TWL_COL                       ((os_vdu_var) 0x84u)
#define os_VDUVAR_TWB_ROW                       ((os_vdu_var) 0x85u)
#define os_VDUVAR_TWR_COL                       ((os_vdu_var) 0x86u)
#define os_VDUVAR_TWT_ROW                       ((os_vdu_var) 0x87u)
#define os_VDUVAR_ORGX                          ((os_vdu_var) 0x88u)
#define os_VDUVAR_ORGY                          ((os_vdu_var) 0x89u)
#define os_VDUVAR_GCSX                          ((os_vdu_var) 0x8Au)
#define os_VDUVAR_GCSY                          ((os_vdu_var) 0x8Bu)
#define os_VDUVAR_OLDER_CSX                     ((os_vdu_var) 0x8Cu)
#define os_VDUVAR_OLDER_CSY                     ((os_vdu_var) 0x8Du)
#define os_VDUVAR_OLD_CSX                       ((os_vdu_var) 0x8Eu)
#define os_VDUVAR_OLD_CSY                       ((os_vdu_var) 0x8Fu)
#define os_VDUVAR_GCS_IX                        ((os_vdu_var) 0x90u)
#define os_VDUVAR_GCS_IY                        ((os_vdu_var) 0x91u)
#define os_VDUVAR_NEW_PTX                       ((os_vdu_var) 0x92u)
#define os_VDUVAR_NEW_PTY                       ((os_vdu_var) 0x93u)
#define os_VDUVAR_SCREEN_START                  ((os_vdu_var) 0x94u)
#define os_VDUVAR_DISPLAY_START                 ((os_vdu_var) 0x95u)
#define os_VDUVAR_TOTAL_SCREEN_SIZE             ((os_vdu_var) 0x96u)
#define os_VDUVAR_GPLFMD                        ((os_vdu_var) 0x97u)
#define os_VDUVAR_GPLBMD                        ((os_vdu_var) 0x98u)
#define os_VDUVAR_GFCOL                         ((os_vdu_var) 0x99u)
#define os_VDUVAR_GBCOL                         ((os_vdu_var) 0x9Au)
#define os_VDUVAR_TFORE_COL                     ((os_vdu_var) 0x9Bu)
#define os_VDUVAR_TBACK_COL                     ((os_vdu_var) 0x9Cu)
#define os_VDUVAR_GF_TINT                       ((os_vdu_var) 0x9Du)
#define os_VDUVAR_GB_TINT                       ((os_vdu_var) 0x9Eu)
#define os_VDUVAR_TF_TINT                       ((os_vdu_var) 0x9Fu)
#define os_VDUVAR_TB_TINT                       ((os_vdu_var) 0xA0u)
#define os_VDUVAR_MAX_MODE                      ((os_vdu_var) 0xA1u)
#define os_VDUVAR_GCHAR_SIZEX                   ((os_vdu_var) 0xA2u)
#define os_VDUVAR_GCHAR_SIZEY                   ((os_vdu_var) 0xA3u)
#define os_VDUVAR_GCHAR_SPACEX                  ((os_vdu_var) 0xA4u)
#define os_VDUVAR_GCHAR_SPACEY                  ((os_vdu_var) 0xA5u)
#define os_VDUVAR_HLINE_ADDR                    ((os_vdu_var) 0xA6u)
#define os_VDUVAR_TCHAR_SIZEX                   ((os_vdu_var) 0xA7u)
#define os_VDUVAR_TCHAR_SIZEY                   ((os_vdu_var) 0xA8u)
#define os_VDUVAR_TCHAR_SPACEX                  ((os_vdu_var) 0xA9u)
#define os_VDUVAR_TCHAR_SPACEY                  ((os_vdu_var) 0xAAu)
#define os_VDUVAR_GCOL_ORA_EOR_ADDR             ((os_vdu_var) 0xABu)
#define os_VDUVAR_VIDC_CLOCK_SPEED              ((os_vdu_var) 0xACu)
#define os_VDUVAR_WINDOW_WIDTH                  ((os_vdu_var) 0x100u)
#define os_VDUVAR_WINDOW_HEIGHT                 ((os_vdu_var) 0x101u)
#define os_VDUVAR_END_LIST                      ((os_vdu_var) 0xFFFFFFFFu)
#define os_FOREGROUND                           0x0u
#define os_BACKGROUND                           0x80u
#define os_COLOUR_TRANSPARENT                   ((os_colour) 0xFFFFFFFFu)
#define os_COLOUR_RED                           ((os_colour) 0xFF00u)
#define os_COLOUR_GREEN                         ((os_colour) 0xFF0000u)
#define os_COLOUR_BLUE                          ((os_colour) 0xFF000000u)
#define os_COLOUR_CYAN                          ((os_colour) 0xFFFF0000u)
#define os_COLOUR_MAGENTA                       ((os_colour) 0xFF00FF00u)
#define os_COLOUR_YELLOW                        ((os_colour) 0xFFFF00u)
#define os_COLOUR_WHITE                         ((os_colour) 0xFFFFFF00u)
#define os_COLOUR_VERY_LIGHT_GREY               ((os_colour) 0xDDDDDD00u)
#define os_COLOUR_LIGHT_GREY                    ((os_colour) 0xBBBBBB00u)
#define os_COLOUR_MID_LIGHT_GREY                ((os_colour) 0x99999900u)
#define os_COLOUR_MID_DARK_GREY                 ((os_colour) 0x77777700u)
#define os_COLOUR_DARK_GREY                     ((os_colour) 0x55555500u)
#define os_COLOUR_VERY_DARK_GREY                ((os_colour) 0x33333300u)
#define os_COLOUR_BLACK                         ((os_colour) 0x0u)
#define os_COLOUR_DARK_BLUE                     ((os_colour) 0x99440000u)
#define os_COLOUR_LIGHT_YELLOW                  ((os_colour) 0xEEEE00u)
#define os_COLOUR_LIGHT_GREEN                   ((os_colour) 0xCC0000u)
#define os_COLOUR_LIGHT_RED                     ((os_colour) 0xDD00u)
#define os_COLOUR_CREAM                         ((os_colour) 0xBBEEEE00u)
#define os_COLOUR_DARK_GREEN                    ((os_colour) 0x885500u)
#define os_COLOUR_ORANGE                        ((os_colour) 0xBBFF00u)
#define os_COLOUR_LIGHT_BLUE                    ((os_colour) 0xFFBB0000u)
#define os_DEVICE_PRINTER_BUSY                  ((os_device_type) 0x0u)
      /*Early */
#define os_DEVICE_PRINTER                       ((os_device_type) 0x0u)
      /*82C71x/IOMD/ARM 7500*/
#define os_DEVICE_SERIAL_RINGING                ((os_device_type) 0x1u)
      /*Early */
#define os_DEVICE_BATTERY_WARNING               ((os_device_type) 0x1u)
      /*82C71x */
#define os_DEVICE_PRINTER_ACKNOWLEDGE           ((os_device_type) 0x2u)
      /*Early */
#define os_DEVICE_FLOPPY_DISC_INDEX             ((os_device_type) 0x2u)
      /*82C71x/IOMD/ARM 7500*/
#define os_DEVICE_VSYNC                         ((os_device_type) 0x3u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_POWER_ON                      ((os_device_type) 0x4u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_IOC_TIMER0                    ((os_device_type) 0x5u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_IOC_TIMER1                    ((os_device_type) 0x6u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_FIQ_DOWNGRADE                 ((os_device_type) 0x7u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_EXPANSION_FIQ_DOWNGRADE       ((os_device_type) 0x8u)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_SOUND_BUFFER                  ((os_device_type) 0x9u)
      /*Early/82C71x */
#define os_DEVICE_IDE_DISCA                     ((os_device_type) 0x9u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_SERIAL_CONTROLLER             ((os_device_type) 0xAu)
      /*Early */
#define os_DEVICE_SERIAL_PORT                   ((os_device_type) 0xAu)
      /*82C71xIOMD/ARM 7500*/
#define os_DEVICE_HARD_DISC_CONTROLLER          ((os_device_type) 0xBu)
      /*Early */
#define os_DEVICE_FLOPPY_DISC                   ((os_device_type) 0xBu)
      /*82C71x */
#define os_DEVICE_NETWORK                       ((os_device_type) 0xBu)
      /*IOMD/ARM 7500*/
#define os_DEVICE_FLOPPY_DISC_CHANGED           ((os_device_type) 0xCu)
      /*Early */
#define os_DEVICE_IDE_DISC                      ((os_device_type) 0xCu)
      /*82C71x */
#define os_DEVICE_FLOPPY_DISCA                  ((os_device_type) 0xCu)
      /*IOMD/ARM 7500*/
#define os_DEVICE_EXPANSION_CARD                ((os_device_type) 0xDu)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_KEYBOARD_TX_EMPTY             ((os_device_type) 0xEu)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_KEYBOARD_RX_FULL              ((os_device_type) 0xFu)
      /*Early/82C71x/IOMD/ARM 7500*/
#define os_DEVICE_DMA_CHANNEL0                  ((os_device_type) 0x10u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_DMA_CHANNEL1                  ((os_device_type) 0x11u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_DMA_CHANNEL2                  ((os_device_type) 0x12u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_DMA_CHANNEL3                  ((os_device_type) 0x13u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_DMA_SOUND_CHANNEL0            ((os_device_type) 0x14u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_DMA_SOUND_CHANNEL1            ((os_device_type) 0x15u)
      /*IOMD/ARM 7500*/
#define os_DEVICE_MOUSE_RX_FULL                 ((os_device_type) 0x16u)
      /*ARM 7500*/
#define os_DEVICE_MOUSE_TX_EMPTY                ((os_device_type) 0x17u)
      /*ARM 7500*/
#define os_DEVICE_JOYSTICK_CONVERSION           ((os_device_type) 0x18u)
      /*ARM 7500*/
#define os_DEVICE_EVENT0                        ((os_device_type) 0x19u)
      /*ARM 7500*/
#define os_DEVICE_EVENT1                        ((os_device_type) 0x1Au)
      /*ARM 7500*/
#define os_ERROR_NUMBER_SHIFT                   0
#define os_ERROR_NUMBER                         0xFFu
#define os_ERROR_SOURCE_SHIFT                   8
#define os_ERROR_SOURCE                         0xFFFF00u
#define os_ERROR_CATEGORY_SHIFT                 24
#define os_ERROR_CATEGORY                       0x7000000u
#define os_CATEGORY_UNCLASSIFIED                0
#define os_CATEGORY_INFORMATION                 1
#define os_CATEGORY_WARNING                     2
#define os_CATEGORY_SYSTEM                      3
#define os_GLOBAL_ESCAPE                        1
#define os_GLOBAL_FATAL                         2
#define os_GLOBAL_IS_AFIL                       3
#define os_GLOBAL_ISNT_FIL                      4
#define os_GLOBAL_IS_ADIR                       5
#define os_GLOBAL_ISNT_DIR                      6
#define os_GLOBAL_NO_FILE                       7
#define os_GLOBAL_NO_DIR                        8
#define os_GLOBAL_NO_ANY                        9
#define os_GLOBAL_TYPS_BAD                      10
#define os_GLOBAL_BAD_REN                       11
#define os_GLOBAL_BAD_ACC                       12
#define os_GLOBAL_OPN_FILS                      13
#define os_GLOBAL_BAD_NAME                      14
#define os_GLOBAL_LONG_NAM                      15
#define os_GLOBAL_CHANNEL                       16
#define os_GLOBAL_BAD_SWI                       17
#define os_GLOBAL_MOD_IN_US                     18
#define os_GLOBAL_STR_OFLO                      19
#define os_GLOBAL_NUM_OFLO                      20
#define os_GLOBAL_BUF_OFLO                      21
#define os_GLOBAL_BAD_STN                       22
#define os_GLOBAL_BAD_NET                       23
#define os_GLOBAL_FULL_NET                      24
#define os_GLOBAL_NO_ECO                        25
#define os_GLOBAL_BAD_READ                      26
#define os_GLOBAL_BAD_WRT                       27
#define os_GLOBAL_DATA_LST                      28
#define os_GLOBAL_BAD_FS_OP                     29
#define os_GLOBAL_FS_NO_RD                      30
#define os_GLOBAL_FS_NO_WRT                     31
#define os_GLOBAL_FS_IN_USE                     32
#define os_GLOBAL_BAD_ADDRESS                   33
#define os_GLOBAL_NO_STORE                      34
#define os_GLOBAL_RAM_LOADC                     35
#define os_GLOBAL_DDS0                          36
#define os_GLOBAL_DDS1                          37
#define os_GLOBAL_DDS2                          38
#define os_GLOBAL_DDS3                          39
#define os_GLOBAL_CSDS                          40
#define os_GLOBAL_LDS                           41
#define os_GLOBAL_URDS                          42
#define os_GLOBAL_DR                            43
#define os_GLOBAL_APP                           44
#define os_GLOBAL_EX_DT                         45
#define os_GLOBAL_EX_LD_EX                      46
#define os_GLOBAL_USE_DESK                      47
#define os_GLOBAL_APP_QUIT                      48
#define os_GLOBAL_NO_MEM                        49
#define os_GLOBAL_BAD_HARD                      50
#define os_GLOBAL_BAD_PARM                      51
#define os_GLOBAL_NO_WIMP                       52
#define error_ESCAPE                            0x11u
#define error_BAD_MODE                          0x19u
#define error_IS_ADIR                           0xA8u
#define error_TYPES_DONT_MATCH                  0xAFu
#define error_BAD_RENAME                        0xB0u
#define error_BAD_COPY                          0xB1u
#define error_OUTSIDE_FILE                      0xB7u
#define error_ACCESS_VIOLATION                  0xBDu
#define error_TOO_MANY_OPEN_FILES               0xC0u
#define error_NOT_OPEN_FOR_UPDATE               0xC1u
#define error_FILE_OPEN                         0xC2u
#define error_OBJECT_LOCKED                     0xC3u
#define error_ALREADY_EXISTS                    0xC4u
#define error_BAD_FILE_NAME                     0xCCu
#define error_FILE_NOT_FOUND                    0xD6u
#define error_SYNTAX                            0xDCu
#define error_BAD_NO_PARMS                      0xDCu
#define error_TOO_MANY_PARMS                    0xDCu
#define error_CHANNEL                           0xDEu
#define error_END_OF_FILE                       0xDFu
#define error_BAD_FILING_SYSTEM_NAME            0xF8u
#define error_UNKNOWN_FILING_SYSTEM             0xF8u
#define error_BAD_KEY                           0xFBu
#define error_BAD_ADDRESS                       0xFCu
#define error_BAD_STRING                        0xFDu
#define error_BAD_ALIAS_STRING                  0xFDu
#define error_BAD_PARM_STRING                   0xFDu
#define error_WILD_CARDS                        0xFDu
#define error_BAD_COMMAND                       0xFEu
#define error_BAD_MAC_VAL                       0x120u
#define error_BAD_VAR_NAM                       0x121u
#define error_BAD_VAR_TYPE                      0x122u
#define error_VAR_NO_ROOM                       0x123u
#define error_VAR_CANT_FIND                     0x124u
#define error_VAR_TOO_LONG                      0x125u
#define error_REDIRECT_FAIL                     0x140u
#define error_STACK_FULL                        0x141u
#define error_BAD_HEX                           0x160u
#define error_BAD_EXPR                          0x161u
#define error_BAD_BRA                           0x162u
#define error_STK_OFLO                          0x163u
#define error_MISS_OPN                          0x164u
#define error_MISS_OPR                          0x165u
#define error_BAD_BITS                          0x166u
#define error_STR_OFLO                          0x167u
#define error_BAD_ITM                           0x168u
#define error_DIV_ZERO                          0x169u
#define error_BAD_BASE                          0x16Au
#define error_BAD_NUMB                          0x16Bu
#define error_NUMB_TOO_BIG                      0x16Cu
#define error_BAD_CLAIM_NUM                     0x1A1u
#define error_BAD_RELEASE                       0x1A2u
#define error_BAD_DEV_NO                        0x1A3u
#define error_BAD_DEV_VEC_REL                   0x1A4u
#define error_BAD_ENV_NUMBER                    0x1B0u
#define error_CANT_CANCEL_QUIT                  0x1B1u
#define error_CH_DYNAM_CAO                      0x1C0u
#define error_CH_DYNAM_NOT_ALL_MOVED            0x1C1u
#define error_APL_WSPACE_IN_USE                 0x1C2u
#define error_RAM_FS_UNCHANGEABLE               0x1C3u
#define error_OSCLI_LONG_LINE                   0x1E0u
      /*line too long for OS_CLI*/
#define error_OSCLI_TOO_HARD                    0x1E1u
      /*OS_CLI ran out of buffers*/
#define error_RC_EXC                            0x1E2u
#define error_RC_NEGATIVE                       0x1E2u
#define error_SYS_HEAP_FULL                     0x1E3u
#define error_BUFF_OVERFLOW                     0x1E4u
#define error_BAD_TIME                          0x1E5u
#define error_NO_SUCH_SWI                       0x1E6u
#define error_UNIMPLEMENTED                     0x1E7u
#define error_OUT_OF_RANGE                      0x1E8u
#define error_NO_OSCLI_SPECIALS                 0x1E9u
#define error_BAD_PARAMETERS                    0x1EAu
#define error_ARG_REPEATED                      0x1EBu
#define error_BAD_READ_SYS_INFO                 0x1ECu
#define error_CDAT_STACK_OVERFLOW               0x2C0u
#define error_CDAT_BUFFER_OVERFLOW              0x2C1u
#define error_CDAT_BAD_FIELD                    0x2C2u
#define error_CANT_START_APPLICATION            0x600u
      /*Unable to start application*/
#define error_BAD_COMMAND_OPTION                0x601u
      /*Bad command option*/
#define error_UNKNOWN_SERIAL_OP                 0x602u
      /*Unknown serial operation*/
#define error_BAD_HARD                          0x603u
      /*Unsupported hardware configuration*/
#define osreadline_GIVEN_ECHO_CHARACTER         ((osreadline_flags) 0x40000000u)
#define osreadline_SUPPRESS_INVALID             ((osreadline_flags) 0x80000000u)
#define osreadline_ECHO_CHARACTER               ((osreadline_flags) 0xFFu)
#define osreadline_ECHO_CHARACTER_SHIFT         0
#define os_READ_CONTROL_TERMINATED              ((os_read_unsigned_flags) 0x80000000u)
#define os_READ_BYTE                            ((os_read_unsigned_flags) 0x40000000u)
#define os_READ_LIMITED                         ((os_read_unsigned_flags) 0x20000000u)
#define os_DESTROY_VAR                          (-1)
      /*for use as 'size' in OS_SetVarVal*/
#define os_GS_TERMINATE_ON_SPACE                ((os_gs_flags) 0x20000000u)
#define os_GS_RETAIN_STICK                      ((os_gs_flags) 0x40000000u)
#define os_GS_RETAIN_DOUBLE_QUOTE               ((os_gs_flags) 0x80000000u)
#define os_DYNAMIC_AREA_APPLICATION_SPACE       ((os_dynamic_area_no) 0xFFFFFFFFu)
      /*RISC O S 3.5+*/
#define os_DYNAMIC_AREA_SYSTEM_HEAP             ((os_dynamic_area_no) 0x0u)
#define os_DYNAMIC_AREA_RMA                     ((os_dynamic_area_no) 0x1u)
#define os_DYNAMIC_AREA_SCREEN_MEMORY           ((os_dynamic_area_no) 0x2u)
#define os_DYNAMIC_AREA_SYSTEM_SPRITES          ((os_dynamic_area_no) 0x3u)
#define os_DYNAMIC_AREA_FONT_CACHE              ((os_dynamic_area_no) 0x4u)
#define os_DYNAMIC_AREA_RAM_DISC                ((os_dynamic_area_no) 0x5u)
#define os_DYNAMIC_AREA_FREE_POOL               ((os_dynamic_area_no) 0x6u)
      /*RISC O S 3.5+*/
#define palettev_SCREEN_STATE_READ              ((palettev_screen_state) 0xFFFFFFFFu)
#define palettev_SCREEN_STATE_NORMAL            ((palettev_screen_state) 0x0u)
#define palettev_SCREEN_STATE_QUIET             ((palettev_screen_state) 0x1u)
#define keyv_TYPE_ARCHIMEDES                    ((keyv_type) 0x1u)
#define keyv_TYPE_PCAT                          ((keyv_type) 0x2u)
#define os_CURRENT_MODE                         ((os_mode) 0xFFFFFFFFu)
#define os_NONEXISTENT_MODE                     (-1)
#define os_NOT_ENOUGH_MEMORY_FOR_MODE           (-2)
#define os_NO_ALTERNATIVE_MODE                  ((os_mode) 0xFFFFFFFEu)
#define os_HANDLER_MEMORY_LIMIT                 ((os_handler_type) 0x0u)
#define os_HANDLER_UNDEFINED_INSTRUCTION        ((os_handler_type) 0x1u)
#define os_HANDLER_PREFETCH_ABORT               ((os_handler_type) 0x2u)
#define os_HANDLER_DATA_ABORT                   ((os_handler_type) 0x3u)
#define os_HANDLER_ADDRESS_EXCEPTION            ((os_handler_type) 0x4u)
#define os_HANDLER_OTHER_EXCEPTIONS             ((os_handler_type) 0x5u)
#define os_HANDLER_ERROR                        ((os_handler_type) 0x6u)
#define os_HANDLER_CALL_BACK                    ((os_handler_type) 0x7u)
#define os_HANDLER_BREAK_PT                     ((os_handler_type) 0x8u)
#define os_HANDLER_ESCAPE                       ((os_handler_type) 0x9u)
#define os_HANDLER_EVENT                        ((os_handler_type) 0xAu)
#define os_HANDLER_EXIT                         ((os_handler_type) 0xBu)
#define os_HANDLER_UNUSED_SWI                   ((os_handler_type) 0xCu)
#define os_HANDLER_EXCEPTION_REGISTERS          ((os_handler_type) 0xDu)
#define os_HANDLER_APPLICATION_SPACE            ((os_handler_type) 0xEu)
#define os_HANDLER_CAO                          ((os_handler_type) 0xFu)
#define os_HANDLER_UP_CALL                      ((os_handler_type) 0x10u)
#define os_SUBSTITUTE_ARGS_IGNORE_EXTRAS        ((os_substitute_args_flags) 0x80000000u)
#define os_SORT_CARDINAL                        ((os_sort_type) 0x0u)
#define os_SORT_INTEGER                         ((os_sort_type) 0x1u)
#define os_SORT_CARDINAL_POINTER                ((os_sort_type) 0x2u)
#define os_SORT_INTEGER_POINTER                 ((os_sort_type) 0x3u)
#define os_SORT_CI_STRING                       ((os_sort_type) 0x4u)
#define os_SORT_STRING                          ((os_sort_type) 0x5u)
#define os_SORT_GIVEN_WORKSPACE                 ((os_heap_sort_flags) 0x20000000u)
#define os_SORT_BUILD_ARRAY                     ((os_heap_sort_flags) 0x40000000u)
#define os_SORT_OBJECTS                         ((os_heap_sort_flags) 0x80000000u)
#define os_AREA_ACCESS_READ_WRITE               ((os_area_flags) 0x0u)
#define os_AREA_ACCESS_READ_ONLY                ((os_area_flags) 0x1u)
#define os_AREA_ACCESS_NONE                     ((os_area_flags) 0x3u)
#define os_AREA_ACCESS_SHIFT                    0
#define os_AREA_NOT_BUFFERABLE                  ((os_area_flags) 0x10u)
#define os_AREA_NOT_CACHEABLE                   ((os_area_flags) 0x20u)
#define os_AREA_DOUBLY_MAPPED                   ((os_area_flags) 0x40u)
#define os_AREA_NO_USER_DRAG                    ((os_area_flags) 0x80u)
#define os_AREA_NEEDS_GIVEN_PAGES               ((os_area_flags) 0x100u)
#define os_AREA_SHRINKABLE                      ((os_area_flags) 0x200u)
#define os_AREA_SPARSE                          ((os_area_flags) 0x400u)
#define os_AREA_PRIVATE                         ((os_area_flags) 0x800u)
#define os_AREA_IS_HEAP                         ((os_area_flags) 0x4000u)
      /*RISC O S Select*/
#define os_DISABLE_CHANGED_BOX                  ((os_changed_box_state) 0x0u)
#define os_ENABLE_CHANGED_BOX                   ((os_changed_box_state) 0x1u)
#define os_RESET_CHANGED_BOX                    ((os_changed_box_state) 0x2u)
#define os_READ_CHANGED_BOX                     ((os_changed_box_state) 0xFFFFFFFFu)
#define os_COLOUR_SET_BG                        ((os_colour_flags) 0x10u)
#define os_COLOUR_GIVEN_PATTERN                 ((os_colour_flags) 0x20u)
#define os_COLOUR_SET_TEXT                      ((os_colour_flags) 0x40u)
      /*RISC O S 3.5+*/
#define os_COLOUR_READ                          ((os_colour_flags) 0x80u)
      /*RISC O S 3.5+*/
#define pointerv_TYPE_QUADRATURE                ((os_pointer_type) 0x0u)
#define pointerv_TYPE_MICROSOFT                 ((os_pointer_type) 0x1u)
      /*RISC O S 3.5+*/
#define pointerv_TYPE_MOUSE_SYSTEMS             ((os_pointer_type) 0x2u)
      /*RISC O S 3.5+*/
#define pointerv_TYPE_PS2                       ((os_pointer_type) 0x3u)
      /*RISC O S 3.6+*/
#define osscreenmode_SUSPEND_CACHEING           ((osscreenmode_cache_flags) 0x1u)
#define osscreenmode_SUSPEND_CLEANING           ((osscreenmode_cache_flags) 0x2u)
#define osscreenmode_READ_LAZINESS              ((osscreenmode_cleaner_laziness) 0xFFFFFFFFu)
#define osscreenmode_FIRST_VSYNC                ((osscreenmode_cleaner_laziness) 0x1u)
#define osscreenmode_SECOND_VSYNC               ((osscreenmode_cleaner_laziness) 0x2u)
#define osscreenmode_THIRD_VSYNC                ((osscreenmode_cleaner_laziness) 0x3u)
#define osdynamicarea_ALLOCATE_AREA             (-1)
#define osdynamicarea_ALLOCATE_BASE             ((byte *) 0xFFFFFFFFu)
#define osmemory_GIVEN_PAGE_NO                  ((osmemory_flags) 0x100u)
#define osmemory_GIVEN_LOG_ADDR                 ((osmemory_flags) 0x200u)
#define osmemory_GIVEN_PHYS_ADDR                ((osmemory_flags) 0x400u)
#define osmemory_RETURN_PAGE_NO                 ((osmemory_flags) 0x800u)
#define osmemory_RETURN_LOG_ADDR                ((osmemory_flags) 0x1000u)
#define osmemory_RETURN_PHYS_ADDR               ((osmemory_flags) 0x2000u)
#define osmemory_CACHE                          ((osmemory_flags) 0xC000u)
#define osmemory_CACHE_SHIFT                    14
#define osmemory_CACHE_DISABLE                  ((osmemory_flags) 0x2u)
#define osmemory_CACHE_ENABLE                   ((osmemory_flags) 0x3u)
#define osmemory_TYPE                           ((osmemory_type_flags) 0xF00u)
#define osmemory_TYPE_SHIFT                     8
#define osmemory_TYPE_ABSENT                    ((osmemory_type_flags) 0x0u)
#define osmemory_TYPE_DRAM                      ((osmemory_type_flags) 0x1u)
#define osmemory_TYPE_VRAM                      ((osmemory_type_flags) 0x2u)
#define osmemory_TYPE_ROM                       ((osmemory_type_flags) 0x3u)
#define osmemory_TYPE_IO                        ((osmemory_type_flags) 0x4u)
#define osmemory_TYPE_SOFT_ROM                  ((osmemory_type_flags) 0x5u)
      /*RISC O S 5+*/
#define osmemory_CONTROLLER_NO                  ((os_controller_flags) 0xFu)
#define osmemory_CONTROLLER_NO_SHIFT            0
#define osmemory_CONTROLLER_TYPE                ((os_controller_flags) 0xFFFFFFF0u)
#define osmemory_CONTROLLER_TYPE_SHIFT          8
#define osmemory_CONTROLLER_TYPE_EASI           ((os_controller_flags) 0x0u)
#define osmemory_CONTROLLER_TYPE_EASI_SPACE     ((os_controller_flags) 0x1u)
#define osmemory_CONTROLLER_TYPE_VIDC1          ((os_controller_flags) 0x2u)
#define osmemory_CONTROLLER_TYPE_VIDC20         ((os_controller_flags) 0x3u)
#define osmemory_CONTROLLER_TYPE_SSPACE         ((os_controller_flags) 0x4u)
      /*RISC O S 5+*/
#define osmemory_CONTROLLER_TYPE_EXTENSION_RO_MS ((os_controller_flags) 0x5u)
      /*RISC O S 5+*/
#define osmemory_IO_BUFFERABLE                  ((osmemory_io_flags) 0x100u)
#define osmemory_IO_CACHEABLE                   ((osmemory_io_flags) 0x200u)
#define osmemory_IO_DOUBLY_MAPPED               ((osmemory_io_flags) 0x10000u)
#define osmemory_IO_RESTRICT_ACCESS             ((osmemory_io_flags) 0x20000u)
#define osmemory_IO_ACCESS                      ((osmemory_io_flags) 0xF000000u)
#define osmemory_IO_ACCESS_SHIFT                24
#define osmemory_AREA                           ((osmemory_area_flags) 0xFF00u)
#define osmemory_AREA_SHIFT                     8
#define osmemory_AREA_CURSOR_SYSTEM_SOUND       ((osmemory_area_flags) 0x1u)
#define osmemory_AREA_IRQ_STACK                 ((osmemory_area_flags) 0x2u)
#define osmemory_AREA_SVC_STACK                 ((osmemory_area_flags) 0x3u)
#define osmemory_AREA_ABT_STACK                 ((osmemory_area_flags) 0x4u)
#define osmemory_AREA_UND_STACK                 ((osmemory_area_flags) 0x5u)
#define osmemory_AREA_SOFT_CAM                  ((osmemory_area_flags) 0x6u)
#define osmemory_AREA_LEVEL_ONE_PAGE_TABLES     ((osmemory_area_flags) 0x7u)
#define osmemory_AREA_LEVEL_TWO_PAGE_TABLES     ((osmemory_area_flags) 0x8u)
#define osmemory_AREA_HAL_WORKSPACE             ((osmemory_area_flags) 0x9u)
#define osmemory_AREA_KERNEL_BUFFERS            ((osmemory_area_flags) 0xAu)
#define osmemory_AREA_UNCACHEABLE_HAL_WORKSPACE ((osmemory_area_flags) 0xBu)
#define os_PLATFORM_CODE_NEEDS_SYNCHRONISATION  ((os_platform_feature_flags) 0x1u)
#define os_PLATFORM_NEEDS_PREDISABLE_FUNCTION   ((os_platform_feature_flags) 0x2u)
#define os_PLATFORM_EXCEPTION_VECTOR_MODIFY_NEEDS32BIT ((os_platform_feature_flags) 0x4u)
#define os_PLATFORM_PIPELINE_LENGTH2            ((os_platform_feature_flags) 0x8u)
#define os_PLATFORM_FULL_EARLY_DATA_ABORTS      ((os_platform_feature_flags) 0x10u)
#define os_PLATFORM32_BIT_OS                    ((os_platform_feature_flags) 0x40u)
      /*RISC O S 5+*/
#define os_PLATFORM26_BIT_MODE_NOT_AVAILABLE    ((os_platform_feature_flags) 0x80u)
      /*RISC O S 5+*/
#define os_GIVEN_CODE_RANGE                     ((os_synchronise_code_flags) 0x1u)
#define os_HEX1_LIMIT                           1
#define os_HEX2_LIMIT                           2
#define os_HEX4_LIMIT                           4
#define os_HEX6_LIMIT                           6
#define os_HEX8_LIMIT                           8
#define os_CARDINAL1_LIMIT                      3
#define os_CARDINAL2_LIMIT                      5
#define os_CARDINAL3_LIMIT                      8
#define os_CARDINAL4_LIMIT                      10
#define os_INTEGER1_LIMIT                       4
#define os_INTEGER2_LIMIT                       6
#define os_INTEGER3_LIMIT                       8
#define os_INTEGER4_LIMIT                       11
#define os_BINARY1_LIMIT                        8
#define os_BINARY2_LIMIT                        16
#define os_BINARY3_LIMIT                        24
#define os_BINARY4_LIMIT                        32
#define os_SPACED_CARDINAL1_LIMIT               3
#define os_SPACED_CARDINAL2_LIMIT               6
#define os_SPACED_CARDINAL3_LIMIT               10
#define os_SPACED_CARDINAL4_LIMIT               13
#define os_SPACED_INTEGER1_LIMIT                4
#define os_SPACED_INTEGER2_LIMIT                7
#define os_SPACED_INTEGER3_LIMIT                10
#define os_SPACED_INTEGER4_LIMIT                14
#define os_FIXED_NET_STATION_LIMIT              7
#define os_NET_STATION_LIMIT                    7
#define os_FIXED_FILE_SIZE_LIMIT                11
#define os_FILE_SIZE_LIMIT                      11
#define os_TRANSITION_MOUSE_RIGHT               0x1u
#define os_TRANSITION_MOUSE_MIDDLE              0x2u
#define os_TRANSITION_MOUSE_LEFT                0x4u
#define os_TRANSITION_KEY_ESCAPE                ((byte) 0)
#define os_TRANSITION_KEY_F1                    ((byte) 1)
#define os_TRANSITION_KEY_F2                    ((byte) 2)
#define os_TRANSITION_KEY_F3                    ((byte) 3)
#define os_TRANSITION_KEY_F4                    ((byte) 4)
#define os_TRANSITION_KEY_F5                    ((byte) 5)
#define os_TRANSITION_KEY_F6                    ((byte) 6)
#define os_TRANSITION_KEY_F7                    ((byte) 7)
#define os_TRANSITION_KEY_F8                    ((byte) 8)
#define os_TRANSITION_KEY_F9                    ((byte) 9)
#define os_TRANSITION_KEY_F10                   ((byte) 10)
#define os_TRANSITION_KEY_F11                   ((byte) 11)
#define os_TRANSITION_KEY_F12                   ((byte) 12)
#define os_TRANSITION_KEY_PRINT                 ((byte) 13)
#define os_TRANSITION_KEY_SCROLL_LOCK           ((byte) 14)
#define os_TRANSITION_KEY_BREAK                 ((byte) 15)
#define os_TRANSITION_KEY_GRAVE                 ((byte) 16)
#define os_TRANSITION_KEY1                      ((byte) 17)
#define os_TRANSITION_KEY2                      ((byte) 18)
#define os_TRANSITION_KEY3                      ((byte) 19)
#define os_TRANSITION_KEY4                      ((byte) 20)
#define os_TRANSITION_KEY5                      ((byte) 21)
#define os_TRANSITION_KEY6                      ((byte) 22)
#define os_TRANSITION_KEY7                      ((byte) 23)
#define os_TRANSITION_KEY8                      ((byte) 24)
#define os_TRANSITION_KEY9                      ((byte) 25)
#define os_TRANSITION_KEY0                      ((byte) 26)
#define os_TRANSITION_KEY_HYPHEN                ((byte) 27)
#define os_TRANSITION_KEY_EQUALS                ((byte) 28)
#define os_TRANSITION_KEY_POUND                 ((byte) 29)
#define os_TRANSITION_KEY_BACKSPACE             ((byte) 30)
#define os_TRANSITION_KEY_INSERT                ((byte) 31)
#define os_TRANSITION_KEY_HOME                  ((byte) 32)
#define os_TRANSITION_KEY_PAGE_UP               ((byte) 33)
#define os_TRANSITION_KEY_NUM_LOCK              ((byte) 34)
#define os_TRANSITION_KEY_KEYPAD_SLASH          ((byte) 35)
#define os_TRANSITION_KEY_KEYPAD_STAR           ((byte) 36)
#define os_TRANSITION_KEY_KEYPAD_HASH           ((byte) 37)
#define os_TRANSITION_KEY_TAB                   ((byte) 38)
#define os_TRANSITION_KEYQ                      ((byte) 39)
#define os_TRANSITION_KEYW                      ((byte) 40)
#define os_TRANSITION_KEYE                      ((byte) 41)
#define os_TRANSITION_KEYR                      ((byte) 42)
#define os_TRANSITION_KEYT                      ((byte) 43)
#define os_TRANSITION_KEYY                      ((byte) 44)
#define os_TRANSITION_KEYU                      ((byte) 45)
#define os_TRANSITION_KEYI                      ((byte) 46)
#define os_TRANSITION_KEYO                      ((byte) 47)
#define os_TRANSITION_KEYP                      ((byte) 48)
#define os_TRANSITION_KEY_SQUARE_BRA            ((byte) 49)
#define os_TRANSITION_KEY_SQUARE_KET            ((byte) 50)
#define os_TRANSITION_KEY_BACKSLASH             ((byte) 51)
#define os_TRANSITION_KEY_DELETE                ((byte) 52)
#define os_TRANSITION_KEY_COPY                  ((byte) 53)
#define os_TRANSITION_KEY_PAGE_DOWN             ((byte) 54)
#define os_TRANSITION_KEY_KEYPAD7               ((byte) 55)
#define os_TRANSITION_KEY_KEYPAD8               ((byte) 56)
#define os_TRANSITION_KEY_KEYPAD9               ((byte) 57)
#define os_TRANSITION_KEY_KEYPAD_MINUS          ((byte) 58)
#define os_TRANSITION_KEY_LEFT_CONTROL          ((byte) 59)
#define os_TRANSITION_KEYA                      ((byte) 60)
#define os_TRANSITION_KEYS                      ((byte) 61)
#define os_TRANSITION_KEYD                      ((byte) 62)
#define os_TRANSITION_KEYF                      ((byte) 63)
#define os_TRANSITION_KEYG                      ((byte) 64)
#define os_TRANSITION_KEYH                      ((byte) 65)
#define os_TRANSITION_KEYJ                      ((byte) 66)
#define os_TRANSITION_KEYK                      ((byte) 67)
#define os_TRANSITION_KEYL                      ((byte) 68)
#define os_TRANSITION_KEY_SEMICOLON             ((byte) 69)
#define os_TRANSITION_KEY_ACUTE                 ((byte) 70)
#define os_TRANSITION_KEY_RETURN                ((byte) 71)
#define os_TRANSITION_KEY_KEYPAD4               ((byte) 72)
#define os_TRANSITION_KEY_KEYPAD5               ((byte) 73)
#define os_TRANSITION_KEY_KEYPAD6               ((byte) 74)
#define os_TRANSITION_KEY_KEYPAD_PLUS           ((byte) 75)
#define os_TRANSITION_KEY_LEFT_SHIFT            ((byte) 76)
#define os_TRANSITION_KEYZ                      ((byte) 78)
#define os_TRANSITION_KEYX                      ((byte) 79)
#define os_TRANSITION_KEYC                      ((byte) 80)
#define os_TRANSITION_KEYV                      ((byte) 81)
#define os_TRANSITION_KEYB                      ((byte) 82)
#define os_TRANSITION_KEYN                      ((byte) 83)
#define os_TRANSITION_KEYM                      ((byte) 84)
#define os_TRANSITION_KEY_COMMA                 ((byte) 85)
#define os_TRANSITION_KEY_POINT                 ((byte) 86)
#define os_TRANSITION_KEY_SLASH                 ((byte) 87)
#define os_TRANSITION_KEY_RIGHT_SHIFT           ((byte) 88)
#define os_TRANSITION_KEY_UP                    ((byte) 89)
#define os_TRANSITION_KEY_KEYPAD1               ((byte) 90)
#define os_TRANSITION_KEY_KEYPAD2               ((byte) 91)
#define os_TRANSITION_KEY_KEYPAD3               ((byte) 92)
#define os_TRANSITION_KEY_CAPS_LOCK             ((byte) 93)
#define os_TRANSITION_KEY_LEFT_ALT              ((byte) 94)
#define os_TRANSITION_KEY_SPACE                 ((byte) 95)
#define os_TRANSITION_KEY_RIGHT_ALT             ((byte) 96)
#define os_TRANSITION_KEY_RIGHT_CONTROL         ((byte) 97)
#define os_TRANSITION_KEY_LEFT                  ((byte) 98)
#define os_TRANSITION_KEY_DOWN                  ((byte) 99)
#define os_TRANSITION_KEY_RIGHT                 ((byte) 100)
#define os_TRANSITION_KEY_KEYPAD0               ((byte) 101)
#define os_TRANSITION_KEY_KEYPAD_POINT          ((byte) 102)
#define os_TRANSITION_KEY_ENTER                 ((byte) 103)
#define os_TRANSITION_UP                        0
#define os_TRANSITION_DOWN                      1

/*************************
 * Function declarations *
 *************************/

#ifdef __cplusplus
   extern "C" {
#endif

/* ------------------------------------------------------------------------
 * Function:      os_read_var_val_size()
 *
 * Description:   Gets size of system variable or checks for its existance
 *                (PRM 1-309, 5a-661)
 *
 * Input:         var - value of R0 on entry
 *                context - value of R3 on entry
 *                var_type - value of R4 on entry
 *
 * Output:        used - 0 if not found or, if var_type_out != 3, then NOT the number of bytes required for the variable
 *                context_out - value of R3 on exit (X version only)
 *                var_type_out - value of R4 on exit
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x23 with R1 = 0x0, R2 = 0x80000000.
 */

extern os_error *xos_read_var_val_size (char const *var,
      int context,
      os_var_type var_type,
      int *used,
      int *context_out,
      os_var_type *var_type_out);
extern int os_read_var_val_size (char const *var,
      int context,
      os_var_type var_type,
      int *used,
      os_var_type *var_type_out);

/* ------------------------------------------------------------------------
 * Function:      os_change_dynamic_area_no_fail()
 *
 * Description:   Alters the space allocation of a dynamic area without
 *                throwing an error if the change was only partially
 *                performed
 *
 * Input:         area_type - value of R0 on entry
 *                change - Increase required (signed integer)
 *
 * Output:        change_out - Amount changed (unsigned integer) (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2A.
 */

extern os_error *xos_change_dynamic_area_no_fail (os_dynamic_area_no area_type,
      int change,
      int *change_out);
extern int os_change_dynamic_area_no_fail (os_dynamic_area_no area_type,
      int change);

/* ------------------------------------------------------------------------
 * Function:      os_writec()
 *
 * Description:   Writes a character to all of the active output streams
 *
 * Input:         c - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x0.
 */

extern os_error *xos_writec (char c);
__swi (0x0) void os_writec (char c);

/* ------------------------------------------------------------------------
 * Function:      wrchv()
 *
 * Description:   OS_WriteC vector
 *
 * Input:         c - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x3.
 */

extern os_error *xwrchv (char c);
extern void wrchv (char c);

/* ------------------------------------------------------------------------
 * Function:      os_write0()
 *
 * Description:   Writes a string to all of the active output streams
 *
 * Input:         s - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x2.
 */

extern os_error *xos_write0 (char const *s);
__swi (0x2) void os_write0 (char const *s);

/* ------------------------------------------------------------------------
 * Function:      os_new_line()
 *
 * Description:   Writes a line feed followed by a carriage return to all
 *                of the active output streams
 *
 * Other notes:   Calls SWI 0x3.
 */

extern os_error *xos_new_line (void);
__swi (0x3) void os_new_line (void);

/* ------------------------------------------------------------------------
 * Function:      os_readc()
 *
 * Description:   Reads a character from the input stream
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x4.
 */

extern os_error *xos_readc (char *c,
      bits *psr);
extern bits os_readc (char *c);

/* ------------------------------------------------------------------------
 * Function:      rdchv()
 *
 * Description:   OS_ReadC vector
 *
 * Output:        c - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x4.
 */

extern os_error *xrdchv (char *c,
      bits *psr);
extern bits rdchv (char *c);

/* ------------------------------------------------------------------------
 * Function:      os_cli()
 *
 * Description:   Processes a supervisor command
 *
 * Input:         command - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x5.
 */

extern os_error *xos_cli (char const *command);
__swi (0x5) void os_cli (char const *command);

/* ------------------------------------------------------------------------
 * Function:      cliv()
 *
 * Description:   OS_CLI vector
 *
 * Input:         command - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x5.
 */

extern os_error *xcliv (char const *command);
extern void cliv (char const *command);

/* ------------------------------------------------------------------------
 * Function:      os_read_line()
 *
 * Description:   Reads a line from the input stream - prefer OS_ReadLine32
 *                on RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xE.
 */

extern os_error *xos_read_line (char *buffer,
      int size,
      char min_char,
      char max_char,
      int *used,
      bits *psr);
extern bits os_read_line (char *buffer,
      int size,
      char min_char,
      char max_char,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_read_line_given_echo()
 *
 * Description:   Reads a line from the input stream, using the given echo
 *                character - use OS_ReadLine32 on RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                echo - value of R4 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xE with R0 |= 0x40000000.
 */

extern os_error *xos_read_line_given_echo (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used,
      bits *psr);
extern bits os_read_line_given_echo (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_read_line_suppress_invalid()
 *
 * Description:   Reads a line from the input stream, not echoing invalid
 *                characters - use OS_ReadLine32 on RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xE with R0 |= 0x80000000.
 */

extern os_error *xos_read_line_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      int *used,
      bits *psr);
extern bits os_read_line_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_read_line_given_echo_suppress_invalid()
 *
 * Description:   Reads a line from the input stream, using the given echo
 *                character and not echoing invalid characters - use
 *                OS_ReadLine3 on RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                echo - value of R4 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0xE with R0 |= 0xC0000000.
 */

extern os_error *xos_read_line_given_echo_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used,
      bits *psr);
extern bits os_read_line_given_echo_suppress_invalid (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_read_line32()
 *
 * Description:   Reads a line from the input stream - RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                flags - value of R4 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x7D.
 */

extern os_error *xos_read_line32 (char *buffer,
      int size,
      char min_char,
      char max_char,
      osreadline_flags flags,
      int *used,
      bits *psr);
extern bits os_read_line32 (char *buffer,
      int size,
      char min_char,
      char max_char,
      osreadline_flags flags,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      readlinev()
 *
 * Description:   OS_ReadLine vector - use ReadLine32V on RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                echo - value of R4 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xE.
 */

extern os_error *xreadlinev (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used,
      bits *psr);
extern bits readlinev (char *buffer,
      int size,
      char min_char,
      char max_char,
      char echo,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      readline32v()
 *
 * Description:   OS_ReadLine vector - RISC O S 5+
 *
 * Input:         buffer - value of R0 on entry
 *                size - value of R1 on entry
 *                min_char - value of R2 on entry
 *                max_char - value of R3 on entry
 *                flags - value of R4 on entry
 *
 * Output:        used - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0xE.
 */

extern os_error *xreadline32v (char *buffer,
      int size,
      char min_char,
      char max_char,
      osreadline_flags flags,
      int *used,
      bits *psr);
extern bits readline32v (char *buffer,
      int size,
      char min_char,
      char max_char,
      osreadline_flags flags,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_control()
 *
 * Description:   Reads/writes handler addresses - prefer
 *                OS_ChangeEnvironment
 *
 * Input:         error_handler - value of R0 on entry
 *                error_buffer - value of R1 on entry
 *                escape_handler - value of R2 on entry
 *                event_handler - value of R3 on entry
 *
 * Output:        old_error_handler - value of R0 on exit
 *                old_error_buffer - value of R1 on exit
 *                old_escape_handler - value of R2 on exit
 *                old_event_handler - value of R3 on exit
 *
 * Other notes:   Calls SWI 0xF.
 */

extern os_error *xos_control (void const *error_handler,
      os_error *error_buffer,
      void const *escape_handler,
      void const *event_handler,
      void **old_error_handler,
      os_error **old_error_buffer,
      void **old_escape_handler,
      void **old_event_handler);
extern void os_control (void const *error_handler,
      os_error *error_buffer,
      void const *escape_handler,
      void const *event_handler,
      void **old_error_handler,
      os_error **old_error_buffer,
      void **old_escape_handler,
      void **old_event_handler);

/* ------------------------------------------------------------------------
 * Function:      os_get_env()
 *
 * Description:   Reads environment parameters
 *
 * Output:        command - value of R0 on exit (X version only)
 *                ram_limit - value of R1 on exit
 *                start - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x10.
 */

extern os_error *xos_get_env (char **command,
      byte **ram_limit,
      os_date_and_time **start);
extern char *os_get_env (byte **ram_limit,
      os_date_and_time **start);

/* ------------------------------------------------------------------------
 * Function:      os_exit()
 *
 * Description:   Passes control to the most recent exit handler
 *
 * Input:         error - value of R0 on entry
 *                rc - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x11 with R1 = 0x58454241.
 */

extern os_error *xos_exit (os_error const *error,
      int rc);
extern void os_exit (os_error const *error,
      int rc);

/* ------------------------------------------------------------------------
 * Function:      os_set_env()
 *
 * Description:   Sets environment parameters - prefer OS_ChangeEnvironment
 *
 * Input:         exit_handler - value of R0 on entry
 *                ram_limit - value of R1 on entry
 *                undefined_instruction_handler - value of R4 on entry
 *                prefetch_abort_handler - value of R5 on entry
 *                data_abort_handler - value of R6 on entry
 *                address_exception_handler - value of R7 on entry
 *
 * Output:        old_exit_handler - value of R0 on exit
 *                old_ram_limit - value of R1 on exit
 *                old_undefined_instruction_handler - value of R4 on exit
 *                old_prefetch_abort_handler - value of R5 on exit
 *                old_data_abort_handler - value of R6 on exit
 *                old_address_exception_handler - value of R7 on exit
 *
 * Other notes:   Calls SWI 0x12.
 */

extern os_error *xos_set_env (void const *exit_handler,
      byte *ram_limit,
      void const *undefined_instruction_handler,
      void const *prefetch_abort_handler,
      void const *data_abort_handler,
      void const *address_exception_handler,
      void **old_exit_handler,
      byte **old_ram_limit,
      void **old_undefined_instruction_handler,
      void **old_prefetch_abort_handler,
      void **old_data_abort_handler,
      void **old_address_exception_handler);
extern void os_set_env (void const *exit_handler,
      byte *ram_limit,
      void const *undefined_instruction_handler,
      void const *prefetch_abort_handler,
      void const *data_abort_handler,
      void const *address_exception_handler,
      void **old_exit_handler,
      byte **old_ram_limit,
      void **old_undefined_instruction_handler,
      void **old_prefetch_abort_handler,
      void **old_data_abort_handler,
      void **old_address_exception_handler);

/* ------------------------------------------------------------------------
 * Function:      os_int_on()
 *
 * Description:   Enables interrupts - cannot be called via APCS26
 *
 * Other notes:   Calls SWI 0x13.
 */

extern os_error *xos_int_on (void);
__swi (0x13) void os_int_on (void);

/* ------------------------------------------------------------------------
 * Function:      os_int_off()
 *
 * Description:   Disables interrupts - cannot be called via APCS26
 *
 * Other notes:   Calls SWI 0x14.
 */

extern os_error *xos_int_off (void);
__swi (0x14) void os_int_off (void);

/* ------------------------------------------------------------------------
 * Function:      os_call_back()
 *
 * Description:   Sets up the callback handler - prefer
 *                OS_ChangeEnvironment
 *
 * Input:         register_block - value of R0 on entry
 *                call_back_handler - value of R1 on entry
 *
 * Output:        old_register_block - value of R0 on exit
 *                old_call_back_handler - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x15.
 */

extern os_error *xos_call_back (os_register_block const *register_block,
      void const *call_back_handler,
      os_register_block **old_register_block,
      void **old_call_back_handler);
extern void os_call_back (os_register_block const *register_block,
      void const *call_back_handler,
      os_register_block **old_register_block,
      void **old_call_back_handler);

/* ------------------------------------------------------------------------
 * Function:      os_break_pt()
 *
 * Description:   Causes a break point trap to occur and the break point
 *                handler to be entered
 *
 * Other notes:   Calls SWI 0x17.
 */

extern os_error *xos_break_pt (void);
__swi (0x17) void os_break_pt (void);

/* ------------------------------------------------------------------------
 * Function:      os_break_ctrl()
 *
 * Description:   Sets up the break point handler - prefer
 *                OS_ChangeEnvironment
 *
 * Input:         register_block - value of R0 on entry
 *                break_pt_handler - value of R1 on entry
 *
 * Output:        old_register_block - value of R0 on exit
 *                old_break_pt_handler - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x18.
 */

extern os_error *xos_break_ctrl (os_register_block *register_block,
      void const *break_pt_handler,
      os_register_block **old_register_block,
      void **old_break_pt_handler);
extern void os_break_ctrl (os_register_block *register_block,
      void const *break_pt_handler,
      os_register_block **old_register_block,
      void **old_break_pt_handler);

/* ------------------------------------------------------------------------
 * Function:      os_unused_swi()
 *
 * Description:   Sets up the handler for unused SWI's - prefer
 *                OS_ChangeEnvironment
 *
 * Input:         unused_swi_handler - value of R0 on entry
 *
 * Output:        old_unused_swi_handler - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x19.
 */

extern os_error *xos_unused_swi (void const *unused_swi_handler,
      void **old_unused_swi_handler);
__swi (0x19) void *os_unused_swi (void const *unused_swi_handler);

/* ------------------------------------------------------------------------
 * Function:      os_update_memc()
 *
 * Description:   Reads or alters the contents of the MEMC control register
 *
 * Input:         value - value of R0 on entry
 *                mask - value of R1 on entry
 *
 * Output:        old_value - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x1A.
 */

extern os_error *xos_update_memc (bits value,
      bits mask,
      bits *old_value);
__swi (0x1A) bits os_update_memc (bits value,
      bits mask);

/* ------------------------------------------------------------------------
 * Function:      os_set_call_back()
 *
 * Description:   Causes a call to the callback handler
 *
 * Other notes:   Calls SWI 0x1B.
 */

extern os_error *xos_set_call_back (void);
__swi (0x1B) void os_set_call_back (void);

/* ------------------------------------------------------------------------
 * Function:      os_mouse()
 *
 * Description:   Reads a mouse state from the buffer
 *
 * Output:        x - value of R0 on exit
 *                y - value of R1 on exit
 *                buttons - value of R2 on exit
 *                t - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x1C.
 */

extern os_error *xos_mouse (int *x,
      int *y,
      bits *buttons,
      os_t *t);
extern void os_mouse (int *x,
      int *y,
      bits *buttons,
      os_t *t);

/* ------------------------------------------------------------------------
 * Function:      mousev()
 *
 * Description:   OS_Mouse vector
 *
 * Output:        x - value of R0 on exit
 *                y - value of R1 on exit
 *                buttons - value of R2 on exit
 *                t - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x1A.
 */

extern os_error *xmousev (int *x,
      int *y,
      bits *buttons,
      os_t *t);
extern void mousev (int *x,
      int *y,
      bits *buttons,
      os_t *t);

/* ------------------------------------------------------------------------
 * Function:      os_claim()
 *
 * Description:   Adds a routine to the list of those that claim a vector
 *
 * Input:         vector - value of R0 on entry
 *                routine - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x1F.
 */

extern os_error *xos_claim (int vector,
      void const *routine,
      byte *handle);
__swi (0x1F) void os_claim (int vector,
      void const *routine,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_release()
 *
 * Description:   Removes a routine from the list of those that claim a
 *                vector
 *
 * Input:         vector - value of R0 on entry
 *                routine - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x20.
 */

extern os_error *xos_release (int vector,
      void const *routine,
      byte *handle);
__swi (0x20) void os_release (int vector,
      void const *routine,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_read_unsigned()
 *
 * Description:   Converts a string to an unsigned number
 *
 * Input:         flags - value of R0 on entry
 *                number - value of R1 on entry
 *                limit - value of R2 on entry
 *
 * Output:        end - value of R1 on exit
 *                value - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x21.
 */

extern os_error *xos_read_unsigned (os_read_unsigned_flags flags,
      char const *number,
      bits limit,
      char **end,
      bits *value);
extern bits os_read_unsigned (os_read_unsigned_flags flags,
      char const *number,
      bits limit,
      char **end);

/* ------------------------------------------------------------------------
 * Function:      os_read_var_val()
 *
 * Description:   Reads a variable value (PRM 1-309, 5a-661) - Prefer
 *                OS_ReadVarValSize to read size of variable
 *
 * Input:         var - value of R0 on entry
 *                value - value of R1 on entry
 *                size - value of R2 on entry
 *                context - value of R3 on entry
 *                var_type - value of R4 on entry
 *
 * Output:        used - value of R2 on exit
 *                context_out - value of R3 on exit (X version only)
 *                var_type_out - value of R4 on exit
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x23.
 */

extern os_error *xos_read_var_val (char const *var,
      char *value,
      int size,
      int context,
      os_var_type var_type,
      int *used,
      int *context_out,
      os_var_type *var_type_out);
extern int os_read_var_val (char const *var,
      char *value,
      int size,
      int context,
      os_var_type var_type,
      int *used,
      os_var_type *var_type_out);

/* ------------------------------------------------------------------------
 * Function:      os_set_var_val()
 *
 * Description:   Writes a variable value
 *
 * Input:         var - value of R0 on entry
 *                value - value of R1 on entry
 *                size - value of R2 on entry
 *                context - value of R3 on entry
 *                var_type - value of R4 on entry
 *
 * Output:        context_out - value of R3 on exit (X version only)
 *                var_type_out - value of R4 on exit
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x24.
 */

extern os_error *xos_set_var_val (char const *var,
      byte const *value,
      int size,
      int context,
      os_var_type var_type,
      int *context_out,
      os_var_type *var_type_out);
extern int os_set_var_val (char const *var,
      byte const *value,
      int size,
      int context,
      os_var_type var_type,
      os_var_type *var_type_out);

/* ------------------------------------------------------------------------
 * Function:      os_gs_init()
 *
 * Description:   Initialises context for use by OS_GSRead
 *
 * Input:         s - value of R0 on entry
 *                flags - value of R2 on entry
 *
 * Output:        context1 - value of R0 on exit
 *                context2 - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x25.
 */

extern os_error *xos_gs_init (char const *s,
      os_gs_flags flags,
      int *context1,
      int *context2);
extern void os_gs_init (char const *s,
      os_gs_flags flags,
      int *context1,
      int *context2);

/* ------------------------------------------------------------------------
 * Function:      os_gs_read()
 *
 * Description:   Returns a character from a string which has been
 *                initialised by OS_GSInit
 *
 * Input:         context1 - value of R0 on entry
 *                context2 - value of R2 on entry
 *
 * Output:        context1_out - value of R0 on exit
 *                c - value of R1 on exit
 *                context2_out - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x26.
 */

extern os_error *xos_gs_read (int context1,
      int context2,
      int *context1_out,
      char *c,
      int *context2_out,
      bits *psr);
extern bits os_gs_read (int context1,
      int context2,
      int *context1_out,
      char *c,
      int *context2_out);

/* ------------------------------------------------------------------------
 * Function:      os_gs_trans()
 *
 * Description:   Equivalent to a call to OS_GSInit and repeated calls to
 *                OS_GSRead
 *
 * Input:         s - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        used - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x27.
 */

extern os_error *xos_gs_trans (char const *s,
      char *buffer,
      int size,
      int *used,
      bits *psr);
extern bits os_gs_trans (char const *s,
      char *buffer,
      int size,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      os_binary_to_decimal()
 *
 * Description:   Converts a signed number to a string
 *
 * Input:         i - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x28.
 */

extern os_error *xos_binary_to_decimal (int i,
      char *buffer,
      int size,
      int *used);
extern int os_binary_to_decimal (int i,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_change_dynamic_area()
 *
 * Description:   Alters the space allocation of a dynamic area
 *
 * Input:         area_type - value of R0 on entry
 *                change - value of R1 on entry
 *
 * Output:        change_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2A.
 */

extern os_error *xos_change_dynamic_area (os_dynamic_area_no area_type,
      int change,
      int *change_out);
extern int os_change_dynamic_area (os_dynamic_area_no area_type,
      int change);

/* ------------------------------------------------------------------------
 * Function:      os_generate_error()
 *
 * Description:   Generates an error and invokes the error handler
 *
 * Input:         error - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x2B.
 */

extern os_error *xos_generate_error (os_error const *error);
__swi (0x2B) void os_generate_error (os_error const *error);

/* ------------------------------------------------------------------------
 * Function:      errorv()
 *
 * Description:   OS_GenerateError vector
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x1.
 */

extern os_error *xerrorv (void);
extern void errorv (void);

/* ------------------------------------------------------------------------
 * Function:      os_read_escape_state()
 *
 * Description:   Checks whether an escape condition has occurred
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x2C.
 */

extern os_error *xos_read_escape_state (bits *psr);
extern bits os_read_escape_state (void);

/* ------------------------------------------------------------------------
 * Function:      os_evaluate_expression()
 *
 * Description:   Evaluates a string expression and returns an integer or
 *                string result
 *
 * Input:         expr - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        expr_is_str - value of R1 on exit (X version only)
 *                int_value_or_str_used - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x2D.
 */

extern os_error *xos_evaluate_expression (char const *expr,
      char *buffer,
      int size,
      osbool *expr_is_str,
      int *int_value_or_str_used);
extern osbool os_evaluate_expression (char const *expr,
      char *buffer,
      int size,
      int *int_value_or_str_used);

/* ------------------------------------------------------------------------
 * Function:      os_read_palette()
 *
 * Description:   Reads the palette setting of a colour
 *
 * Input:         entry - value of R0 on entry
 *                colour_type - value of R1 on entry
 *
 * Output:        on - value of R2 on exit
 *                off - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x2F.
 */

extern os_error *xos_read_palette (os_colour_number entry,
      int colour_type,
      os_colour *on,
      os_colour *off);
extern void os_read_palette (os_colour_number entry,
      int colour_type,
      os_colour *on,
      os_colour *off);

/* ------------------------------------------------------------------------
 * Function:      palettev_read_entry()
 *
 * Description:   Reads the palette
 *
 * Input:         entry - value of R0 on entry
 *                colour_type - value of R1 on entry
 *
 * Output:        on - value of R2 on exit
 *                off - value of R3 on exit
 *                incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x1, R9 = 0x23.
 */

extern os_error *xpalettev_read_entry (os_colour_number entry,
      int colour_type,
      os_colour *on,
      os_colour *off,
      osbool *incomplete);
extern osbool palettev_read_entry (os_colour_number entry,
      int colour_type,
      os_colour *on,
      os_colour *off);

/* ------------------------------------------------------------------------
 * Function:      palettev_set_entry()
 *
 * Description:   Sets the palette
 *
 * Input:         entry - value of R0 on entry
 *                colour_type - value of R1 on entry
 *                on - value of R2 on entry
 *                off - value of R3 on entry
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x2, R9 = 0x23.
 */

extern os_error *xpalettev_set_entry (os_colour_number entry,
      int colour_type,
      os_colour on,
      os_colour off,
      osbool *incomplete);
extern osbool palettev_set_entry (os_colour_number entry,
      int colour_type,
      os_colour on,
      os_colour off);

/* ------------------------------------------------------------------------
 * Function:      palettev_set_on()
 *
 * Description:   Sets the flash state to on
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x3, R9 = 0x23.
 */

extern os_error *xpalettev_set_on (osbool *incomplete);
extern osbool palettev_set_on (void);

/* ------------------------------------------------------------------------
 * Function:      palettev_set_off()
 *
 * Description:   Sets the flash state to off
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x4, R9 = 0x23.
 */

extern os_error *xpalettev_set_off (osbool *incomplete);
extern osbool palettev_set_off (void);

/* ------------------------------------------------------------------------
 * Function:      palettev_default()
 *
 * Description:   Sets the palette to the default
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x5, R9 = 0x23.
 */

extern os_error *xpalettev_default (osbool *incomplete);
extern osbool palettev_default (void);

/* ------------------------------------------------------------------------
 * Function:      palettev_blank_screen()
 *
 * Description:   Controls screenblanking
 *
 * Input:         state - value of R0 on entry
 *
 * Output:        state_out - value of R0 on exit
 *                incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x6, R9 = 0x23.
 */

extern os_error *xpalettev_blank_screen (palettev_screen_state state,
      palettev_screen_state *state_out,
      osbool *incomplete);
extern osbool palettev_blank_screen (palettev_screen_state state,
      palettev_screen_state *state_out);

/* ------------------------------------------------------------------------
 * Function:      palettev_read_entries()
 *
 * Description:   Reads palette entries
 *
 * Input:         entry_list - value of R0 on entry
 *                colour_type_and_entry_count - value of R1 on entry
 *                on - value of R2 on entry
 *                off - value of R3 on entry
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x7, R9 = 0x23.
 */

extern os_error *xpalettev_read_entries (os_colour_number const *entry_list,
      bits colour_type_and_entry_count,
      os_palette *on,
      os_palette *off,
      osbool *incomplete);
extern osbool palettev_read_entries (os_colour_number const *entry_list,
      bits colour_type_and_entry_count,
      os_palette *on,
      os_palette *off);

/* ------------------------------------------------------------------------
 * Function:      palettev_write_entries()
 *
 * Description:   Writes palette entries
 *
 * Input:         entry_list - value of R0 on entry
 *                colour_type_and_entry_count - value of R1 on entry
 *                palette - value of R2 on entry
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x8, R9 = 0x23.
 */

extern os_error *xpalettev_write_entries (os_colour_number const *entry_list,
      bits colour_type_and_entry_count,
      os_palette const *palette,
      osbool *incomplete);
extern osbool palettev_write_entries (os_colour_number const *entry_list,
      bits colour_type_and_entry_count,
      os_palette const *palette);

/* ------------------------------------------------------------------------
 * Function:      palettev_set_gamma_corrections()
 *
 * Description:   Sets the gamma correction tables
 *
 * Input:         red_table - value of R0 on entry
 *                green_table - value of R1 on entry
 *                blue_table - value of R2 on entry
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0x9, R9 = 0x23.
 */

extern os_error *xpalettev_set_gamma_corrections (os_correction_table const *red_table,
      os_correction_table const *green_table,
      os_correction_table const *blue_table,
      osbool *incomplete);
extern osbool palettev_set_gamma_corrections (os_correction_table const *red_table,
      os_correction_table const *green_table,
      os_correction_table const *blue_table);

/* ------------------------------------------------------------------------
 * Function:      palettev_invert_lcd()
 *
 * Description:   Inverts the L C D display
 *
 * Output:        incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0xA, R9 = 0x23.
 */

extern os_error *xpalettev_invert_lcd (osbool *incomplete);
extern osbool palettev_invert_lcd (void);

/* ------------------------------------------------------------------------
 * Function:      palettev_dim_screen()
 *
 * Description:   Controls screen dimming
 *
 * Input:         state - value of R0 on entry
 *
 * Output:        state_out - value of R0 on exit
 *                incomplete - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R4 = 0xB, R9 = 0x23.
 */

extern os_error *xpalettev_dim_screen (palettev_screen_state state,
      palettev_screen_state *state_out,
      osbool *incomplete);
extern osbool palettev_dim_screen (palettev_screen_state state,
      palettev_screen_state *state_out);

/* ------------------------------------------------------------------------
 * Function:      os_read_vdu_variables()
 *
 * Description:   Reads a series of VDU variables
 *
 * Input:         var_list - value of R0 on entry
 *                value_list - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x31.
 */

extern os_error *xos_read_vdu_variables (os_vdu_var_list const *var_list,
      int *value_list);
__swi (0x31) void os_read_vdu_variables (os_vdu_var_list const *var_list,
      int *value_list);

/* ------------------------------------------------------------------------
 * Function:      os_read_point()
 *
 * Description:   Reads the colour of a point
 *
 * Input:         x - value of R0 on entry
 *                y - value of R1 on entry
 *
 * Output:        gcol - value of R2 on exit
 *                tint - value of R3 on exit
 *                off_screen - value of R4 on exit (X version only)
 *
 * Returns:       R4 (non-X version only)
 *
 * Other notes:   Calls SWI 0x32.
 */

extern os_error *xos_read_point (int x,
      int y,
      os_gcol *gcol,
      os_tint *tint,
      osbool *off_screen);
extern osbool os_read_point (int x,
      int y,
      os_gcol *gcol,
      os_tint *tint);

/* ------------------------------------------------------------------------
 * Function:      os_read_mode_variable()
 *
 * Description:   Reads information about a screen mode
 *
 * Input:         mode - value of R0 on entry
 *                var - value of R1 on entry
 *
 * Output:        var_val - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x35.
 */

extern os_error *xos_read_mode_variable (os_mode mode,
      os_mode_var var,
      int *var_val,
      bits *psr);
extern bits os_read_mode_variable (os_mode mode,
      os_mode_var var,
      int *var_val);

/* ------------------------------------------------------------------------
 * Function:      os_remove_cursors()
 *
 * Description:   Removes the cursors from the screen
 *
 * Other notes:   Calls SWI 0x36.
 */

extern os_error *xos_remove_cursors (void);
__swi (0x36) void os_remove_cursors (void);

/* ------------------------------------------------------------------------
 * Function:      os_restore_cursors()
 *
 * Description:   Restores the cursors to the screen
 *
 * Other notes:   Calls SWI 0x37.
 */

extern os_error *xos_restore_cursors (void);
__swi (0x37) void os_restore_cursors (void);

/* ------------------------------------------------------------------------
 * Function:      os_swi_number_to_string()
 *
 * Description:   Converts a SWI number to a string containing its name
 *
 * Input:         swi - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x38.
 */

extern os_error *xos_swi_number_to_string (int swi,
      char *buffer,
      int size,
      int *used);
extern int os_swi_number_to_string (int swi,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_swi_number_from_string()
 *
 * Description:   Converts a string to a SWI number if valid
 *
 * Input:         swi_name - value of R1 on entry
 *
 * Output:        swi - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x39.
 */

extern os_error *xos_swi_number_from_string (char const *swi_name,
      int *swi);
extern int os_swi_number_from_string (char const *swi_name);

/* ------------------------------------------------------------------------
 * Function:      os_validate_address()
 *
 * Description:   Checks that a range of address are in logical RAM
 *
 * Input:         min - value of R0 on entry
 *                max - value of R1 on entry
 *
 * Output:        psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x3A.
 */

extern os_error *xos_validate_address (byte *min,
      byte *max,
      bits *psr);
extern bits os_validate_address (byte *min,
      byte *max);

/* ------------------------------------------------------------------------
 * Function:      os_call_after()
 *
 * Description:   Calls a specified address after a delay
 *
 * Input:         delay - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x3B.
 */

extern os_error *xos_call_after (int delay,
      void const *code,
      byte *handle);
__swi (0x3B) void os_call_after (int delay,
      void const *code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_call_every()
 *
 * Description:   Calls a specified address every time a delay elapses
 *
 * Input:         delay - value of R0 on entry
 *                code - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x3C.
 */

extern os_error *xos_call_every (int delay,
      void const *code,
      byte *handle);
__swi (0x3C) void os_call_every (int delay,
      void const *code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_remove_ticker_event()
 *
 * Description:   Removes a given call address and handle value from the
 *                ticker event list
 *
 * Input:         code - value of R0 on entry
 *                handle - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x3D.
 */

extern os_error *xos_remove_ticker_event (void const *code,
      byte *handle);
__swi (0x3D) void os_remove_ticker_event (void const *code,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      tickerv()
 *
 * Description:   Called every centisecond
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x1C.
 */

extern os_error *xtickerv (void);
extern void tickerv (void);

/* ------------------------------------------------------------------------
 * Function:      os_install_key_handler()
 *
 * Description:   Installs a key handler or reads the address of the
 *                current one
 *
 * Input:         key_handler - value of R0 on entry
 *
 * Output:        old_key_handler - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x3E.
 */

extern os_error *xos_install_key_handler (os_key_handler const *key_handler,
      os_key_handler **old_key_handler);
__swi (0x3E) os_key_handler *os_install_key_handler (os_key_handler const *key_handler);

/* ------------------------------------------------------------------------
 * Function:      keyv_present()
 *
 * Description:   The given keyboard is present
 *
 * Input:         keyboard_type - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x0, R9 = 0x13.
 */

extern os_error *xkeyv_present (keyv_type keyboard_type);
extern void keyv_present (keyv_type keyboard_type);

/* ------------------------------------------------------------------------
 * Function:      keyv_transition_up()
 *
 * Description:   Key released
 *
 * Input:         key - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x1, R9 = 0x13.
 */

extern os_error *xkeyv_transition_up (int key);
extern void keyv_transition_up (int key);

/* ------------------------------------------------------------------------
 * Function:      keyv_transition_down()
 *
 * Description:   Key pressed
 *
 * Input:         key - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x2, R9 = 0x13.
 */

extern os_error *xkeyv_transition_down (int key);
extern void keyv_transition_down (int key);

/* ------------------------------------------------------------------------
 * Function:      keyv_led_state()
 *
 * Description:   Notifies driver of LED state
 *
 * Input:         flags - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x3, R9 = 0x13.
 */

extern os_error *xkeyv_led_state (bits flags);
extern void keyv_led_state (bits flags);

/* ------------------------------------------------------------------------
 * Function:      keyv_enable_drivers()
 *
 * Description:   Enables keyboard device drivers
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x4, R9 = 0x13.
 */

extern os_error *xkeyv_enable_drivers (void);
extern void keyv_enable_drivers (void);

/* ------------------------------------------------------------------------
 * Function:      os_check_mode_valid()
 *
 * Description:   Checks if it is possible to change into a specified mode
 *
 * Input:         mode - value of R0 on entry
 *
 * Output:        mode_status - value of R0 on exit
 *                alternative_mode - value of R1 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x3F.
 */

extern os_error *xos_check_mode_valid (os_mode mode,
      int *mode_status,
      os_mode *alternative_mode,
      bits *psr);
extern bits os_check_mode_valid (os_mode mode,
      int *mode_status,
      os_mode *alternative_mode);

/* ------------------------------------------------------------------------
 * Function:      os_change_environment()
 *
 * Description:   Installs a handler
 *
 * Input:         handler_type - value of R0 on entry
 *                handler - value of R1 on entry
 *                handle - value of R2 on entry
 *                buffer - value of R3 on entry
 *
 * Output:        old_handler - value of R1 on exit (X version only)
 *                old_handle - value of R2 on exit
 *                old_buffer - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x40.
 */

extern os_error *xos_change_environment (os_handler_type handler_type,
      void const *handler,
      byte *handle,
      byte *buffer,
      void **old_handler,
      byte **old_handle,
      byte **old_buffer);
extern void *os_change_environment (os_handler_type handler_type,
      void const *handler,
      byte *handle,
      byte *buffer,
      byte **old_handle,
      byte **old_buffer);

/* ------------------------------------------------------------------------
 * Function:      changeenvironmentv()
 *
 * Description:   OS_ChangeEnvironment vector
 *
 * Input:         handler_type - value of R0 on entry
 *                handler - value of R1 on entry
 *                handle - value of R2 on entry
 *                buffer - value of R3 on entry
 *
 * Output:        old_handler - value of R1 on exit (X version only)
 *                old_handle - value of R2 on exit
 *                old_buffer - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x1E.
 */

extern os_error *xchangeenvironmentv (os_handler_type handler_type,
      void const *handler,
      byte *handle,
      byte *buffer,
      void **old_handler,
      byte **old_handle,
      byte **old_buffer);
extern void *changeenvironmentv (os_handler_type handler_type,
      void const *handler,
      byte *handle,
      byte *buffer,
      byte **old_handle,
      byte **old_buffer);

/* ------------------------------------------------------------------------
 * Function:      osclaimscreenmemory_alloc()
 *
 * Description:   Claims spare screen memory - Deprecated under RISC OS
 *                3.7+
 *
 * Input:         size - value of R1 on entry
 *
 * Output:        size_out - value of R1 on exit
 *                blk - value of R2 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x41 with R0 = 0x1.
 */

extern os_error *xosclaimscreenmemory_alloc (int size,
      int *size_out,
      void **blk,
      bits *psr);
extern bits osclaimscreenmemory_alloc (int size,
      int *size_out,
      void **blk);

/* ------------------------------------------------------------------------
 * Function:      osclaimscreenmemory_free()
 *
 * Description:   Releases spare screen memory - Deprecated under RISC OS
 *                3.7+
 *
 * Other notes:   Calls SWI 0x41 with R0 = 0x0.
 */

extern os_error *xosclaimscreenmemory_free (void);
extern void osclaimscreenmemory_free (void);

/* ------------------------------------------------------------------------
 * Function:      os_read_monotonic_time()
 *
 * Description:   Returns the number of centiseconds since the last hard
 *                reset
 *
 * Output:        t - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x42.
 */

extern os_error *xos_read_monotonic_time (os_t *t);
__swi (0x42) os_t os_read_monotonic_time (void);

/* ------------------------------------------------------------------------
 * Function:      os_substitute_args()
 *
 * Description:   Substitutes command line arguments
 *
 * Input:         args - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                source - value of R3 on entry
 *                source_size - value of R4 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x43.
 */

extern os_error *xos_substitute_args (char const *args,
      char *buffer,
      int size,
      char const *source,
      int source_size,
      int *used);
extern int os_substitute_args (char const *args,
      char *buffer,
      int size,
      char const *source,
      int source_size);

/* ------------------------------------------------------------------------
 * Function:      os_substitute_args32()
 *
 * Description:   Substitutes command line arguments - RISC O S 5+
 *
 * Input:         args - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                source - value of R3 on entry
 *                source_size - value of R4 on entry
 *                flags - value of R5 on entry
 *
 * Output:        used - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7E.
 */

extern os_error *xos_substitute_args32 (char const *args,
      char *buffer,
      int size,
      char const *source,
      int source_size,
      os_substitute_args_flags flags,
      int *used);
extern int os_substitute_args32 (char const *args,
      char *buffer,
      int size,
      char const *source,
      int source_size,
      os_substitute_args_flags flags);

/* ------------------------------------------------------------------------
 * Function:      os_pretty_print()
 *
 * Description:   Writes a string with some formatting to all of the active
 *                output streams
 *
 * Input:         string - value of R0 on entry
 *                dictionary - value of R1 on entry
 *                special - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x44.
 */

extern os_error *xos_pretty_print (char const *string,
      byte const *dictionary,
      char const *special);
__swi (0x44) void os_pretty_print (char const *string,
      byte const *dictionary,
      char const *special);

/* ------------------------------------------------------------------------
 * Function:      os_plot()
 *
 * Description:   Direct VDU call to general plot command
 *
 * Input:         plot_code - value of R0 on entry
 *                x - value of R1 on entry
 *                y - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x45.
 */

extern os_error *xos_plot (os_plot_code plot_code,
      int x,
      int y);
__swi (0x45) void os_plot (os_plot_code plot_code,
      int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      ukplotv()
 *
 * Description:   Called when an unknown OS_Plot command is issued
 *
 * Input:         plot_code - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x19.
 */

extern os_error *xukplotv (os_plot_code plot_code);
extern void ukplotv (os_plot_code plot_code);

/* ------------------------------------------------------------------------
 * Function:      os_writen()
 *
 * Description:   Writes a counted string to all of the active output
 *                streams
 *
 * Input:         s - value of R0 on entry
 *                size - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x46.
 */

extern os_error *xos_writen (char const *s,
      int size);
__swi (0x46) void os_writen (char const *s,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_add_to_vector()
 *
 * Description:   Adds a routine to the list of those that claim a vector
 *
 * Input:         vector - value of R0 on entry
 *                routine - value of R1 on entry
 *                handle - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x47.
 */

extern os_error *xos_add_to_vector (int vector,
      void const *routine,
      byte *handle);
__swi (0x47) void os_add_to_vector (int vector,
      void const *routine,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_write_env()
 *
 * Description:   Sets the program environment command string and start
 *                time
 *
 * Input:         command - value of R0 on entry
 *                start - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x48.
 */

extern os_error *xos_write_env (char const *command,
      os_date_and_time const *start);
__swi (0x48) void os_write_env (char const *command,
      os_date_and_time const *start);

/* ------------------------------------------------------------------------
 * Function:      os_read_args()
 *
 * Description:   Given a keyword definition, scans a command string
 *
 * Input:         keywords - value of R0 on entry
 *                input - value of R1 on entry
 *                buffer - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Output:        spare - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x49.
 */

extern os_error *xos_read_args (char const *keywords,
      char const *input,
      char *buffer,
      int size,
      int *spare);
extern int os_read_args (char const *keywords,
      char const *input,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_read_ram_fs_limits()
 *
 * Description:   Gets the current limits of the RAM filing system
 *
 * Output:        start - value of R0 on exit
 *                end - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x4A.
 */

extern os_error *xos_read_ram_fs_limits (byte **start,
      char **end);
extern void os_read_ram_fs_limits (byte **start,
      char **end);

/* ------------------------------------------------------------------------
 * Function:      os_claim_device_vector()
 *
 * Description:   Claims a device vector
 *
 * Input:         device - value of R0 on entry
 *                driver - value of R1 on entry
 *                handle - value of R2 on entry
 *                status - value of R3 on entry
 *                mask - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4B.
 */

extern os_error *xos_claim_device_vector (os_device_type device,
      void const *driver,
      byte *handle,
      int *status,
      bits mask);
extern void os_claim_device_vector (os_device_type device,
      void const *driver,
      byte *handle,
      int *status,
      bits mask);

/* ------------------------------------------------------------------------
 * Function:      os_release_device_vector()
 *
 * Description:   Releases a device vector
 *
 * Input:         device - value of R0 on entry
 *                driver - value of R1 on entry
 *                handle - value of R2 on entry
 *                status - value of R3 on entry
 *                mask - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x4C.
 */

extern os_error *xos_release_device_vector (os_device_type device,
      void const *driver,
      byte *handle,
      int *status,
      bits mask);
extern void os_release_device_vector (os_device_type device,
      void const *driver,
      byte *handle,
      int *status,
      bits mask);

/* ------------------------------------------------------------------------
 * Function:      os_delink_application()
 *
 * Description:   Removes any vectors that an application is using
 *
 * Input:         vector_details - value of R0 on entry
 *                size - value of R1 on entry
 *
 * Output:        used - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x4D.
 */

extern os_error *xos_delink_application (byte *vector_details,
      int size,
      int *used);
extern int os_delink_application (byte *vector_details,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_relink_application()
 *
 * Description:   Restores from a buffer any vectors that an application is
 *                using
 *
 * Input:         vector_details - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x4E.
 */

extern os_error *xos_relink_application (byte const *vector_details);
__swi (0x4E) void os_relink_application (byte const *vector_details);

/* ------------------------------------------------------------------------
 * Function:      os_heap_sort()
 *
 * Description:   Heap-sorts a list of objects - prefer OS_HeapSort32 on
 *                RISC O S 5+
 *
 * Input:         count - value of R0 on entry
 *                array - value of R1 on entry
 *                compare_fn - value of R2 on entry
 *                handle - value of R3 on entry
 *                objects - value of R4 on entry
 *                object_size - value of R5 on entry
 *                workspace - value of R6 on entry
 *
 * Other notes:   Calls SWI 0x4F.
 */

extern os_error *xos_heap_sort (int count,
      int *array,
      os_sort_type compare_fn,
      byte *handle,
      byte *objects,
      int object_size,
      void *workspace);
extern void os_heap_sort (int count,
      int *array,
      os_sort_type compare_fn,
      byte *handle,
      byte *objects,
      int object_size,
      void *workspace);

/* ------------------------------------------------------------------------
 * Function:      os_heap_sort32()
 *
 * Description:   Heap-sorts a list of objects - RISC O S 5+
 *
 * Input:         count - value of R0 on entry
 *                array - value of R1 on entry
 *                compare_fn - value of R2 on entry
 *                handle - value of R3 on entry
 *                objects - value of R4 on entry
 *                object_size - value of R5 on entry
 *                workspace - value of R6 on entry
 *                flags - value of R7 on entry
 *
 * Other notes:   Calls SWI 0x7F.
 */

extern os_error *xos_heap_sort32 (int count,
      int *array,
      os_sort_type compare_fn,
      byte *handle,
      byte *objects,
      int object_size,
      void *workspace,
      os_heap_sort_flags flags);
extern void os_heap_sort32 (int count,
      int *array,
      os_sort_type compare_fn,
      byte *handle,
      byte *objects,
      int object_size,
      void *workspace,
      os_heap_sort_flags flags);

/* ------------------------------------------------------------------------
 * Function:      os_exit_and_die()
 *
 * Description:   Kills a module and passes control to the most recent exit
 *                handler
 *
 * Input:         error - value of R0 on entry
 *                rc - value of R2 on entry
 *                module_name - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x50 with R1 = 0x58454241.
 */

extern os_error *xos_exit_and_die (os_error const *error,
      int rc,
      char const *module_name);
extern void os_exit_and_die (os_error const *error,
      int rc,
      char const *module_name);

/* ------------------------------------------------------------------------
 * Function:      os_read_mem_map_info()
 *
 * Description:   Reads the page size and count
 *
 * Output:        page_size - value of R0 on exit
 *                page_count - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x51.
 */

extern os_error *xos_read_mem_map_info (int *page_size,
      int *page_count);
extern void os_read_mem_map_info (int *page_size,
      int *page_count);

/* ------------------------------------------------------------------------
 * Function:      os_read_mem_map_entries()
 *
 * Description:   Reads by page number the logical to physical memory
 *                mapping used by MEMC
 *
 * Input:         request_list - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x52.
 */

extern os_error *xos_read_mem_map_entries (os_mem_map_request_list *request_list);
__swi (0x52) void os_read_mem_map_entries (os_mem_map_request_list *request_list);

/* ------------------------------------------------------------------------
 * Function:      os_set_mem_map_entries()
 *
 * Description:   Writes the logical to physical memory mapping used by
 *                MEMC
 *
 * Input:         request_list - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x53.
 */

extern os_error *xos_set_mem_map_entries (os_mem_map_request_list const *request_list);
__swi (0x53) void os_set_mem_map_entries (os_mem_map_request_list const *request_list);

/* ------------------------------------------------------------------------
 * Function:      os_add_call_back()
 *
 * Description:   Adds a transient callback to the list
 *
 * Input:         call_back - value of R0 on entry
 *                handle - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x54.
 */

extern os_error *xos_add_call_back (void const *call_back,
      byte *handle);
__swi (0x54) void os_add_call_back (void const *call_back,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_read_default_handler()
 *
 * Description:   Gets the address of the default handler
 *
 * Input:         handler_type - value of R0 on entry
 *
 * Output:        handler - value of R1 on exit (X version only)
 *                handle - value of R2 on exit
 *                buffer - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x55.
 */

extern os_error *xos_read_default_handler (int handler_type,
      void **handler,
      byte **handle,
      byte **buffer);
extern void *os_read_default_handler (int handler_type,
      byte **handle,
      byte **buffer);

/* ------------------------------------------------------------------------
 * Function:      os_set_ecf_origin()
 *
 * Description:   Sets the origin of the ECF patterns
 *
 * Input:         x - value of R0 on entry
 *                y - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x56.
 */

extern os_error *xos_set_ecf_origin (int x,
      int y);
__swi (0x56) void os_set_ecf_origin (int x,
      int y);

/* ------------------------------------------------------------------------
 * Function:      os_confirm()
 *
 * Description:   Gets a yes or no answer
 *
 * Output:        key - value of R0 on exit
 *                psr - processor status register on exit (X version only)
 *
 * Returns:       psr (non-X version only)
 *
 * Other notes:   Calls SWI 0x59.
 */

extern os_error *xos_confirm (char *key,
      bits *psr);
extern bits os_confirm (char *key);

/* ------------------------------------------------------------------------
 * Function:      os_changed_box()
 *
 * Description:   Determines which area of the screen has changed
 *
 * Input:         state - value of R0 on entry
 *
 * Output:        enabled - value of R0 on exit (X version only)
 *                change_box - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5A.
 */

extern os_error *xos_changed_box (os_changed_box_state state,
      osbool *enabled,
      os_change_box **change_box);
extern osbool os_changed_box (os_changed_box_state state,
      os_change_box **change_box);

/* ------------------------------------------------------------------------
 * Function:      os_crc()
 *
 * Description:   Calculates the cyclic redundancy check for a block of
 *                data
 *
 * Input:         crc_in - value of R0 on entry
 *                block - value of R1 on entry
 *                end - value of R2 on entry
 *                stride - value of R3 on entry
 *
 * Output:        crc - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5B.
 */

extern os_error *xos_crc (int crc_in,
      byte const *block,
      byte const *end,
      int stride,
      int *crc);
__swi (0x5B) int os_crc (int crc_in,
      byte const *block,
      byte const *end,
      int stride);

/* ------------------------------------------------------------------------
 * Function:      os_read_dynamic_area()
 *
 * Description:   Reads the space allocation of a dynamic area
 *
 * Input:         area - value of R0 on entry
 *
 * Output:        area_start - value of R0 on exit (X version only)
 *                size - value of R1 on exit
 *                size_limit - value of R2 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x5C.
 */

extern os_error *xos_read_dynamic_area (os_dynamic_area_no area,
      byte **area_start,
      int *size,
      int *size_limit);
extern byte *os_read_dynamic_area (os_dynamic_area_no area,
      int *size,
      int *size_limit);

/* ------------------------------------------------------------------------
 * Function:      os_print_char()
 *
 * Description:   Sends a character to the printer stream
 *
 * Input:         c - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x5D.
 */

extern os_error *xos_print_char (char c);
__swi (0x5D) void os_print_char (char c);

/* ------------------------------------------------------------------------
 * Function:      os_change_redirection()
 *
 * Description:   Reads or writes OS_CLI input/output redirection handles -
 *                prefer OS_ChangeRedirectionW
 *
 * Input:         input - value of R0 on entry
 *                output - value of R1 on entry
 *
 * Output:        old_input - value of R0 on exit
 *                old_output - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x5E.
 */

extern os_error *xos_change_redirection (os_f input,
      os_f output,
      os_f *old_input,
      os_f *old_output);
extern void os_change_redirection (os_f input,
      os_f output,
      os_f *old_input,
      os_f *old_output);

/* ------------------------------------------------------------------------
 * Function:      os_change_redirectionw()
 *
 * Description:   Reads or writes OS_CLI input/output redirection. Uses
 *                32-bit file handles
 *
 * Input:         input - value of R0 on entry
 *                output - value of R1 on entry
 *
 * Output:        old_input - value of R0 on exit
 *                old_output - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x5E.
 */

extern os_error *xos_change_redirectionw (os_fw input,
      os_fw output,
      os_fw *old_input,
      os_fw *old_output);
extern void os_change_redirectionw (os_fw input,
      os_fw output,
      os_fw *old_input,
      os_fw *old_output);

/* ------------------------------------------------------------------------
 * Function:      os_remove_call_back()
 *
 * Description:   Removes a transient callback from the list
 *
 * Input:         call_back - value of R0 on entry
 *                handle - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x5F.
 */

extern os_error *xos_remove_call_back (void const *call_back,
      byte *handle);
__swi (0x5F) void os_remove_call_back (void const *call_back,
      byte *handle);

/* ------------------------------------------------------------------------
 * Function:      os_find_mem_map_entries()
 *
 * Description:   Reads by logical address the logical to physical memory
 *                mapping used by MEMC
 *
 * Input:         request_list - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x60.
 */

extern os_error *xos_find_mem_map_entries (os_mem_map_request_list *request_list);
__swi (0x60) void os_find_mem_map_entries (os_mem_map_request_list *request_list);

/* ------------------------------------------------------------------------
 * Function:      os_set_colour()
 *
 * Description:   Sets the current colour or colour pattern
 *
 * Input:         flags - value of R0 on entry
 *                colour_number - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x61.
 */

extern os_error *xos_set_colour (os_colour_flags flags,
      os_colour_number colour_number);
__swi (0x61) void os_set_colour (os_colour_flags flags,
      os_colour_number colour_number);

/* ------------------------------------------------------------------------
 * Function:      os_read_colour()
 *
 * Description:   Reads the current colour or colour pattern - RISC O S
 *                3.5+
 *
 * Input:         flags - value of R0 on entry
 *                pattern - value of R1 on entry
 *
 * Output:        flags_out - value of R0 on exit
 *                colour_number - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x61 with R0 |= 0x80.
 */

extern os_error *xos_read_colour (os_colour_flags flags,
      os_ecf *pattern,
      os_colour_flags *flags_out,
      os_colour_number *colour_number);
extern os_colour_number os_read_colour (os_colour_flags flags,
      os_ecf *pattern,
      os_colour_flags *flags_out);

/* ------------------------------------------------------------------------
 * Function:      ospointer_get()
 *
 * Description:   Gets the currently selected pointer device type - RISC O
 *                S 3.5+
 *
 * Output:        pointer_type - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x64 with R0 = 0x0.
 */

extern os_error *xospointer_get (os_pointer_type *pointer_type);
extern os_pointer_type ospointer_get (void);

/* ------------------------------------------------------------------------
 * Function:      ospointer_set()
 *
 * Description:   Sets the currently selected pointer device type - RISC O
 *                S 3.5+
 *
 * Input:         pointer_type - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x64 with R0 = 0x1.
 */

extern os_error *xospointer_set (os_pointer_type pointer_type);
extern void ospointer_set (os_pointer_type pointer_type);

/* ------------------------------------------------------------------------
 * Function:      ospointer_read_alternate_position()
 *
 * Description:   Reads the position of the alternate pointing device -
 *                RISC O S 4.32+
 *
 * Output:        xposition - value of R0 on exit
 *                yposition - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x64 with R0 = 0x2.
 */

extern os_error *xospointer_read_alternate_position (int *xposition,
      int *yposition);
extern void ospointer_read_alternate_position (int *xposition,
      int *yposition);

/* ------------------------------------------------------------------------
 * Function:      pointerv_status()
 *
 * Description:   Requests status of pointer device - RISC O S 3.5+
 *
 * Input:         pointer_type - value of R1 on entry
 *
 * Output:        xmove - value of R2 on exit
 *                ymove - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x0, R9 = 0x26.
 */

extern os_error *xpointerv_status (os_pointer_type pointer_type,
      int *xmove,
      int *ymove);
extern void pointerv_status (os_pointer_type pointer_type,
      int *xmove,
      int *ymove);

/* ------------------------------------------------------------------------
 * Function:      pointerv_enumerate()
 *
 * Description:   Enumerates pointer device types - RISC O S 3.5+
 *
 * Input:         record - value of R1 on entry
 *
 * Output:        record_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x1, R9 = 0x26.
 */

extern os_error *xpointerv_enumerate (pointerv_record const *record,
      pointerv_record **record_out);
extern pointerv_record *pointerv_enumerate (pointerv_record const *record);

/* ------------------------------------------------------------------------
 * Function:      pointerv_selected()
 *
 * Description:   Pointer device type selected - RISC O S 3.5+
 *
 * Input:         pointer_type - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x2, R9 = 0x26.
 */

extern os_error *xpointerv_selected (os_pointer_type pointer_type);
extern void pointerv_selected (os_pointer_type pointer_type);

/* ------------------------------------------------------------------------
 * Function:      pointerv_extended_status()
 *
 * Description:   Requests extended status of pointer device - RISC O S
 *                4.32+
 *
 * Input:         pointer_type - value of R1 on entry
 *
 * Output:        xmove - value of R2 on exit
 *                ymove - value of R3 on exit
 *                xmove_alternate - value of R4 on exit
 *                ymove_alternate - value of R5 on exit
 *                buttons - value of R6 on exit
 *
 * Other notes:   Calls SWI 0x34 with R0 = 0x4, R9 = 0x26.
 */

extern os_error *xpointerv_extended_status (os_pointer_type pointer_type,
      int *xmove,
      int *ymove,
      int *xmove_alternate,
      int *ymove_alternate,
      bits *buttons);
extern void pointerv_extended_status (os_pointer_type pointer_type,
      int *xmove,
      int *ymove,
      int *xmove_alternate,
      int *ymove_alternate,
      bits *buttons);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_select()
 *
 * Description:   Selects a screen mode - RISC O S 3.5+
 *
 * Input:         mode - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x0.
 */

extern os_error *xosscreenmode_select (os_mode mode);
extern void osscreenmode_select (os_mode mode);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_current()
 *
 * Description:   Returns the mode specifier for the current mode - RISC O
 *                S 3.5+
 *
 * Output:        mode - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x1.
 */

extern os_error *xosscreenmode_current (os_mode *mode);
extern os_mode osscreenmode_current (void);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_enumerate()
 *
 * Description:   Enumerates the available screen modes - RISC O S 3.5+
 *
 * Input:         context - value of R2 on entry
 *                block - value of R6 on entry
 *                block_size - value of R7 on entry
 *
 * Output:        complete - value of R1 on exit (X version only)
 *                context_out - value of R2 on exit
 *                end - value of R6 on exit
 *                free - value of R7 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x2.
 */

extern os_error *xosscreenmode_enumerate (int context,
      os_mode_block *block,
      int block_size,
      osbool *complete,
      int *context_out,
      byte **end,
      int *free);
extern osbool osscreenmode_enumerate (int context,
      os_mode_block *block,
      int block_size,
      int *context_out,
      byte **end,
      int *free);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_cache_control()
 *
 * Description:   Controls cacheing of screen memory and screen cleaning -
 *                RISC O S 4+
 *
 * Input:         flags - value of R1 on entry
 *                laziness - value of R2 on entry
 *
 * Output:        current_flags - value of R1 on exit (X version only)
 *                current_laziness - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x4.
 */

extern os_error *xosscreenmode_cache_control (osscreenmode_cache_flags flags,
      osscreenmode_cleaner_laziness laziness,
      osscreenmode_cache_flags *current_flags,
      osscreenmode_cleaner_laziness *current_laziness);
extern osscreenmode_cache_flags osscreenmode_cache_control (osscreenmode_cache_flags flags,
      osscreenmode_cleaner_laziness laziness,
      osscreenmode_cleaner_laziness *current_laziness);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_request_clean()
 *
 * Description:   Request a foreground screen clean - RISC O S 4+
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x5.
 */

extern os_error *xosscreenmode_request_clean (void);
extern void osscreenmode_request_clean (void);

/* ------------------------------------------------------------------------
 * Function:      osscreenmode_force_clean()
 *
 * Description:   Force a screen clean if needed - RISC O S 4+
 *
 * Other notes:   Calls SWI 0x65 with R0 = 0x6.
 */

extern os_error *xosscreenmode_force_clean (void);
extern void osscreenmode_force_clean (void);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_create()
 *
 * Description:   Creates a new dynamic area - RISC O S 3.5+
 *
 * Input:         area - value of R1 on entry
 *                size - value of R2 on entry
 *                base_address - value of R3 on entry
 *                flags - value of R4 on entry
 *                size_limit - value of R5 on entry
 *                handler - value of R6 on entry
 *                workspace - value of R7 on entry
 *                description - value of R8 on entry
 *
 * Output:        area_out - value of R1 on exit (X version only)
 *                base_address_out - value of R3 on exit
 *                size_limit_out - value of R5 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x0.
 */

extern os_error *xosdynamicarea_create (os_dynamic_area_no area,
      int size,
      byte const *base_address,
      os_area_flags flags,
      int size_limit,
      void const *handler,
      void *workspace,
      char const *description,
      os_dynamic_area_no *area_out,
      byte **base_address_out,
      int *size_limit_out);
extern os_dynamic_area_no osdynamicarea_create (os_dynamic_area_no area,
      int size,
      byte const *base_address,
      os_area_flags flags,
      int size_limit,
      void const *handler,
      void *workspace,
      char const *description,
      byte **base_address_out,
      int *size_limit_out);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_delete()
 *
 * Description:   Removes a previously created dynamic area - RISC O S 3.5+
 *
 * Input:         area - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x1.
 */

extern os_error *xosdynamicarea_delete (os_dynamic_area_no area);
extern void osdynamicarea_delete (os_dynamic_area_no area);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_read()
 *
 * Description:   Returns information on a dynamic area - RISC O S 3.5+
 *
 * Input:         area - value of R1 on entry
 *
 * Output:        size - value of R2 on exit
 *                base_address - value of R3 on exit
 *                flags - value of R4 on exit
 *                size_limit - value of R5 on exit
 *                handler - value of R6 on exit
 *                workspace - value of R7 on exit
 *                description - value of R8 on exit
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x2.
 */

extern os_error *xosdynamicarea_read (os_dynamic_area_no area,
      int *size,
      byte **base_address,
      os_area_flags *flags,
      int *size_limit,
      void **handler,
      void **workspace,
      char **description);
extern void osdynamicarea_read (os_dynamic_area_no area,
      int *size,
      byte **base_address,
      os_area_flags *flags,
      int *size_limit,
      void **handler,
      void **workspace,
      char **description);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_enumerate()
 *
 * Description:   Enumerates dynamic areas - RISC O S 3.5+
 *
 * Input:         context - value of R1 on entry
 *
 * Output:        context_out - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x3.
 */

extern os_error *xosdynamicarea_enumerate (int context,
      int *context_out);
extern int osdynamicarea_enumerate (int context);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_renumber()
 *
 * Description:   Renumbers dynamic areas - RISC O S 3.5+
 *
 * Input:         old_area - value of R1 on entry
 *                new_area - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x4.
 */

extern os_error *xosdynamicarea_renumber (os_dynamic_area_no old_area,
      os_dynamic_area_no new_area);
extern void osdynamicarea_renumber (os_dynamic_area_no old_area,
      os_dynamic_area_no new_area);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_free_space()
 *
 * Description:   Return total free space, allowing for shrinkable areas -
 *                RISC O S 4+
 *
 * Input:         exclude_area - value of R1 on entry
 *
 * Output:        free_space - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x5.
 */

extern os_error *xosdynamicarea_free_space (os_dynamic_area_no exclude_area,
      int *free_space);
extern int osdynamicarea_free_space (os_dynamic_area_no exclude_area);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_set_clamps()
 *
 * Description:   Set clamps on maximum sizes for subsequently created
 *                dynamic areas - RISC O S 4+
 *
 * Input:         unlimited_area_clamp - value of R1 on entry
 *                limited_area_clamp - value of R2 on entry
 *                sparse_area_clamp - value of R3 on entry
 *
 * Output:        old_unlimited_area_clamp - value of R1 on exit
 *                old_limited_area_clamp - value of R2 on exit
 *                old_sparse_area_clamp - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x8.
 */

extern os_error *xosdynamicarea_set_clamps (int unlimited_area_clamp,
      int limited_area_clamp,
      int sparse_area_clamp,
      int *old_unlimited_area_clamp,
      int *old_limited_area_clamp,
      int *old_sparse_area_clamp);
extern void osdynamicarea_set_clamps (int unlimited_area_clamp,
      int limited_area_clamp,
      int sparse_area_clamp,
      int *old_unlimited_area_clamp,
      int *old_limited_area_clamp,
      int *old_sparse_area_clamp);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_ensure_region()
 *
 * Description:   Ensures that a region of a sparse area is mapped to valid
 *                memory - RISC O S 4+
 *
 * Input:         area - value of R1 on entry
 *                base_address - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x9.
 */

extern os_error *xosdynamicarea_ensure_region (os_dynamic_area_no area,
      byte const *base_address,
      int size);
extern void osdynamicarea_ensure_region (os_dynamic_area_no area,
      byte const *base_address,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_release_region()
 *
 * Description:   Allows a region of a sparse area to be released as free
 *                memory - RISC O S 4+
 *
 * Input:         area - value of R1 on entry
 *                base_address - value of R2 on entry
 *                size - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0xA.
 */

extern os_error *xosdynamicarea_release_region (os_dynamic_area_no area,
      byte const *base_address,
      int size);
extern void osdynamicarea_release_region (os_dynamic_area_no area,
      byte const *base_address,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_heap_describe()
 *
 * Description:   Describe the space used by a dynamic area's heap - RISC O
 *                S Select
 *
 * Input:         area - value of R1 on entry
 *
 * Output:        max - value of R2 on exit
 *                free - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0xE.
 */

extern os_error *xosdynamicarea_heap_describe (os_dynamic_area_no area,
      int *max,
      int *free);
extern int osdynamicarea_heap_describe (os_dynamic_area_no area,
      int *max);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_heap_alloc()
 *
 * Description:   Claim space from a dynamic area's heap - RISC O S Select
 *
 * Input:         area - value of R1 on entry
 *                size - value of R3 on entry
 *
 * Output:        blk - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0xF.
 */

extern os_error *xosdynamicarea_heap_alloc (os_dynamic_area_no area,
      int size,
      void **blk);
extern void *osdynamicarea_heap_alloc (os_dynamic_area_no area,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_heap_free()
 *
 * Description:   Release space previously claimed from a dynamic area's
 *                heap - RISC O S Select
 *
 * Input:         area - value of R1 on entry
 *                blk - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x10.
 */

extern os_error *xosdynamicarea_heap_free (os_dynamic_area_no area,
      void *blk);
extern void osdynamicarea_heap_free (os_dynamic_area_no area,
      void *blk);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_heap_realloc()
 *
 * Description:   Resize a previously claimed block from a dynamic area's
 *                heap - RISC O S Select
 *
 * Input:         area - value of R1 on entry
 *                blk - value of R2 on entry
 *                size_increase - value of R3 on entry
 *
 * Output:        blk_out - value of R2 on exit (X version only)
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x11.
 */

extern os_error *xosdynamicarea_heap_realloc (os_dynamic_area_no area,
      void *blk,
      int size_increase,
      void **blk_out);
extern void *osdynamicarea_heap_realloc (os_dynamic_area_no area,
      void *blk,
      int size_increase);

/* ------------------------------------------------------------------------
 * Function:      osdynamicarea_heap_read_size()
 *
 * Description:   Read the size of a block allocated from a dynamic area's
 *                heap - RISC O S Select
 *
 * Input:         area - value of R1 on entry
 *                blk - value of R2 on entry
 *
 * Output:        size - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x66 with R0 = 0x12.
 */

extern os_error *xosdynamicarea_heap_read_size (os_dynamic_area_no area,
      void *blk,
      int *size);
extern int osdynamicarea_heap_read_size (os_dynamic_area_no area,
      void *blk);

/* ------------------------------------------------------------------------
 * Function:      osmemory_page_op()
 *
 * Description:   General page block operations - RISC O S 3.5+
 *
 * Input:         flags - value of R0 on entry
 *                page_block - value of R1 on entry
 *                page_count - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x68 with R0 |= 0x0.
 */

extern os_error *xosmemory_page_op (osmemory_flags flags,
      os_page_block const *page_block,
      int page_count);
extern void osmemory_page_op (osmemory_flags flags,
      os_page_block const *page_block,
      int page_count);

/* ------------------------------------------------------------------------
 * Function:      osmemory_read_arrangement_table_size()
 *
 * Description:   Reads the size of the physical memory arrangement table -
 *                RISC O S 3.5+
 *
 * Output:        table_size - value of R1 on exit (X version only)
 *                page_size - value of R2 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0x6.
 */

extern os_error *xosmemory_read_arrangement_table_size (int *table_size,
      int *page_size);
extern int osmemory_read_arrangement_table_size (int *page_size);

/* ------------------------------------------------------------------------
 * Function:      osmemory_read_arrangement_table()
 *
 * Description:   Read the physical memory arrangement table - RISC O S
 *                3.5+
 *
 * Input:         arrangement_table - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0x7.
 */

extern os_error *xosmemory_read_arrangement_table (byte *arrangement_table);
extern void osmemory_read_arrangement_table (byte *arrangement_table);

/* ------------------------------------------------------------------------
 * Function:      osmemory_read_size()
 *
 * Description:   Reads the amount of a specified type of memory available
 *                on the computer - RISC O S 3.5+
 *
 * Input:         type - value of R0 on entry
 *
 * Output:        page_count - value of R1 on exit
 *                page_size - value of R2 on exit
 *
 * Other notes:   Calls SWI 0x68 with R0 |= 0x8.
 */

extern os_error *xosmemory_read_size (osmemory_type_flags type,
      int *page_count,
      int *page_size);
extern void osmemory_read_size (osmemory_type_flags type,
      int *page_count,
      int *page_size);

/* ------------------------------------------------------------------------
 * Function:      osmemory_read_controller()
 *
 * Description:   Reads controller presence and base address - RISC O S
 *                3.5+
 *
 * Input:         controller - value of R1 on entry
 *
 * Output:        controller_addr - value of R1 on exit
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0x9.
 */

extern os_error *xosmemory_read_controller (osmemory_controller_flags controller,
      void **controller_addr);
extern void osmemory_read_controller (osmemory_controller_flags controller,
      void **controller_addr);

/* ------------------------------------------------------------------------
 * Function:      osmemory_find_contiguous()
 *
 * Description:   Recommends a base page for a currently available (not
 *                locked down) region of physically contiguous RAM - RISC O
 *                S 4+
 *
 * Input:         size - value of R1 on entry
 *
 * Output:        page_number - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0xC.
 */

extern os_error *xosmemory_find_contiguous (int size,
      int *page_number);
extern int osmemory_find_contiguous (int size);

/* ------------------------------------------------------------------------
 * Function:      osmemory_map_in_permanent_io()
 *
 * Description:   Permanently map in a region of IO memory - RISC O S 5+
 *
 * Input:         flags - value of R0 on entry
 *                phys_addr - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        log_addr - value of R3 on exit (X version only)
 *
 * Returns:       R3 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 |= 0xD.
 */

extern os_error *xosmemory_map_in_permanent_io (osmemory_io_flags flags,
      byte *phys_addr,
      int size,
      byte **log_addr);
extern byte *osmemory_map_in_permanent_io (osmemory_io_flags flags,
      byte *phys_addr,
      int size);

/* ------------------------------------------------------------------------
 * Function:      osmemory_map_in_temporary_io()
 *
 * Description:   Temporarily map in 1Mb of IO memory - RISC O S 5+
 *
 * Input:         flags - value of R0 on entry
 *                phys_addr - value of R1 on entry
 *
 * Output:        log_addr - value of R2 on exit (X version only)
 *                key - value of R3 on exit
 *
 * Returns:       R2 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 |= 0xE.
 */

extern os_error *xosmemory_map_in_temporary_io (osmemory_io_flags flags,
      byte *phys_addr,
      byte **log_addr,
      osmemory_io_reference_key *key);
extern byte *osmemory_map_in_temporary_io (osmemory_io_flags flags,
      byte *phys_addr,
      osmemory_io_reference_key *key);

/* ------------------------------------------------------------------------
 * Function:      osmemory_map_out_temporary_io()
 *
 * Description:   Map out a region of temporary IO memory - RISC O S 5+
 *
 * Input:         key - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x68 with R0 = 0xF.
 */

extern os_error *xosmemory_map_out_temporary_io (osmemory_io_reference_key key);
extern void osmemory_map_out_temporary_io (osmemory_io_reference_key key);

/* ------------------------------------------------------------------------
 * Function:      osmemory_get_area_info()
 *
 * Description:   Get information on a memory area - RISC O S 5+
 *
 * Input:         type - value of R0 on entry
 *
 * Output:        base - value of R1 on exit (X version only)
 *                allocated - value of R2 on exit
 *                used - value of R3 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x68 with R0 |= 0x10.
 */

extern os_error *xosmemory_get_area_info (osmemory_area_flags type,
      byte **base,
      int *allocated,
      int *used);
extern byte *osmemory_get_area_info (osmemory_area_flags type,
      int *allocated,
      int *used);

/* ------------------------------------------------------------------------
 * Function:      osclaimprocessorvector_alloc()
 *
 * Description:   Claims a processor vector - RISC O S 3.5+
 *
 * Input:         vector - value of R0 on entry
 *                routine - value of R1 on entry
 *
 * Output:        old_routine - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x69 with R0 |= 0x100.
 */

extern os_error *xosclaimprocessorvector_alloc (bits vector,
      void const *routine,
      void **old_routine);
extern void *osclaimprocessorvector_alloc (bits vector,
      void const *routine);

/* ------------------------------------------------------------------------
 * Function:      osclaimprocessorvector_free()
 *
 * Description:   Releases a processor vector - RISC O S 3.5+
 *
 * Input:         vector - value of R0 on entry
 *                old_routine - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x69 with R0 |= 0x0.
 */

extern os_error *xosclaimprocessorvector_free (bits vector,
      void const *old_routine);
extern void osclaimprocessorvector_free (bits vector,
      void const *old_routine);

/* ------------------------------------------------------------------------
 * Function:      os_reset()
 *
 * Description:   Performs a hard reset - RISC O S 3.5+
 *
 * Other notes:   Calls SWI 0x6A.
 */

extern os_error *xos_reset (void);
__swi (0x6A) void os_reset (void);

/* ------------------------------------------------------------------------
 * Function:      os_mmu_control()
 *
 * Description:   Modifies the ARM MMU - prefer Cache_Control; RISC O S
 *                3.5+
 *
 * Input:         eor_mask - value of R1 on entry
 *                and_mask - value of R2 on entry
 *
 * Output:        old_value - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x6B with R0 = 0x0.
 */

extern os_error *xos_mmu_control (bits eor_mask,
      bits and_mask,
      bits *old_value);
extern bits os_mmu_control (bits eor_mask,
      bits and_mask);

/* ------------------------------------------------------------------------
 * Function:      osplatformfeatures_get_features()
 *
 * Description:   Reports platform features - RISC O S 3.7+
 *
 * Output:        flags - value of R0 on exit (X version only)
 *                predisable_fn - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x6D with R0 = 0x0.
 */

extern os_error *xosplatformfeatures_get_features (os_platform_feature_flags *flags,
      void **predisable_fn);
extern os_platform_feature_flags osplatformfeatures_get_features (void **predisable_fn);

/* ------------------------------------------------------------------------
 * Function:      os_synchronise_code_areas()
 *
 * Description:   Informs the O S that code has been newly generated or
 *                modified in memory - RISC O S 3.7+
 *
 * Input:         flags - value of R0 on entry
 *                start - value of R1 on entry
 *                end - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x6E.
 */

extern os_error *xos_synchronise_code_areas (bits flags,
      void const *start,
      void const *end);
__swi (0x6E) void os_synchronise_code_areas (bits flags,
      void const *start,
      void const *end);

/* ------------------------------------------------------------------------
 * Function:      os_enter_usr32()
 *
 * Description:   Enter 32 bit user mode - RISC O S 4+
 *
 * Other notes:   Calls SWI 0x73.
 */

extern os_error *xos_enter_usr32 (void);
__swi (0x73) void os_enter_usr32 (void);

/* ------------------------------------------------------------------------
 * Function:      os_enter_usr26()
 *
 * Description:   Enter 26 bit user mode - RISC O S 4+
 *
 * Other notes:   Calls SWI 0x74.
 */

extern os_error *xos_enter_usr26 (void);
__swi (0x74) void os_enter_usr26 (void);

/* ------------------------------------------------------------------------
 * Function:      os_hardware_call_hal()
 *
 * Description:   Calls a HAL routine - RISC O S 5+
 *
 * Input:         arg1 - value of R0 on entry
 *                arg2 - value of R1 on entry
 *                arg3 - value of R2 on entry
 *                arg4 - value of R3 on entry
 *                arg5 - value of R4 on entry
 *                arg6 - value of R5 on entry
 *                arg7 - value of R6 on entry
 *                arg8 - value of R7 on entry
 *                flags - value of R8 on entry
 *                call - value of R9 on entry
 *
 * Output:        result1 - value of R0 on exit
 *                result2 - value of R1 on exit
 *                result3 - value of R2 on exit
 *                result4 - value of R3 on exit
 *
 * Other notes:   Calls SWI 0x7A with R8 |= 0x0.
 */

extern os_error *xos_hardware_call_hal (int arg1,
      int arg2,
      int arg3,
      int arg4,
      int arg5,
      int arg6,
      int arg7,
      int arg8,
      os_hardware_flags flags,
      int call,
      int *result1,
      int *result2,
      int *result3,
      int *result4);
extern void os_hardware_call_hal (int arg1,
      int arg2,
      int arg3,
      int arg4,
      int arg5,
      int arg6,
      int arg7,
      int arg8,
      os_hardware_flags flags,
      int call,
      int *result1,
      int *result2,
      int *result3,
      int *result4);

/* ------------------------------------------------------------------------
 * Function:      os_hardware_find_hal_routine()
 *
 * Description:   Finds the address of a HAL routine - RISC O S 5+
 *
 * Input:         flags - value of R8 on entry
 *                call - value of R9 on entry
 *
 * Output:        routine - value of R0 on exit (X version only)
 *                static_base - value of R1 on exit
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x7A with R8 |= 0x1.
 */

extern os_error *xos_hardware_find_hal_routine (os_hardware_flags flags,
      int call,
      void **routine,
      int *static_base);
extern void *os_hardware_find_hal_routine (os_hardware_flags flags,
      int call,
      int *static_base);

/* ------------------------------------------------------------------------
 * Function:      os_convert_standard_date_and_time()
 *
 * Description:   Converts a 5-byte time into a string - prefer
 *                Territory_ConvertStandardDateAndTime
 *
 * Input:         date_and_time - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC0.
 */

extern os_error *xos_convert_standard_date_and_time (os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_standard_date_and_time (os_date_and_time const *date_and_time,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_date_and_time()
 *
 * Description:   Converts a 5-byte time into a string using a supplied
 *                format string - prefer Territory_ConvertDateAndTime
 *
 * Input:         date_and_time - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *                format - value of R3 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xC1.
 */

extern os_error *xos_convert_date_and_time (os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char const *format,
      char **end);
extern char *os_convert_date_and_time (os_date_and_time const *date_and_time,
      char *buffer,
      int size,
      char const *format);

/* ------------------------------------------------------------------------
 * Function:      os_convert_hex1()
 *
 * Description:   Converts a number into a 1-digit hexadecimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD0.
 */

extern os_error *xos_convert_hex1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_hex1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_hex2()
 *
 * Description:   Converts a number into a 2-digit hexadecimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD1.
 */

extern os_error *xos_convert_hex2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_hex2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_hex4()
 *
 * Description:   Converts a number into a 4-digit hexadecimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD2.
 */

extern os_error *xos_convert_hex4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_hex4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_hex6()
 *
 * Description:   Converts a number into a 6-digit hexadecimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD3.
 */

extern os_error *xos_convert_hex6 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_hex6 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_hex8()
 *
 * Description:   Converts a number into an 8-digit hexadecimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD4.
 */

extern os_error *xos_convert_hex8 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_hex8 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_cardinal1()
 *
 * Description:   Converts a 1-byte number into an unsigned decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD5.
 */

extern os_error *xos_convert_cardinal1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_cardinal1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_cardinal2()
 *
 * Description:   Converts a 2-byte number into an unsigned decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD6.
 */

extern os_error *xos_convert_cardinal2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_cardinal2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_cardinal3()
 *
 * Description:   Converts a 3-byte number into an unsigned decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD7.
 */

extern os_error *xos_convert_cardinal3 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_cardinal3 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_cardinal4()
 *
 * Description:   Converts a 4-byte number into an unsigned decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD8.
 */

extern os_error *xos_convert_cardinal4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_cardinal4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_integer1()
 *
 * Description:   Converts a 1-byte number into a signed decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xD9.
 */

extern os_error *xos_convert_integer1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_integer1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_integer2()
 *
 * Description:   Converts a 2-byte number into a signed decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDA.
 */

extern os_error *xos_convert_integer2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_integer2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_integer3()
 *
 * Description:   Converts a 3-byte number into a signed decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDB.
 */

extern os_error *xos_convert_integer3 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_integer3 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_integer4()
 *
 * Description:   Converts a 4-byte number into a signed decimal string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDC.
 */

extern os_error *xos_convert_integer4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_integer4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_binary1()
 *
 * Description:   Converts a 1-byte number into an unsigned binary string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDD.
 */

extern os_error *xos_convert_binary1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_binary1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_binary2()
 *
 * Description:   Converts a 2-byte number into an unsigned binary string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDE.
 */

extern os_error *xos_convert_binary2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_binary2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_binary3()
 *
 * Description:   Converts a 3-byte number into an unsigned binary string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xDF.
 */

extern os_error *xos_convert_binary3 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_binary3 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_binary4()
 *
 * Description:   Converts a 4-byte number into an unsigned binary string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE0.
 */

extern os_error *xos_convert_binary4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_binary4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_cardinal1()
 *
 * Description:   Converts a 1-byte number into a spaced unsigned decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE1.
 */

extern os_error *xos_convert_spaced_cardinal1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_cardinal1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_cardinal2()
 *
 * Description:   Converts a 2-byte number into a spaced unsigned decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE2.
 */

extern os_error *xos_convert_spaced_cardinal2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_cardinal2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_cardinal3()
 *
 * Description:   Converts a 3-byte number into a spaced unsigned decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE3.
 */

extern os_error *xos_convert_spaced_cardinal3 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_cardinal3 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_cardinal4()
 *
 * Description:   Converts a 4-byte number into a spaced unsigned decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE4.
 */

extern os_error *xos_convert_spaced_cardinal4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_cardinal4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_integer1()
 *
 * Description:   Converts a 1-byte number into a spaced signed decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE5.
 */

extern os_error *xos_convert_spaced_integer1 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_integer1 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_integer2()
 *
 * Description:   Converts a 2-byte number into a spaced signed decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE6.
 */

extern os_error *xos_convert_spaced_integer2 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_integer2 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_integer3()
 *
 * Description:   Converts a 3-byte number into a spaced signed decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE7.
 */

extern os_error *xos_convert_spaced_integer3 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_integer3 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_spaced_integer4()
 *
 * Description:   Converts a 4-byte number into a spaced signed decimal
 *                string
 *
 * Input:         value - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE8.
 */

extern os_error *xos_convert_spaced_integer4 (int value,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_spaced_integer4 (int value,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_fixed_net_station()
 *
 * Description:   Converts from an Econet station/network number pair to a
 *                string of fixed length
 *
 * Input:         station_number - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xE9.
 */

extern os_error *xos_convert_fixed_net_station (os_station_number const *station_number,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_fixed_net_station (os_station_number const *station_number,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_net_station()
 *
 * Description:   Converts from an Econet station/network number pair to a
 *                string
 *
 * Input:         station_number - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xEA.
 */

extern os_error *xos_convert_net_station (os_station_number const *station_number,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_net_station (os_station_number const *station_number,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_fixed_file_size()
 *
 * Description:   Converts an integer into a filesize string of fixed
 *                length
 *
 * Input:         file_size - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xEB.
 */

extern os_error *xos_convert_fixed_file_size (int file_size,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_fixed_file_size (int file_size,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_convert_file_size()
 *
 * Description:   Converts an integer into a filesize string
 *
 * Input:         file_size - value of R0 on entry
 *                buffer - value of R1 on entry
 *                size - value of R2 on entry
 *
 * Output:        end - value of R1 on exit (X version only)
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0xEC.
 */

extern os_error *xos_convert_file_size (int file_size,
      char *buffer,
      int size,
      char **end);
extern char *os_convert_file_size (int file_size,
      char *buffer,
      int size);

/* ------------------------------------------------------------------------
 * Function:      os_null()
 *
 * Description:   VDU command for nul (no operation)
 *
 * Other notes:   Calls SWI 0x100.
 */

extern os_error *xos_null (void);
__swi (0x100) void os_null (void);

/* ------------------------------------------------------------------------
 * Function:      os_char_to_printer()
 *
 * Description:   VDU command to send the next character to the printer
 *                only - must be followed by 'char'
 *
 * Other notes:   Calls SWI 0x101.
 */

extern os_error *xos_char_to_printer (void);
__swi (0x101) void os_char_to_printer (void);

/* ------------------------------------------------------------------------
 * Function:      os_printer_on()
 *
 * Description:   VDU command to enable the printer stream - prefer PDriver
 *
 * Other notes:   Calls SWI 0x102.
 */

extern os_error *xos_printer_on (void);
__swi (0x102) void os_printer_on (void);

/* ------------------------------------------------------------------------
 * Function:      os_printer_off()
 *
 * Description:   VDU command to disable the printer stream - prefer
 *                PDriver
 *
 * Other notes:   Calls SWI 0x103.
 */

extern os_error *xos_printer_off (void);
__swi (0x103) void os_printer_off (void);

/* ------------------------------------------------------------------------
 * Function:      os_split_cursors()
 *
 * Description:   VDU command to split the text and graphics cursors
 *
 * Other notes:   Calls SWI 0x104.
 */

extern os_error *xos_split_cursors (void);
__swi (0x104) void os_split_cursors (void);

/* ------------------------------------------------------------------------
 * Function:      os_join_cursors()
 *
 * Description:   VDU command to join the text and graphics cursors
 *
 * Other notes:   Calls SWI 0x105.
 */

extern os_error *xos_join_cursors (void);
__swi (0x105) void os_join_cursors (void);

/* ------------------------------------------------------------------------
 * Function:      os_vdu_on()
 *
 * Description:   VDU command to enable screen output
 *
 * Other notes:   Calls SWI 0x106.
 */

extern os_error *xos_vdu_on (void);
__swi (0x106) void os_vdu_on (void);

/* ------------------------------------------------------------------------
 * Function:      os_bell()
 *
 * Description:   VDU command to ring the bell
 *
 * Other notes:   Calls SWI 0x107.
 */

extern os_error *xos_bell (void);
__swi (0x107) void os_bell (void);

/* ------------------------------------------------------------------------
 * Function:      os_backspace()
 *
 * Description:   VDU command to perform a backspace
 *
 * Other notes:   Calls SWI 0x108.
 */

extern os_error *xos_backspace (void);
__swi (0x108) void os_backspace (void);

/* ------------------------------------------------------------------------
 * Function:      os_tab()
 *
 * Description:   VDU command to perform a horizontal tab
 *
 * Other notes:   Calls SWI 0x109.
 */

extern os_error *xos_tab (void);
__swi (0x109) void os_tab (void);

/* ------------------------------------------------------------------------
 * Function:      os_line_feed()
 *
 * Description:   VDU command to perform a linefeed
 *
 * Other notes:   Calls SWI 0x10A.
 */

extern os_error *xos_line_feed (void);
__swi (0x10A) void os_line_feed (void);

/* ------------------------------------------------------------------------
 * Function:      os_vertical_tab()
 *
 * Description:   VDU command to perform a vertical tab
 *
 * Other notes:   Calls SWI 0x10B.
 */

extern os_error *xos_vertical_tab (void);
__swi (0x10B) void os_vertical_tab (void);

/* ------------------------------------------------------------------------
 * Function:      os_cls()
 *
 * Description:   VDU command to clear the text window
 *
 * Other notes:   Calls SWI 0x10C.
 */

extern os_error *xos_cls (void);
__swi (0x10C) void os_cls (void);

/* ------------------------------------------------------------------------
 * Function:      os_return()
 *
 * Description:   VDU command to perform a return
 *
 * Other notes:   Calls SWI 0x10D.
 */

extern os_error *xos_return (void);
__swi (0x10D) void os_return (void);

/* ------------------------------------------------------------------------
 * Function:      os_page_mode_on()
 *
 * Description:   VDU command to turn paged mode on
 *
 * Other notes:   Calls SWI 0x10E.
 */

extern os_error *xos_page_mode_on (void);
__swi (0x10E) void os_page_mode_on (void);

/* ------------------------------------------------------------------------
 * Function:      os_page_mode_off()
 *
 * Description:   VDU command to turn paged mode off
 *
 * Other notes:   Calls SWI 0x10F.
 */

extern os_error *xos_page_mode_off (void);
__swi (0x10F) void os_page_mode_off (void);

/* ------------------------------------------------------------------------
 * Function:      os_clg()
 *
 * Description:   VDU command to clear the graphics window
 *
 * Other notes:   Calls SWI 0x110.
 */

extern os_error *xos_clg (void);
__swi (0x110) void os_clg (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_text_colour()
 *
 * Description:   VDU command to set the text colour - must be followed by
 *                'colour' - prefer OS_SetColour
 *
 * Other notes:   Calls SWI 0x111.
 */

extern os_error *xos_set_text_colour (void);
__swi (0x111) void os_set_text_colour (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_gcol()
 *
 * Description:   VDU command to set the graphics colour and action - must
 *                be followed by 'action,' 'colour' - prefer OS_SetColour
 *
 * Other notes:   Calls SWI 0x112.
 */

extern os_error *xos_set_gcol (void);
__swi (0x112) void os_set_gcol (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_palette()
 *
 * Description:   VDU command to set the palette - must be followed by
 *                'colour,' 'mode,' 'red,' 'green,' 'blue'
 *
 * Other notes:   Calls SWI 0x113.
 */

extern os_error *xos_set_palette (void);
__swi (0x113) void os_set_palette (void);

/* ------------------------------------------------------------------------
 * Function:      os_reset_colours()
 *
 * Description:   VDU command to restore default colours
 *
 * Other notes:   Calls SWI 0x114.
 */

extern os_error *xos_reset_colours (void);
__swi (0x114) void os_reset_colours (void);

/* ------------------------------------------------------------------------
 * Function:      os_vdu_off()
 *
 * Description:   VDU command to disable screen output
 *
 * Other notes:   Calls SWI 0x115.
 */

extern os_error *xos_vdu_off (void);
__swi (0x115) void os_vdu_off (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_mode()
 *
 * Description:   VDU command to change display mode - must be followed by
 *                'mode' - prefer OS_ScreenMode
 *
 * Other notes:   Calls SWI 0x116.
 */

extern os_error *xos_set_mode (void);
__swi (0x116) void os_set_mode (void);

/* ------------------------------------------------------------------------
 * Function:      os_misc()
 *
 * Description:   Miscellaneous VDU commands - must be followed by
 *                'command' and 8 more arguments
 *
 * Other notes:   Calls SWI 0x117.
 */

extern os_error *xos_misc (void);
__swi (0x117) void os_misc (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_graphics_window()
 *
 * Description:   VDU command to define the graphics window - must be
 *                followed by 'x0,' 'y0,' 'x1,' 'y1' (2 bytes each)
 *
 * Other notes:   Calls SWI 0x118.
 */

extern os_error *xos_set_graphics_window (void);
__swi (0x118) void os_set_graphics_window (void);

/* ------------------------------------------------------------------------
 * Function:      os_plot_vdu()
 *
 * Description:   General VDU plot commands - must be followed by
 *                'plot_type' and 'x,' 'y' (2 bytes each) - prefer OS_Plot
 *
 * Other notes:   Calls SWI 0x119.
 */

extern os_error *xos_plot_vdu (void);
__swi (0x119) void os_plot_vdu (void);

/* ------------------------------------------------------------------------
 * Function:      os_reset_windows()
 *
 * Description:   VDU command to restore default windows
 *
 * Other notes:   Calls SWI 0x11A.
 */

extern os_error *xos_reset_windows (void);
__swi (0x11A) void os_reset_windows (void);

/* ------------------------------------------------------------------------
 * Function:      os_escape()
 *
 * Description:   VDU command for escape (no operation)
 *
 * Other notes:   Calls SWI 0x11B.
 */

extern os_error *xos_escape (void);
__swi (0x11B) void os_escape (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_text_window()
 *
 * Description:   VDU command to define the text window - must be followed
 *                by 'x0,' 'y0,' 'x1,' 'y1'
 *
 * Other notes:   Calls SWI 0x11C.
 */

extern os_error *xos_set_text_window (void);
__swi (0x11C) void os_set_text_window (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_graphics_origin()
 *
 * Description:   VDU command to set the graphics origin - must be followed
 *                by 'x,' 'y' (2 bytes each)
 *
 * Other notes:   Calls SWI 0x11D.
 */

extern os_error *xos_set_graphics_origin (void);
__swi (0x11D) void os_set_graphics_origin (void);

/* ------------------------------------------------------------------------
 * Function:      os_home_text_cursor()
 *
 * Description:   VDU command to home the text cursor
 *
 * Other notes:   Calls SWI 0x11E.
 */

extern os_error *xos_home_text_cursor (void);
__swi (0x11E) void os_home_text_cursor (void);

/* ------------------------------------------------------------------------
 * Function:      os_set_text_cursor()
 *
 * Description:   VDU command to position the text cursor - must be
 *                followed by 'x,' 'y'
 *
 * Other notes:   Calls SWI 0x11F.
 */

extern os_error *xos_set_text_cursor (void);
__swi (0x11F) void os_set_text_cursor (void);

/* ------------------------------------------------------------------------
 * Function:      os_space()
 *
 * Description:   VDU command to perform a space
 *
 * Other notes:   Calls SWI 0x120.
 */

extern os_error *xos_space (void);
__swi (0x120) void os_space (void);

/* ------------------------------------------------------------------------
 * Function:      os_delete()
 *
 * Description:   VDU command to perform a delete
 *
 * Other notes:   Calls SWI 0x17F.
 */

extern os_error *xos_delete (void);
__swi (0x17F) void os_delete (void);

/* ------------------------------------------------------------------------
 * Function:      ukvdu23v()
 *
 * Description:   Called when an unrecognised VDU 23 command is issued
 *
 * Input:         n - value of R0 on entry
 *                queue - value of R1 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x17.
 */

extern os_error *xukvdu23v (int n,
      byte const *queue);
extern void ukvdu23v (int n,
      byte const *queue);

/* ------------------------------------------------------------------------
 * Function:      vduxv()
 *
 * Description:   Called when VDU output has been redirected
 *
 * Input:         b - value of R0 on entry
 *
 * Other notes:   Calls SWI 0x34 with R9 = 0x1B.
 */

extern os_error *xvduxv (byte b);
extern void vduxv (byte b);

/* ------------------------------------------------------------------------
 * Function:      service_release_fiq()
 *
 * Description:   FIQ released
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xB.
 */

extern os_error *xservice_release_fiq (void);
extern void service_release_fiq (void);

/* ------------------------------------------------------------------------
 * Function:      service_claim_fiq()
 *
 * Description:   FIQ claimed
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0xC.
 */

extern os_error *xservice_claim_fiq (void);
extern void service_claim_fiq (void);

/* ------------------------------------------------------------------------
 * Function:      service_reset()
 *
 * Description:   Post-reset. Also, request to task modules and filing
 *                system-specific desktop filers to set task_handle
 *                variable to 0
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x27.
 */

extern os_error *xservice_reset (void);
extern void service_reset (void);

/* ------------------------------------------------------------------------
 * Function:      service_key_handler()
 *
 * Description:   Keyboard handler changed
 *
 * Input:         keyboard_id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x44.
 */

extern os_error *xservice_key_handler (int keyboard_id);
extern void service_key_handler (int keyboard_id);

/* ------------------------------------------------------------------------
 * Function:      service_mode_change()
 *
 * Description:   Mode changed
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x46.
 */

extern os_error *xservice_mode_change (void);
extern void service_mode_change (void);

/* ------------------------------------------------------------------------
 * Function:      service_claim_fiq_in_background()
 *
 * Description:   FIQ claimed in background
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x47.
 */

extern os_error *xservice_claim_fiq_in_background (void);
extern void service_claim_fiq_in_background (void);

/* ------------------------------------------------------------------------
 * Function:      service_memory_moved()
 *
 * Description:   Memory moved
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4E.
 */

extern os_error *xservice_memory_moved (void);
extern void service_memory_moved (void);

/* ------------------------------------------------------------------------
 * Function:      service_pre_mode_change()
 *
 * Description:   Mode change
 *
 * Input:         mode - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x4D.
 */

extern os_error *xservice_pre_mode_change (os_mode mode);
extern void service_pre_mode_change (os_mode mode);

/* ------------------------------------------------------------------------
 * Function:      service_mode_extension()
 *
 * Description:   Allow soft modes
 *
 * Input:         mode - value of R2 on entry
 *                monitor_type - value of R3 on entry
 *                bandwidth - RISC O S 3.5+
 *                vram_size - RISC O S 3.5+
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                vidc_list - value of R3 on exit
 *                workspace_list - value of R4 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x50.
 */

extern os_error *xservice_mode_extension (os_mode mode,
      int monitor_type,
      int bandwidth,
      int vram_size,
      osbool *unclaimed,
      int **vidc_list,
      int **workspace_list);
extern osbool service_mode_extension (os_mode mode,
      int monitor_type,
      int bandwidth,
      int vram_size,
      int **vidc_list,
      int **workspace_list);

/* ------------------------------------------------------------------------
 * Function:      service_mode_translation()
 *
 * Description:   Translate modes for unknown monitor types
 *
 * Input:         mode - value of R2 on entry
 *                monitor_type - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x51.
 */

extern os_error *xservice_mode_translation (os_mode mode,
      int monitor_type);
extern void service_mode_translation (os_mode mode,
      int monitor_type);

/* ------------------------------------------------------------------------
 * Function:      service_validate_address()
 *
 * Description:   OS_ValidateAddress has been called with an unknown area
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x6D.
 */

extern os_error *xservice_validate_address (void);
extern void service_validate_address (void);

/* ------------------------------------------------------------------------
 * Function:      service_monitor_lead_translation()
 *
 * Description:   Translate monitor lead ID
 *
 * Input:         lead_id - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x76.
 */

extern os_error *xservice_monitor_lead_translation (int lead_id);
extern void service_monitor_lead_translation (int lead_id);

/* ------------------------------------------------------------------------
 * Function:      service_mode_changing()
 *
 * Description:   Mode change
 *
 * Input:         mode - value of R2 on entry
 *                monitor_type - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x89.
 */

extern os_error *xservice_mode_changing (os_mode mode,
      int monitor_type);
extern void service_mode_changing (os_mode mode,
      int monitor_type);

/* ------------------------------------------------------------------------
 * Function:      service_enumerate_screen_modes()
 *
 * Description:   Enumerates the available screen modes
 *
 * Input:         context - value of R2 on entry
 *                monitor_type - value of R3 on entry
 *                bandwidth - value of R4 on entry
 *                vram_size - value of R5 on entry
 *                block - value of R6 on entry
 *                block_size - value of R7 on entry
 *
 * Output:        unclaimed - value of R1 on exit (X version only)
 *                context_out - value of R2 on exit
 *                end - value of R6 on exit
 *                free - value of R7 on exit
 *
 * Returns:       R1 (non-X version only)
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8D.
 */

extern os_error *xservice_enumerate_screen_modes (int context,
      int monitor_type,
      int bandwidth,
      int vram_size,
      os_mode_block *block,
      int block_size,
      osbool *unclaimed,
      int *context_out,
      byte **end,
      int *free);
extern osbool service_enumerate_screen_modes (int context,
      int monitor_type,
      int bandwidth,
      int vram_size,
      os_mode_block *block,
      int block_size,
      int *context_out,
      byte **end,
      int *free);

/* ------------------------------------------------------------------------
 * Function:      service_pages_unsafe()
 *
 * Description:   Pages specified are about to be swapped for different
 *                pages - RISC O S 3.5+
 *
 * Input:         page_block - value of R2 on entry
 *                request_count - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8E.
 */

extern os_error *xservice_pages_unsafe (os_page_block const *page_block,
      int request_count);
extern void service_pages_unsafe (os_page_block const *page_block,
      int request_count);

/* ------------------------------------------------------------------------
 * Function:      service_pages_safe()
 *
 * Description:   Pages specified have been swapped for different pages -
 *                RISC O S 3.5+
 *
 * Input:         request_count - value of R2 on entry
 *                old_page_block - value of R3 on entry
 *                new_page_block - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x8F.
 */

extern os_error *xservice_pages_safe (int request_count,
      os_page_block const *old_page_block,
      os_page_block const *new_page_block);
extern void service_pages_safe (int request_count,
      os_page_block const *old_page_block,
      os_page_block const *new_page_block);

/* ------------------------------------------------------------------------
 * Function:      service_dynamic_area_create()
 *
 * Description:   Dynamic area has just been successfully created - RISC O
 *                S 3.5+
 *
 * Input:         area - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x90.
 */

extern os_error *xservice_dynamic_area_create (int area);
extern void service_dynamic_area_create (int area);

/* ------------------------------------------------------------------------
 * Function:      service_dynamic_area_remove()
 *
 * Description:   Dynamic area is about to be removed - RISC O S 3.5+
 *
 * Input:         area - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x91.
 */

extern os_error *xservice_dynamic_area_remove (int area);
extern void service_dynamic_area_remove (int area);

/* ------------------------------------------------------------------------
 * Function:      service_dynamic_area_renumber()
 *
 * Description:   Dynamic area is being renumbered - RISC O S 3.5+
 *
 * Input:         area - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x30 with R1 = 0x92.
 */

extern os_error *xservice_dynamic_area_renumber (int area);
extern void service_dynamic_area_renumber (int area);

/* ------------------------------------------------------------------------
 * Function:      event_char_input()
 *
 * Description:   Character input
 *
 * Input:         buffer - value of R1 on entry
 *                b - value of R2 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x2.
 */

extern os_error *xevent_char_input (int buffer,
      byte b);
extern void event_char_input (int buffer,
      byte b);

/* ------------------------------------------------------------------------
 * Function:      event_vsync()
 *
 * Description:   Vertical sync
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x4.
 */

extern os_error *xevent_vsync (void);
extern void event_vsync (void);

/* ------------------------------------------------------------------------
 * Function:      event_interval_timer()
 *
 * Description:   Interval timer
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x5.
 */

extern os_error *xevent_interval_timer (void);
extern void event_interval_timer (void);

/* ------------------------------------------------------------------------
 * Function:      event_escape()
 *
 * Description:   Escape
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x6.
 */

extern os_error *xevent_escape (void);
extern void event_escape (void);

/* ------------------------------------------------------------------------
 * Function:      event_mouse_transition()
 *
 * Description:   Mouse button up/down
 *
 * Input:         x - value of R1 on entry
 *                y - value of R2 on entry
 *                state - value of R3 on entry
 *                t - value of R4 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0xA.
 */

extern os_error *xevent_mouse_transition (int x,
      int y,
      bits state,
      os_t t);
extern void event_mouse_transition (int x,
      int y,
      bits state,
      os_t t);

/* ------------------------------------------------------------------------
 * Function:      event_key_transition()
 *
 * Description:   Key up/down
 *
 * Input:         down - value of R1 on entry
 *                key - value of R2 on entry
 *                keyboard_id - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0xB.
 */

extern os_error *xevent_key_transition (osbool down,
      int key,
      int keyboard_id);
extern void event_key_transition (osbool down,
      int key,
      int keyboard_id);

/* ------------------------------------------------------------------------
 * Function:      event_pointer_scroll()
 *
 * Description:   Pointer scroll - RISC O S 4.32+
 *
 * Input:         xmove - value of R2 on entry
 *                ymove - value of R3 on entry
 *
 * Other notes:   Calls SWI 0x22 with R0 = 0x15, R1 = 0x4.
 */

extern os_error *xevent_pointer_scroll (int xmove,
      int ymove);
extern void event_pointer_scroll (int xmove,
      int ymove);

/* ------------------------------------------------------------------------
 * Function:      upcall_move_memory_request()
 *
 * Description:   Informs your program that RISC O S would like to move
 *                memory
 *
 * Input:         size_change - value of R1 on entry
 *
 * Output:        not_moved - value of R0 on exit (X version only)
 *
 * Returns:       R0 (non-X version only)
 *
 * Other notes:   Calls SWI 0x33 with R0 = 0x101.
 */

extern os_error *xupcall_move_memory_request (int size_change,
      osbool *not_moved);
extern osbool upcall_move_memory_request (int size_change);

#ifdef __cplusplus
   }
#endif

#if defined NAMESPACE_OSLIB
  } 
#endif

#ifndef oscore32_H
#include "oslib/oscore32.h"
#endif

#endif
