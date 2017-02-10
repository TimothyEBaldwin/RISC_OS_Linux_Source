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
/* > h.CurveFit
 */

#include <math.h>

typedef struct pointstr { int x,y; } pointstr;
typedef struct bezierstr { pointstr p0, p1, p2, p3; double error; } bezierstr;

#define MAXPOINTS 800
#define SMALL 0.00000000001
#define SMALLP (512.0 * 3)
#define UNKNOWN 0x80000000

#define returnerr(string) { static os_error e = { 1, string }; return(&e); }

os_error * curvefit(bezierstr *result, pointstr *data, double *ti, int n);
os_error *solve_tangent3(pointstr *data,double *ti,int n,
                         int x0,int y0,int x3,int y3,
                         int dx0,int dy0,int dx3,int dy3,
                         double *cx,double *cy);
os_error *solve_tangent0(pointstr *data,double *ti,int n,
                         int x0,int y0,int x3,int y3,
                         int dx0,int dy0,int dx3,int dy3,
                         double *cx,double *cy);
os_error *solve_tangent03(pointstr *data,double *ti,int n,
                          int x0,int y0,int x3,int y3,
                          int dx0,int dy0,int dx3,int dy3,
                          double *cx,double *cy);
os_error *solve_notangents(pointstr *data,double *ti,int n,
                           int x0,int y0,int x3,int y3,
                           int dx0,int dy0,int dx3,int dy3,
                           double *cx,double *cy);
os_error *solve_noendpoints(pointstr *data,double *ti,int n,
                            int x0,int y0,int x3,int y3,
                            int dx0,int dy0,int dx3,int dy3,
                            double *cx,double *cy);
os_error *plot_bezier(bezierstr *curve);
os_error *plot_cross(pointstr p);
