/*********************************************************************
* Copyright (C) 2000 by Progress Software Corporation. All rights    *
* reserved. Prior versions of this work may contain portions         *
* contributed by participants of Possenet.                           *
*                                                                    *
*********************************************************************/

FUNCTION assignFocusedWidget RETURNS LOGICAL
  ( INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION assignWidgetValue RETURNS LOGICAL
  ( INPUT pcName  AS CHARACTER,
    INPUT pcValue AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION assignWidgetValueList RETURNS LOGICAL
  ( INPUT pcNameList  AS CHARACTER,
    INPUT pcValueList AS CHARACTER,
    INPUT pcDelimiter AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION blankWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )  
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION clearWidget RETURNS LOGICAL
    ( INPUT pcNameList AS CHARACTER )
    &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
    &ELSE IN SUPER.
    &ENDIF

FUNCTION disableRadioButton RETURNS LOGICAL
  ( INPUT pcNameList  AS CHARACTER,
    INPUT piButtonNum AS INTEGER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION disableWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION enableRadioButton RETURNS LOGICAL
  ( INPUT pcNameList  AS CHARACTER,
    INPUT piButtonNum AS INTEGER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION enableWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION formattedWidgetValue RETURNS CHARACTER
  ( INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION formattedWidgetValueList RETURNS CHARACTER
  ( INPUT pcNameList  AS CHARACTER,
    INPUT pcDelimiter AS CHARACTER) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION hideWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION highlightWidget RETURNS LOGICAL
  ( INPUT pcNameList      AS CHARACTER, 
    INPUT pcHighlightType AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION resetWidgetValue RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION toggleWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION viewWidget RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER )
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetHandle RETURNS HANDLE
  ( INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetLongcharValue RETURNS LONGCHAR
  (INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetIsBlank RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetIsFocused RETURNS LOGICAL
  ( INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetIsModified RETURNS LOGICAL
  ( INPUT pcNameList AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetIsTrue RETURNS LOGICAL
  ( INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetValue RETURNS CHARACTER
  (INPUT pcName AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF

FUNCTION widgetValueList RETURNS CHARACTER
  (INPUT pcNameList  AS CHARACTER,
   INPUT pcDelimiter AS CHARACTER ) 
  &IF DEFINED(CustomSuper) &THEN IN TARGET-PROCEDURE.
  &ELSE IN SUPER.
  &ENDIF
