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

#cs ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
        Au3 版本: 3.3.9.4
        脚本作者: CrossDoor
        电子邮件: [email]382869232@qq.com[/email]
        QQ/TM: 382869232
        脚本版本: 0.0.0.0
        脚本功能: 万年历
#ce ＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿脚本开始＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
 
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <StaticConstants.au3>
#Include <Date.au3>
#include <GuiEdit.au3>
 
;~ Global $aMonthName[12] = ["01月","02月","03月","04月","05月","06月","07月","08月","09月","10月","11月","12月"]
Global $aWeekName[7] = ["周日","周一","周二","周三","周四","周五","周六"]
Global $aDayName[42]
Global $hFocusText
$hForm = GUICreate("日历控件",600,400,-1,-1,$WS_POPUP)
 
GUISetBkColor(0x009944)
GUICtrlCreateLabel("○",30,12,50,50)
GUICtrlSetFont(-1, 42, 800)
GUICtrlSetColor(-1,0xFEFEFE)
GUICtrlSetBkColor(-1,-2)
GUICtrlCreateLabel("←",39,19,50,50)
GUICtrlSetFont(-1, 32, 800)
GUICtrlSetColor(-1,0xFEFEFE)
GUICtrlSetBkColor(-1,-2)
 
GUICtrlCreateLabel("日历",90,17,250,45)
GUICtrlSetFont(-1, 35, 800)
GUICtrlSetColor(-1,0xFEFEFE)
GUICtrlSetBkColor(-1,-2)
 
Global $hCalendarText = GUICtrlCreateLabel(GetDate(),70,75,380,25)
GUICtrlSetFont(-1, 19, 800)
GUICtrlSetColor(-1,0xFEFEFE)
GUICtrlSetBkColor(-1,-2)
 
Global $hPrevText = GUICtrlCreateLabel("<",95,120,15,20)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,-2)
GUICtrlSetCursor(-1, 0)
Global $hYearText = GUICtrlCreateInput(@YEAR,230,117,58,25)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,0x009944)
GUICtrlSetLimit(-1,4)
GUICtrlCreateLabel("年",288,120,20,25)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,-2)
Global $hMonthText = GUICtrlCreateInput(@MON,308,117,32,25)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,0x009944)
GUICtrlSetLimit(-1,2)
GUICtrlCreateLabel("月",340,120,20,25)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,-2)
Global $hNextText = GUICtrlCreateLabel(">",485,120,15,20)
GUICtrlSetFont(-1, 16, 800)
GUICtrlSetColor(-1,0xDFDFDF)
GUICtrlSetBkColor(-1,-2)
GUICtrlSetCursor(-1, 0)
 
For $i = 0 To 6
        GUICtrlCreateLabel($aWeekName[$i],90+$i*60,155,50,22,$SS_CENTER)
        GUICtrlSetFont(-1, 16, 800)
        GUICtrlSetColor(-1,0xFEFEFE)
        GUICtrlSetBkColor(-1,-2)
Next
 
Local $k=1
For $i = 1 To 6
        For $j =0 To 6
                $aDayName[$k-1] = GUICtrlCreateLabel("",90+$j*60,155+$i*30,50,22,$SS_CENTER)
                GUICtrlSetFont(-1, 16, 800)
                GUICtrlSetColor(-1,0xFEFEFE)
                GUICtrlSetBkColor(-1,-2)
                $k+=1
        Next
Next
SetCalendar(@YEAR, @MON)
GUICtrlSetState($aDayName[34],$GUI_FOCUS)
GUISetState()
GUIRegisterMsg($WM_NCHITTEST, "WM_NCHITTEST")
GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")
AdlibRegister("GetDate", 60000)
 
Do
Until GUIGetMsg() = -3
 
AdlibUnRegister("SetDate")
 
Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
    Local $iIDFrom, $iCode, $iYear, $iMonth
    $iIDFrom = BitAND($iwParam, 0x0000FFFF)
    $iCode = BitShift($iwParam, 16)
        Switch $iIDFrom
                Case $hYearText,$hMonthText
                        Switch $iCode
                                Case $EN_UPDATE
                                        $iYear = Int(GUICtrlRead($hYearText))
                                        $iMonth = Int(GUICtrlRead($hMonthText))
                                        If SetCalendar($iYear, $iMonth) Then
                                                If $iMonth < 10 Then GUICtrlSetData($hMonthText,"0"&$iMonth)
                                        EndIf
                                Case $EN_SETFOCUS
                                        $hFocusText = $iIDFrom
                                Case $EN_KILLFOCUS
                                        $hFocusText = ""
                        EndSwitch
                Case $hPrevText
                        $iYear = Int(GUICtrlRead($hYearText))
                        $iMonth = Int(GUICtrlRead($hMonthText))
                        If $hFocusText = $hYearText Then
                                $iYear-=1
                                GUICtrlSetData($hYearText,$iYear)
                                SetCalendar($iYear, $iMonth)
                        Else
                                $iMonth-=1
                                If $iMonth < 1 Then
                                        $iMonth = 12
                                        $iYear-=1
                                        GUICtrlSetData($hYearText,$iYear)
                                EndIf
                                GUICtrlSetData($hMonthText,$iMonth)
                                If SetCalendar($iYear, $iMonth) Then
                                        If $iMonth < 10 Then GUICtrlSetData($hMonthText,"0"&$iMonth)
                                EndIf
                        EndIf
                Case $hNextText 
                        $iYear = Int(GUICtrlRead($hYearText))
                        $iMonth = Int(GUICtrlRead($hMonthText))
                        If $hFocusText = $hYearText Then
                                $iYear+=1
                                GUICtrlSetData($hYearText,$iYear)
                                SetCalendar($iYear, $iMonth)
                        Else
                                $iMonth+=1
                                If $iMonth > 12 Then                                    
                                        $iMonth = 1
                                        $iYear+=1
                                        GUICtrlSetData($hYearText,$iYear)
                                EndIf
                                GUICtrlSetData($hMonthText,$iMonth)
                                If SetCalendar($iYear, $iMonth) Then
                                        If $iMonth < 10 Then GUICtrlSetData($hMonthText,"0"&$iMonth)
                                EndIf
                        EndIf                   
                Case $hCalendarText
                        SetCalendar(@YEAR, @MON)
                        GUICtrlSetData($hYearText,@YEAR)
                        GUICtrlSetData($hMonthText,@MON)
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_COMMAND
 
 
Func SetCalendar($iYear, $iMonth)
        If $iYear < 999 Or $iYear > 9998 Or $iMonth < 1 And $iMonth > 12 Then Return False                                              
        Local $k=1, $l = 0, $iWeekday = _DateToDayOfWeek($iYear, $iMonth, 1)
        Local $iDays = _DateDaysInMonth($iYear, $iMonth)
        For $i = 1 To 6
                For $j =0 To 6
                        If $k >= $iWeekday And $l < $iDays Then
                                $l+=1
                                GUICtrlSetData($aDayName[$k-1],$l)
                        Else
                                GUICtrlSetData($aDayName[$k-1],"")
                        EndIf
                        If @YEAR = $iYear And @MDAY = $l And @MON = $iMonth Then
                                GUICtrlSetColor($aDayName[$k-1], 0xFFA0A0)
                        Else
                                GUICtrlSetColor($aDayName[$k-1], 0xFEFEFE)
                        EndIf
                        $k+=1
                Next
        Next
        Return True
EndFunc
 
Func SetDate()
        GUICtrlSetData($hCalendarText, GetDate())
EndFunc
 
Func GetDate()
        If @HOUR > 12 Then
                Return (@YEAR & "年 " & @MON & "月 " & @MDAY & "日 下午 " & @HOUR & ":" & @MIN)
        Else
                Return (@YEAR & "年 " & @MON & "月 " & @MDAY & "日 上午 " & @HOUR & ":" & @MIN)
        EndIf
EndFunc
 
Func WM_NCHITTEST($HWND, $IMSG, $IWPARAM, $ILPARAM)
        If ($HWND = $hForm) And ($IMSG = $WM_NCHITTEST) Then Return $HTCAPTION
EndFunc
