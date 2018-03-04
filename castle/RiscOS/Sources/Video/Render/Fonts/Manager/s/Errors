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
; > Sources.Errors

; Errors moved from Hdr.NewErrors to here, with message tokens added

 AddError FontEscape,            "ErrEscape:Escape", ErrorNumber_Escape
 AddError FontCantKill,          "ErrCantKill:Font Manager is in use", ErrorNumber_CantKill
 AddError FontBuffOverflow,      "ErrBuffOverflow:Buffer overflow", ErrorNumber_BuffOverflow
 AddError FontNoSuchSWI,         "ErrNoSuchSWI:SWI not known", ErrorNumber_NoSuchSWI
 AddError FontBadFileName,       "ErrBadFileName:Bad file name", ErrorNumber_BadFileName
 AddError FontBadParameters,     "ErrBadParameters:Bad parameters", ErrorNumber_BadParameters

 ^ &200
 AddError FontNoRoom,            "ErrNoRoom:Not enough memory for Font cache"
 AddError FontCacheFull,         "ErrCacheFull:Font cache full"
 AddError FontNoCache,           "ErrNoCache:No font cache present"
 AddError FontTooLong,           "ErrTooLong:String too long"
 AddError Font64K,               "Err64K:Font definition too large"
 AddError FontPalTooBig,         "ErrPalTooBig:Undefined font colour"
 AddError FontBadTranBits,       "ErrBadTranBits:Invalid data passed to Font_SetTransfer"
 AddError FontNotEnoughBits,     "ErrNotEnoughBits:Invalid font colour"
 AddError FontNoFont,            "ErrNoFont:Undefined font handle"
 AddError FontNoPixels,          "ErrNoPixels:No pixel data for this font"
 AddError FontBadFontNumber,     "ErrBadFontNumber:Font handle out of range"
 AddError FontNotFound,          "ErrNotFound:%0 font not found"
 AddError FontBadFontFile,       "ErrBadFontFile:Illegal font file"
 AddError FontNoHandles,         "ErrNoHandles:No more font handles"
 AddError FontBadCounter,        "ErrBadCounter:Fonts must be read sequentially"
 AddError FontBadCtrlChar,       "ErrBadCtrlChar:Illegal control character in font string"
 AddError FontsInUse,            "ErrsInUse:Font manager in use"
 AddError FontBadSegment,        "ErrBadSegment:Illegal line segment in outline font"
 AddError FontBadPrefix,         "ErrBadPrefix:%1 (while scanning Font$$$$Path)"
 AddError FontReserved,          "ErrReserved:Reserved fields must be zero"
 AddError FontBadCharCode,       "ErrBadCharCode:Character code out of range"
 AddError FontNoBitmaps,         "ErrNoBitmaps:ROM font directory cannot contain bitmaps"
 AddError FontNoBitmaps2,        "ErrNoBitmaps2:Can't convert bitmap characters into outlines"
 AddError FontBadFontCacheFile,  "ErrBadFontCacheFile:Invalid font cache file"
 AddError FontFieldNotFound,     "ErrFieldNotFound:%0 field not present in font string"
 AddError FontBadMatrix,         "ErrBadMatrix:Invalid matrix passed to Font Manager"
 AddError FontOverflow,          "ErrOverflow:Number too big"
 AddError FontDivby0,            "ErrDivby0:Division by zero"
 AddError FontBadReadMetrics,    "ErrBadReadMetrics:Font_ReadFontMetrics not allowed on a transformed font"
 AddError FontBadRGB,            "ErrBadRGB:Undefined RGB font colours"
 AddError FontEncodingNotFound,  "ErrEncodingNotFound:%0 encoding not found"
 AddError FontMustHaveSlash,     "ErrMustHaveSlash:Identifier '%1' should be preceded by '/' in encoding '%0'"
 AddError FontBadEncodingSize,   "ErrBadEncodingSize:Max total size of input and output encoding files is 16k"
 AddError FontTooManyIDs,        "ErrTooManyIDs:Too many identifiers in %0 encoding"
 AddError FontTooFewIDs,         "ErrTooFewIDs:Not enough identifiers in %0 encoding"
 AddError FontNoBaseEncoding,    "ErrNoBaseEncoding:Base encoding %0 not found"
 AddError FontIdentifierNotFound,"ErrIdentifierNotFound:Identifier %1 not found in encoding %0"
 AddError FontTooManyChunks,     "ErrTooManyChunks:Too many characters in %0"
 AddError FontBadFontFile2,      "ErrBadFontFile2:Illegal font file in %0"
 AddError FontBadSupremacyBlend, "ErrSupremacyBlend:Supremacy blending not supported in this mode"
 AddError FontNoPathDot,         "ErrNoPathDot:Font prefix is not a path"

 ASSERT @ <= &280

 ^ ErrorNumber_FontNotFound
 AddError FontDataNotFound,  "ErrDataNotFound:Font data not found"
 ^ ErrorNumber_FontNotFound
 AddError FontDataNotFound2, "ErrDataNotFound2:No suitable font data for %0"

        END

