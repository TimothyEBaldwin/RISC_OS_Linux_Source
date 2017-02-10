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
/****************************************************************************
 * This source file was written by Acorn Computers Limited. It is part of   *
 * the RISCOS library for writing applications in C for RISC OS. It may be  *
 * used freely in the creation of programs for Archimedes. It should be     *
 * used with Acorn's C Compiler Release 3 or later.                         *
 *                                                                          *
 ***************************************************************************/
/*
 * Title: bezierarc.h
 * Purpose: Arc to bezier conversion.
 *
 */

/*
 * Version: 0.10
 * History: 0.10 - 12 June 1989 - header added
 *
 */

/* Definition of a coordinate. Note that Draw coordinates may be freely cast
   to this
 */

typedef struct {int x, y;} bezierarc_coord;

/* Constants */
#define bezierarc_pi      3.1415927
#define bezierarc_rad90   (bezierarc_pi/2)
#define bezierarc_rad360  (bezierarc_pi*2)

/* Construct a bezier arc of less than 90 degrees */
void bezierarc_short(
    bezierarc_coord   centre,
    double            startAngle,
    double            endAngle,
    int               radius,
    bezierarc_coord   *start,
    bezierarc_coord   *end,
    bezierarc_coord   *control1,
    bezierarc_coord   *control2);

/* Construct a 90 degree bezier arc */
void bezierarc_90(
    bezierarc_coord   centre,
    double            startAngle,
    int               radius,
    bezierarc_coord   *start,
    bezierarc_coord   *end,
    bezierarc_coord   *control1,
    bezierarc_coord   *control2);

/* Construct a set of points defining a circle */
void bezierarc_circle(
    bezierarc_coord   centre,
    int               radius,
    bezierarc_coord   *p /* array for 13 points */);

/* Get points for first segment of an arc -> number of segments */
int bezierarc_start(
    bezierarc_coord   centre,
    double            startAngle,
    double            endAngle,
    int               radius,
    bezierarc_coord   *start,
    bezierarc_coord   *end,
    bezierarc_coord   *bezier1,
    bezierarc_coord   *bezier2);

/* Next segment of arc -> 0 or next segment number */
int bezierarc_segment(
    int               segment,
    bezierarc_coord   *end,
    bezierarc_coord   *bezier1,
    bezierarc_coord   *bezier2);
