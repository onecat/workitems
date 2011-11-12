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

#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <IE.au3>

Global $url = "http://udb.yy.com/register.do", $regtimes = 1
#Region ### START Koda GUI section ### Form=d:\我的文档\桌面\数兔子\YYreg\Form1.kxf
$Form1 = GUICreate("Form1", 910, 195, 342, 105)
;~ $oIE = _IECreateEmbedded()
$oIE = ObjCreate("Shell.Explorer.2")
$Obj1_ctrl = GUICtrlCreateObj($oIE, 8, 200, 891, 532)
$Reload = GUICtrlCreateButton("重新载入注册页面", 8, 145, 107, 25, $BS_FLAT)
$Regsub = GUICtrlCreateButton("注册 (Enter)", 120, 145, 91, 25, $BS_FLAT)
$Pic1 = GUICtrlCreatePic("", 8, 6, 200, 70)
$securityCode1 = GUICtrlCreateInput("", 80, 110, 121, 21)
$Label5 = GUICtrlCreateLabel("验证码：", 16, 114, 52, 17)
$Label6 = GUICtrlCreateLabel("点击图片更换验证码", 47, 90, 112, 17)
$Group1 = GUICtrlCreateGroup("自动填写设置", 215, 6, 337, 97)
$user0 = GUICtrlCreateInput("oo", 292, 22, 30, 21)
$user1 = GUICtrlCreateInput("xy", 356, 22, 30, 21)
$Label1 = GUICtrlCreateLabel("用户名前缀", 225, 26, 64, 17)
$Label2 = GUICtrlCreateLabel("后缀", 328, 26, 28, 17)
$mima0 = GUICtrlCreateInput("vv", 292, 46, 30, 21)
$mima1 = GUICtrlCreateInput("iiok", 356, 46, 30, 21)
$Label3 = GUICtrlCreateLabel("密码前缀", 225, 50, 52, 17)
$Label4 = GUICtrlCreateLabel("后缀", 328, 50, 28, 17)
$mimaCheckbox = GUICtrlCreateCheckbox("解锁密码规则", 344, 76, 97, 17)
$userCheckbox = GUICtrlCreateCheckbox("解锁用户名规则", 225, 76, 105, 17)
$Label9 = GUICtrlCreateLabel("用户名规则", 392, 26, 64, 17)
$Label10 = GUICtrlCreateLabel("密码规则", 392, 50, 52, 17)
$Ruuser = GUICtrlCreateInput("16800", 457, 24, 90, 21, BitOR($ES_AUTOHSCROLL, $ES_NUMBER))
$Rumima = GUICtrlCreateInput("00", 457, 48, 90, 21, BitOR($ES_AUTOHSCROLL, $ES_NUMBER))
;~ $Button3 = GUICtrlCreateButton("锁定规则", 457, 74, 62, 23, $BS_FLAT)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("注册填写项", 216, 105, 337, 65)
$Ruser = GUICtrlCreateInput("", 288, 117, 121, 21)
$Label7 = GUICtrlCreateLabel("用户名", 244, 121, 40, 17)
$Rmima = GUICtrlCreateInput("", 288, 140, 121, 21)
$Label8 = GUICtrlCreateLabel("密码", 256, 144, 28, 17)
$Checkbox1 = GUICtrlCreateCheckbox("关闭自动填写规则", 415, 144, 125, 17)
$Label11 = GUICtrlCreateLabel("根据规则数字将会递增", 416, 120, 130, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Button1 = GUICtrlCreateButton("Button1", 562, 150, 75, 20, $BS_FLAT)
$ListView1 = GUICtrlCreateListView("用户名|密码|注册时间", 560, 6, 314, 134)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 0, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 1, 110)
GUICtrlSendMsg(-1, $LVM_SETCOLUMNWIDTH, 2, 80)
$Button2 = GUICtrlCreateButton("▽▽▼▼可视模式▼▼▽▽", 8, 173, 891, 17, $BS_FLAT)

GUICtrlSetState($Regsub, $GUI_DISABLE)
GUICtrlSetState($Button1, $GUI_DISABLE)
GUICtrlSetState($user0, $GUI_DISABLE)
GUICtrlSetState($user1, $GUI_DISABLE)
GUICtrlSetState($Ruuser, $GUI_DISABLE)
GUICtrlSetState($mima0, $GUI_DISABLE)
GUICtrlSetState($mima1, $GUI_DISABLE)
GUICtrlSetState($Rumima, $GUI_DISABLE)
GUICtrlSetState($Checkbox1, $GUI_CHECKED)
GUICtrlSetState($mimaCheckbox, $GUI_CHECKED)
GUICtrlSetState($userCheckbox, $GUI_CHECKED)
GUICtrlSetData($Ruser,  GUICtrlRead($user0) & _StringPad3(Number(GUICtrlRead($Ruuser)) + 1, StringLen(GUICtrlRead($Ruuser)), "0", 0) & GUICtrlRead($user1))
GUICtrlSetData($Rmima, GUICtrlRead($mima0) & _StringPad3(Number(GUICtrlRead($Rumima)) + 1, StringLen(GUICtrlRead($Rumima)), "0", 0) & GUICtrlRead($mima1))

GUICtrlSetResizing($Reload, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Regsub, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Pic1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($securityCode1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Obj1_ctrl, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label5, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label4, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label5, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label6, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Group1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($user0, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($user1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label2, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($mima0, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($mima1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label3, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label4, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($mimaCheckbox, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($userCheckbox, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label9, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label10, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Ruuser, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Rumima, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
;~ GUICtrlSetResizing($Button3, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Group2, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Ruser, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label7, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Rmima, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label8, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Checkbox1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Label11, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Button1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($ListView1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
GUICtrlSetResizing($Button2, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;

GUICtrlSetResizing($Reload, $GUI_DOCKALL) ;
GUICtrlSetResizing($Regsub, $GUI_DOCKALL) ;
GUICtrlSetResizing($Pic1, $GUI_DOCKALL) ;
GUICtrlSetResizing($securityCode1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Obj1_ctrl, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label5, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label4, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label5, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label6, $GUI_DOCKALL) ;
GUICtrlSetResizing($Group1, $GUI_DOCKALL) ;
GUICtrlSetResizing($user0, $GUI_DOCKALL) ;
GUICtrlSetResizing($user1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label2, $GUI_DOCKALL) ;
GUICtrlSetResizing($mima0, $GUI_DOCKALL) ;
GUICtrlSetResizing($mima1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label3, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label4, $GUI_DOCKALL) ;
GUICtrlSetResizing($mimaCheckbox, $GUI_DOCKALL) ;
GUICtrlSetResizing($userCheckbox, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label9, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label10, $GUI_DOCKALL) ;
GUICtrlSetResizing($Ruuser, $GUI_DOCKALL) ;
GUICtrlSetResizing($Rumima, $GUI_DOCKALL) ;
;~ GUICtrlSetResizing($Button3, $GUI_DOCKALL) ;
GUICtrlSetResizing($Group2, $GUI_DOCKALL) ;
GUICtrlSetResizing($Ruser, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label7, $GUI_DOCKALL) ;
GUICtrlSetResizing($Rmima, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label8, $GUI_DOCKALL) ;
GUICtrlSetResizing($Checkbox1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Label11, $GUI_DOCKALL) ;
GUICtrlSetResizing($Button1, $GUI_DOCKALL) ;
GUICtrlSetResizing($ListView1, $GUI_DOCKALL) ;
GUICtrlSetResizing($Button2, $GUI_DOCKALL) ;

GUIRegisterMsg($WM_COMMAND, "WM_COMMAND")

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###



While 1
        $nMsg = GUIGetMsg()
        Switch $nMsg
                Case $GUI_EVENT_CLOSE
                        Exit

                Case $Reload
                        _load()
                        
                Case $Regsub
                        _regRun()
                        
                Case $Pic1
                        
                Case $Button2
                        $BtTxt = GUICtrlRead($Button2)
                        _GUIMove($BtTxt)
                        
                Case $Checkbox1
                        If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then
                                _AutoSwitch(4)
                        Else
                                _AutoSwitch(5)
                        EndIf
                        
                Case $userCheckbox
                        If GUICtrlRead($userCheckbox) = $GUI_CHECKED Then
                                _AutoSwitch(0)
                        Else
                                _AutoSwitch(2)
                        EndIf
                Case $mimaCheckbox
                        If GUICtrlRead($mimaCheckbox) = $GUI_CHECKED Then
                                _AutoSwitch(1)
                        Else
                                _AutoSwitch(3)
                        EndIf
        EndSwitch
WEnd

Func _load()
        Local $file = ""
        _IENavigate($oIE, $url)
        _IELoadWait($oIE)
        Sleep(500)
        While $file = ""
                If $file <> "" Then ExitLoop
                $oImg = _IEGetObjById($oIE, "imgSecurityCode")
                $oPic = $oIE.Document.body.createControlRange()
                $oPic.Add($oImg)
                $oPic.execCommand("Copy")
                $file = ClipGet()
                GUICtrlDelete($Pic1)
                $Pic1 = GUICtrlCreatePic($file, 8, 6, 200, 70)
                GUICtrlSetResizing($Pic1, $GUI_DOCKTOP + $GUI_DOCKSIZE) ;
                GUICtrlSetResizing($Pic1, $GUI_DOCKALL) ;
        WEnd
        GUICtrlSetState($Regsub, $GUI_ENABLE)
EndFunc   ;==>_load

Func _inprot()
        
EndFunc   ;==>_inprot

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
        $RuuserLen = StringLen(GUICtrlRead($Ruuser))
        $RumimaLen = StringLen(GUICtrlRead($Rumima))
        Switch $ilParam
                Case GUICtrlGetHandle($user0)
;~                                         If GUICtrlRead($Ruser) <> "" Then
;~                                                 GUICtrlSetData($Ruser, "")
;~                                         Else
                        GUICtrlSetData($Ruser, GUICtrlRead($user0) & _StringPad3(Number(GUICtrlRead($Ruuser)) + 1, $RuuserLen, "0", 0) & GUICtrlRead($user1))
;~                                         EndIf
                        
                Case GUICtrlGetHandle($mima0)
;~                                         If GUICtrlRead($Rmima) = "" Then
;~                                                 GUICtrlSetData($Rmima, "")
;~                                         Else
                        GUICtrlSetData($Rmima, GUICtrlRead($mima0) & _StringPad3(Number(GUICtrlRead($Rumima)) + 1, $RumimaLen, "0", 0) & GUICtrlRead($mima1))
;~                                         EndIf
                        
                Case GUICtrlGetHandle($user1)
;~                                         If GUICtrlRead($Ruser) = "" Then
;~                                                 GUICtrlSetData($Ruser, "")
;~                                         Else
                        GUICtrlSetData($Ruser, GUICtrlRead($user0) & _StringPad3(Number(GUICtrlRead($Ruuser)) + 1, $RuuserLen, "0", 0) & GUICtrlRead($user1))
;~                                         EndIf
                        
                Case GUICtrlGetHandle($mima1)
;~                                         If GUICtrlRead($Rmima) = "" Then
;~                                                 GUICtrlSetData($Rmima, "")
;~                                         Else
                        GUICtrlSetData($Rmima, GUICtrlRead($mima0) & _StringPad3(Number(GUICtrlRead($Rumima)) + 1, $RumimaLen, "0", 0) & GUICtrlRead($mima1))
;~                                         EndIf
        EndSwitch
EndFunc   ;==>WM_COMMAND

Func _StringPad3($string, $length = -1, $sign = -1, $direction = 1)
        ;若 $length 為 -1 時則 $length 值為 $string 的長度
        If Not $length Then $length = StringLen($string)
        ;若 $sign 為 -1 時則 $sign 值為 " "(空白)
        If Not IsString($sign) Then $sign = " "
        ;如果 $string 長度沒有小於 $length 時則直接回傳
        If StringLen($string) >= $length Then Return $string
        ;計算要補幾位
        $length = $length - StringLen($string)
        If $direction = 1 Then ;PadRight
                For $i = 1 To $length
                        $string &= $sign
                Next
        Else ;PadLeft
                For $i = 1 To $length
                        $string = $sign & $string
                Next
        EndIf
        Return $string
EndFunc   ;==>_StringPad3

Func _GUIMove($BtTxt)
        $guixy = WinGetPos($Form1)
        If $BtTxt = '▲▲△△精简模式△△▲▲' Then
                GUICtrlSetData($Button2, '▽▽▼▼可视模式▼▼▽▽')
                $new_guiX = $guixy[3] - 550
        Else
                GUICtrlSetData($Button2, '▲▲△△精简模式△△▲▲')
                $new_guiX = $guixy[3] + 550
        EndIf
        WinMove($Form1, '', $guixy[0], $guixy[1], $guixy[2], $new_guiX)
        Return
EndFunc   ;==>_GUIMove

Func _AutoSwitch($Type)
        Switch $Type
                Case 0
                        GUICtrlSetState($user0, $GUI_DISABLE)
                        GUICtrlSetState($user1, $GUI_DISABLE)
                        GUICtrlSetState($Ruuser, $GUI_DISABLE)
                        GUICtrlSetData($userCheckbox, "解锁用户名规则")
                        
                Case 1
                        GUICtrlSetState($mima0, $GUI_DISABLE)
                        GUICtrlSetState($mima1, $GUI_DISABLE)
                        GUICtrlSetState($Rumima, $GUI_DISABLE)
                        GUICtrlSetData($mimaCheckbox, "解锁密码规则")
                        
                Case 2
                        GUICtrlSetState($user0, $GUI_ENABLE)
                        GUICtrlSetState($user1, $GUI_ENABLE)
                        GUICtrlSetState($Ruuser, $GUI_ENABLE)
                        GUICtrlSetData($user0, "")
                        GUICtrlSetData($user1, "")
                        GUICtrlSetData($Ruuser, "00000")
                        GUICtrlSetData($userCheckbox, "锁定用户名规则")
                        
                Case 3
                        GUICtrlSetState($mima0, $GUI_ENABLE)
                        GUICtrlSetState($mima1, $GUI_ENABLE)
                        GUICtrlSetState($Rumima, $GUI_ENABLE)
                        GUICtrlSetData($mima0, "")
                        GUICtrlSetData($mima1, "")
                        GUICtrlSetData($Rumima, "00000")
                        GUICtrlSetData($mimaCheckbox, "锁定密码规则")
                        
                        
                Case 4
                        GUICtrlSetState($Ruuser, $GUI_DISABLE)
                        GUICtrlSetData($Ruuser, "00000")
                        GUICtrlSetData($user0, "ai")
                        GUICtrlSetData($user1, "xiyu")
                        GUICtrlSetState($user0, $GUI_DISABLE)
                        GUICtrlSetState($user1, $GUI_DISABLE)
                        GUICtrlSetState($userCheckbox, $GUI_ENABLE)
                        
                        GUICtrlSetState($Rumima, $GUI_DISABLE)
                        GUICtrlSetData($Rumima, "00000")
                        GUICtrlSetData($mima0, "ai")
                        GUICtrlSetData($mima1, "xiyu")
                        GUICtrlSetState($mima0, $GUI_DISABLE)
                        GUICtrlSetState($mima1, $GUI_DISABLE)
                        GUICtrlSetState($mimaCheckbox, $GUI_ENABLE)
                        
                        GUICtrlSetData($Label11, "根据规则数字将会递增")
                        GUICtrlSetState($mimaCheckbox, $GUI_CHECKED)
                        GUICtrlSetState($userCheckbox, $GUI_CHECKED)
                        
                        GUICtrlSetData($Checkbox1, "关闭自动填写规则")
                        
                Case 5
                        GUICtrlSetState($Ruuser, $GUI_DISABLE)
                        GUICtrlSetState($user0, $GUI_DISABLE)
                        GUICtrlSetState($user1, $GUI_DISABLE)
                        GUICtrlSetState($userCheckbox, $GUI_DISABLE)
                        
                        GUICtrlSetState($Rumima, $GUI_DISABLE)
                        GUICtrlSetState($mima0, $GUI_DISABLE)
                        GUICtrlSetState($mima1, $GUI_DISABLE)
                        GUICtrlSetState($mimaCheckbox, $GUI_DISABLE)
                        
                        GUICtrlSetData($Label11, "请手动填入用户名密码")
                        GUICtrlSetState($mimaCheckbox, $GUI_UNCHECKED)
                        GUICtrlSetState($userCheckbox, $GUI_UNCHECKED)
                        
                        GUICtrlSetData($Checkbox1, "开启自动填写规则")
                        
        EndSwitch
        
EndFunc   ;==>_AutoSwitch

Func _regRun()
        
        If GUICtrlRead($Checkbox1) = $GUI_CHECKED Then
                If GUICtrlRead($userCheckbox) <> $GUI_CHECKED Or GUICtrlRead($mimaCheckbox) <> $GUI_CHECKED Then
                        MsgBox(0, 0, "请先锁定【用户名规则】和【密码规则】")
                        Return False
                EndIf
                _UserSn($regtimes)
        EndIf        
        
        _regsubload()
        $regtimes += 1
EndFunc   ;==>_regRun

Func _UserSn($num)
        $RuuserLen = StringLen(GUICtrlRead($Ruuser))
        $RumimaLen = StringLen(GUICtrlRead($Rumima))
        GUICtrlSetData($Ruser, GUICtrlRead($user0) & _StringPad3(Number($num) + 1, $RuuserLen, "0", 0) & GUICtrlRead($user1))
        GUICtrlSetData($Rmima, GUICtrlRead($mima0) & _StringPad3(Number($num) + 1, $RuuserLen, "0", 0) & GUICtrlRead($mima1))
EndFunc   ;==>_UserSn

Func _regsubload()
        Local $returnText
        $user = _IEGetObjByName($oIE, "username")
        $user.value = GUICtrlRead($Ruser)
        $pw1 = _IEGetObjByName($oIE, "password")
        $pw1.value = GUICtrlRead($Rmima)
        $pw2 = _IEGetObjById($oIE, "password2")
        $pw2.value = GUICtrlRead($Rmima)
        $yzm = _IEGetObjByName($oIE, "securityCode1")
        $yzm.value = GUICtrlRead($securityCode1)
        $xy = _IEGetObjById($oIE, "agreement")
        $xy.click
        $Submit = _IEGetObjById($oIE,"submitButton")
        Sleep(800)
        $Submit.click        
        Sleep(500)
        _IELoadWait($oIE)
        $returnText = _IEBodyReadText($oIE)
        MsgBox(0,0,$returnText)
EndFunc   ;==>_regsubload