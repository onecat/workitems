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

#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GUIComboBox.au3>
#include <iNet.au3>
#include <GuiEdit.au3>
#Region ### START Koda GUI section ### Form=
 
Opt("MustDeclareVars",1)
Opt("GUICloseOnESC",0)
Opt("TrayIconHide",1)
Local $hMain = GUICreate("wanIP和物理位置", 340, 230, Default, Default)
Local $hCombo = GUICtrlCreateCombo("", 80, 48, 85, 25, BitOR($CBS_DROPDOWNLIST,$CBS_AUTOHSCROLL))
Local $aSites[3] = ["chinaz.com","ip138.com","ip.qq.com"]
Local $i
For $i = 0 To UBound($aSites) - 1
        GUICtrlSetData($hCombo,$aSites[$i] & "|")
Next
_GUICtrlComboBox_SetCurSel($hCombo,0)
Local $hInput = GUICtrlCreateInput("",80,16,150,20)
GUICtrlSetTip($hInput,"留空则查询本网信息,支持回车")
Local $hBtn = GUICtrlCreateButton("查询",238,16,40,20)
Local $hBtn_File = GUICtrlCreateButton("文件",285,16,40,20)
GUICtrlSetTip($hBtn,"查询归属地")
Local $hEdit = GUICtrlCreateEdit("", 80, 78, 245, 140, BitOR($ES_AUTOVSCROLL,$ES_AUTOHSCROLL,$ES_READONLY,$ES_WANTRETURN,$WS_VSCROLL))
GUICtrlCreateLabel("输入IP地址或主机名：",12,15,60,34,$SS_RIGHT)
GUICtrlCreateLabel("查询网站：", 12, 52, 60, 17,$SS_RIGHT)
GUICtrlCreateLabel("查询结果：", 12, 80, 60, 17,$SS_RIGHT)
Local $hBtn_Clean = GUICtrlCreateButton("清空",12,100,50,20)
_GUICtrlEdit_SetText($hEdit,_chinaz() & " <=[" & $aSites[0] & "]" & @CRLF)
GUICtrlSetState($hInput,$GUI_FOCUS)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
 
While 1
        Local $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit
                Case $hCombo
                        If GUICtrlRead($hInput) = "" Then
                                Switch  GUICtrlRead($hCombo)
                                        Case $aSites[0]
                                                _GUICtrlEdit_AppendText($hEdit,_chinaz() & " <=[" & $aSites[0] & "]" & @CRLF)
                                        Case $aSites[1]
                                                _GUICtrlEdit_AppendText($hEdit,_ip138() & " <=[" & $aSites[1] & "]" & @CRLF)
                                        Case $aSites[2]
                                                _GUICtrlEdit_AppendText($hEdit,_qq() & " <=[" & $aSites[2] & "]" & @CRLF)
                                EndSwitch
                        EndIf
                Case $hBtn,$hInput      ;响应回车事件
                        If GUICtrlRead($hInput) = "" Then ContinueCase
                        Local $sInput = GUICtrlRead($hInput)
                        If StringRegExp($sInput,'^(\d{1,3}\.){3}\d{1,3}$') Or StringRegExp($sInput,'^\w[\w-]*\.[\w\.-]*[a-zA-Z]$') Then ;判断一下输入内容是否合法
                                Switch  GUICtrlRead($hCombo)
                                        Case $aSites[0] ;chinaz.com
                                                _GUICtrlEdit_AppendText($hEdit,$sInput & " <=[" & $aSites[0] & "]" & @CRLF & _chinaz_query($sInput) & @CRLF)
                                        Case $aSites[1] ;ip138.com
                                                _GUICtrlEdit_AppendText($hEdit,$sInput & " <=[" & $aSites[1] & "]" & @CRLF & _ip138_query($sInput) & @CRLF)
                                        Case $aSites[2] ;ip.qq.com只支持查询IP,不支持域名
                                                _GUICtrlEdit_AppendText($hEdit,$sInput & " <=[" & $aSites[2] & "]" & @CRLF & _qq_query($sInput) & @CRLF)
                                EndSwitch
                        Else
                                MsgBox(16,"输入错误","不是一个合法IP或域名",0,$hMain)
                        EndIf
                Case $hBtn_Clean
                        _GUICtrlEdit_SetText($hEdit,"") ;清空
                Case $hBtn_File
                        Local $sFilePath = FileOpenDialog("选择文件",@ScriptDir,"文本文件(*.txt;*.log;*.csv;*.ini)",1,"",$hMain)
                        If Not @error Then 
                                Local $sFileData = FileRead($sFilePath)
                                Local $j
                                Local $hLbl_Lines = GUICtrlCreateLabel("",220,52,100,20)
                                Local $aLines = StringRegExp($sFileData,'\V+',3)
                                If Not @error Then                              
                                        Switch  GUICtrlRead($hCombo)
                                                Case $aSites[0] ;chinaz.com
                                                        For $j = 0 To UBound($aLines) - 1
                                                                GUICtrlSetData($hLbl_Lines,$j+1 & "/" & UBound($aLines) & "(" & Int(($j+1)/UBound($aLines)*100) & " %)")
                                                                _GUICtrlEdit_AppendText($hEdit,$aLines[$j] & " <=[" & $aSites[0] & "]" & @CRLF & _chinaz_query($aLines[$j]) & @CRLF)
                                                        Next
                                                Case $aSites[1] ;ip138.com
                                                        For $j = 0 To UBound($aLines) - 1
                                                                GUICtrlSetData($hLbl_Lines,$j+1 & "/" & UBound($aLines) & "(" & Int(($j+1)/UBound($aLines))*100 & " %)")
                                                                _GUICtrlEdit_AppendText($hEdit,$aLines[$j] & " <=[" & $aSites[1] & "]" & @CRLF & _ip138_query($aLines[$j]) & @CRLF)
                                                        Next
                                        EndSwitch
                                        GUICtrlSetData($hLbl_Lines,"")
                                EndIf
                        EndIf
        EndSwitch
WEnd
 
 
Func _chinaz()
        Local $source = _INetGetSource("http://tool.chinaz.com/IP/",False)
        $source = BinaryToString($source,4)
        Local $sIP,$aIP,$sLocation,$aLocation
        $aIP = StringRegExp($source,'您的IP.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "未获取IP"
        EndIf
        $aLocation = StringRegExp($source,'来自:<.*?>([^<>]+)',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
        Else
                $sLocation = "未获取物理位置"
        EndIf
        Return $sIP & @CRLF & $sLocation
EndFunc
 
Func _ip138()
        Local $source = _INetGetSource('http://iframe.ip138.com/city.asp')
        Local $aInfo = StringRegExp($source,'(?<=\[).*?(?=\])|(?<=来自：)[^<]+(?=<)',3)
        If Not @error Then
                Return $aInfo[0] & @CRLF & $aInfo[1]
        Else
                Return "未获取IP和物理位置"
        EndIf
EndFunc
 
Func _qq()
        Local $source = _INetGetSource("http://ip.qq.com")
        Local $sIP,$sLocation,$aIP,$aLocation
        $aIP = StringRegExp($source,'您当前的IP为.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "未获取IP"
        EndIf
        $aLocation = StringRegExp($source,'该IP所在地为.*?([^<>]+)</span>',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
                $sLocation = StringRegExpReplace($sLocation,'&nbsp;','')
        Else
                $sLocation = "未获取物理位置"
        EndIf
        Return $sIP & @CRLF & $sLocation
EndFunc
 
Func _ip138_query($sHostName = "")
        Local $source = _INetGetSource('http://www.ip138.com/ips1388.asp?ip=' & $sHostName & '&action=2')
        Local $aIP,$sIP,$aLocation,$sLocation
        $aIP = StringRegExp($source,'(?:(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d)\.){3}(?:\b[1-9]\b|\b[1-9]\d\b|1\d\d|2[0-4]\d)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "未获取到IP"
        EndIf
        $aLocation = StringRegExp($source,'(?:本站主数据：|参考数据一：)([^<]+)',3)
        If Not @error Then
                $sLocation = $aLocation[0] & @CRLF & $aLocation[1]
        Else
                $sLocation = "未获取物理位置"
        EndIf
        Return $sIP & @CRLF & $sLocation
EndFunc
 
Func _chinaz_query($sHostName = "")
        Local $source = _INetGetSource('http://tool.chinaz.com/IP/?IP=' & $sHostName,False)
        $source = BinaryToString($source,4)
        Local $info
        Local $aData = StringRegExp($source,'>查询结果(.*?)</',3)
        If @error Then 
                Return $info = "未获取IP和物理位置信息"
        EndIf
        Local $i,$info = ""
        For $i = 0 To UBound($aData) - 1
                $info = $info & StringRegExpReplace($aData[$i],'\s|(?:==>>)|\d{4,}|:|\[\d\]','') & @CRLF 
        Next
        Return $info
EndFunc
 
Func _qq_query($sHostName = "")
        Local $source = _INetGetSource('http://ip.qq.com/cgi-bin/searchip?searchip1=' & $sHostName)
        Local $sIP,$sLocation,$aIP,$aLocation
        $aIP = StringRegExp($source,'您当前的IP为.*?(\d[\d.]+)',3)
        If Not @error Then 
                $sIP = $aIP[0]
        Else
                $sIP = "未获取IP"
        EndIf
        $aLocation = StringRegExp($source,'该IP所在地为.*?([^<>]+)</span>',3)
        If Not @error Then 
                $sLocation = $aLocation[0]
                $sLocation = StringRegExpReplace($sLocation,'&nbsp;','')
        Else
                $sLocation = "未获取物理位置"
        EndIf
        Return $sIP & @CRLF & $sLocation
EndFunc