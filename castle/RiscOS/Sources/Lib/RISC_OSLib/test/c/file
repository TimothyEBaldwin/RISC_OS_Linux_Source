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
/* Test harness for large file extensions
 * Intended for use in debug builds where the file size check in fopen_common()
 * has been disabled, and where OFF32_MAX has been reduced to 31
 */

#define _LARGEFILE_SOURCE
#define _FILE_OFFSET_BITS 64

#include <stdio.h>
#include <errno.h>
#include "swis.h"

#define BUFSIZE 16

int main(void)
{
  FILE *f;
  char buffer[BUFSIZE];
  int i;
  char string[80];
  
  /* Writing beyond file pointer limit */
  
  errno = 0;
  f = fopen("myfile", "w");
  sprintf(string, "fopen errno = %d\n\r", errno);
  _swix(OS_Write0, _IN(0), string);
  if (f != NULL)
  {
    setvbuf(f, buffer, _IOFBF, BUFSIZE);
    
    for (i = 0; i < 34; i++)
    {
      errno = 0;
      int e = fputc(i, f);
      sprintf(string, "fputc %d=%d errno = %d\n\r", i, e, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    
    errno = 0;
    fclose(f);
    sprintf(string, "fclose errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
  }
  
  /* Writing beyond file pointer limit, where the limit lies on a
   * buffer boundary */
  
  errno = 0;
  f = fopen("myfile", "w");
  sprintf(string, "fopen errno = %d\n\r", errno);
  _swix(OS_Write0, _IN(0), string);
  if (f != NULL)
  {
    setvbuf(f, buffer, _IOFBF, BUFSIZE);
    errno = 0;
    fseeko(f, 15, SEEK_SET);
    sprintf(string, "fseeko errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
    
    for (i = 15; i < 34; i++)
    {
      errno = 0;
      int e = fputc(i, f);
      sprintf(string, "fputc %d=%d errno = %d\n\r", i, e, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    
    errno = 0;
    fclose(f);
    sprintf(string, "fclose errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
  }
  
  /* Reading beyond file pointer limit */
  
  errno = 0;
  f = fopen("myfile2", "r");
  sprintf(string, "fopen errno = %d\n\r", errno);
  _swix(OS_Write0, _IN(0), string);
  if (f != NULL)
  {
    setvbuf(f, buffer, _IOFBF, BUFSIZE);
    
    for (i = 0; i < 35; i++)
    {
      errno = 0;
      int c = fgetc(f);
      sprintf(string, "fgetc %d=%d errno = %d\n\r", i, c, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    
    errno = 0;
    fclose(f);
    sprintf(string, "fclose errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
  }
  
  /* Reading beyond file pointer limit, when data has been written
   * up to a buffer boundary */
  
  errno = 0;
  f = fopen("myfile2", "r+");
  sprintf(string, "fopen errno = %d\n\r", errno);
  _swix(OS_Write0, _IN(0), string);
  if (f != NULL)
  {
    setvbuf(f, buffer, _IOFBF, BUFSIZE);
    
    for (i = 0; i < 16; i++)
    {
      errno = 0;
      int e = fputc(i, f);
      sprintf(string, "fputc %d=%d errno = %d\n\r", i, e, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    errno = 0;
    fseeko(f, 0, SEEK_CUR);
    sprintf(string, "fseeko errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
    for (; i < 35; i++)
    {
      errno = 0;
      int c = fgetc(f);
      sprintf(string, "fgetc %d=%d errno = %d\n\r", i, c, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    
    errno = 0;
    fclose(f);
    sprintf(string, "fclose errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
  }
  
  /* Reading beyond file pointer limit, when data has been written
   * up to NOT a buffer boundary */
  
  errno = 0;
  f = fopen("myfile2", "r+");
  sprintf(string, "fopen errno = %d\n\r", errno);
  _swix(OS_Write0, _IN(0), string);
  if (f != NULL)
  {
    setvbuf(f, buffer, _IOFBF, BUFSIZE);
    
    for (i = 0; i < /*13*/19; i++)
    {
      errno = 0;
      int e = fputc(i, f);
      sprintf(string, "fputc %d=%d errno = %d\n\r", i, e, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    errno = 0;
    fseeko(f, 0, SEEK_CUR);
    sprintf(string, "fseeko errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
    for (; i < 35; i++)
    {
      errno = 0;
      int c = fgetc(f);
      sprintf(string, "fgetc %d=%d errno = %d\n\r", i, c, errno);
      _swix(OS_Write0, _IN(0), string);
    }
    
    errno = 0;
    fclose(f);
    sprintf(string, "fclose errno = %d\n\r", errno);
    _swix(OS_Write0, _IN(0), string);
  }
}
