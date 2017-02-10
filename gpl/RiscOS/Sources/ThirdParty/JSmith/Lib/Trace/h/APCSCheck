/* 
 * Copyright Julian Smith.
 * 
 * This file is part of Trace.
 * 
 * Trace is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation, either version 3 of the License, or (at your
 * option) any later version.
 * 
 * Trace is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with Trace.  If not, see <http://www.gnu.org/licenses/>.
 */
#ifndef __Trace_APCSCheck_h
#define __Trace_APCSCheck_h




#ifdef Trace_TRACE
	
	void	Trace_APCSCheck_Init( void);
/*
Calls Trace_SetHandlers with Trace_APCSCheck_Start and
Trace_APCSCheck_Stop. These check that intercepted functions obey APCS.

If registers required by APCS to be preserved (r4-r11, r13, processor
flags in pc) are corrupted, a diagnostic to that effect will be output
to stderr.

Note that only functions intercepted by Trace_InterceptAllFunctions()
and/or Trace_InterceptFunction() will be checked, and that the standard
tracing of function entry/exit provided by Trace_StartHandler and
Trace_StopHandler will not function while APCS checking is turned on.

Thus to check APCS compliance of all functions, do:

Trace_APCSCheck_Init();
Trace_InterceptAllFunctions();
 */


	void	Trace_APCSCheck_SetAutoCorrect( int yesno);
/*
If yesno=1, Trace_APCS will correct register values on return if they
are found to be corrupted, after outputing the diagnostic.

if yesno=0, corrupted register values will be left.

The default behaviour is as if Trace_APCSCheck_SetAutoCorrect( 0) has
been called.
 */


	void	Trace_APCSCheck_Start( const char* fnname);
/*
Don't call directly.
 */


	void	Trace_APCSCheck_Stop( const char* fnname);
/*
Don't call directly.
 */



#else
	
	#define	Trace_APCSCheck_Init()
	#define	Trace_APCSCheck_SetAutoCorrect( yesno)
	#define	Trace_APCSCheck_Start( fnname)
	#define	Trace_APCSCheck_Stop( fnname)
	
#endif


#endif
