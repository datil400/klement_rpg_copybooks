     /*-                                                                            +
      * Copyright (c) 2004-2008 Scott C. Klement                                    +
      * All rights reserved.                                                        +
      *                                                                             +
      * Redistribution and use in source and binary forms, with or without          +
      * modification, are permitted provided that the following conditions          +
      * are met:                                                                    +
      * 1. Redistributions of source code must retain the above copyright           +
      *    notice, this list of conditions and the following disclaimer.            +
      * 2. Redistributions in binary form must reproduce the above copyright        +
      *    notice, this list of conditions and the following disclaimer in the      +
      *    documentation and/or other materials provided with the distribution.     +
      *                                                                             +
      * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND      +
      * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE       +
      * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE  +
      * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE     +
      * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL  +
      * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS     +
      * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)       +
      * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT  +
      * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY   +
      * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF      +
      * SUCH DAMAGE.                                                                +
      *                                                                             +
      */                                                                            +
      * Data structures and related definitions for NLS-Enabled APIs.
      *                                                 SCK 5/5/2004
      *
      /if defined(QLG_H)
      /eof
      /endif

      /define QLG_H

      ********************************************************************
      * Structure for CCSID based request
      *
      *   typedef struct Qlg_CCSID_ReqCtlBlk {
      *       int Type_of_Request;
      *       int CCSID_of_Input_Data;
      *       int Case_Request;
      *       char Reserved[10];
      *   } Qlg_CCSID_ReqCtlBlk_T;
      ********************************************************************
     D Qlg_CCSID_ReqCtlBlk_T...
     D                 ds                  based(StructureTemplate)
     D                                     align
     D                                     qualified
     D   Type_of_Request...
     D                               10I 0
     D   CCSID_of_Input_data...
     D                               10I 0
     D   Case_Request...
     D                               10I 0
     D   Reserved...
     D                               10A



      ********************************************************************
      * Structures for request using table (*TBL)
      *
      *   typedef struct Qlg_Qual_Tbl_Name {
      *       char Tbl_Name[10];
      *       char Lib[10];
      *   } Qlg_Qual_Tbl_Name_T;
      *
      *   typedef struct Qlg_Table_ReqCtlBlk {
      *       int Type_of_Request;
      *       int DBCS_Indicator;
      *       Qlg_Qual_Tbl_Name_T Qual_Tbl_Name;
      *   } Qlg_Table_ReqCtlBlk_T;
      ********************************************************************
     D Qlg_Qual_Tbl_Name_T...
     D                 ds                  based(StructureTemplate)
     D                                     align
     D                                     qualified
     D   Tbl_Name                    10A
     D   Lib                         10A


     D Qlg_Table_ReqCtlBlk_T...
     D                 ds                  based(StructureTemplate)
     D                                     align
     D                                     qualified
     D   Type_of_Request...
     D                               10I 0
     D   DBCS_Indicator...
     D                               10I 0
     D   Qual_Tbl_Name...
     D                                     likeds(Qlg_Qual_Tbl_Name_t)


      ********************************************************************
      * Structure for request using user-defined conversion map
      *
      *   typedef struct UsrDef_ReqCtlBlk {
      *       int Type_of_Request;
      *       int DBCS_Indicator;
      *       int Reserved;
      *       int Length;
      *   /*  char CvtMap[];                         Variable length field    */
      *   } Qlg_UsrDef_ReqCtlBlk_T;
      ********************************************************************
     D Qlg_UsrDef_ReqCtlBlk_T...
     D                 ds                  based(StructureTemplate)
     D                                     align
     D                                     qualified
     D   Type_of_Request...
     D                               10I 0
     D   DBCS_Indicator...
     D                               10I 0
     D   Reserved...
     D                               10I 0
     D   Length...
     D                               10I 0
     D   CvtMap...
     D                              256A


      ********************************************************************
      * Structure for NLS-enabled path name
      *
      *   typedef struct Qlg_Path_Name {
      *       int  CCSID;
      *       char Country_ID[2];              /* Country or region ID  */
      *       char Language_ID[3];
      *       char Reserved[3];
      *       unsigned int Path_Type;
      *       int  Path_Length;
      *       char Path_Name_Delimiter[2];
      *       char Reserved2[10];
      *     /*char Path_Name[];*/              /*   Variable length field    */
      *   } Qlg_Path_Name_T;
      ********************************************************************
     D Qlg_Path_Name_T...
     D                 ds                  based(StructureTemplate)
     D                                     align
     D                                     qualified
     D   CCSID                       10I 0
     D   Country_ID                   2A
     D   Language_ID                  3A
     D   Reserved                     3A
     D   Path_Type                   10U 0
     D   Path_Length                 10I 0
     D   Path_Name_Delimiter...
     D                                2A
     D   Reserved2                   10A
     D   Path_Name                 1024A
     D   p_Path_Name                   *   overlay(Path_Name)


      ********************************************************************
      *  Constants for the Path_Type parameter to QLg_Path_Name_T
      ********************************************************************
     D QLG_CHAR_SINGLE...
     D                 c                   0
     D QLG_PTR_SINGLE...
     D                 c                   1
     D QLG_CHAR_DOUBLE...
     D                 c                   2
     D QLG_PTR_DOUBLE...
     D                 c                   3
