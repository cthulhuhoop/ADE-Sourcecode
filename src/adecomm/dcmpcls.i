/*************************************************************/
/* Copyright (c) 1984-2005,2015 by Progress Software Corporation  */
/*                                                           */
/* All rights reserved.  No part of this program or document */
/* may be  reproduced in  any form  or by  any means without */
/* permission in writing from PROGRESS Software Corporation. */
/*************************************************************/

/**************************************************************************
    Procedure:  dcmpcls.i
    
    Purpose:    Preprocessor Defines for handling compilation of .cls files

    Syntax :    { adecomm/dcmpcls.i }

    Parameters:
    
    Description:
        Defines some constants for use when determining the outcome of 
        a compile relating to .cls files, and whether the compiled code
        contained OO4GL syntax or not.

        There are 3 errors we are interested in re: OO4GL:
        - 12622, 12623 and 17950
          - these define whether a file without a .cls extension 
            contained OO4GL code (CLASS, INTERFACE and ENUM, respectively).
        - 12629, 12855 and 17951
          - these indicate that a file with a .cls extension contained
            a different package than the pathname of the file
            (CLASS, INTERFACE and ENUM, respectively).
      
        Depending on the circumstances, we might need to check for the 
        error number as an integer or as a string. These preprocessors
        define both.

        For more information, refer to the SAVE_AND_COMPILE_BLOCK 
        comment in adeedit/pcompile.i and adecomm/_pwrun.p

    Notes  :
    Authors: 
    Date   : May 2005
**************************************************************************/


/* .cls-related error message pre-processors */

&GLOBAL-DEFINE IS_CLASS_ERROR "(12622)":U
&GLOBAL-DEFINE IS_INTERFACE_ERROR "(12623)":U
&GLOBAL-DEFINE IS_ENUM_ERROR "(17950)":U
&GLOBAL-DEFINE WRONG_CLASS_TYPE_ERROR "(12629)":U
&GLOBAL-DEFINE WRONG_INTERFACE_TYPE_ERROR "(12855)":U
&GLOBAL-DEFINE WRONG_ENUM_TYPE_ERROR "(17951)":U

&GLOBAL-DEFINE IS_CLASS_ERROR_NUM 12622
&GLOBAL-DEFINE IS_INTERFACE_ERROR_NUM 12623
&GLOBAL-DEFINE IS_ENUM_ERROR_NUM 17950
&GLOBAL-DEFINE WRONG_CLASS_TYPE_ERROR_NUM 12629
&GLOBAL-DEFINE WRONG_INTERFACE_TYPE_ERROR_NUM 12855
&GLOBAL-DEFINE WRONG_ENUM_TYPE_ERROR_NUM 17951

/* FORWARD declaration of functions */
FUNCTION IsValidClassChange RETURN LOGICAL (
    INPUT cFileName AS CHAR,
    INPUT cCurrentClassType AS CHAR,
    INPUT cCompileClassType AS CHAR) FORWARD.
