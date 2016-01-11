&ANALYZE-SUSPEND _VERSION-NUMBER AB_v9r12
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
    File        : design.p
    Purpose     : Super procedure for design class.

    Syntax      : RUN start-super-proc("adm2/design.p":U).

    Modified    : 09/07/1999
  ------------------------------------------------------------------------*/
/*          This .W file was created with the Progress UIB.             */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


&SCOP ADMSuper design.p

  /* Custom exclude file */

  {src/adm2/custom/designexclcustom.i}
  
  DEFINE VARIABLE glDesignTimeHideMenu AS LOG NO-UNDO. 
  
/* Used in getFuncLibHandle */
  DEFINE VARIABLE xcUIBfuncLib AS CHARACTER NO-UNDO INIT "adeuib/_abfuncs.w":U.
  DEFINE VARIABLE ghUIBfuncLib AS HANDLE    NO-UNDO.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


/* ************************  Function Prototypes ********************** */

&IF DEFINED(EXCLUDE-getDataObjectHandle) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getDataObjectHandle Procedure 
FUNCTION getDataObjectHandle RETURNS HANDLE
  (  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getDataSource) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getDataSource Procedure 
FUNCTION getDataSource RETURNS HANDLE
  ( )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getDesignTimeHideMenu) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getDesignTimeHideMenu Procedure 
FUNCTION getDesignTimeHideMenu RETURNS LOGICAL
  (  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getFilterTarget) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getFilterTarget Procedure 
FUNCTION getFilterTarget RETURNS CHARACTER
  ( )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getFuncLibHandle) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD getFuncLibHandle Procedure 
FUNCTION getFuncLibHandle RETURNS HANDLE PRIVATE
  (  )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-linkHandles) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD linkHandles Procedure 
FUNCTION linkHandles RETURNS CHAR
  (pcLink AS CHAR)  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-setDesignTimeHideMenu) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION-FORWARD setDesignTimeHideMenu Procedure 
FUNCTION setDesignTimeHideMenu RETURNS LOGICAL
  ( plLog AS LOG )  FORWARD.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF


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
         HEIGHT             = 15
         WIDTH              = 60.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB Procedure 
/* ************************* Included-Libraries *********************** */

{src/adm2/desiprop.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Main Block  *************************** */

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&IF DEFINED(EXCLUDE-destroyObject) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE destroyObject Procedure 
PROCEDURE destroyObject :
/*------------------------------------------------------------------------------
  Purpose: Destroy all design-time SDO's    
    Notes:  
------------------------------------------------------------------------------*/      
  DEFINE VARIABLE cUIBMode AS CHAR NO-UNDO.  
  
  {get UIBMode cUIBMode}.
  
  IF cUIBMode = "DESIGN":U THEN
    DYNAMIC-FUNC("shutdown-sdo":U IN getFuncLibHandle(), TARGET-PROCEDURE).
  
  RUN SUPER.  

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

/* ************************  Function Implementations ***************** */

&IF DEFINED(EXCLUDE-getDataObjectHandle) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getDataObjectHandle Procedure 
FUNCTION getDataObjectHandle RETURNS HANDLE
  (  ) :
/*------------------------------------------------------------------------------
  Purpose: Returns the handle of the design-time DataObject   
    Notes: If the SDO is not running it gets started  
------------------------------------------------------------------------------*/  
  DEFINE VARIABLE cDesignDataObject AS CHAR NO-UNDO.
  DEFINE VARIABLE cUIBMode          AS CHAR NO-UNDO.

  /* if not design get outa here */
  {get UIBMode cUIBMode}.
  IF cUIBMode <> "DESIGN":U THEN 
    RETURN ?.

  /* Find the design-time sdo name */
  {get DesignDataObject cDesignDataObject}.  
  
  IF cDesignDataObject = "":U THEN
    RETURN ?.
    
  RETURN DYNAMIC-FUNC("get-sdo-hdl":U IN getFuncLibHandle(),
                       cDesignDataObject, 
                       TARGET-PROCEDURE).

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getDataSource) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getDataSource Procedure 
FUNCTION getDataSource RETURNS HANDLE
  ( ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE hSource AS HANDLE NO-UNDO.
  DEFINE VARIABLE cSource AS CHAR   NO-UNDO.

  cSource = {fnarg linkHandles 'Data-Source':U}.
  hSource = WIDGET-HANDLE(cSource).
 
  IF NOT VALID-HANDLE(hSource) THEN
    {get DataObjectHandle hSource}.

  RETURN hSource.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getDesignTimeHideMenu) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getDesignTimeHideMenu Procedure 
FUNCTION getDesignTimeHideMenu RETURNS LOGICAL
  (  ) :
/*------------------------------------------------------------------------------
  Purpose: This flag is set right before initializeobject for a toolbar
           if this menu is on the startpage   
    Notes: The AppBuilder's start up process first views and then hides hidden 
           objects, so the view of hidden pages will add any menu to the window 
           and hide will delete it. No menu will survive this.. 
           So this flag is toggled on from the Appbuilder to tell the toolbar 
           if it can 'view' the menu. The toolbar only 'hides' its own menu, 
           so no problem occurs.  
------------------------------------------------------------------------------*/
   RETURN glDesignTimeHideMenu.
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getFilterTarget) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getFilterTarget Procedure 
FUNCTION getFilterTarget RETURNS CHARACTER
  ( ) :
/*------------------------------------------------------------------------------
  Purpose:  
    Notes:  
------------------------------------------------------------------------------*/
  DEFINE VARIABLE hTarget AS HANDLE NO-UNDO.
  DEFINE VARIABLE cTarget AS CHAR   NO-UNDO.
  
  cTarget = {fnarg linkHandles 'Filter-Target':U}.
  
  IF cTarget = "":U THEN
  DO:
    {get DataObjectHandle hTarget}.
    cTarget = STRING(hTarget).
  END.

  RETURN cTarget.
END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-getFuncLibHandle) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION getFuncLibHandle Procedure 
FUNCTION getFuncLibHandle RETURNS HANDLE PRIVATE
  (  ) :
/*------------------------------------------------------------------------------
  Purpose: Returns the handle of the AppBuilder function library 
    Notes: PRIVATE 
           Used in getUIBDataObjectHandle and UIBDestroyDataObject. 
           Uses a variable defined in smart definition section 
------------------------------------------------------------------------------*/
  IF NOT VALID-HANDLE(ghUIBFuncLib) THEN 
  DO:
    ghUIBFuncLib = SESSION:FIRST-PROCEDURE.
    DO WHILE VALID-HANDLE(ghUIBFuncLib):
      IF ghUIBFuncLib:FILE-NAME = xcUIBFuncLib THEN 
         LEAVE.
      ghUIBFuncLib = ghUIBFuncLib:NEXT-SIBLING.
    END.
  END.
  RETURN ghUIBFuncLib.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-linkHandles) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION linkHandles Procedure 
FUNCTION linkHandles RETURNS CHAR
  (pcLink AS CHAR) :
/*------------------------------------------------------------------------------
   Purpose: Return a comma separated list of linked objects at design time
Parameters: pcLink - Link name ie,. DATA-SOURCE ..   
     Notes: 
------------------------------------------------------------------------------*/
  DEFINE VARIABLE cUIBMode  AS CHAR NO-UNDO.  
  DEFINE VARIABLE cObjectId AS CHAR NO-UNDO.  
  DEFINE VARIABLE cHandle   AS CHAR NO-UNDO.  
  DEFINE VARIABLE cLinkList AS CHAR NO-UNDO.  
  DEFINE VARIABLE cType     AS CHAR NO-UNDO.  
  DEFINE VARIABLE iSO       AS INT  NO-UNDO.  
  DEFINE VARIABLE iId      AS INT  NO-UNDO.  

  {get UIBMode cUIBMode}.

  IF cUIBMode = "DESIGN":U THEN
  DO:
    RUN adeuib/_uibinfo (?, 
                        "HANDLE ":U + STRING(TARGET-PROCEDURE), 
                        "LINK ":U + pcLink, 
                        OUTPUT cObjectid). /* Context ID */
    
    DO iSO = 1 TO NUM-ENTRIES(cObjectId):
      iId = INT(ENTRY(iSO,cObjectId)).
      
      /* We don't want to retun links to THIS-PROCEDURE so we check TYPE */ 
      RUN adeuib/_uibinfo (iId, ?, "TYPE":U,OUTPUT cType).
      
      IF cType = "SmartObject":U THEN
      DO:   
        RUN adeuib/_uibinfo (iId, ?, "PROCEDURE-HANDLE":U,OUTPUT cHandle).
        cLinkList = cLinkList
                    + (IF cLinkList = "":U THEN "":U ELSE ",":U) 
                    + cHandle.    
      END. /* cType = SmartObject */
    END. /* do iSO = 1 to */ 
  END. /* DESIGN */

  RETURN cLinkList.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF

&IF DEFINED(EXCLUDE-setDesignTimeHideMenu) = 0 &THEN

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _FUNCTION setDesignTimeHideMenu Procedure 
FUNCTION setDesignTimeHideMenu RETURNS LOGICAL
  ( plLog AS LOG ) :
/*------------------------------------------------------------------------------
  Purpose: This flag is set right before initializeobject for a toolbar
           in this menu is on the startpage   
     Notes: The AppBuilder's start up process first views and then hides hidden 
            objects, so the view of hidden pages will add any menu to the window 
            and hide will delete it. No menu will survive this.. 
            So this flag is toggled on from the Appbuilder to tell the toolbar 
            if it can 'view' the menu. The toolbar only 'hides' its own menu, 
            so no problem occurs.  
---------------------------------------------------------------------------*/
  glDesignTimeHideMenu = plLog.

  RETURN TRUE.

END FUNCTION.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ENDIF
