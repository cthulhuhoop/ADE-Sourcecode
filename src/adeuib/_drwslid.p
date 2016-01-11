/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation ("PSC"),       *
* 14 Oak Park, Bedford, MA 01730, and other contributors as listed   *
* below.  All Rights Reserved.                                       *
*                                                                    *
* The Initial Developer of the Original Code is PSC.  The Original   *
* Code is Progress IDE code released to open source December 1, 2000.*
*                                                                    *
* The contents of this file are subject to the Possenet Public       *
* License Version 1.0 (the "License"); you may not use this file     *
* except in compliance with the License.  A copy of the License is   *
* available as of the date of this notice at                         *
* http://www.possenet.org/license.html                               *
*                                                                    *
* Software distributed under the License is distributed on an "AS IS"*
* basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. You*
* should refer to the License for the specific language governing    *
* rights and limitations under the License.                          *
*                                                                    *
* Contributors:                                                      *
*                                                                    *
*********************************************************************/
/*----------------------------------------------------------------------------

File: drawslid.p

Description:
    Draw a slider widget in the current h_frame.

Input Parameters:
   <None>

Output Parameters:
   <None>

Author: D. Ross Hunter,  Wm.T.Wood

Date Created: 1992 

----------------------------------------------------------------------------*/

{adeuib/uniwidg.i}
{adeuib/layout.i}
{adeuib/sharvars.i}

&Scoped-define min-height-chars 1
&Scoped-define min-cols 1

DEFINE VAR min_height   AS DECIMAL                                   NO-UNDO.
DEFINE VAR min_width    AS DECIMAL                                   NO-UNDO.
DEFINE VAR cur-lo       AS CHARACTER                                 NO-UNDO.

DEFINE BUFFER parent_U FOR _U.
DEFINE BUFFER parent_L FOR _L.

FIND _U WHERE _U._HANDLE = _h_win.
cur-lo = _U._LAYOUT-NAME.

/* Setup parameters */
&Scoped-define min_value 0
&Scoped-define max_value 100

/* Get the RECID of the parent frame */
FIND parent_U WHERE parent_U._HANDLE = _h_frame.
FIND parent_L WHERE RECID(parent_L)  = parent_U._lo-recid.

/* Create a Universal Widget Record and populate it as much as possible. */
CREATE _U.
CREATE _L.
CREATE _F.

ASSIGN /* TYPE-specific settings */
       _count[{&SLIDR}] = _count[{&SLIDR}] + 1
       _U._NAME          = "SLIDER-" + STRING(_count[{&SLIDR}])
       _U._TYPE          = "SLIDER":U
       _F._DATA-TYPE     = "Integer":U
       _L._NO-LABELS     = TRUE  /* Labels not supported on multi-line widgets */
       _F._HORIZONTAL    = (_second_corner_x - _frmx) >
                           (_second_corner_y - _frmy)  /* Wider than tall? */  
       _F._MAX-VALUE     = {&max_value}
       _F._MIN-VALUE     = {&min_value}
       _F._INITIAL-DATA  = "0":U
       /* Standard Settings for Universal and Field records */
       { adeuib/std_uf.i &SECTION = "DRAW-SETUP" }
       .

/* If the user just clicked, then use default sizes.  Otherwise use the
   size drawn by the user.  NOTE: the Custom Section may override this. */
/* Base the minimum size on the orientation of the slider and the window type */
IF _F._HORIZONTAL
THEN ASSIGN min_height = 2
            min_width  = 15.
ELSE ASSIGN min_height = 3 
            min_width = (IF _L._WIN-TYPE THEN 7 ELSE 9).
IF (_second_corner_x eq _frmx) AND (_second_corner_y eq _frmy)
THEN ASSIGN _L._WIDTH  = min_width
            _L._HEIGHT = min_height.
ELSE ASSIGN _L._WIDTH  = MAX(min_width, (_second_corner_x - _frmx + 1)
                                  / SESSION:PIXELS-PER-COLUMN / _cur_col_mult)
            _L._HEIGHT = MAX(min_height, (_second_corner_y - _frmy + 1)
                                  / SESSION:PIXELS-PER-ROW / _cur_row_mult).
       
/* Are there any custom widget overrides?                               */
IF _custom_draw ne ? THEN RUN adeuib/_usecust.p (_custom_draw, RECID(_U)).
 
/* Create the widget based on the contents of the Universal Widget record */
RUN adeuib/_undslid.p (RECID(_U)).

/* FOR EACH layout other than the current layout, populate _L records for them */
{adeuib/multi_l.i &from-slider = YES}
                    