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

#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>
#include <Array.au3>
 
Opt("GUIOnEventMode", 1)
 
Local $hGUI, $hGraphic, $aPoints[42][2], $aPointsY[41]
 
$hGUI = GUICreate("GDI+", 400, 300)
GUISetOnEvent($GUI_EVENT_CLOSE, "close")
$StatLabel = GUICtrlCreateLabel("", 40, 30, 320, 240)
GUICtrlSetBkColor($StatLabel, 0xCCE8CF)
GUISetState()
 
_GDIPlus_Startup()
$hGraphic = _GDIPlus_GraphicsCreateFromHWND(ControlGetHandle($hGUI, "", $StatLabel))
 
$aPoints[0][0] = 41
For $y = 1 To 41
        $aPointsY[$y - 1] = Random(20, 220)
Next
 
Func DefinePoint()
        For $i = 1 To 41
                $aPoints[$i][0] = 8 * ($i - 1)
                $aPoints[$i][1] = $aPointsY[$i - 1]
        Next
EndFunc   ;==>DefinePoint
 
;_AntiAlias($hGraphic, 4)
 
While 1
        DefinePoint()
        _GDIPlus_GraphicsDrawCurve($hGraphic, $aPoints)
        Sleep(1000)
        _GDIPlus_GraphicsClear($hGraphic, 0xFFCCE8CF)
        Dim $reYPoints = Random(20, 220)
        _ArrayPush($aPointsY, $reYPoints)
WEnd
 
Func close()
        _GDIPlus_GraphicsDispose($hGraphic)
        _GDIPlus_Shutdown()
        Exit
EndFunc   ;==>close
 
Func _AntiAlias($hGraphics, $mode)
        Local $aResult
        $aResult = DllCall($ghGDIPDll, "int", "GdipSetSmoothingMode", "hwnd", $hGraphics, "int", $mode)
        If @error Then Return SetError(@error, @extended, False)
        Return SetError($aResult[0], 0, $aResult[0] = 0)
EndFunc   ;==>_AntiAlias
