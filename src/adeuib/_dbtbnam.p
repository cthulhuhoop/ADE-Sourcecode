&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r2
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure 
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
/*--------------------------------------------------------------------------
    File        : adeuib/_dbtbnam.p
    Purpose     : Converts a db.tbl string to either "tbl" or "db.tbl" depending
                  on the settings for the TEMP-TABLES database and _suppress_dbname.

    Syntax      : RUN adeuib/_dbtbnam.p 
                       (INPUT p_id,       /* INTEGER context id of the procedure. */
                        INPUT p_nam-in,   /* CHAR the name to convert. */
                        OUTPUT p_nam-out) /* CHAR -- the "correct" name. */

    Author(s)   : Wm.T.Wood
    Created     : May 1996
    
    Notes       : In v8, the ID of the procedure is ignored here.
    
  ------------------------------------------------------------------------*/
/*          This .W file was created with the Progress UIB.             */
/*----------------------------------------------------------------------*/

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Procedure
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: CODE-ONLY COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Procedure ASSIGN
         HEIGHT             = 2
         WIDTH              = 40.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Definitions  ************************** */
DEFINE INPUT  PARAMETER p_id       AS INTEGER NO-UNDO.
DEFINE INPUT  PARAMETER p_nam-in   AS CHAR NO-UNDO.
DEFINE OUTPUT PARAMETER p_nam-out  AS CHAR NO-UNDO.

{ adeuib/sharvars.i }  /* Standard shared variables. */

/* FUNCTION PROTOTYPE */
FUNCTION db-tbl-name RETURNS CHARACTER
  (INPUT db-tbl AS CHARACTER) IN _h_func_lib.

/* ***************************  Main Block  *************************** */
/* Check degenerate case. */
p_nam-out = p_nam-in.
IF NUM-ENTRIES(p_nam-in,".":U) eq 2 THEN 
  p_nam-out = db-tbl-name(p_nam-in).

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

