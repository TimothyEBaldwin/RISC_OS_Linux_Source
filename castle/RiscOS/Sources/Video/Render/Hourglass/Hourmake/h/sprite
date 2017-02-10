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
#define Sprite_Initialise           9
#define Sprite_Load                 10
#define Sprite_Select               24
#define Sprite_ReadInformation      40
#define Sprite_PutScaled            52
#define Sprite_SwitchOutputToSprite 60
#define Sprite_SaveAreaSize         62

typedef struct
{
  int size;
  int number;
  int sproff;
  int freeoff;
} sprite_area;

typedef struct
{
  int  next;
  char name[12];
  int  width;
  int  height;
  int  lbit;
  int  rbit;
  int  image;
  int  mask;
  int  mode;
} sprite_header;
