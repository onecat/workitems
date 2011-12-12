#Region ACN预处理程序参数(常用参数)
#PRE_Icon= 										;图标,支持EXE,DLL,ICO
#PRE_OutFile=									;输出文件名
#PRE_OutFile_Type=exe							;文件类型
#PRE_Compression=4								;压缩等级
#PRE_UseUpx=y 									;使用压缩
#PRE_Res_Comment= 								;程序注释
#PRE_Res_Description=							;详细信息
#PRE_Res_Fileversion=							;文件版本
#PRE_Res_FileVersion_AutoIncrement=p			;自动更新版本
#PRE_Res_LegalCopyright= 						;版权
#PRE_Change2CUI=N                   			;修改输出的程序为CUI(控制台程序)
;#PRE_Res_Field=AutoIt Version|%AutoItVer%		;自定义资源段
;#PRE_Run_Tidy=                   				;脚本整理
;#PRE_Run_Obfuscator=      						;代码迷惑
;#PRE_Run_AU3Check= 							;语法检查
;#PRE_Run_Before= 								;运行前
;#PRE_Run_After=								;运行后
;#PRE_UseX64=n									;使用64位解释器
;#PRE_Compile_Both								;进行双平台编译
#EndRegion ACN预处理程序参数设置完成
#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

 Au3 版本: 
 脚本作者: 
 电子邮件: 
	QQ/TM: 
 脚本版本: 
 脚本功能: 

#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿

;注释掉的是自定义的菜单，自己写了一个，结果发现英文论坛里有类似的，就把英文论坛里的源码贴上来。

#include <GUIConstants.au3>
#include<WindowsConstants.au3>

$oMyError = ObjEvent("AutoIt.Error","MyErrFunc")

$FileName=@ScriptDir & "\Worksheet.xls"

if not FileExists($FileName) then
  Msgbox (0,"Excel File Test","Can't run this test, because it requires an Excel file in "& $FileName)
  Exit
endif

$oExcelDoc = ObjGet($FileName) 

if IsObj($oExcelDoc) then

    GUICreate ( "Embedded ActiveX Test", 640, 580, (@DesktopWidth-640)/2, (@DesktopHeight-580)/2 , $WS_OVERLAPPEDWINDOW + $WS_VISIBLE + $WS_CLIPCHILDREN ) 

    $GUI_FileMenu   = GUICtrlCreateMenu     ("&File")
   $GUI_FileNew    = GUICtrlCreateMenuitem ("&New"         ,$GUI_FileMenu)
    $GUI_FileSave   = GUICtrlCreateMenuitem ("&Save"        ,$GUI_FileMenu)
    $GUI_FileSaveAs = GUICtrlCreateMenuitem ("Save As..."   ,$GUI_FileMenu)
    $GUI_FileSepa   = GUICtrlCreateMenuitem (""             ,$GUI_FileMenu)    ; create a separator line
    $GUI_FileExit   = GUICtrlCreateMenuitem ("E&xit"        ,$GUI_FileMenu)
    $GUI_ActiveX    = GUICtrlCreateObj      ( $oExcelDoc,   0, 0 , 600 , 500 )
    
    GUICtrlCreateLabel('',0,0,640,110)
        GUICtrlSetState ( -1 ,$GUI_ONTOP )
    GUISetState ()     
    
    While 1
        $msg = GUIGetMsg()
        Select
            Case $msg = $GUI_EVENT_CLOSE or $msg = $GUI_FileExit
               ExitLoop
            Case $msg = $GUI_FileSave
                $oExcelDoc.Save         ; Save the workbook
            Case $msg = $GUI_FileSaveAs
                $NewFileName=FileSaveDialog("Save Worksheet as",@scriptdir,"Excel Files (*.xls)")
                if not @error and $NewFileName <> "" Then
                    $oExcelDoc.SaveAs($NewFileName)     ; Save the workbook under a different name
                EndIf
                
        EndSelect
    Wend

    GUIDelete ()


    $oExcelDoc.Close       
    
EndIf


Exit


Func MyErrFunc()

  $HexNumber=hex($oMyError.number,8)

  Msgbox(0,"AutoItCOM Test","We intercepted a COM Error !"       & @CRLF  & @CRLF & _
             "err.description is: "    & @TAB & $oMyError.description    & @CRLF & _
             "err.windescription:"     & @TAB & $oMyError.windescription & @CRLF & _
             "err.number is: "         & @TAB & $HexNumber              & @CRLF & _
             "err.lastdllerror is: "   & @TAB & $oMyError.lastdllerror   & @CRLF & _
             "err.scriptline is: "     & @TAB & $oMyError.scriptline     & @CRLF & _
             "err.source is: "         & @TAB & $oMyError.source         & @CRLF & _
             "err.helpfile is: "       & @TAB & $oMyError.helpfile       & @CRLF & _
             "err.helpcontext is: "    & @TAB & $oMyError.helpcontext _
            )

  SetError(1)  ; to check for after this function returns
Endfunc