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

File: _undtogg.p

Description: Undelete a TOGGLE-BOX widget.

Input Parameters:  uRecId - RecID of object of interest.

Output Parameters: <None>

Author: Ravi-Chandar Ramalingam

Date Created: 24 February 1993

----------------------------------------------------------------------------*/
DEFINE INPUT PARAMETER uRecId AS RECID NO-UNDO.

{adeuib/uniwidg.i}
{adeuib/layout.i}
{adeuib/sharvars.i}

DEFINE BUFFER parent_U FOR _U.
DEFINE BUFFER parent_L FOR _L.
DEFINE BUFFER parent_C FOR _C.

FIND _U       WHERE RECID(_U)       eq uRecId.
FIND _L       WHERE RECID(_L)       eq _U._lo-recid.
FIND _F       WHERE RECID(_F)       eq _U._x-recid.
FIND parent_U WHERE RECID(parent_U) eq _U._parent-recid.
FIND parent_L WHERE RECID(parent_L) eq parent_U._lo-recid.
FIND parent_C WHERE RECID(parent_C) eq parent_U._x-recid.

ASSIGN _F._FRAME    = parent_U._HANDLE
       _L._WIN-TYPE = parent_L._WIN-TYPE.
IF NOT _L._WIN-TYPE THEN _L._HEIGHT = 1.

CREATE VALUE(IF _L._WIN-TYPE THEN "TOGGLE-BOX" ELSE "TEXT") _U._HANDLE
    ASSIGN
        {adeuib/std_attr.i}
    TRIGGERS:
        {adeuib/std_trig.i}
    END TRIGGERS.

/* Assign Handles that we now know */
ASSIGN  {adeuib/std_uf.i &section = "HANDLES"} .

/* Set Widget Size and LABEL.  WIDTH and HEIGHT could be unknown, in which case
   we don't reset the default size returned by the system. */
IF _L._WIDTH ne ?  THEN _U._HANDLE:WIDTH  = _L._WIDTH * _L._COL-MULT.
IF _L._HEIGHT ne ? THEN _U._HANDLE:HEIGHT = _L._HEIGHT * _L._ROW-MULT.
IF _L._WIN-TYPE THEN DO: /* GUI Mode */
  ASSIGN _U._HANDLE:LABEL       = _U._LABEL
         _U._HANDLE:AUTO-RESIZE = FALSE.
END.
ELSE DO:  /* TTY Mode Emulation - Simulate the label. */
  RUN adeuib/_sim_lbl.p (_U._HANDLE).
END.

/* Place object within frame boundary. */
{adeuib/onframe.i
   &_whFrameHandle = "_F._FRAME"
   &_whObjHandle   = "_U._HANDLE"
   &_lvHidden      = _L._REMOVE-FROM-LAYOUT}

/* Make sure the Universal Widget Record is "correct" by reading the actually
   instantiated values. */
ASSIGN  {adeuib/std_uf.i &section = "GEOMETRY"} .

{ adeuib/rstrtrg.i } /* Restore triggers */
IF _U._HANDLE:TYPE = "TOGGLE-BOX" THEN 
  _U._HANDLE:CHECKED = IF CAN-DO("YES,TRUE",_F._INITIAL-DATA) THEN YES ELSE NO.
