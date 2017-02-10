/* This source code in this file is licensed to You by Castle Technology
 * Limited ("Castle") and its licensors on contractual terms and conditions
 * ("Licence") which entitle you freely to modify and/or to distribute this
 * source code subject to Your compliance with the terms of the Licence.
 * 
 * This source code has been made available to You without any warranties
 * whatsoever. Consequently, Your use, modification and distribution of this
 * source code is entirely at Your own risk and neither Castle, its licensors
 * nor any other person who has contributed to this source code shall be
 * liable to You for any loss or damage which You may suffer as a result of
 * Your use, modification or distribution of this source code.
 * 
 * Full details of Your rights and obligations are set out in the Licence.
 * You should have received a copy of the Licence with this source code file.
 * If You have not received a copy, the text of the Licence is available
 * online at www.castle-technology.co.uk/riscosbaselicence.htm
 */
/*
*  PARAMS.H -- Reasons codes for Fileswitch interface.
*
*  09-03-94 INH  Derived from FSinC
*
*/

typedef enum
{
        FSEntry_Open_Reason_OpenRead = 0,
        FSEntry_Open_Reason_CreateUpdate = 1,
        FSEntry_Open_Reason_Update = 2
}
        FSEntry_Open_Reason;

#define OPEN_Writable           0x80000000
#define OPEN_Readable           0x40000000
#define OPEN_ObjectIsDir        0x20000000
#define OPEN_Unbuffered         0x10000000
#define OPEN_Interactive        0x08000000


typedef enum
{
        FSEntry_Args_Reason_ReadSequentialFilePointer = 0,
        FSEntry_Args_Reason_WriteSequentialFilePointer = 1,
        FSEntry_Args_Reason_ReadFileExtent = 2,
        FSEntry_Args_Reason_WriteFileExtent = 3,
        FSEntry_Args_Reason_ReadSizeAllocatedToFile = 4,
        FSEntry_Args_Reason_EOFCheck = 5,
        FSEntry_Args_Reason_FlushFileBuffer = 6,
        FSEntry_Args_Reason_EnsureFileSize = 7,
        FSEntry_Args_Reason_WriteZerosToFile = 8,
        FSEntry_Args_Reason_ReadFileDateStamp = 9,
        FSEntry_Args_Reason_IOCtl = 11
}
        FSEntry_Args_Reason;


typedef enum
{
        FSEntry_File_Reason_LoadFile = 0xff,
        FSEntry_File_Reason_SaveFile = 0,
        FSEntry_File_Reason_WriteCatalogueInformation = 1,
        FSEntry_File_Reason_WriteLoadAddress = 2,
        FSEntry_File_Reason_WriteExecutionAddress = 3,
        FSEntry_File_Reason_WriteAttributes = 4,
        FSEntry_File_Reason_ReadCatalogueInformation = 5,
        FSEntry_File_Reason_DeleteObject = 6,
        FSEntry_File_Reason_CreateFile = 7,
        FSEntry_File_Reason_CreateDirectory = 8,
        FSEntry_File_Reason_ReadCatalogueInformationNoLength = 9
}
        FSEntry_File_Reason;

typedef enum
{
        FSEntry_Func_Reason_SetCurrentDirectory = 0,
        FSEntry_Func_Reason_SetLibraryDirectory = 1,
        FSEntry_Func_Reason_CatalogueDirectory = 2,
        FSEntry_Func_Reason_ExamineCurrentDirectory = 3,
        FSEntry_Func_Reason_CatalogueLibraryDirectory = 4,
        FSEntry_Func_Reason_ExamineLibraryDirectory = 5,
        FSEntry_Func_Reason_ExamineObjects = 6,
        FSEntry_Func_Reason_SetFilingSystemOptions = 7,
        FSEntry_Func_Reason_RenameObject = 8,
        FSEntry_Func_Reason_AccessObjects = 9,
        FSEntry_Func_Reason_BootFilingSystem = 10,
        FSEntry_Func_Reason_ReadNameAndBootOptionOfDisc = 11,
        FSEntry_Func_Reason_ReadCurrentDirectoryNameAndPrivilegeByte = 12,
        FSEntry_Func_Reason_ReadLibraryDirectoryNameAndPrivilegeByte = 13,
        FSEntry_Func_Reason_ReadDirectoryEntries = 14,
        FSEntry_Func_Reason_ReadDirectoriesAndInformation = 15,
        FSEntry_Func_Reason_ShutDown = 16,
        FSEntry_Func_Reason_PrintStartUpBanner = 17,
        FSEntry_Func_Reason_SetDirectoryContexts = 18,
        FSEntry_Func_Reason_ReadDirectoryEntriesAndInformation = 19,
        FSEntry_Func_Reason_OutputFullInformationOnObjects = 20,
        FSEntry_Func_Reason_ResolveWildcard = 24,
        FSEntry_Func_Reason_ReadFreeSpace = 30,
        FSEntry_Func_Reason_ReadFreeSpace64 = 35
}
        FSEntry_Func_Reason;


typedef enum
{
        FSEntry_GBPB_Reason_PutMultipleBytesHere = 1,
        FSEntry_GBPB_Reason_PutMultipleBytes = 2,
        FSEntry_GBPB_Reason_GetMultipleBytesHere = 3,
        FSEntry_GBPB_Reason_GetMultipleBytes = 4
}
        FSEntry_GBPB_Reason;


