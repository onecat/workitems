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

#Region ;**** 参数创建于 ACNWrapper_GUI ****
#AutoIt3Wrapper_icon=C:\WINDOWS\system32\shell32.dll|-3
#AutoIt3Wrapper_Res_Comment=不重起自动修改计算机名，加网域
#AutoIt3Wrapper_Res_LegalCopyright=刘刚
#AutoIt3Wrapper_Add_Constants=n
#EndRegion ;**** 参数创建于 ACNWrapper_GUI ****
#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
Opt("GUICoordMode",1)
Opt("TrayIconHide",1)
$gui=GUICreate("加域-刘刚",300,200,300,300)
$computer=GUICtrlCreateLabel("电脑名:",20,20,50)
$computer_text=GUICtrlCreateInput("",75,20,200)
$user=GUICtrlCreateLabel("用户名:",20,50,50)
$user_text=GUICtrlCreateInput("shenzhen\test1",75,50,200)
$pwd=GUICtrlCreateLabel("密码:",20,80,50)
$pwd_text=GUICtrlCreateInput("000000",75,80,200,"",$ES_PASSWORD)
$domain_name=GUICtrlCreateLabel("域:",20,110,50)
$domain_text=GUICtrlCreateInput("shenzhen.lh.com",75,110,200)
$ou=GUICtrlCreateLabel("OU:",20,140,50)
$ou_text=GUICtrlCreateInput("ou=computers,ou=sales,dc=shenzhen,dc=lh,dc=com",75,140,200)
$ok=GUICtrlCreateButton("确  定",80,175,80)
$cancel=GUICtrlCreateButton("取  消",195,175,80)
GUISetState(@SW_SHOW)
GUICtrlSetData($computer_text,getOldCName())
While 1
        Local $msg=GUIGetMsg()
        Local $result
        Select
                Case $msg=$ok
                        Local $computer_r=GUICtrlRead($computer_text)
                        Local $user_r=GUICtrlRead($user_text)
                        Local $password_r=GUICtrlRead($pwd_text)
                        Local $domain_r=GUICtrlRead($domain_text)
                        Local $ou_r=GUICtrlRead($ou_text)
                        WinSetState("加域-刘刚","",@SW_HIDE)
                        ProgressOn("加域-刘刚","检查必要文件是否存在","","400","350",2)
                        If Not(FileExists(@SystemDir&"\dsquery.exe") And FileExists(@SystemDir&"\netdom.exe") And FileExists(@SystemDir&"\dsquery.dll")) Then
                                MsgBox(4096,"提示","请复制dsquery.exe、netdom.exe、dsquery.dll到system32文件夹")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        ProgressSet(10,"","检查是否填写完整")
                        If $computer_r="" Or $user_r="" Or $password_r="" Or $domain_r="" Then
                                MsgBox(4096,"提示","请填写完整!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        ProgressSet(20,"","检查计算机名是否符合规则")
            If Not nameIsRorE($computer_r) Then
                MsgBox(4096,"提示","计算机名不符合规则,只能由字母数字和连字符组成,不能超过15个字符,且不能全为数字!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)                            
                ContinueLoop
                        EndIf
                        ProgressSet(30,"","建立到网域的连接")
                        If Not Ping_domain($domain_r) Then
                                MsgBox(4096,"提示","不能联系到域"&$domain_r&"请检查网络配置!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(40,"","检查是否已经加入网域")
                        If Not isGorD() Then
                                MsgBox(4096,"提示","你已经是域成员!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(50,"","验证用户名和密码是否正确")
                        If Not E_UandP($domain_r,$user_r,$password_r) Then
                                MsgBox(4096,"提示","用户名或密码错误!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(60,"","检查计算机名是否已经在域中使用")
                        If userExists($computer_r,$domain_r,$user_r,$password_r) Then
                                MsgBox(4096,"提示","该计算机名已经在域中使用!")
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)                            
                                ContinueLoop
                        EndIf
                        ProgressSet(70,"","正在加入网域")
                        If StringUpper($computer_r)==StringUpper(getOldCName()) Then
                                $alert=MsgBox(1,"提示","你没有修改计算机名,确认以当前计算机名加入网域吗?")
                                If $alert>1 Then
                                    ProgressOff()
                                    WinSetState("加域-刘刚","",@SW_SHOW)                                                
                                        ContinueLoop
                                EndIf
                        Else
                                ProgressSet(80,"正在修改计算机名")
                                rename($computer_r)
                        EndIf
                        ProgressSet(90,"正在加入网域")
                        $result=join($computer_r,$domain_r,$user_r,$password_r,$ou_r)
                        If $result=1 Then
                                ProgressSet(100,"","完成")
                                Sleep(3000)
                                ProgressOff()
                                popup("重起","加域成功，计算机将在10秒后重起",10)
                                Shutdown(6)
                        Else
                                ProgressOff()
                                WinSetState("加域-刘刚","",@SW_SHOW)
                                ContinueLoop
                        EndIf
                        Exit
                Case $msg=$cancel Or $msg=$GUI_EVENT_CLOSE
                        ExitLoop
        EndSelect
WEnd
Func Ping_domain($domain) ;判断能否连接到域
        If Ping($domain) Then
                Return True
        Else
                Return False
        EndIf
EndFunc
Func getOldCName();获取旧的电脑名称
        $obj=ObjCreate("WScript.Network")
        Return $obj.ComputerName
EndFunc
Func isGorD() ;判断是否已经加入网域
        $strComputer = "." 
    $objWMIService = ObjGet("winmgmts:\\" & $strComputer & "\root\cimv2")
        $collitems=$objWMIService.ExecQuery("Select * From Win32_ComputerSystem")
        For $colitem In $collitems
                Local $rule=$colitem.DomainRole
                If $rule=0 Then
                        Return True
                Else
                        Return False
                EndIf
        Next
EndFunc
Func userExists($computer_name,$domainname,$username,$password) ;判断域中是否已经存在相同的电脑名
        Local $path=@SystemDir&"\comp.txt"
    If FileExists($path) Then
           FileDelete($path)
   EndIf
    RunWait(@ComSpec&" /c dsquery computer -name "&$computer_name&" -d "&$domainname&" -u "&$username&" -p "&$password&" > "&$path,"",@SW_HIDE)
    If FileGetSize($path)>0 Then
           Return True
    Else
           Return False
    EndIf
EndFunc
Func rename($name) ;重命名电脑名
         RegWrite("HKLM\system\currentcontrolset\control\computername\computername","computername","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\control\computername\ActiveComputerName","computername","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\services\tcpip\parameters","nv hostname","REG_SZ",$name)
     RegWrite("HKLM\system\currentcontrolset\services\tcpip\parameters","hostname","REG_SZ",$name)
 EndFunc
 Func join($computer_name,$domain,$user,$pwd,$ou) ;加域
          Local $temp=@SystemDir&"\join.txt"
          Local $str
          Local $result
          If $ou="" Then
                  $str=" /c netdom join "&$computer_name&" /domain:"&$domain&" /userD:"&$user&" /passwordd:"&$pwd &" > "&$temp
          Else
                  $str=" /c netdom join "&$computer_name&" /domain:"&$domain&" /ou:"&$ou&" /userD:"&$user&" /passwordd:"&$pwd &" > "&$temp
          EndIf
          If MsgBox(1,"确认","你确认加入网域 "&$domain &" ?")=1 Then
                  If FileExists($temp) Then
                          FileDelete($temp)
                  EndIf
                  RunWait(@ComSpec&$str,"",@SW_HIDE)
                  If FileExists($temp) Then
                          $str=FileReadLine($temp)
                          If StringLower($str)=="the command completed successfully." Then
                                  $result=1
                          Else
                                  $result=2
                                  MsgBox(4096,"提示",$str)
                          EndIf
                  EndIf
          Else
                  $result=3
          EndIf
          Return $result
  EndFunc
  Func nameIsRorE($computername) ;判断计算机名是否符合规则
          $result=StringRegExp($computername,'^[a-zA-Z0-9-]{1,15}$')
          $result1=StringRegExp($computername,'^\d{1,15}$')
          If $result==1 And $result1==0 Then
                  Return True
          Else
                  Return False
          EndIf
  EndFunc
  Func E_UandP($domain,$user,$pwd)  ;判断用户名和密码是否正确
          Local $path=@SystemDir&"\net.txt"
          If FileExists($path) Then
                  FileDelete($path)
          EndIf
          RunWait(@ComSpec&' /c net use * /del /y',"",@SW_HIDE)
          RunWait(@ComSpec&" /c net use \\"& $domain & "\ipc$ /user:"&$user&" "&$pwd&" > " &$path,"",@SW_HIDE)
          If FileExists($path) Then
                  If FileGetSize($path)>0 Then
                          Return True
                  Else
                          Return False
                  EndIf
          EndIf
  EndFunc  
Func popup($title,$text,$second)
        Local $gui=GUICreate($title,240,60)
    GUISetState(@SW_SHOW)
    $tishi=GUICtrlCreateLabel("",10,20,200,15)
    While 1
            If $second>0 Then
           timespan($tishi,$text,$second)
                   ExitLoop
            EndIf
    WEnd
EndFunc
Func timespan($gui,$text,$time)
    While $time>0
            GUICtrlSetData($gui,$text&" "&$time)
                Sleep(1000)
                $time=$time-1
    WEnd
EndFunc